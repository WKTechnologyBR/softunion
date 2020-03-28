unit untCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM, Vcl.Buttons, ClasseCadastro,
  uDWDataset;

type
  TfrmCadastroClientes = class(TfrmPadrao)
    Label8: TLabel;
    edtCPF: TEdit;
    edtRG: TEdit;
    Label11: TLabel;
    edtCelular: TEdit;
    Label12: TLabel;
    edtTelefone: TEdit;
    Label13: TLabel;
    edtEmail: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtDataNascimento: TDateTimePicker;
    FDMemTable1CD_CLIENTES: TIntegerField;
    FDMemTable1NM_CLIENTES: TStringField;
    FDMemTable1CPF: TStringField;
    FDMemTable1RG: TStringField;
    FDMemTable1TELEFONE: TStringField;
    FDMemTable1CELULAR: TStringField;
    FDMemTable1EMAIL: TStringField;
    cbCidades: TComboBox;
    Label10: TLabel;
    Label7: TLabel;
    Label5: TLabel;
    edtEndereco: TEdit;
    Label6: TLabel;
    edtBairro: TEdit;
    edtNumero: TEdit;
    Label9: TLabel;
    Label16: TLabel;
    edtComplemento: TEdit;
    cbEstados: TComboBox;
    FDMemTable1BAIRRO: TStringField;
    FDMemTable1COMPLEMENTO: TStringField;
    FDMemTable1NUMERO: TStringField;
    FDMemTable1CD_CIDADES: TIntegerField;
    FDMemTable1DS_ENDERECOS: TStringField;
    FDMemTable1DT_NASCIMENTO: TStringField;
    FDMemTable1DS_ESTADOS: TStringField;
    FDMemTable1DS_CIDADES: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarRegistro;
    procedure LimparCampos;
  end;

var
  frmCadastroClientes: TfrmCadastroClientes;

const aSQLPadrao: String = 'SELECT '+
                           'C.CD_CLIENTES, '+
                           'C.NM_CLIENTES, '+
                           'C.CPF, '+
                           'C.RG, '+
                           'C.DT_NASCIMENTO, '+
                           'C.TELEFONE, '+
                           'C.CELULAR, '+
                           'C.EMAIL, '+
                           'C.DS_ENDERECOS, '+
                           'C.BAIRRO, '+
                           'C.COMPLEMENTO, '+
                           'C.NUMERO, '+
                           'C.CD_CIDADES, '+
                           'CC.DS_CIDADES, '+
                           'E.DS_ESTADOS, '+
                           'C.DT_REGISTRO, '+
                           'C.CD_USUARIOS '+

                           'FROM CLIENTES C '+
                           'LEFT JOIN CIDADES CC ON CC.CD_CIDADES = C.CD_CIDADES '+
                           'LEFT JOIN ESTADOS E ON E.CD_ESTADOS = C.CD_ESTADOS ';
implementation

{$R *.dfm}

procedure TfrmCadastroClientes.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox(Pchar(
    'O item será excluído definitivamente!'), 'Aviso do Sistema!', MB_YESNO) of
    IDYES  :
    begin
        DeletarServidor('CLIENTES', edtCodigo.Text);
        PageControl1.ActivePage:=tabPrincipal;
        Listar(aSQLPadrao);
    end;

    IDNO :
    begin

    end;
  end;
end;

