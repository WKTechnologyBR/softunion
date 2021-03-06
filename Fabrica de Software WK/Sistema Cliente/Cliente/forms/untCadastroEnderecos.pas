unit untCadastroEnderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB,
  Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM, ClasseCadastro, uDWDataset;

type
  TfrmCadastroEnderecos = class(TfrmPadrao)
    edtBairro: TEdit;
    Label5: TLabel;
    edtNumero: TEdit;
    Label6: TLabel;
    edtComplemento: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    cbCidades: TComboBox;
    FDMemTable1CD_ENDERECOS: TIntegerField;
    FDMemTable1DS_ENDERECOS: TStringField;
    FDMemTable1BAIRRO: TStringField;
    FDMemTable1COMPLEMENTO: TStringField;
    FDMemTable1NUMERO: TStringField;
    FDMemTable1DS_CIDADES: TStringField;
    FDMemTable1CD_CIDADES: TIntegerField;
    FDMemTable1CD_USUARIO: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarRegistro;
    procedure LimparCampos;
  end;

var
  frmCadastroEnderecos: TfrmCadastroEnderecos;

const aSQLPadrao: String =  'SELECT '+
                            'E.CD_ENDERECOS, '+
                            'E.DS_ENDERECOS, '+
                            'E.BAIRRO, '+
                            'E.COMPLEMENTO, '+
                            'E.NUMERO, '+
                            'C.DS_CIDADES, '+
                            'E.CD_CIDADES, '+
                            'E.CD_USUARIO '+
                            'FROM ENDERECOS E '+
                            'LEFT JOIN CIDADES C ON C.CD_CIDADES = E.CD_CIDADES ';
implementation

{$R *.dfm}

procedure TfrmCadastroEnderecos.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
end;

procedure TfrmCadastroEnderecos.btnSalvarClick(Sender: TObject);
begin

  if cbCidades.ItemIndex = -1 then
  begin
    ShowMessage('Cidade � um campo obrigat�rio.');
    cbCidades.SetFocus;
    Abort;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Descri��o � um campo obrigat�rio.');
    edtDescricao.SetFocus;
    Abort;
  end;

  if Trim(edtBairro.Text) = '' then
  begin
    ShowMessage('Bairro � um campo obrigat�rio.');
    edtBairro.SetFocus;
    Abort;
  end;

  if Trim(edtNumero.Text) = '' then
  begin
    ShowMessage('N�mero � um campo obrigat�rio.');
    edtNumero.SetFocus;
    Abort;
  end;

  if Trim(edtComplemento.Text) = '' then
  begin
    ShowMessage('Complemento � um campo obrigat�rio.');
    edtComplemento.SetFocus;
    Abort;
  end;

  try
    GravarRegistro;
  except on e:exception do
    MessageDlg(e.message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmCadastroEnderecos.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtCodigo.Text       :=  FDMemTable1.FieldByName('CD_ENDERECOS').AsString;
  edtDescricao.Text    :=  FDMemTable1.FieldByName('DS_ENDERECOS').AsString;
  edtBairro.Text       :=  FDMemTable1.FieldByName('BAIRRO').AsString;
  edtComplemento.Text  :=  FDMemTable1.FieldByName('COMPLEMENTO').AsString;
  edtNumero.Text       :=  FDMemTable1.FieldByName('NUMERO').AsString;
  cbCidades.ItemIndex:=cbCidades.Items.IndexOf(FDMemTable1.FieldByName('DS_CIDADES').AsString);
end;

procedure TfrmCadastroEnderecos.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

procedure TfrmCadastroEnderecos.GravarRegistro;
var
  CEnderecos: TEnderecos;
begin
  CEnderecos:=Nil;
  CEnderecos:=TEnderecos.Create;

  try
    CEnderecos.FCD_CIDADES      := DM.ComboBoxRetornar(cbCidades);
    CEnderecos.FDS_ENDERECOS    := edtDescricao.Text;
    CEnderecos.FBAIRRO          := edtBairro.Text;
    CEnderecos.FCOMPLEMENTO     := edtComplemento.Text;
    CEnderecos.FNUMERO          := edtNumero.Text;
    // CEnderecos.FDT_CADASTRO  := Now;
    CEnderecos.FCD_USUARIOS     := 1;

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descri��o antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          GravarServidorJson(CEnderecos, 'ENDERECOS');

          LimparCampos;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve altera��o a atualizado no banco
        AtualizarServidor(CEnderecos, 'ENDERECOS', edtCodigo.Text);
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
    CEnderecos.DisposeOf;
  end;
end;

procedure TfrmCadastroEnderecos.LimparCampos;
begin
  edtCodigo.Text      := '';
  edtDescricao.Text   := '';
  edtBairro.Text      := '';
  edtComplemento.Text := '';
  edtNumero.Text      := '';
  cbCidades.ItemIndex := -1;
end;

end.
