unit untPrincipal;

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

  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.Menus,
  untCadastroEstados,
  untCadastroCidade,
  untCadastroClientes,
  untCadastroUsuarios,
  untCadastroEnderecos, Vcl.ComCtrls, untDM, untCadastroPessoas, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Arquivo1: TMenuItem;
    Cadastros1: TMenuItem;
    Usurios1: TMenuItem;
    Clientes1: TMenuItem;
    Cidades1: TMenuItem;
    Estados1: TMenuItem;
    Sair1: TMenuItem;
    Endereos1: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    Pessoas1: TMenuItem;
    StatusBar1: TStatusBar;
    procedure Estados1Click(Sender: TObject);
    procedure Cidades1Click(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure Endereos1Click(Sender: TObject);
    procedure Usurios1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Pessoas1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure AbrirForm(FormClass: TComponentClass);
  end;

var
  frmPrincipal: TfrmPrincipal;
  FormAtivo: TForm;

implementation

{$R *.dfm}

{ TForm1 }

procedure TfrmPrincipal.AbrirForm(FormClass: TComponentClass);
begin
  try
    if Assigned(FormAtivo) then
    begin
      if FormAtivo.ClassType = FormClass then
        Exit
      else
      begin
        FormAtivo.Destroy;
        FormAtivo := Nil;
      end;
    end;
    Application.CreateForm(FormClass, FormAtivo);
    FormAtivo.Position := poMainFormCenter;
    FormAtivo.ShowModal;

  finally
    begin
      FormAtivo.Destroy;
      FormAtivo := Nil;
    end;
  end;

end;

procedure TfrmPrincipal.Cidades1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroCidade);
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroClientes);
end;

procedure TfrmPrincipal.Endereos1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroEnderecos);
end;

procedure TfrmPrincipal.Estados1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroEstados);
end;

procedure TfrmPrincipal.Pessoas1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroPessoas);
end;

procedure TfrmPrincipal.Sair1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.Usurios1Click(Sender: TObject);
begin
  AbrirForm(TfrmCadastroUsuarios);
end;

end.
