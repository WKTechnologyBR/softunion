unit untPadrao;

interface

uses
  Clipbrd,
  REST.JSON,
  uDWJSONObject,
  uDWConsts,
  uDWDatamodule,
  uRESTDWPoolerDB,
  uRestDWDriverFD,
  uDWAbout,
  uRESTDWServerEvents,
  uSystemEvents,

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin, frxDBSet, frxExportPDF, frxClass, Vcl.Grids,
  Vcl.DBGrids, ClasseCadastro, uDWConstsData, uDWDataset,
  Data.DB, Vcl.StdCtrls;

type
  //Usado para mover o cursor no Datepicker
  TDateTimePicker = class(Vcl.ComCtrls.TDateTimePicker)
  protected
    procedure Change; override;
  private
    FMoveCursor: Boolean;
    procedure WMKeyDown(var Message: TWMKeyDown); message WM_KEYDOWN;
  end;

type
  TfrmPadrao = class(TForm)
    edtCodigo: TEdit;
    edtDescricao: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PageControl1: TPageControl;
    tabPrincipal: TTabSheet;
    tabEdicao: TTabSheet;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Panel2: TPanel;
    btnNovoRegistro: TButton;
    Panel3: TPanel;
    btnSalvar: TButton;
    btnCancelar: TButton;
    Label3: TLabel;
    Shape1: TShape;
    btnDeletar: TButton;
    Label4: TLabel;
    Shape2: TShape;
    lblQuantidadeArtigos: TLabel;
    FDMemTable1: TDWMemtable;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnNovoRegistroClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure PreencherComboBox;
    procedure OcultarSheets(PageControl: TPageControl);
    procedure Listar(SQL_TEXTO: String);
    procedure GravarServidorJson(aObject: TObject; aTabela: String; aParam: String = 'Gravar');
    procedure AtualizarServidor(aObject: TObject; aTabela: String; aID: String);
    procedure DeletarServidor(aTabela: String; aID: String);

    procedure LimparCampos;
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

uses untDM, FireDAC.Comp.Client;

procedure TfrmPadrao.btnNovoRegistroClick(Sender: TObject);
begin
  LimparCampos;
  edtCodigo.Text    :=  '';
  edtDescricao.Text :=  '';
  btnSalvar.Caption :=  'Salvar';
  PageControl1.ActivePage:=tabEdicao;
end;

procedure TfrmPadrao.btnSalvarClick(Sender: TObject);
begin
  PageControl1.ActivePage:=tabPrincipal;
end;

procedure TfrmPadrao.AtualizarServidor(aObject: TObject; aTabela: String; aID: String);
var
  dwParams      : TDWParams;
  vErrorMessage : String;
begin
  dwParams      := Nil;
  vErrorMessage := '';

  try
    DM.DWClientEvents1.CreateDWParams('Atualizar', dwParams);
    dwParams.ItemsString['Result'].AsString := TJson.ObjectToJsonString(aObject);
    dwParams.ItemsString['Tabela'].AsString := aTabela;
    dwParams.ItemsString['ID'].AsString     := aID;
    dwParams.ItemsString['Token'].AsString  := DM.TOKEN;
    DM.DWClientEvents1.SendEvent('Atualizar', dwParams, vErrorMessage);

    if vErrorMessage = '' then
    begin

    end;

  finally
    begin
      dwParams.DisposeOf;
    end;
  end;
end;

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  PageControl1.ActivePage:=tabPrincipal;
end;

procedure TfrmPadrao.DBGrid1DblClick(Sender: TObject);
begin
  if FDMemTable1.RecordCount > 0 then
  begin
    btnSalvar.Caption :=  'Atualizar';
    PageControl1.ActivePage:=tabEdicao;
  end else ShowMessage('Selecione um item para editar.');
end;

procedure TfrmPadrao.DeletarServidor(aTabela, aID: String);
var
  dwParams      : TDWParams;
  vErrorMessage : String;
begin
  dwParams      := Nil;
  vErrorMessage := '';

  try
    DM.DWClientEvents1.CreateDWParams('Deletar', dwParams);
    dwParams.ItemsString['Tabela'].AsString := aTabela;
    dwParams.ItemsString['ID'].AsString     := aID;
    DM.DWClientEvents1.SendEvent('Deletar', dwParams, vErrorMessage);

    if vErrorMessage = '' then
    begin
      //Não ocorreu erro no servidor, limpar campos
    end else ShowMessage(vErrorMessage);

  finally
    begin
      dwParams.DisposeOf;
    end;
  end;
end;

procedure TfrmPadrao.GravarServidorJson(aObject: TObject; aTabela: String; aParam: String = 'Gravar');
var
  dwParams      : TDWParams;
  vErrorMessage : String;
