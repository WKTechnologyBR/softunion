unit untLogin;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  untDM, Vcl.ExtCtrls;

type
  TfrmLogin = class(TForm)
    edtDescricao: TEdit;
    Label2: TLabel;
    edtSenha: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    edtToken: TEdit;
    Image1: TImage;
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
  uDWJSONObject, uDWConsts, uRESTDWPoolerDB;

{$R *.dfm}

procedure TfrmLogin.Button1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmLogin.Button2Click(Sender: TObject);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vErrorMessage : String;
  I: Integer;

  RDWClientSQL: TRESTDWClientSQL;
begin
  RDWClientSQL  :=  Nil;
  JSONValue     := Nil;
  dwParams      := Nil;
  vErrorMessage := '';

  if DM.TestarConexaoServidorRDW then
  begin
    RDWClientSQL  := TRESTDWClientSQL.Create(Nil);
    JSONValue     := TJSONValue.Create;
    try
      //Recuperar dados no servidor conforme sql recebido
      DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
      dwParams.ItemsString['SQL'].AsString  := 'SELECT CD_USUARIOS, USUARIO, SENHA FROM USUARIOS '+
                                                'WHERE USUARIO = ' + QuotedStr(edtDescricao.Text);
      dwParams.ItemsString['Token'].AsString  := edtToken.Text;
      DM.DWClientEvents1.SendEvent('Retornar', dwParams, vErrorMessage);
      //JSONValue.WriteToDataset(dtFull, dwParams.ItemsString['Result'].Value, FDMemTable1);

      RDWClientSQL.OpenJson(vErrorMessage);

      if RDWClientSQL.RecordCount > 0 then
      begin

        try
          if RDWClientSQL.FieldByName('USUARIO').AsString <> edtDescricao.Text then
          begin
            ShowMessage('E-mail inválido.');
            Abort;
          end;
          if RDWClientSQL.FieldByName('SENHA').AsString <> DM.PostProcess(DM.InternalEncrypt(edtSenha.Text, 0)) then
          begin
            ShowMessage('Senha inválida.');
            Abort;
          end;

          ModalResult := mrOk;
          DM.TOKEN:=edtToken.Text;
          DM.CD_USUARIO:=RDWClientSQL.FieldByName('CD_USUARIOS').AsInteger;

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
        RDWClientSQL.DisposeOf;
      end;
    end;
  end else ShowMessage('Sem conexão com o servidor.');

end;

end.
