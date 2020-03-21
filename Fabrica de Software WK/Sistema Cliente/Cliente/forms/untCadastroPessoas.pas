unit untCadastroPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, untPadrao, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Vcl.StdCtrls, Vcl.ComCtrls,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, untDM;

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

const aSQLPadrao: String = 'SELECT CD_PESSOAS, NM_PESSOAS FROM PESSOAS';

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
begin
  FDMTPadrao.Close;
  FDMTPadrao.FieldDefs.Clear;//Limpamos campos
  FDMTPadrao.FieldDefs.Add('NM_PESSOAS', ftString, 60, False); // adicionamos campos
  FDMTPadrao.FieldDefs.Add('DT_NASCIMENTO', ftDate);
  FDMTPadrao.FieldDefs.Add('CD_SEXO', ftInteger);
  FDMTPadrao.FieldDefs.Add('CD_ENDERECOS', ftInteger);

  case cbTipoPessoa.ItemIndex of
    0:begin  //Pessoa física
        FDMTPadrao.FieldDefs.Add('CPF', ftString, 60, False);
        FDMTPadrao.FieldDefs.Add('CD_ESTADO_CIVIL', ftInteger);
      end;

    1:begin
        FDMTPadrao.FieldDefs.Add('NM_FANTASIA', ftString, 60, False);
        FDMTPadrao.FieldDefs.Add('CNPJ', ftString, 60, False);
        FDMTPadrao.FieldDefs.Add('RAZAO_SOCIAL', ftString, 60, False);
      end;
  end;
  FDMTPadrao.FieldDefs.Add('DT_REGISTRO', ftDateTime);
  FDMTPadrao.FieldDefs.Add('CD_USUARIOS', ftInteger);
  FDMTPadrao.CreateDataSet;

  FDMTPadrao.Append;
  FDMTPadrao.FieldByName('NM_PESSOAS').AsString     := edtDescricao.Text;
  FDMTPadrao.FieldByName('DT_NASCIMENTO').AsString  := DateToStr(edtDataNascimento.Date);
  FDMTPadrao.FieldByName('CD_SEXO').AsInteger       := DM.ComboBoxRetornar(cbSexo);
  FDMTPadrao.FieldByName('CD_ENDERECOS').AsInteger  := DM.ComboBoxRetornar(cbEnderecos);

  case cbTipoPessoa.ItemIndex of
    0:begin  //Pessoa física
        FDMTPadrao.FieldByName('CPF').AsString                := edtDescricao.Text;
        FDMTPadrao.FieldByName('CD_ESTADO_CIVIL').AsInteger   := DM.ComboBoxRetornar(cbEstadoCivil);
      end;

    1:begin
        FDMTPadrao.FieldByName('NM_FANTASIA').AsString  := edtDescricao.Text;
        FDMTPadrao.FieldByName('CNPJ').AsString         := edtDescricao.Text;
        FDMTPadrao.FieldByName('RAZAO_SOCIAL').AsString := edtDescricao.Text;
      end;
  end;
  FDMTPadrao.FieldByName('DT_REGISTRO').AsDateTime  := Now;
  FDMTPadrao.FieldByName('CD_USUARIOS').AsInteger   := 1;

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
          GravarServidor('PESSOAS');

          LimparCampos;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        AtualizarServidor('PESSOAS', edtCodigo.Text);
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

procedure TfrmCadastroPessoas.LimparCampos;
begin
//
end;

end.
