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
    Label5: TLabel;
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
    cbEnderecos: TComboBox;
    Label15: TLabel;
    edtDataNascimento: TDateTimePicker;
    FDMemTable1CD_CLIENTES: TIntegerField;
    FDMemTable1NM_CLIENTES: TStringField;
    FDMemTable1CPF: TStringField;
    FDMemTable1RG: TStringField;
    FDMemTable1DS_ENDERECOS: TStringField;
    FDMemTable1TELEFONE: TStringField;
    FDMemTable1CELULAR: TStringField;
    FDMemTable1EMAIL: TStringField;
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
                           'E.DS_ENDERECOS, '+
                           //'C.DT_NASCIMENTO, '+
                           'C.TELEFONE, '+
                           'C.CELULAR, '+
                           'C.EMAIL '+
                           'FROM CLIENTES C '+
                           'LEFT JOIN ENDERECOS E ON E.CD_ENDERECOS = C.CD_ENDERECOS';
implementation

{$R *.dfm}

procedure TfrmCadastroClientes.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox(Pchar(
    'O item ser� exclu�do definitivamente!'), 'Aviso do Sistema!', MB_YESNO) of
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
    ShowMessage('Nome do cliente � um campo obrigat�rio.');
    edtDescricao.SetFocus;
    Abort;
  end;
  if Trim(edtCPF.Text) = '' then
  begin
    ShowMessage('CPF � um campo obrigat�rio.');
    edtCPF.SetFocus;
    Abort;
  end;

  if Trim(edtRG.Text) = '' then
  begin
    ShowMessage('RG � um campo obrigat�rio.');
    edtRG.SetFocus;
    Abort;
  end;

  if cbEnderecos.ItemIndex = -1 then
  begin
    ShowMessage('Endere�o � um campo obrigat�rio.');
    cbEnderecos.SetFocus;
    Abort;
  end;

  if Trim(edtTelefone.Text) = '' then
  begin
    ShowMessage('Telefone � um campo obrigat�rio.');
    edtTelefone.SetFocus;
    Abort;
  end;

  if Trim(edtCelular.Text) = '' then
  begin
    ShowMessage('Celular � um campo obrigat�rio.');
    edtCelular.SetFocus;
    Abort;
  end;

  if Trim(edtEmail.Text) = '' then
  begin
    ShowMessage('E-mail � um campo obrigat�rio.');
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
  edtCodigo.Text        :=  FDMemTable1.FieldByName('CD_CLIENTES').AsString;
  edtDescricao.Text     :=  FDMemTable1.FieldByName('DS_CLIENTES').AsString;
  edtRG.Text            :=  FDMemTable1.FieldByName('RG').AsString;
  cbEnderecos.ItemIndex :=  cbEnderecos.Items.IndexOf(FDMemTable1.FieldByName('DS_ENDERECOS').AsString);
  edtTelefone.Text      :=  FDMemTable1.FieldByName('FONE').AsString;
  edtCelular.Text       :=  FDMemTable1.FieldByName('CELULAR').AsString;
  edtEmail.Text         :=  FDMemTable1.FieldByName('EMAIL').AsString;
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
    CClientes.FNM_CLIENTES:= edtDescricao.Text;
    CClientes.FCPF := edtCPF.Text;
    CClientes.FRG := edtRG.Text;
    CClientes.FCD_ENDERECOS := DM.ComboBoxRetornar(cbEnderecos);
    // CClientes.FDT_NASCIMENTO:= DateToStr(edtDataNascimento.Date);
    CClientes.FTELEFONE := edtTelefone.Text;
    CClientes.FCELULAR := edtCelular.Text;
    CClientes.FEMAIL := edtEmail.Text;
    // CClientes.FDT_REGISTRO:= Now;
    CClientes.FCD_USUARIOS := 1;

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descri��o antes de prosseguir.')
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
        //Verificar se o item existe no banco e se houve altera��o a atualizado no banco
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
  cbEnderecos.ItemIndex  := -1;
  edtDataNascimento.Date := Now;
  edtTelefone.Text       := '';
  edtCelular.Text        := '';
  edtEmail.Text          := '';
end;

end.
