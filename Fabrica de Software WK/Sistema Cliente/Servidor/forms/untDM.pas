unit untDM;

interface

uses
  OnGuard, OgUtil,

{$REGION 'Token'}
  EncdDecd,
  Clipbrd,
{$ENDREGION}

  Vcl.Forms,
  Vcl.Dialogs,

  //Versão do programa
  DWDCPtypes,
  Winapi.Windows,

{$REGION 'Arquivos de conexão Firedac'}
  FireDAC.UI.Intf,
  FireDAC.VCLUI.Wait,
  FireDAC.Stan.Intf,
  FireDAC.Comp.UI,

  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Phys.IBBase,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
{$ENDREGION}

  IniFiles,
  uDWJSONObject,
  uDWConsts,
  uDWDatamodule,
  uRESTDWPoolerDB,
  uRestDWDriverFD,
  uDWAbout,
  uRESTDWServerEvents,
  uSystemEvents,

  System.SysUtils,
  System.Classes,
  Data.DB;

type
  TToken = class
    public
      class function TokenValidar(aToken: String): Boolean;
      class function TokenCriar(aUsuario: String): String; overload;
    static;
  end;

type
  TArquivoINI = class
    Public
      class function LerIni(Chave1, Chave2: String; ValorPadrao: String = ''): String;
      class procedure ConectarBanco(Conexao: TFDConnection);
      class function GetVersionApp(const AFileName: String): String;
    static;
  end;

type
  TServerModule = class(TServerMethodDataModule)
    DWServerEvents1: TDWServerEvents;
    RESTDWPoolerDB1: TRESTDWPoolerDB;
    FDMemTable1: TFDMemTable;
    FDConnection1: TFDConnection;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    procedure DWServerEvents1EventsGravarReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure ServerMethodDataModuleWelcomeMessage(Welcomemsg,
      AccessTag: string; var ConnectionDefs: TConnectionDefs;
      var Accept: Boolean);
    procedure DWServerEvents1EventsRetornarReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEvents1EventsAtualizarReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEvents1EventsDeletarReplyEvent(var Params: TDWParams;
      var Result: string);
    procedure DWServerEvents1EventsGravarUsuarioReplyEvent(
      var Params: TDWParams; var Result: string);
    procedure ServerMethodDataModuleCreate(Sender: TObject);
    procedure DWServerEvents1EventsCidadesReplyEvent(var Params: TDWParams;
      var Result: string);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  ServerModule: TServerModule;

const
  EncryptionKey : TKey = ($F5, $8E, $84, $F6, $92, $C9, $A4, $F8,
                          $1A, $EA, $6F, $8F, $AB, $EC, $FE, $C4);

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TServerModule.DWServerEvents1EventsAtualizarReplyEvent(
  var Params: TDWParams; var Result: string);
var
  JSONValue: TJSONValue;
  aSQL, bSQL: String;
  I, X, Y: Integer;

  aFDQuery: TFDQuery;
