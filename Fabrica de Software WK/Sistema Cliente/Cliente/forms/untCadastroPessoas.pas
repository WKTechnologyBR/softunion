unit untCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, untDM, Datasnap.DBClient, ClasseCadastro, uDWDataset,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmCadastroPessoas = class(TfrmPadrao)
    edtDataNascimento: TDateTimePicker;
    Label15: TLabel;
    cbEnderecos: TComboBox;
    Label7: TLabel;
    cbTipoPessoa: TComboBox;
    Label8: TLabel;
    edtCPFCNPJ: TEdit;
    Label5: TLabel;
    lblNomeFantasia: TLabel;
    lblRazaoSocial: TLabel;
    edtRazaoSocial: TEdit;
    edtNomeFantasia: TEdit;
    Panel4: TPanel;
    cbSexo: TComboBox;
    Label6: TLabel;
    cbEstadoCivil: TComboBox;
    Label9: TLabel;
    FDMemTable1CD_PESSOAS: TIntegerField;
    FDMemTable1NM_PESSOAS: TStringField;
    FDMemTable1DT_NASCIMENTO: TStringField;
    FDMemTable1CD_SEXO: TIntegerField;
    FDMemTable1CD_ENDERECOS: TIntegerField;
    FDMemTable1CPF: TStringField;
    FDMemTable1CD_ESTADO_CIVIL: TIntegerField;
    FDMemTable1NM_FANTASIA: TStringField;
    FDMemTable1CNPJ: TStringField;
    FDMemTable1RAZAO_SOCIAL: TStringField;
    FDMemTable1TIPO_PESSOA: TIntegerField;
    FDMemTable1DT_REGISTRO: TStringField;
    FDMemTable1CD_USUARIOS: TIntegerField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoPessoaCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarRegistro;
    procedure LimparCampos;
  end;

var
  frmCadastroPessoas: TfrmCadastroPessoas;

const aSQLPadrao: String = 'SELECT '+
                           'P.CD_PESSOAS, '+
                           'P.NM_PESSOAS, '+
                           'P.DT_NASCIMENTO, '+
                           'P.CD_SEXO, '+
                           'S.DS_SEXO, '+
                           'P.CD_ENDERECOS, '+
                           'P.CPF, '+
                           'P.CD_ESTADO_CIVIL, '+
                           'P.NM_FANTASIA, '+
                           'P.CNPJ, '+
                           'P.RAZAO_SOCIAL, '+
                           'P.TIPO_PESSOA, '+
                           //'P.DT_REGISTRO, '+
                           'P.CD_USUARIOS '+

                           'FROM PESSOAS P ' +
                           'LEFT JOIN SEXO S ON S.CD_SEXO = P.CD_SEXO ';

implementation

{$R *.dfm}

procedure TfrmCadastroPessoas.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Nome do cliente é um campo obrigatório.');
    edtDescricao.SetFocus;
    Abort;
  end;
//  if Trim(edtCPF.Text) = '' then
//  begin
//    ShowMessage('CPF é um campo obrigatório.');
//    edtCPF.SetFocus;
//    Abort;
//  end;
//
//  if Trim(edtRG.Text) = '' then
//  begin
//    ShowMessage('RG é um campo obrigatório.');
//    edtRG.SetFocus;
//    Abort;
//  end;
//
//  if cbEnderecos.ItemIndex = -1 then
//  begin
//    ShowMessage('Endereço é um campo obrigatório.');
//    cbEnderecos.SetFocus;
//    Abort;
//  end;
//
//  if Trim(edtTelefone.Text) = '' then
//  begin
//    ShowMessage('Telefone é um campo obrigatório.');
//    edtTelefone.SetFocus;
//    Abort;
//  end;
//
//  if Trim(edtCelular.Text) = '' then
//  begin
//    ShowMessage('Celular é um campo obrigatório.');
//    edtCelular.SetFocus;
//    Abort;
//  end;
//
//  if Trim(edtEmail.Text) = '' then
//  begin
//    ShowMessage('E-mail é um campo obrigatório.');
//    edtEmail.SetFocus;
//    Abort;
//  end;

  try
    GravarRegistro;
  except on e:exception do
    MessageDlg(e.message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmCadastroPessoas.cbTipoPessoaCloseUp(Sender: TObject);
begin
  inherited;
  case cbTipoPessoa.ItemIndex of
    0:begin  //Pessoa física
        Panel4.Left:= cbEnderecos.Left;
        Panel4.Top := cbEnderecos.Top + 33;
        Panel4.Visible:=True;

        lblNomeFantasia.Visible := False;
        edtNomeFantasia.Visible := False;
        lblRazaoSocial.Visible  := False;
        edtRazaoSocial.Visible  := False;
      end;

    1:begin
        Panel4.Visible:=False;

        lblNomeFantasia.Visible := True;
        edtNomeFantasia.Visible := True;
        lblRazaoSocial.Visible  := True;
        edtRazaoSocial.Visible  := True;
      end;

  end;
end;

procedure TfrmCadastroPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  //Pessoa física
  Panel4.Left:= cbEnderecos.Left;
  Panel4.Top := cbEnderecos.Top + 33;
  Panel4.Visible:=True;
  Listar(aSQLPadrao);
end;

procedure TfrmCadastroPessoas.GravarRegistro;
var
  CPessoas: TPessoas;
begin
  try
    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          GravarServidorJson(CPessoas, 'PESSOAS');

          LimparCampos;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor(CPessoas, 'PESSOAS', edtCodigo.Text);
        LimparCampos;
        PageControl1.ActivePage := tabPrincipal;
      end;

      Listar(aSQLPadrao);

    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    CPessoas.DisposeOf;
  end;
end;

procedure TfrmCadastroPessoas.LimparCampos;
begin
//
end;

end.
