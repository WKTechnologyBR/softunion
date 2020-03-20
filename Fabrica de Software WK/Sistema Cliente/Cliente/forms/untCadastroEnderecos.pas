unit untCadastroEnderecos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM;

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
    FDMemTable1BAIRRO: TStringField;
    FDMemTable1NUMERO: TStringField;
    FDMemTable1COMPLEMENTO: TStringField;
    FDMemTable1DS_CIDADES: TStringField;
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
    ShowMessage('Cidade é um campo obrigatório.');
    cbCidades.SetFocus;
    Abort;
  end;

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Descrição é um campo obrigatório.');
    edtDescricao.SetFocus;
    Abort;
  end;

  if Trim(edtBairro.Text) = '' then
  begin
    ShowMessage('Bairro é um campo obrigatório.');
    edtBairro.SetFocus;
    Abort;
  end;

  if Trim(edtNumero.Text) = '' then
  begin
    ShowMessage('Número é um campo obrigatório.');
    edtNumero.SetFocus;
    Abort;
  end;

  if Trim(edtComplemento.Text) = '' then
  begin
    ShowMessage('Complemento é um campo obrigatório.');
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
begin
  FDMTPadrao.Close;
  FDMTPadrao.FieldDefs.Clear;//Limpamos campos
  FDMTPadrao.FieldDefs.Add('CD_CIDADES', ftInteger); // adicionamos campos
  FDMTPadrao.FieldDefs.Add('DS_ENDERECOS', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('BAIRRO', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('COMPLEMENTO', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('NUMERO', ftString, 60, False);
  FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
  FDMTPadrao.FieldDefs.Add('CD_USUARIO', ftInteger);
  FDMTPadrao.CreateDataSet;

  FDMTPadrao.Append;
  FDMTPadrao.FieldByName('CD_CIDADES').AsInteger   := DM.ComboBoxRetornar(cbCidades);
  FDMTPadrao.FieldByName('DS_ENDERECOS').AsString  := edtDescricao.Text;
  FDMTPadrao.FieldByName('BAIRRO').AsString        := edtBairro.Text;
  FDMTPadrao.FieldByName('COMPLEMENTO').AsString   := edtComplemento.Text;
  FDMTPadrao.FieldByName('NUMERO').AsString        := edtNumero.Text;
  FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime := Now;
  FDMTPadrao.FieldByName('CD_USUARIO').AsInteger   := 1;
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
          GravarServidor('ENDERECOS');

          LimparCampos;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor('ENDERECOS', edtCodigo.Text);
        LimparCampos;
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