begin
  try
    JSONValue           := Nil;
    aFDQuery            := Nil;

    JSONValue           := TJSONValue.Create;
    aFDQuery            := TFDQuery.Create(Nil);
    aFDQuery.Connection := FDConnection1;

    aSQL:='';
    bSQL:='';

    try
      JSONValue           := TJSONValue.Create;

      JSONValue.Encoded   := False;
      JSONValue.JsonMode  := jmDataware;

      FDMemTable1.Close;
      JSONValue.WriteToDataset(dtFull, Params.ItemsString['Result'].Value, FDMemTable1);
      FDMemTable1.CommitUpdates;

      if FDMemTable1.RecordCount > 0 then
      begin
        aFDQuery.Close;
        aFDQuery.SQL.Clear;
        aFDQuery.SQL.Add('SELECT TOKEN FROM USUARIOS WHERE TOKEN = :TOKEN');
        aFDQuery.ParamByName('TOKEN').AsString:=Params.ItemsString['Token'].AsString;
        aFDQuery.Open;

        if aFDQuery.RecordCount > 0 then
        begin
          //Gerar sql
          for I := 0 to FDMemTable1.FieldCount - 1 do
          begin
            aSQL:=aSQL + FDMemTable1.FieldDefs.Items[I].Name + ' = :' +
            FDMemTable1.FieldDefs.Items[I].Name + ', ';
          end;
            bSQL:=    ('UPDATE ' + Params.ItemsString['Tabela'].AsString + ' SET ' +
                      Copy(aSQL, 1, length(aSQL) - 2) +
                      ' WHERE CD_' + Params.ItemsString['Tabela'].AsString +
                      ' = :CD_' + Params.ItemsString['Tabela'].AsString);

          //Atualizar no banco
          FDMemTable1.First;
          FDMemTable1.DisableControls;

          aFDQuery.Close;
          aFDQuery.SQL.Clear;
          aFDQuery.SQL.Add(bSQL);

          for X:= 0 to FDMemTable1.RecordCount - 1 do
          begin
            for Y := 0 to FDMemTable1.FieldCount - 1 do
            begin
              aFDQuery.Params[Y].Values[X]:=FDMemTable1.Fields.Fields[Y].Value
            end;
              aFDQuery.ParamByName('CD_' + Params.ItemsString['Tabela'].AsString).AsString:=
                      Params.ItemsString['ID'].AsString;
            FDMemTable1.Next;
          end;
          FDMemTable1.EnableControls;
          aFDQuery.ExecSQL;
        end;
      end;

    finally
      begin
        JSONValue.DisposeOf;
        aFDQuery.DisposeOf;
      end;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TServerModule.DWServerEvents1EventsCidadesReplyEvent(
  var Params: TDWParams; var Result: string);
var
  JSONValue: TJSONValue;
  I: Integer;
  aFDQuery: TFDQuery;
begin
  JSONValue           := Nil;
  aFDQuery            := Nil;

  JSONValue           := TJSONValue.Create;
  aFDQuery            := TFDQuery.Create(Nil);
  aFDQuery.Connection := FDConnection1;

  try
    aFDQuery.Close;
    aFDQuery.SQL.Clear;
    aFDQuery.SQL.Add('SELECT TOKEN FROM USUARIOS WHERE TOKEN = :TOKEN');
    aFDQuery.ParamByName('TOKEN').AsString:=Params.ItemsString['Token'].AsString;
    aFDQuery.Open;

    if aFDQuery.RecordCount > 0 then
    begin
      aFDQuery.Close;
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Add('SELECT * FROM CIDADES WHERE DS_CIDADES LIKE :DS_CIDADES');
      aFDQuery.ParamByName('DS_CIDADES').AsString:='%' + Params.ItemsString['Nome'].AsString + '%';
      aFDQuery.Open;

      if aFDQuery.RecordCount > 0 then
      begin
        try
          JSONValue.Encoding := Encoding;
          JSONValue.Encoded  := False;
          JSONValue.JsonMode := jmPureJSON;
          JSONValue.LoadFromDataset('', aFDQuery, False,  JSONValue.JsonMode, 'dd/mm/yyyy', '.');
          Result := JSONValue.ToJSON;
        finally
          JSONValue.Free;
        end;
      end;
    end;

    aFDQuery.DisposeOf;

  except on E: Exception do
    begin
      Result:=('Erro: ' + E.Message);
    end;
  end;
end;

procedure TServerModule.DWServerEvents1EventsDeletarReplyEvent(
  var Params: TDWParams; var Result: string);
var
  aSQL: String;
  aFDQuery: TFDQuery;
