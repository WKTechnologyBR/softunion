unit untLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, untDM, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, uRESTDWPoolerDB;

type
  TfrmLogin = class(TForm)
    edtDescricao: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    FDMemTable1: TFDMemTable;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

uses
  uDWJSONObject, uDWConsts;

{$R *.dfm}

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;
{
    if (edtUsuario.Text = '') then //Verifica se o campo "Usuário" foi preenchido
    begin
        Messagedlg('O campo "Usuário" deve ser preenchido!', mtInformation, [mbOk], 0);
        if edtUsuario.CanFocus then
        edtUsuario.SetFocus;
        Exit;
    end;
        if (edtSenha.Text = '') then //Verifica se o campo "Senha" foi preenchido
        begin
        Messagedlg('O campo "Senha" deve ser preenchido!', mtInformation, [mbOk], 0);
        if edtSenha.CanFocus then
        edtSenha.SetFocus;
        Exit;
    end;
        if loginValido(edtUsuario.Text, edtSenha.Text) then //Verifica se o login é válido
        ModalResult := mrOk
        else //Caso o login não seja válido então
    begin
        inc(tentativas); //Incrementa em 1 o valor da variável tentativas
        if tentativas < 3 then
    begin
        MessageDlg(Format('Tentativa %d de 3', [tentativas]), mtError, [mbOk], 0);
        if edtSenha.CanFocus then
        edtSenha.SetFocus;
    end
    else
    begin
        MessageDlg(Format('%dª tentativa de acesso ao sistema.',
        [tentativas]) + #13 + 'A aplicação será fechada!', mtError, [mbOk], 0);
        ModalResult := mrCancel;
        end;
    end;
}
procedure TfrmLogin.Button2Click(Sender: TObject);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vErrorMessage : String;
  I: Integer;
  ClientSQL: TRESTDWClientSQL;
begin
  JSONValue     := Nil;
  dwParams      := Nil;
  vErrorMessage := '';
    ClientSQL    := Nil;

  if DM.TestarConexaoServidorRDW then
  begin
    ClientSQL:=TRESTDWClientSQL.Create(Nil);
    JSONValue     := TJSONValue.Create;
    try
      //Recuperar dados no servidor conforme sql recebido
      DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
      dwParams.ItemsString['SQL'].AsString  := 'SELECT USUARIO, SENHA FROM USUARIOS '+
                                                'WHERE USUARIO = ' + QuotedStr(edtDescricao.Text);
      dwParams.ItemsString['Token'].AsString  := DM.Token;
      DM.DWClientEvents1.SendEvent('Retornar', dwParams, vErrorMessage);


      ClientSQL.OpenJson(vErrorMessage);
      if ClientSQL.RecordCount > 0 then
      begin
        try
          if ClientSQL.FieldByName('USUARIO').AsString > edtDescricao.Text then
          begin
            ShowMessage('E-mail inválido.');
            Abort;
          end;
          if ClientSQL.FieldByName('SENHA').AsString > edtSenha.Text then
          begin
            ShowMessage('Senha inválida.');
            Abort;
          end;

          ModalResult := mrOk;

        except on E: Exception do

        end;

      end;

      if vErrorMessage = '' then
      begin
        //JSONValue.WriteToDataset(dtFull, dwParams.ItemsString['Result'].Value, FDMemTable1);
      end;

    finally
      begin
        dwParams.DisposeOf;
        JSONValue.DisposeOf;
      end;
    end;
  end else ShowMessage('Sem conexão com o servidor.');

end;

end.
