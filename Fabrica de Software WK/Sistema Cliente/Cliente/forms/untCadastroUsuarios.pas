unit untCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls;

type
  TfrmCadastroUsuarios = class(TfrmPadrao)
    edtEmail: TEdit;
    Label5: TLabel;
    edtSenha: TEdit;
    Label6: TLabel;
    FDMemTable1EMAIL: TStringField;
    FDMemTable1SENHA: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroUsuarios: TfrmCadastroUsuarios;

const aSQLPadrao: String = 'SELECT '+
                           'CD_USUARIOS CD_CADASTRO, '+
                           'NM_USUARIOS DS_CADASTRO, '+
                           'USUARIO, '+
                           'SENHA '+
                           'FROM USUARIOS ';
implementation

{$R *.dfm}

procedure TfrmCadastroUsuarios.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox(Pchar(
    'O item será excluído definitivamente!'), 'Aviso do Sistema!', MB_YESNO) of
    IDYES  :
    begin
        DeletarServidor('USUARIOS', edtCodigo.Text);
        PageControl1.ActivePage:=tabPrincipal;
        Listar(aSQLPadrao);
    end;

    IDNO :
    begin

    end;
  end;
end;

procedure TfrmCadastroUsuarios.btnSalvarClick(Sender: TObject);
begin
  inherited;

  FDMTPadrao.Close;
  FDMTPadrao.FieldDefs.Clear;//Limpamos campos
  FDMTPadrao.FieldDefs.Add('NM_USUARIOS', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('USUARIO', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('SENHA', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
  FDMTPadrao.FieldDefs.Add('IN_ATIVO', ftString, 1, False);
  FDMTPadrao.CreateDataSet;

  FDMTPadrao.Append;
  FDMTPadrao.FieldByName('NM_USUARIOS').AsString   := edtDescricao.Text;
  FDMTPadrao.FieldByName('USUARIO').AsString         := edtEmail.Text;
  FDMTPadrao.FieldByName('SENHA').AsString         := edtSenha.Text;
  FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime := Now;
  FDMTPadrao.FieldByName('IN_ATIVO').AsString      := 'S';
  FDMTPadrao.Post;

  try

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          GravarServidor('USUARIOS');

          edtCodigo.Text    := '';
          edtDescricao.Text := '';
          edtSenha.Text     := '';
          edtEmail.Text     := '';

          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor('USUARIOS', edtCodigo.Text);
        edtCodigo.Text    := '';
        edtDescricao.Text := '';
        edtSenha.Text     := '';
        edtEmail.Text     := '';
        PageControl1.ActivePage := tabPrincipal;
      end;
    finally

    end;

    Listar(aSQLPadrao);

  except on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TfrmCadastroUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtSenha.Text := FDMemTable1.FieldByName('SENHA').AsString;
  edtEmail.Text := FDMemTable1.FieldByName('USUARIO').AsString;
end;

procedure TfrmCadastroUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

end.