begin
  try
    aFDQuery            := Nil;
    aFDQuery            := TFDQuery.Create(Nil);
    aFDQuery.Connection := FDConnection1;

    aSQL:='';

    try
      aSQL:=    ('DELETE FROM ' + Params.ItemsString['Tabela'].AsString +
                ' WHERE CD_' + Params.ItemsString['Tabela'].AsString +
                ' = :CD_' + Params.ItemsString['Tabela'].AsString);

      aFDQuery.Close;
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Add('SELECT TOKEN FROM USUARIOS WHERE TOKEN = :TOKEN');
      aFDQuery.ParamByName('TOKEN').AsString:=Params.ItemsString['Token'].AsString;
      aFDQuery.Open;

      if aFDQuery.RecordCount > 0 then
      begin
        //Atualizar no banco
        aFDQuery.Close;
        aFDQuery.SQL.Clear;
        aFDQuery.SQL.Add(aSQL);
        aFDQuery.ParamByName('CD_' + Params.ItemsString['Tabela'].AsString).AsString:=
            Params.ItemsString['ID'].AsString;
        aFDQuery.ExecSQL;
      end;

    finally
        aFDQuery.DisposeOf;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TServerModule.DWServerEvents1EventsGravarReplyEvent(
  var Params: TDWParams; var Result: string);
var
  JSONValue: TJSONValue;
  aSQL, bSQL, cSQL: String;
  I, X, Y: Integer;

  aFDQuery: TFDQuery;
begin
  try
    JSONValue           := Nil;
    aFDQuery            := Nil;

    JSONValue           := TJSONValue.Create;
    aFDQuery            := TFDQuery.Create(Nil);
    aFDQuery.Connection := FDConnection1;

    aSQL:='';
    bSQL:='';
    cSQL:='';

    try
      JSONValue           := TJSONValue.Create;

      JSONValue.Encoded   := False;
      JSONValue.JsonMode  := jmDataware;

      FDMemTable1.Close;
      JSONValue.WriteToDataset(dtFull, Params.ItemsString['Result'].Value, FDMemTable1);
      FDMemTable1.CommitUpdates;

      if FDMemTable1.RecordCount > 0 then
      begin
        aFDQuery.Close;
        aFDQuery.SQL.Clear;
        aFDQuery.SQL.Add('SELECT TOKEN FROM USUARIOS WHERE TOKEN = :TOKEN');
        aFDQuery.ParamByName('TOKEN').AsString:=Params.ItemsString['Token'].AsString;
        aFDQuery.Open;

        if aFDQuery.RecordCount > 0 then
        begin
          //Gerar sql
          for I := 0 to FDMemTable1.FieldCount - 1 do
          begin
            aSQL:=aSQL + FDMemTable1.FieldDefs.Items[I].Name + ', ';
            bSQL:=bSQL + ':' + FDMemTable1.FieldDefs.Items[I].Name + ', ';
          end;
            cSQL:=    ('INSERT INTO ' + Params.ItemsString['Tabela'].AsString +
                      '(' + Copy(aSQL, 1, length(aSQL) - 2) +
                      ') VALUES(' + Copy(bSQL, 1, length(bSQL) - 2) + ')');

          //Gravar no banco com ArrayDML
          aFDQuery.Close;
          aFDQuery.SQL.Clear;
          aFDQuery.SQL.Add(cSQL);
          aFDQuery.Params.ArraySize:=FDMemTable1.RecordCount;

          FDMemTable1.First;
          FDMemTable1.DisableControls;
          for X:= 0 to FDMemTable1.RecordCount - 1 do
          begin
            for Y := 0 to FDMemTable1.FieldCount - 1 do
            begin
              aFDQuery.Params[Y].Values[X]:=FDMemTable1.Fields.Fields[Y].Value
            end;

            FDMemTable1.Next;
          end;
          FDMemTable1.EnableControls;
          aFDQuery.Execute(FDMemTable1.RecordCount);
        end;
      end;

    finally
      begin
        JSONValue.DisposeOf;
        aFDQuery.DisposeOf;
      end;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TServerModule.DWServerEvents1EventsGravarUsuarioReplyEvent(
  var Params: TDWParams; var Result: string);
var
  JSONValue: TJSONValue;
  aFDQuery: TFDQuery;