procedure TfrmCadastroClientes.btnSalvarClick(Sender: TObject);
begin
  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Nome do cliente é um campo obrigatório.');
    edtDescricao.SetFocus;
    Abort;
  end;
  if Trim(edtCPF.Text) = '' then
  begin
    ShowMessage('CPF é um campo obrigatório.');
    edtCPF.SetFocus;
    Abort;
  end;

  if Trim(edtRG.Text) = '' then
  begin
    ShowMessage('RG é um campo obrigatório.');
    edtRG.SetFocus;
    Abort;
  end;

  if Trim(edtTelefone.Text) = '' then
  begin
    ShowMessage('Telefone é um campo obrigatório.');
    edtTelefone.SetFocus;
    Abort;
  end;

  if Trim(edtCelular.Text) = '' then
  begin
    ShowMessage('Celular é um campo obrigatório.');
    edtCelular.SetFocus;
    Abort;
  end;

  if Trim(edtEmail.Text) = '' then
  begin
    ShowMessage('E-mail é um campo obrigatório.');
    edtEmail.SetFocus;
    Abort;
  end;

  try
    GravarRegistro;
  except on e:exception do
    MessageDlg(e.message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmCadastroClientes.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text              :=  FDMemTable1.FieldByName('CD_CLIENTES').AsString;
  edtDescricao.Text           :=  FDMemTable1.FieldByName('NM_CLIENTES').AsString;
  edtCPF.Text                 :=  FDMemTable1.FieldByName('CPF').AsString;
  edtRG.Text                  :=  FDMemTable1.FieldByName('RG').AsString;

  edtTelefone.Text            :=  FDMemTable1.FieldByName('TELEFONE').AsString;
  edtCelular.Text             :=  FDMemTable1.FieldByName('CELULAR').AsString;
  edtEmail.Text               :=  FDMemTable1.FieldByName('EMAIL').AsString;

  edtDataNascimento.DateTime  :=  FDMemTable1.FieldByName('DT_NASCIMENTO').AsDateTime;
  cbCidades.ItemIndex         :=  cbCidades.Items.IndexOf(FDMemTable1.FieldByName('DS_CIDADES').AsString);
  cbEstados.ItemIndex         :=  cbEstados.Items.IndexOf(FDMemTable1.FieldByName('DS_ESTADOS').AsString);
  edtEndereco.Text            :=  FDMemTable1.FieldByName('DS_ENDERECOS').AsString;
  edtBairro.Text              :=  FDMemTable1.FieldByName('BAIRRO').AsString;
  edtComplemento.Text         :=  FDMemTable1.FieldByName('COMPLEMENTO').AsString;
  edtNumero.Text              :=  FDMemTable1.FieldByName('NUMERO').AsString;
end;

procedure TfrmCadastroClientes.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

procedure TfrmCadastroClientes.GravarRegistro;
var
  CClientes: TClientes;
begin
  CClientes:=Nil;
  CClientes:=TClientes.Create;
  try
    CClientes.FNM_CLIENTES  := edtDescricao.Text;
    CClientes.FCPF          := edtCPF.Text;
    CClientes.FRG           := edtRG.Text;
    CClientes.FDT_NASCIMENTO:= DateToStr(edtDataNascimento.Date);
    CClientes.FTELEFONE     := edtTelefone.Text;
    CClientes.FCELULAR      := edtCelular.Text;
    CClientes.FEMAIL        := edtEmail.Text;

    CClientes.FCD_CIDADES   := DM.ComboBoxRetornar(cbCidades);
    CClientes.FCD_ESTADOS   := DM.ComboBoxRetornar(cbEstados);
    CClientes.FDS_ENDERECOS := edtEndereco.Text;
    CClientes.FBAIRRO       := edtBairro.Text;
    CClientes.FCOMPLEMENTO  := edtComplemento.Text;
    CClientes.FNUMERO       := edtNumero.Text;
    CClientes.FDT_REGISTRO  := Copy(FormatDateTime('YYYY.MM.DD hh:mm', NOW), 1, 15);
    CClientes.FCD_USUARIOS  := DM.CD_USUARIO;

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          GravarServidorJson(CClientes, 'CLIENTES');

          LimparCampos;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor(CClientes, 'CLIENTES', edtCodigo.Text);
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
    CClientes.DisposeOf;
  end;
end;

procedure TfrmCadastroClientes.LimparCampos;
begin
  edtCodigo.Text         := '';
  edtDescricao.Text      := '';
  edtCPF.Text            := '';
  edtRG.Text             := '';
  edtDataNascimento.Date := Now;
  edtTelefone.Text       := '';
  edtCelular.Text        := '';
  edtEmail.Text          := '';
end;

end.
