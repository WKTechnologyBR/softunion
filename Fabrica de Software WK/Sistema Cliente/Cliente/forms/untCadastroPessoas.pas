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
    FDMemTable1CPF: TStringField;
    FDMemTable1CD_ESTADO_CIVIL: TIntegerField;
    FDMemTable1NM_FANTASIA: TStringField;
    FDMemTable1CNPJ: TStringField;
    FDMemTable1RAZAO_SOCIAL: TStringField;
    FDMemTable1TIPO_PESSOA: TIntegerField;
    FDMemTable1DT_REGISTRO: TStringField;
    FDMemTable1CD_USUARIOS: TIntegerField;
    Label10: TLabel;
    cbCidades: TComboBox;
    Label11: TLabel;
    edtEndereco: TEdit;
    Label12: TLabel;
    edtBairro: TEdit;
    edtNumero: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    edtComplemento: TEdit;
    cbEstados: TComboBox;
    Label7: TLabel;
    FDMemTable1BAIRRO: TStringField;
    FDMemTable1COMPLEMENTO: TStringField;
    FDMemTable1NUMERO: TStringField;
    FDMemTable1CD_CIDADES: TIntegerField;
    FDMemTable1DS_ENDERECOS: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbTipoPessoaCloseUp(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
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
                           'P.CPF, '+
                           'P.CD_ESTADO_CIVIL, '+
                           'P.NM_FANTASIA, '+
                           'P.CNPJ, '+
                           'P.RAZAO_SOCIAL, '+
                           'P.TIPO_PESSOA, '+
                           'P.DT_REGISTRO, '+
                           'P.CD_USUARIOS, '+
                           'P.BAIRRO, '+
                           'P.COMPLEMENTO, '+
                           'P.NUMERO, '+
                           'P.CD_CIDADES, '+
                           'P.DS_ENDERECOS '+

                           'FROM PESSOAS P';

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
        Panel4.Left:= edtDescricao.Left;
        Panel4.Top := edtDescricao.Top + 35;
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

procedure TfrmCadastroPessoas.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text    :=  FDMemTable1.FieldByName('CD_PESSOAS').AsString;
  edtDescricao.Text :=  FDMemTable1.FieldByName('NM_PESSOAS').AsString;

  edtDataNascimento.DateTime  :=  FDMemTable1.FieldByName('DT_NASCIMENTO').AsDateTime;
  cbSexo.ItemIndex            :=  cbSexo.Items.IndexOf(FDMemTable1.FieldByName('CD_SEXO').AsString);
  edtCPFCNPJ.Text             :=  FDMemTable1.FieldByName('CPF').AsString;
  //DM.ComboBoxRetornar(cbEstadoCivil);
  edtNomeFantasia.Text  :=  FDMemTable1.FieldByName('NM_FANTASIA').AsString;
  cbTipoPessoa.ItemIndex  :=  FDMemTable1.FieldByName('TIPO_PESSOA').AsInteger;
  //DM.ComboBoxRetornar(cbCidades);
  //DM.ComboBoxRetornar(cbEstados);
  edtEndereco.Text  :=  FDMemTable1.FieldByName('DS_ENDERECOS').AsString;
  edtBairro.Text  :=  FDMemTable1.FieldByName('BAIRRO').AsString;
  edtComplemento.Text  :=  FDMemTable1.FieldByName('COMPLEMENTO').AsString;
  edtNumero.Text  :=  FDMemTable1.FieldByName('NUMERO').AsString;
end;

procedure TfrmCadastroPessoas.FormCreate(Sender: TObject);
begin
  inherited;
  //Pessoa física
  Panel4.Left:= edtDescricao.Left;
  Panel4.Top := edtDescricao.Top + 35;
  Panel4.Visible:=True;
  Listar(aSQLPadrao);
end;

procedure TfrmCadastroPessoas.GravarRegistro;
var
  CPessoas: TPessoas;
begin
  CPessoas:=Nil;
  CPessoas:=TPessoas.Create;

  try
    CPessoas.FNM_PESSOAS          := edtDescricao.Text;
    CPessoas.FDT_NASCIMENTO       := Copy(FormatDateTime('YYYY.MM.DD', edtDataNascimento.Date), 1, 10);
    CPessoas.FCD_SEXO             := DM.ComboBoxRetornar(cbSexo);
    CPessoas.FCPF                 := edtCPFCNPJ.Text;
    CPessoas.FCD_ESTADO_CIVIL     := DM.ComboBoxRetornar(cbEstadoCivil);
    CPessoas.FNM_FANTASIA         := edtNomeFantasia.Text;
    CPessoas.FTIPO_PESSOA         := cbTipoPessoa.ItemIndex;
    CPessoas.FCD_CIDADES          := DM.ComboBoxRetornar(cbCidades);
    CPessoas.FCD_ESTADOS          := DM.ComboBoxRetornar(cbEstados);
    CPessoas.FDS_ENDERECOS        := edtEndereco.Text;
    CPessoas.FBAIRRO              := edtBairro.Text;
    CPessoas.FCOMPLEMENTO         := edtComplemento.Text;
    CPessoas.FNUMERO              := edtNumero.Text;
    CPessoas.FDT_REGISTRO         := Copy(FormatDateTime('YYYY.MM.DD hh:mm', NOW), 1, 15);
    CPessoas.FCD_USUARIOS         := DM.CD_USUARIO;

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