begin
  try
    JSONValue           := Nil;
    aFDQuery            := Nil;

    JSONValue           := TJSONValue.Create;
    aFDQuery            := TFDQuery.Create(Nil);
    aFDQuery.Connection := FDConnection1;

    try
      JSONValue           := TJSONValue.Create;

      JSONValue.Encoded   := False;
      JSONValue.JsonMode  := jmDataware;

      FDMemTable1.Close;
      JSONValue.WriteToDataset(dtFull, Params.ItemsString['Result'].Value, FDMemTable1);
      FDMemTable1.CommitUpdates;

      if FDMemTable1.RecordCount > 0 then
      begin
        aFDQuery.Close;
        aFDQuery.SQL.Clear;
        aFDQuery.SQL.Add('SELECT USUARIO FROM USUARIOS '+
                         'WHERE USUARIO = :USUARIO');
        aFDQuery.ParamByName('USUARIO').AsString:=FDMemTable1.FieldByName('USUARIO').AsString;
        aFDQuery.Open;

        if aFDQuery.FieldByName('USUARIO').AsString <> FDMemTable1.FieldByName('USUARIO').AsString then
        begin
          //Gravar no banco com ArrayDML
          aFDQuery.Close;
          aFDQuery.SQL.Clear;
          aFDQuery.SQL.Add('INSERT INTO USUARIOS ('+
                          'NM_USUARIOS, '+
                          'USUARIO, '+
                          'SENHA, '+
                          'TOKEN, '+
                          'DT_REGISTRO, '+
                          'IN_ATIVO) '+

                          'VALUES('+
                          ':NM_USUARIOS, '+
                          ':USUARIO, '+
                          ':SENHA, '+
                          ':TOKEN, '+
                          ':DT_REGISTRO, '+
                          ':IN_ATIVO)');
          aFDQuery.ParamByName('NM_USUARIOS').AsString      :=  FDMemTable1.FieldByName('NM_USUARIOS').AsString;
          aFDQuery.ParamByName('USUARIO').AsString          :=  FDMemTable1.FieldByName('USUARIO').AsString;
          aFDQuery.ParamByName('SENHA').AsString            :=  FDMemTable1.FieldByName('SENHA').AsString;
          aFDQuery.ParamByName('TOKEN').AsString            :=  TToken.TokenCriar(
                                                                  FDMemTable1.FieldByName('USUARIO').AsString);
          aFDQuery.ParamByName('DT_REGISTRO').AsDateTime    :=  Now;
          aFDQuery.ParamByName('IN_ATIVO').AsString         :=  'S';
          aFDQuery.ExecSQL;
        end else Params.ItemsString['aMsg'].AsString:='Usuário já cadastrado.';
      end;

    finally
      begin
        JSONValue.DisposeOf;
        aFDQuery.DisposeOf;
      end;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

{ TArquivoINI }

class procedure TArquivoINI.ConectarBanco(Conexao: TFDConnection);
begin
  try
    with Conexao do
    begin
      Connected := false;
      LoginPrompt := false;
      Params.Clear;
      Params.Values['DriverID']   := 'FB';
      //Params.Values['Protocol']   := TArquivoINI.LerIni('FIREBIRD', 'Protocol');
      //Params.Values['Server']     := TArquivoINI.LerIni('FIREBIRD', 'Server');
      Params.Values['Database']   := TArquivoINI.LerIni('FIREBIRD', 'Database');
      Params.Values['User_name']  := TArquivoINI.LerIni('FIREBIRD', 'User_name');
      Params.Values['Password']   := TArquivoINI.LerIni('FIREBIRD', 'Password');
      Connected:=True;
    end;
  except on E: Exception do
    begin
      raise Exception.Create('Ocorreu uma Falha na configuração no Banco Firebird!');
      Conexao.Connected:=False;
    end;
  end;
end;

class function TArquivoINI.GetVersionApp(const AFileName: String): String;
var
  FileName: string;
  InfoSize, Wnd: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  VerSize: DWORD;
