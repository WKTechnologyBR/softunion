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
    FDMemTable1CD_ESTADOS: TIntegerField;
    FDMemTable1DS_ESTADO_CIVIL: TStringField;
    FDMemTable1DS_CIDADES: TStringField;
    FDMemTable1DS_ESTADOS: TStringField;
    FDMemTable1DS_SEXO: TStringField;
    procedure btnSalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoRegistroClick(Sender: TObject);
    procedure cbTipoPessoaCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure GravarRegistro;
    procedure TipoPessoa(aTipo: Integer);
    procedure TipoPessoaAtivo(aTipo: Integer);
  end;

var
  frmCadastroPessoas: TfrmCadastroPessoas;

const aSQLPadrao: String = 'SELECT '+
                           'P.CD_PESSOAS, '+
                           'P.NM_PESSOAS, '+
                           'P.DT_NASCIMENTO, '+
                           'P.CD_SEXO, '+
                           'COALESCE(P.CPF, P.CNPJ) CPF, '+
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
                           'P.DS_ENDERECOS, '+
                           'P.CD_ESTADOS, '+
                           'EC.DS_ESTADO_CIVIL, '+
                           'C.DS_CIDADES, '+
                           'E.DS_ESTADOS, '+
                           'S.DS_SEXO '+

                           'FROM PESSOAS P '+
                           'LEFT JOIN ESTADO_CIVIL EC ON EC.CD_ESTADO_CIVIL = P.CD_ESTADO_CIVIL '+
                           'LEFT JOIN CIDADES C ON C.CD_CIDADES = P.CD_CIDADES '+
                           'LEFT JOIN ESTADOS E ON E.CD_ESTADOS = P.CD_ESTADOS '+
                           'LEFT JOIN SEXO S ON S.CD_SEXO = P.CD_SEXO ';

implementation

uses
  System.Math;

{$R *.dfm}

procedure TfrmCadastroPessoas.btnNovoRegistroClick(Sender: TObject);
begin
  inherited;
  TipoPessoa(0);
  TipoPessoaAtivo(1);
end;

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
  TipoPessoa(cbTipoPessoa.ItemIndex);
end;

procedure TfrmCadastroPessoas.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  LimparCampos;
  try
    TipoPessoaAtivo(0);
    edtCodigo.Text              :=  FDMemTable1.FieldByName('CD_PESSOAS').AsString;
    edtDescricao.Text           :=  FDMemTable1.FieldByName('NM_PESSOAS').AsString;
    edtDataNascimento.DateTime  :=  IfThen(Trim(FDMemTable1.FieldByName('DT_NASCIMENTO').AsString) = '', Now,
                                    FDMemTable1.FieldByName('DT_NASCIMENTO').AsDateTime);
    cbSexo.ItemIndex            :=  cbSexo.Items.IndexOf(FDMemTable1.FieldByName('DS_SEXO').AsString);
    cbEstadoCivil.ItemIndex     :=  cbEstadoCivil.Items.IndexOf(FDMemTable1.FieldByName('DS_ESTADO_CIVIL').AsString);
    edtNomeFantasia.Text        :=  FDMemTable1.FieldByName('NM_FANTASIA').AsString;
    edtRazaoSocial.Text         :=  FDMemTable1.FieldByName('RAZAO_SOCIAL').AsString;
    cbCidades.ItemIndex         :=  cbCidades.Items.IndexOf(FDMemTable1.FieldByName('DS_CIDADES').AsString);
    cbEstados.ItemIndex         :=  cbEstados.Items.IndexOf(FDMemTable1.FieldByName('DS_ESTADOS').AsString);
    edtEndereco.Text            :=  FDMemTable1.FieldByName('DS_ENDERECOS').AsString;
    edtBairro.Text              :=  FDMemTable1.FieldByName('BAIRRO').AsString;
    edtComplemento.Text         :=  FDMemTable1.FieldByName('COMPLEMENTO').AsString;
    edtNumero.Text              :=  FDMemTable1.FieldByName('NUMERO').AsString;

    TipoPessoa(FDMemTable1.FieldByName('TIPO_PESSOA').AsInteger);
    cbTipoPessoa.ItemIndex      :=  FDMemTable1.FieldByName('TIPO_PESSOA').AsInteger;
    edtCPFCNPJ.Text             :=  FDMemTable1.FieldByName('CPF').AsString;

  except on E: Exception do

  end;
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
  CPessoasJudirica: TPessoasJuridica;
  CPessoasFisica: TPessoasFisica;
