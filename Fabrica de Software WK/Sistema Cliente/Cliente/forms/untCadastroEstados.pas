unit untCadastroEstados;

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
  TfrmCadastroEstados = class(TfrmPadrao)
    Label5: TLabel;
    edtSigla: TEdit;
    FDMemTable1SIGLA: TStringField;
    procedure btnDeletarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadastroEstados: TfrmCadastroEstados;

const
  aSQLPadrao: String = 'SELECT CD_ESTADOS CD_CADASTRO, ' +
    'DS_ESTADOS DS_CADASTRO, ' + 'SIGLA ' + 'FROM ESTADOS ' +
    'ORDER BY DS_ESTADOS';

implementation

{$R *.dfm}

procedure TfrmCadastroEstados.btnDeletarClick(Sender: TObject);
begin
  inherited;
  case Application.MessageBox(Pchar('O item será excluído definitivamente!'),
    'Aviso do Sistema!', MB_YESNO) of
    IDYES:
      begin
        DeletarServidor('ESTADOS', edtCodigo.Text);
        PageControl1.ActivePage := tabPrincipal;

        Listar(aSQLPadrao);

      end;

    IDNO:
      begin

      end;
  end;
end;

procedure TfrmCadastroEstados.btnSalvarClick(Sender: TObject);
var
  CEstado: TEstados;
begin
  inherited;
  CEstado := Nil;
  CEstado := TEstados.Create;
  try
    CEstado.FDS_ESTADOS := edtDescricao.Text;
    CEstado.FSIGLA := edtSigla.Text;
    //CEstado.FDT_REGISTRO := Now;

    // FDMTPadrao.Close;
    // FDMTPadrao.FieldDefs.Clear; // Limpamos campos
    // FDMTPadrao.FieldDefs.Add('DS_ESTADOS', ftString, 40, False);
    // // adicionamos campos
    // FDMTPadrao.FieldDefs.Add('SIGLA', ftString, 40, False);
    // FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
    // FDMTPadrao.CreateDataSet;
    //
    // FDMTPadrao.Append;
    // FDMTPadrao.FieldByName('DS_ESTADOS').AsString := edtDescricao.Text;
    // FDMTPadrao.FieldByName('SIGLA').AsString := edtSigla.Text;
    // FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime := Now;
    // FDMTPadrao.Post;

    try

      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
          ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          GravarServidorJson(CEstado, 'ESTADOS');
          edtCodigo.Text := '';
          edtDescricao.Text := '';
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        AtualizarServidor('ESTADOS', edtCodigo.Text);
      end;

      Listar(aSQLPadrao);

    except
      on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    CEstado.DisposeOf;
  end;

end;

procedure TfrmCadastroEstados.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  edtSigla.Text := FDMemTable1.FieldByName('SIGLA').AsString;
end;

procedure TfrmCadastroEstados.FormCreate(Sender: TObject);
begin
  inherited;
  Listar(aSQLPadrao);
end;

end.
