program ServerSistemaCliente;

uses
  Vcl.Forms,
  untPrincipal in 'forms\untPrincipal.pas' {frmPrincipal},
  untDM in 'forms\untDM.pas' {ServerModule: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
