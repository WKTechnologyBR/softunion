unit untPadrao;

interface

uses
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
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.UI.Intf, FireDAC.VCLUI.Wait,
  FireDAC.Phys.FBDef, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Vcl.StdCtrls, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB, FireDAC.Comp.UI, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons,
  Vcl.ComCtrls, Vcl.ToolWin, frxDBSet, frxExportPDF, frxClass, Vcl.Grids,
  Vcl.DBGrids;

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
    FDMemTable1: TFDMemTable;
    FDMemTable1CD_CADASTRO: TIntegerField;
    FDMemTable1DS_CADASTRO: TStringField;
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
    FDMTPadrao: TFDMemTable;
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
    procedure GravarServidor(aTabela: String);
    procedure AtualizarServidor(aTabela: String; aID: String);
    procedure DeletarServidor(aTabela: String; aID: String);
//    function GeraCodigo(SQL_TEXTO: String): String;
//    procedure Gravar(SQL_TEXTO: String);
  end;

var
  frmPadrao: TfrmPadrao;

implementation

{$R *.dfm}

uses untDM;

procedure TfrmPadrao.btnNovoRegistroClick(Sender: TObject);
begin
  edtCodigo.Text    :=  '';
  edtDescricao.Text :=  '';
  btnSalvar.Caption :=  'Salvar';
  PageControl1.ActivePage:=tabEdicao;
end;

procedure TfrmPadrao.btnSalvarClick(Sender: TObject);
begin
  PageControl1.ActivePage:=tabPrincipal;
end;

procedure TfrmPadrao.AtualizarServidor(aTabela: String; aID: String);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vErrorMessage : String;
begin
  JSONValue     := Nil;
  dwParams      := Nil;
  vErrorMessage := '';

  try
    JSONValue          := TJSONValue.Create;
    JSONValue.Encoded  := False;
    JSONValue.JsonMode := jmDataware;
    JSONValue.LoadFromDataset('', FDMTPadrao, False,  JSONValue.JsonMode);

    DM.DWClientEvents1.CreateDWParams('Atualizar', dwParams);
    dwParams.ItemsString['Result'].AsString := JSONValue.ToJSON;
    dwParams.ItemsString['Tabela'].AsString := aTabela;
    dwParams.ItemsString['ID'].AsString     := aID;
    dwParams.ItemsString['Token'].AsString  := DM.Token;
    DM.DWClientEvents1.SendEvent('Atualizar', dwParams, vErrorMessage);

    if vErrorMessage = '' then
    begin
      //Não ocorreu erro no servidor, limpar campos
    end;

  finally
    begin
      dwParams.DisposeOf;
      JSONValue.DisposeOf;
    end;
  end;
end;

procedure TfrmPadrao.btnCancelarClick(Sender: TObject);
begin
  PageControl1.ActivePage:=tabPrincipal;
end;

procedure TfrmPadrao.DBGrid1DblClick(Sender: TObject);
begin
  if FDMemTable1.RecordCount > 0 then
  begin
    edtCodigo.Text    :=  FDMemTable1.FieldByName('CD_CADASTRO').AsString;
    edtDescricao.Text :=  FDMemTable1.FieldByName('DS_CADASTRO').AsString;
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
    dwParams.ItemsString['Token'].AsString  := DM.Token;
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

procedure TfrmPadrao.GravarServidor(aTabela: String);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vErrorMessage : String;
begin
  JSONValue     := Nil;
  dwParams      := Nil;
  vErrorMessage := '';

  try
    JSONValue          := TJSONValue.Create;
    JSONValue.Encoded  := False;
    JSONValue.JsonMode := jmDataware;
    JSONValue.LoadFromDataset('', FDMTPadrao, False,  JSONValue.JsonMode);

    DM.DWClientEvents1.CreateDWParams('Gravar', dwParams);
    dwParams.ItemsString['Result'].AsString := JSONValue.ToJSON;
    dwParams.ItemsString['Tabela'].AsString := aTabela;
    dwParams.ItemsString['Token'].AsString  := DM.Token;
    DM.DWClientEvents1.SendEvent('Gravar', dwParams, vErrorMessage);

    if vErrorMessage = '' then
    begin
      //Não ocorreu erro no servidor, limpar campos
    end;

  finally
    begin
      dwParams.DisposeOf;
      JSONValue.DisposeOf;
    end;
  end;
end;

procedure TfrmPadrao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;
procedure TfrmPadrao.FormCreate(Sender: TObject);
begin
  OcultarSheets(PageControl1);
  PreencherComboBox;
end;

procedure TfrmPadrao.Listar(SQL_TEXTO: String);
var
  JSONValue     : TJSONValue;
  dwParams      : TDWParams;
  vJSONRet : String;
  aFDQuery: TFDQuery;
  I: Integer;

  ClientSQL: TRESTDWClientSQL;
begin
  try
    JSONValue     := Nil;
    dwParams      := Nil;
    vJSONRet := '';
    aFDQuery      := Nil;
    ClientSQL    := Nil;

    FDMemTable1.Close;
    FDMemTable1.CreateDataSet;

    if Trim(SQL_TEXTO) <> '' then
    begin
      if DM.TestarConexaoServidorRDW then
      begin

        ClientSQL:=TRESTDWClientSQL.Create(Nil);

        JSONValue     := TJSONValue.Create;
        try
          DM.DWClientEvents1.CreateDWParams('Retornar', dwParams);
          dwParams.ItemsString['SQL'].AsString  := SQL_TEXTO;
          dwParams.ItemsString['Token'].AsString  := DM.Token;
          DM.DWClientEvents1.SendEvent('Retornar', dwParams, vJSONRet);

          ClientSQL.OpenJson(vJSONRet);

          //JSONValue.WriteToDataset(dtFull, dwParams.ItemsString['Result'].Value, ClientSQL);

          ClientSQL.First;

          if ClientSQL.RecordCount > 0 then
          begin
            ClientSQL.DisableControls;
            FDMemTable1.DisableControls;
            while not ClientSQL.Eof do
            begin
              FDMemTable1.Append;
              for I := 0 to FDMemTable1.FieldCount - 1 do
              begin
                FDMemTable1.Fields.Fields[I].AsString:=ClientSQL.Fields.Fields[I].AsString;
              end;
              FDMemTable1.Post;
              ClientSQL.Next
            end;
            ClientSQL.EnableControls;
            FDMemTable1.EnableControls;
            FDMemTable1.First;

            lblQuantidadeArtigos.Caption:='Quantidade de Itens: ' + IntToStr(FDMemTable1.RecordCount);

          end;

          if vJSONRet = '' then
          begin

          end;

        finally
          begin
            dwParams.DisposeOf;
            JSONValue.DisposeOf;
            ClientSQL.DisposeOf;
          end;
        end;
      end else ShowMessage('Sem conexão com o servidor.');
    end;
  except on E: Exception do
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

end.
