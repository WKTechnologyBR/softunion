unit untCadastroClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM, Vcl.Buttons, ClasseCadastro;

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
    FDMemTable1CPF: TStringField;
    FDMemTable1RG: TStringField;
    FDMemTable1DS_ENDERECOS: TStringField;
    FDMemTable1FONE: TStringField;
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
                           'C.CD_CLIENTES CD_CADASTRO, '+
                           'C.NM_CLIENTES DS_CADASTRO, '+
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

  if cbEnderecos.ItemIndex = -1 then
  begin
    ShowMessage('Endereço é um campo obrigatório.');
    cbEnderecos.SetFocus;
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
  edtCPF.Text           :=  FDMemTable1.FieldByName('CPF').AsString;
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


    // FDMTPadrao.Close;
//    FDMTPadrao.FieldDefs.Clear;//Limpamos campos
//    FDMTPadrao.FieldDefs.Add('NM_CLIENTES', ftString, 60, False); // adicionamos campos
//    FDMTPadrao.FieldDefs.Add('CPF', ftString, 60, False);
//    FDMTPadrao.FieldDefs.Add('RG', ftString, 60, False);
//    FDMTPadrao.FieldDefs.Add('CD_ENDERECOS', ftInteger);
//    FDMTPadrao.FieldDefs.Add('DT_NASCIMENTO', ftDate);
//    FDMTPadrao.FieldDefs.Add('FONE', ftString, 60, False);
//    FDMTPadrao.FieldDefs.Add('CELULAR', ftString, 60, False);
//    FDMTPadrao.FieldDefs.Add('EMAIL', ftString, 60, False);
//    FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
//    FDMTPadrao.FieldDefs.Add('CD_USUARIOS', ftInteger);
//    FDMTPadrao.CreateDataSet;

//    FDMTPadrao.Append;
//    FDMTPadrao.FieldByName('NM_CLIENTES').AsString    := edtDescricao.Text;
//    FDMTPadrao.FieldByName('CPF').AsString            := edtCPF.Text;
//    FDMTPadrao.FieldByName('RG').AsString             := edtRG.Text;
//    FDMTPadrao.FieldByName('CD_ENDERECOS').AsInteger  := DM.ComboBoxRetornar(cbEnderecos);
//    FDMTPadrao.FieldByName('DT_NASCIMENTO').AsString  := DateToStr(edtDataNascimento.Date);
//    FDMTPadrao.FieldByName('FONE').AsString           := edtTelefone.Text;
//    FDMTPadrao.FieldByName('CELULAR').AsString        := edtCelular.Text;
//    FDMTPadrao.FieldByName('EMAIL').AsString          := edtEmail.Text;
//    FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime  := Now;
//    FDMTPadrao.FieldByName('CD_USUARIOS').AsInteger   := 1;
//    FDMTPadrao.Post;

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
        AtualizarServidor('CLIENTES', edtCodigo.Text);
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
