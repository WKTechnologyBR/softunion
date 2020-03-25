unit untCadastroCidade;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls,
  Vcl.ComCtrls, untDM, ClasseCadastro;

type
  TfrmCadastroCidade = class(TfrmPadrao)
    cbEstados: TComboBox;
    Label6: TLabel;
    FDMemTable1ESTADO: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoRegistroClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarRegistro;
  end;

var
  frmCadastroCidade: TfrmCadastroCidade;

const
  aSQLPadrao: String = 'SELECT ' + 'C.CD_CIDADES CD_CADASTRO, ' +
    'C.DS_CIDADES DS_CADASTRO, ' + 'E.DS_ESTADOS ' + 'FROM CIDADES C ' +
    'LEFT JOIN ESTADOS E ON E.CD_ESTADOS = C.CD_ESTADOS ' +
    'ORDER BY DS_CIDADES';

implementation

{$R *.dfm}

procedure TfrmCadastroCidade.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox(Pchar('O item será excluído definitivamente!'),
    'Aviso do Sistema!', MB_YESNO) of
    IDYES:
      begin
        DeletarServidor('CIDADES', edtCodigo.Text);
        PageControl1.ActivePage := tabPrincipal;
        Listar(aSQLPadrao);
      end;

    IDNO:
      begin

      end;
  end;
end;

procedure TfrmCadastroCidade.btnNovoRegistroClick(Sender: TObject);
begin
  inherited;
  cbEstados.ItemIndex := -1;
end;

procedure TfrmCadastroCidade.btnSalvarClick(Sender: TObject);
begin

  if Trim(edtDescricao.Text) = '' then
  begin
    ShowMessage('Descrição é um campo obrigatório.');
    edtDescricao.SetFocus;
    Abort;
  end;

  if cbEstados.ItemIndex = -1 then
  begin
    ShowMessage('Estado é um campo obrigatório.');
    cbEstados.SetFocus;
    Abort;
  end;

  try
    GravarRegistro;
  except
    on e: exception do
      MessageDlg(e.message, mtError, [mbOk], 0);
  end;
end;

procedure TfrmCadastroCidade.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  cbEstados.ItemIndex := cbEstados.Items.IndexOf
    (FDMemTable1.FieldByName('DS_ESTADOS').AsString);
end;

procedure TfrmCadastroCidade.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

procedure TfrmCadastroCidade.GravarRegistro;
var
  CCidades: TCidades;
begin
  CCidades := Nil;
  CCidades := TCidades.Create;
  try
    CCidades.FCD_ESTADOS := DM.ComboBoxRetornar(cbEstados);
    CCidades.FDS_CIDADES := edtDescricao.Text;
    CCidades.FCD_USUARIO := 1;


    // FDMTPadrao.Close;
    // FDMTPadrao.FieldDefs.Clear;//Limpamos campos
    // FDMTPadrao.FieldDefs.Add('CD_ESTADOS', ftInteger);//adicionamos campos
    // FDMTPadrao.FieldDefs.Add('DS_CIDADES', ftString, 60, False);
    // FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
    // FDMTPadrao.FieldDefs.Add('CD_USUARIO', ftInteger);
    // FDMTPadrao.CreateDataSet;
    //
    // FDMTPadrao.Append;
    // FDMTPadrao.FieldByName('CD_ESTADOS').AsInteger   :=  DM.ComboBoxRetornar(cbEstados);
    // FDMTPadrao.FieldByName('DS_CIDADES').AsString    :=  edtDescricao.Text;
    // FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime :=  Now;
    // FDMTPadrao.FieldByName('CD_USUARIO').AsInteger   :=  1;
    // FDMTPadrao.Post;

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
          ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          // Inserir os dados no banco
          GravarServidorJson(CCidades, 'CIDADES');

          edtCodigo.Text := '';
          edtDescricao.Text := '';
          cbEstados.ItemIndex := -1;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        // Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor('CIDADES', edtCodigo.Text);
        edtCodigo.Text := '';
        edtDescricao.Text := '';
        cbEstados.ItemIndex := -1;
        PageControl1.ActivePage := tabPrincipal;
      end;

      Listar(aSQLPadrao);

    except
      on e: exception do
      begin
        ShowMessage(e.message);
      end;
    end;
  finally
    CCidades.DisposeOf;
  end;
end;

end.
