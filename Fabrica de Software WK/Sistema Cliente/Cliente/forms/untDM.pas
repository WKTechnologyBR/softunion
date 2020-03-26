unit untDM;

interface

uses
  uRESTDWBase,
  uDWJSONObject,
  uDWConsts,
  uDWDatamodule,
  uRESTDWPoolerDB,
  uRestDWDriverFD,
  uDWAbout,
  uRESTDWServerEvents,
  uSystemEvents,

  //IfThen
  System.StrUtils,

  Vcl.Dialogs,
  Vcl.StdCtrls,

  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait, FireDAC.Phys.FBDef, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Phys, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.DataSet, IdTCPClient;

type
  TDM = class(TDataModule)
    DWClientEvents1: TDWClientEvents;
    RESTClientPooler1: TRESTClientPooler;
  private
    { Private declarations }
  public
    { Public declarations }
    TOKEN: String;
    CD_USUARIO: Integer;

    function ComboBoxRetornar(aCB: TComboBox): integer;
    procedure ListarDadosComboBox(CDS: TComboBox; SQL_TEXTO: String);
    function DeletarItens(aColuna, aTabelaExclusao, aTabelaVinculo, aCodigo: String): Boolean;
    //Validar servidor
    function TestarConexaoServidorRDW : boolean;

    function Encode(const S: ansistring): ansistring;
    function PostProcess(const S: ansistring): ansistring;
    function InternalEncrypt(const S: ansistring; Key: Word): ansistring;
  end;

var
  DM: TDM;

const IP_SERVIDOR : String = '192.168.0.10';
const PORTA_SERVIDOR: Integer = 8082;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

//Funções do UserControl
function TDM.Encode(const S: ansistring): ansistring;
const
  Map: array [0 .. 63]
    of Char = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';
var
  I: longint;
begin
  I := 0;
  Move(S[1], I, length(S));
  case length(S) of
    1:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64];
    2:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64];
    3:
      Result := Map[I mod 64] + Map[(I shr 6) mod 64] + Map[(I shr 12) mod 64] +
        Map[(I shr 18) mod 64];
  end;
end;

function TDM.PostProcess(const S: ansistring): ansistring;
var
  SS: ansistring;
begin
  SS := S;
  Result := '';
  while SS <> '' do
  begin
    Result := Result + Encode(copy(SS, 1, 3));
    Delete(SS, 1, 3);
  end;
  sleep(10);
end;

function TDM.InternalEncrypt(const S: ansistring; Key: Word): ansistring;
var
  I: Word;
  Seed: int64;
begin
  Result := S;
  Seed := Key;
  for I := 1 to length(Result) do
  begin
{$IFNDEF VER180}
    Result[I] := Ansichar(byte(Result[I]) xor (Seed shr 8));
{$ELSE}
    Result[I] := Char(byte(Result[I]) xor (Seed shr 8));
{$ENDIF};
    Seed := (byte(Result[I]) + Seed) * Word(52845) + Word(22719);
  end;
end;

function TDM.ComboBoxRetornar(aCB: TComboBox): integer;
begin
  try
    Result := Integer(aCB.Items.Objects[aCB.ItemIndex]);
  except
    on  e: Exception do
    begin
      Result := -1;
    end;
  end;
end;

function TDM.DeletarItens(aColuna, aTabelaExclusao, aTabelaVinculo, aCodigo: String): Boolean;
var
   zSQL: TFDQuery;
begin
  Result:=False;
  zSQL:=TFDQuery.Create(Nil);
  //zSQL.Connection:=DM.FDConnection1;
  try
    try
      with zSQL do
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT '+ aColuna +
                ' FROM '+  aTabelaVinculo +
                ' WHERE '+ aColuna + ' = :ACODIGO');
        ParamByName('ACODIGO').AsString:=aCodigo;
        Open;

        if RecordCount = 0 then
        begin
          Close;
          SQL.Clear;
          SQL.Add('DELETE FROM '+ aTabelaExclusao +
                  ' WHERE '+ aColuna + ' = :ACODIGO ');
          ParamByName('ACODIGO').AsString  :=	aCodigo;
          ExecSQL;

          Result:=True;

        end else ShowMessage('Itens com vínculo não podem ser deletados.');
      end;
    finally
      zSQL.DisposeOf;
    end;

  except on  e: exception do
  begin
    messageDlg('Não foi possível excluir o registro' + E.Message, mtError, [mbOk], 0);
    zSQL.DisposeOf;
  end;
  end;
end;

procedure TDM.ListarDadosComboBox(CDS: TComboBox; SQL_TEXTO: String);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vErrorMessage : String;
  I: Integer;
  RDWClientSQL: TRESTDWClientSQL;
begin
  JSONValue     := Nil;
  dwParams      := Nil;
  vErrorMessage := '';
  RDWClientSQL  :=  Nil;

  if DM.TestarConexaoServidorRDW then
  begin
    RDWClientSQL  := TRESTDWClientSQL.Create(Nil);
    JSONValue     := TJSONValue.Create;
    try
      //Recuperar dados no servidor conforme sql recebido
      DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
      dwParams.ItemsString['SQL'].AsString  := SQL_TEXTO;
      dwParams.ItemsString['Token'].AsString  := TOKEN;
      DM.DWClientEvents1.SendEvent('Retornar', dwParams, vErrorMessage);

      //JSONValue.WriteToDataset(dtFull, dwParams.ItemsString['Result'].Value, DM.FDMemTable2);

      RDWClientSQL.OpenJson(vErrorMessage);
      if RDWClientSQL.RecordCount > 0 then
      begin
        try
          //Preencher combobox
          with RDWClientSQL do
          begin
            if RecordCount > 0 then
            begin
              CDS.Items.Clear;

              First;
              DisableControls;
              while not EOF do
              begin
                CDS.Items.AddObject(FieldByName('DS_PADRAO').AsString,
                TObject(Pointer(FieldByName('CD_PADRAO').AsInteger)));
                Next;
              end;
              EnableControls;
            end;
          end;

        except on E: Exception do

        end;

      end;

      if vErrorMessage = '' then
      begin

      end;

    finally
      begin
        dwParams.DisposeOf;
        JSONValue.DisposeOf;
      end;
    end;
  end else ShowMessage('Sem conexão com o servidor.');
end;

function TDM.TestarConexaoServidorRDW: boolean;
var
  FGetLastError: String;
  TCP: TIdTCPClient;
  Exists: Boolean;
  I: Integer;
begin

  Result := False;
  TCP    := TIdTCPClient.Create(nil);
  try
    TCP.Host           := IP_SERVIDOR;
    TCP.Port           := PORTA_SERVIDOR;
    TCP.ReadTimeout    := 500;
    TCP.ConnectTimeout := 500;
    I                  := 0;
    while (I < 1) do
    begin
      Inc(I);
      try
        TCP.Connect;
        TCP.Disconnect;
        exit(true); // Success
      except
        on e: Exception do
          FGetLastError := 'Connect tcp error :' + e.Message;
      end;
    end;
  finally
    TCP.free;
  end;
end;

end.