begin
//  Clipboard.AsText:=TJson.ObjectToJsonString(aObject);

  dwParams      := Nil;
  vErrorMessage := '';

  try
    DM.DWClientEvents1.CreateDWParams(aParam, dwParams);
    dwParams.ItemsString['Result'].AsString := TJson.ObjectToJsonString(aObject);
    dwParams.ItemsString['Tabela'].AsString := aTabela;

    if aParam = 'Gravar' then
      dwParams.ItemsString['Token'].AsString  := DM.TOKEN;

    DM.DWClientEvents1.SendEvent(aParam, dwParams, vErrorMessage);

    if vErrorMessage = '' then
    begin
      //Não ocorreu erro no servidor, limpar campos
    end;

  finally
    begin
      dwParams.DisposeOf;
    end;
  end;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;
procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  LimparCampos;
  OcultarSheets(PageControl1);
  PreencherComboBox;
end;

procedure TfrmPadrao.LimparCampos;
var
   I: integer;
begin
   try
      for I:= 0 to  ComponentCount -1 do
      begin
        if Components[I] is tEdit then
        begin
           (Components[I] as tEdit).Text:= '';
        end
        else if Components[I] is TComboBox then
        begin
           (Components[I] as TComboBox).ItemIndex:= 0;
        end
      end;

      except on  e: exception do
      begin
        messageDlg(E.Message, mtError, [mbOk], 0);
      end;
   end;
end;

procedure TfrmPadrao.Listar(SQL_TEXTO: String);
var
  dwParams      : TDWParams;
  vErrorMessage : String;
  I: Integer;
  RDWClientSQL: TRESTDWClientSQL;
begin
  try
    RDWClientSQL  :=  Nil;
    dwParams      :=  Nil;
    vErrorMessage :=  '';

    if Trim(SQL_TEXTO) <> '' then
    begin
      FDMemTable1.Close;
      FDMemTable1.Open;

      if DM.TestarConexaoServidorRDW then
      begin
        RDWClientSQL  := TRESTDWClientSQL.Create(Nil);

        try
          DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
          dwParams.ItemsString['SQL'].AsString  := SQL_TEXTO;
          dwParams.ItemsString['Token'].AsString  := DM.TOKEN;
          DM.DWClientEvents1.SendEvent('Retornar', dwParams, vErrorMessage);

          if vErrorMessage <> '' then
          begin
            RDWClientSQL.OpenJson(vErrorMessage);

            RDWClientSQL.First;
            if RDWClientSQL.RecordCount > 0 then
            begin
              RDWClientSQL.DisableControls;
              FDMemTable1.DisableControls;
              while not RDWClientSQL.Eof do
              begin
                FDMemTable1.Append;
                for I := 0 to FDMemTable1.FieldCount - 1 do
                begin
                  FDMemTable1.Fields.Fields[I].AsString:=RDWClientSQL.Fields.Fields[I].AsString;
                end;
                FDMemTable1.Post;
                RDWClientSQL.Next
              end;
              RDWClientSQL.EnableControls;
              FDMemTable1.EnableControls;
              FDMemTable1.First;
            end;
            lblQuantidadeArtigos.Caption:='Quantidade de Itens: ' + IntToStr(FDMemTable1.RecordCount);
          end;

        finally
          begin
            dwParams.DisposeOf;
            RDWClientSQL.DisposeOf;
          end;
        end;

      end else ShowMessage('Sem conexão com o servidor.');

    end;

  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

procedure TfrmPadrao.OcultarSheets(PageControl: TPageControl);
var
  iPage: Integer;
begin
  for iPage := 0 to PageControl.PageCount - 1 do
    PageControl.Pages[iPage].TabVisible := False;

  if ( PageControl.PageCount > 0 ) then
    PageControl.ActivePage := PageControl.Pages[0];
    PageControl.Style := tsButtons;
end;

procedure TfrmPadrao.PreencherComboBox;
var
   I: integer;
begin
  try
    for I:= 0 to  ComponentCount -1 do
    begin
      if Components[i] is TComboBox then
      begin
         if (Components[I] as TComboBox).Hint <> '' then
         begin
           (Components[I] as TComboBox).Items.Clear;
           DM.ListarDadosComboBox((Components[I] as TComboBox),
                                'SELECT ' +
                                'CD_' + (Components[I] as TComboBox).Hint + ' CD_PADRAO, ' +
                                'DS_' + (Components[I] as TComboBox).Hint + ' DS_PADRAO ' +
                                'FROM ' + (Components[I] as TComboBox).Hint);
           (Components[I] as TComboBox).ItemIndex:=0;
         end;
      end;
    end;
  except on E: Exception do
    ShowMessage(E.Message);
  end;
end;

{ TDateTimePicker }

procedure TDateTimePicker.Change;
const
  CDtSep = '/';
var
  FEdit: TCustomEdit;
begin
  inherited;
  if not DroppedDown then
    if DateFormat = dfShort then
      if Format.Contains(CDtSep) then
        if FMoveCursor then
        begin
          FEdit := TCustomEdit(Self);
          if Trim(FEdit.Text)[FEdit.SelStart + 2] = CDtSep then
            Self.Perform($0100, $27, 0);
        end;
end;

procedure TDateTimePicker.WMKeyDown(var Message: TWMKeyDown);
begin
  if not DoKeyDown(Message) then
    inherited;
  UpdateUIState(Message.CharCode);
  FMoveCursor := Message.CharCode in [96 .. 105];
end;

end.
