unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDWAbout, uRESTDWBase, Vcl.StdCtrls,
  untDM, Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtPorta: TEdit;
    Button1: TButton;
    edtUsuario: TEdit;
    edtSenha: TEdit;
    RESTServicePooler1: TRESTServicePooler;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Status;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  with RESTServicePooler1 do
  begin
    ServerParams.UserName    :=  edtUsuario.Text;
    ServerParams.Password    :=  edtSenha.Text;
    ServicePort              :=  StrToInt(edtPorta.Text);
  end;

  RESTServicePooler1.Active  := not RESTServicePooler1.Active;
  Status;
end;

procedure TfrmPrincipal.FormActivate(Sender: TObject);
begin
  RESTServicePooler1.ServerMethodClass:=TServerModule;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  Status;
end;

procedure TfrmPrincipal.Status;
begin
  if RESTServicePooler1.Active then
     Button1.Caption:='Parar servidor'
     else Button1.Caption:='Iniciar servidor';
end;

end.