begin

  try
    case cbTipoPessoa.ItemIndex of
      0:begin  //Pessoa física
          CPessoasFisica                      := Nil;
          CPessoasFisica                      := TPessoasFisica.Create;

          CPessoasFisica.FNM_PESSOAS          := edtDescricao.Text;
          CPessoasFisica.FDT_NASCIMENTO       := Copy(FormatDateTime('YYYY.MM.DD', edtDataNascimento.Date), 1, 10);
          CPessoasFisica.FCD_SEXO             := DM.ComboBoxRetornar(cbSexo);
          CPessoasFisica.FCPF                 := edtCPFCNPJ.Text;
          CPessoasFisica.FCD_ESTADO_CIVIL     := DM.ComboBoxRetornar(cbEstadoCivil);
          CPessoasFisica.FTIPO_PESSOA         := cbTipoPessoa.ItemIndex;
          CPessoasFisica.FCD_CIDADES          := DM.ComboBoxRetornar(cbCidades);
          CPessoasFisica.FCD_ESTADOS          := DM.ComboBoxRetornar(cbEstados);
          CPessoasFisica.FDS_ENDERECOS        := edtEndereco.Text;
          CPessoasFisica.FBAIRRO              := edtBairro.Text;
          CPessoasFisica.FCOMPLEMENTO         := edtComplemento.Text;
          CPessoasFisica.FNUMERO              := edtNumero.Text;
          CPessoasFisica.FDT_REGISTRO         := Copy(FormatDateTime('YYYY.MM.DD hh:mm', NOW), 1, 15);
          CPessoasFisica.FCD_USUARIOS         := DM.CD_USUARIO;

        end;

      1:begin
          CPessoasJudirica                      := Nil;
          CPessoasJudirica                      := TPessoasJuridica.Create;

          CPessoasJudirica.FNM_PESSOAS          := edtDescricao.Text;
          CPessoasJudirica.FCNPJ                := edtCPFCNPJ.Text;
          CPessoasJudirica.FNM_FANTASIA         := edtNomeFantasia.Text;
          CPessoasJudirica.FRAZAO_SOCIAL        := edtRazaoSocial.Text;
          CPessoasJudirica.FTIPO_PESSOA         := cbTipoPessoa.ItemIndex;
          CPessoasJudirica.FCD_CIDADES          := DM.ComboBoxRetornar(cbCidades);
          CPessoasJudirica.FCD_ESTADOS          := DM.ComboBoxRetornar(cbEstados);
          CPessoasJudirica.FDS_ENDERECOS        := edtEndereco.Text;
          CPessoasJudirica.FBAIRRO              := edtBairro.Text;
          CPessoasJudirica.FCOMPLEMENTO         := edtComplemento.Text;
          CPessoasJudirica.FNUMERO              := edtNumero.Text;
          CPessoasJudirica.FDT_REGISTRO         := Copy(FormatDateTime('YYYY.MM.DD hh:mm', NOW), 1, 15);
          CPessoasJudirica.FCD_USUARIOS         := DM.CD_USUARIO;
        end;
    end;

    try
      if btnSalvar.Caption = 'Salvar' then
      begin
        if Trim(edtDescricao.Text) = '' then
        ShowMessage('Digite uma descrição antes de prosseguir.')
        else
        begin
          //Inserir os dados no banco
          case cbTipoPessoa.ItemIndex of
            0:begin  //Pessoa física
                GravarServidorJson(CPessoasFisica, 'PESSOAS');
              end;

            1:begin
                GravarServidorJson(CPessoasJudirica, 'PESSOAS');
              end;
          end;
          PageControl1.ActivePage := tabPrincipal;
        end;
      end;

      if btnSalvar.Caption = 'Atualizar' then
      begin
        //Verificar se o item existe no banco e se houve alteração a atualizado no banco
        case cbTipoPessoa.ItemIndex of
          0:begin  //Pessoa física
              AtualizarServidor(CPessoasFisica, 'PESSOAS', edtCodigo.Text);
            end;

          1:begin
              AtualizarServidor(CPessoasJudirica, 'PESSOAS', edtCodigo.Text);
            end;
        end;
        PageControl1.ActivePage := tabPrincipal;
      end;

      Listar(aSQLPadrao);

    except on E: Exception do
      begin
        ShowMessage(E.Message);
      end;
    end;
  finally
    begin
      case cbTipoPessoa.ItemIndex of
        0:begin  //Pessoa física
            CPessoasFisica.DisposeOf;
          end;

        1:begin
            CPessoasJudirica.DisposeOf;
          end;
      end;
    end;
  end;
end;

procedure TfrmCadastroPessoas.TipoPessoa(aTipo: Integer);
begin
  case aTipo of
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

procedure TfrmCadastroPessoas.TipoPessoaAtivo(aTipo: Integer);
begin
  case aTipo of
    0:begin  //Inativar
        cbTipoPessoa.Enabled  := False;
      end;

    1:begin  //Ativar
        cbTipoPessoa.Enabled    := True;
      end;

  end;
end;

end.
