program ServerSistemaCliente;

uses
  Vcl.Forms,
  untPrincipal in 'forms\untPrincipal.pas' {frmPrincipal},
  untDM in 'forms\untDM.pas' {ServerModule: TDataModule},
  DCPbase64 in 'C:\Program Files (x86)\Embarcadero\Studio\Componentes\DCPcrypt-master\DCPbase64.pas',
  DCPconst in 'C:\Program Files (x86)\Embarcadero\Studio\Componentes\DCPcrypt-master\DCPconst.pas',
  DCPcrypt2 in 'C:\Program Files (x86)\Embarcadero\Studio\Componentes\DCPcrypt-master\DCPcrypt2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