begin
  Result := EmptyStr;
  FileName := AFileName;
  UniqueString(FileName);
  InfoSize := GetFileVersionInfoSize(PChar(FileName), Wnd);
  if InfoSize <> 0 then
  begin
    GetMem(VerBuf, InfoSize);
    try
      if GetFileVersionInfo(PChar(FileName), Wnd, InfoSize, VerBuf) then
        if VerQueryValue(VerBuf, '\', Pointer(FI), VerSize) then
          Result:= Concat(IntToStr(FI.dwFileVersionMS shr 16), '.',
                          IntToStr(FI.dwFileVersionMS and $FFFF), '.',
                          IntToStr(FI.dwFileVersionLS shr 16), '.',
                          IntToStr(FI.dwFileVersionLS and $FFFF));
    finally
      FreeMem(VerBuf);
    end;
  end;
end;

class function TArquivoINI.LerIni(Chave1, Chave2, ValorPadrao: String): String;
var
  Arquivo: String;
  FileINI: TIniFile;
begin
  {$IFDEF MSWINDOWS}
  Arquivo := ExtractFilePath(ParamStr(0)) +
  Copy(ExtractFileName(Application.ExeName), 1, Pos('.', ExtractFileName(Application.ExeName))-1) +
  '.ini'    ;
  Result := ValorPadrao;
  try
    FileIni := TIniFile.Create(Arquivo);
    if FileExists(Arquivo) then
      Result := FileIni.ReadString(Chave1, Chave2, ValorPadrao);
  finally
    FreeAndNil(FileIni)
  end;
  {$ENDIF }
end;

procedure TServerModule.DWServerEvents1EventsRetornarReplyEvent(
  var Params: TDWParams; var Result: string);
var
  JSONValue: TJSONValue;
  I: Integer;
  aFDQuery: TFDQuery;
begin
  JSONValue           := Nil;
  aFDQuery            := Nil;

  JSONValue           := TJSONValue.Create;
  aFDQuery            := TFDQuery.Create(Nil);
  aFDQuery.Connection := FDConnection1;

  try
    aFDQuery.Close;
    aFDQuery.SQL.Clear;
    aFDQuery.SQL.Add('SELECT TOKEN FROM USUARIOS WHERE TOKEN = :TOKEN');
    aFDQuery.ParamByName('TOKEN').AsString:=Params.ItemsString['Token'].AsString;
    aFDQuery.Open;

    if aFDQuery.RecordCount > 0 then
    begin
      aFDQuery.Close;
      aFDQuery.SQL.Clear;
      aFDQuery.SQL.Add(Params.ItemsString['SQL'].AsString);
      aFDQuery.Open;

      if aFDQuery.RecordCount > 0 then
      begin
        try
          JSONValue.Encoding := Encoding;
          JSONValue.Encoded  := False;
          JSONValue.JsonMode := jmPureJSON;
          JSONValue.LoadFromDataset('', aFDQuery, False,  JSONValue.JsonMode, 'dd/mm/yyyy', '.');
          //Params.ItemsString['Result'].AsString := JSONValue.ToJSON;
          Result := JSONValue.ToJSON;
        finally
          JSONValue.Free;
        end;
      end;
    end;

    aFDQuery.DisposeOf;

  except on E: Exception do
    begin
      ShowMessage('Erro: ' + E.Message);
      Clipboard.AsText:=E.Message;
    end;
  end;
end;

procedure TServerModule.ServerMethodDataModuleCreate(Sender: TObject);
begin
  TArquivoINI.ConectarBanco(FDConnection1);
end;

procedure TServerModule.ServerMethodDataModuleWelcomeMessage(Welcomemsg,
  AccessTag: string; var ConnectionDefs: TConnectionDefs; var Accept: Boolean);
begin
  TArquivoINI.ConectarBanco(FDConnection1);
end;

{ TToken }

class function TToken.TokenCriar(aUsuario: String): String;
var
  Key : TKey;
  Code : TCode;
  Modifier : Longint;
  D : TDateTime;
begin
  D:=Now;
  Key := EncryptionKey;
  Modifier := StringHashELF(aUsuario);
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  InitRegCode(Key, '', D, Code);
  Result:=BufferToHex(Code, SizeOf(Code));
end;

class function TToken.TokenValidar(aToken: String): Boolean;
begin
//
end;

end.
