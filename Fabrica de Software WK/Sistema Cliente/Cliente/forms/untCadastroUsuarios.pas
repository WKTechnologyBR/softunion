unit untCadastroUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM, ClasseCadastro, uDWDataset, System.StrUtils;

type
  TfrmCadastroUsuarios = class(TfrmPadrao)
    edtUsuario: TEdit;
    Label5: TLabel;
    edtSenha: TEdit;
    Label6: TLabel;
    FDMemTable1CD_USUARIOS: TIntegerField;
    FDMemTable1NM_USUARIOS: TStringField;
    FDMemTable1USUARIO: TStringField;
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
                           'CD_USUARIOS, '+
                           'NM_USUARIOS, '+
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
var
  CUsuarios: TUsuarios;
begin
  inherited;
  CUsuarios:=Nil;
  CUsuarios:=TUsuarios.Create;

  try
    CUsuarios.FNM_USUARIOS  :=  edtDescricao.Text;
    CUsuarios.FUSUARIO      :=  edtUsuario.Text;
    CUsuarios.FSENHA        :=  IfThen(Trim(edtSenha.Text) <> '',
                                DM.PostProcess(DM.InternalEncrypt(edtSenha.Text, 0)),
                                FDMemTable1SENHA.AsString);

    CUsuarios.FDT_REGISTRO  :=  Copy(FormatDateTime('YYYY.MM.DD hh:mm', NOW), 1, 15);
    CUsuarios.FTOKEN        :=  DM.TOKEN;
    CUsuarios.FIN_ATIVO     :=  'S';


    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          GravarServidorJson(CUsuarios, 'USUARIOS', 'GravarUsuario');

          edtCodigo.Text    := '';
          edtDescricao.Text := '';
          edtSenha.Text     := '';
          edtUsuario.Text     := '';

          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor(CUsuarios, 'USUARIOS', edtCodigo.Text);
        edtCodigo.Text    := '';
        edtDescricao.Text := '';
        edtSenha.Text     := '';
        edtUsuario.Text     := '';
        PageControl1.ActivePage := tabPrincipal;
      end;

      Listar(aSQLPadrao);

    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    CUsuarios.DisposeOf;
  end;
end;

procedure TfrmCadastroUsuarios.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text    := FDMemTable1.FieldByName('CD_USUARIOS').AsString;
  edtDescricao.Text := FDMemTable1.FieldByName('NM_USUARIOS').AsString;
  edtSenha.Text     := ''; //FDMemTable1.FieldByName('SENHA').AsString;
  edtUsuario.Text   := FDMemTable1.FieldByName('USUARIO').AsString;
end;

procedure TfrmCadastroUsuarios.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

end.
