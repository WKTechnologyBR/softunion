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
  FireDAC.Phys.FB, FireDAC.Comp.UI, FireDAC.Comp.DataSet, IdTCPClient,
  uDWConstsData;

type
  TDM = class(TDataModule)
    DWClientEvents1: TDWClientEvents;
    RESTClientPooler1: TRESTClientPooler;
    FDMemTable2: TFDMemTable;
    ClientSQL1: TRESTDWClientSQL;
  private
    { Private declarations }
  public
    { Public declarations }
    const
      Token: String = '8CCAD0E419DB5393';

    function ComboBoxRetornar(aCB: TComboBox): integer;
    procedure ListarDadosComboBox(CDS: TComboBox; SQL_TEXTO: String);
    function DeletarItens(aColuna, aTabelaExclusao, aTabelaVinculo, aCodigo: String): Boolean;
    //Validar servidor
    function TestarConexaoServidorRDW : boolean;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

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
  vJSONRet : String;
  I: Integer;
  ClientSQL: TRESTDWClientSQL;
begin
  try
    JSONValue     := Nil;
    dwParams      := Nil;
    vJSONRet      := '';
    ClientSQL     := Nil;

    if DM.TestarConexaoServidorRDW then
    begin
      ClientSQL := TRESTDWClientSQL.Create(Nil);
      JSONValue := TJSONValue.Create;
      try
        //Recuperar dados no servidor conforme sql recebido
        DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
        dwParams.ItemsString['SQL'].AsString    := SQL_TEXTO;
        dwParams.ItemsString['Token'].AsString  := Token;
        DM.DWClientEvents1.SendEvent('Retornar', dwParams, vJSONRet);

        ClientSQL.OpenJson(vJSONRet);

        //Preencher combobox
        if ClientSQL.RecordCount > 0 then
        begin
          CDS.Items.Clear;

          ClientSQL.First;
          ClientSQL.DisableControls;
          while not ClientSQL.EOF do
          begin
            CDS.Items.AddObject(ClientSQL.FieldByName('DS_PADRAO').AsString,
            TObject(Pointer(ClientSQL.FieldByName('CD_PADRAO').AsInteger)));
            ClientSQL.Next;
          end;
          ClientSQL.EnableControls;
        end;

        if vJSONRet = '' then
        begin

        end;

      finally
        begin
          dwParams.DisposeOf;
          JSONValue.DisposeOf;
          ClientSQL.DisposeOf;
        end;
      end;
    end else ShowMessage('Sem conexão com o servidor.');
  except on E: Exception do
  end;
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
    TCP.Host           := '192.168.0.11';
    TCP.Port           := 8082;
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
