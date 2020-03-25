program SistemaCliente;

uses
  Controls,
  SysUtils,
  Vcl.Forms,
  untPrincipal in 'forms\untPrincipal.pas' {frmPrincipal},
  untDM in 'forms\untDM.pas' {DM: TDataModule},
  untPadrao in 'forms\untPadrao.pas' {frmPadrao},
  untCadastroEstados in 'forms\untCadastroEstados.pas' {frmCadastroEstados},
  untCadastroCidade in 'forms\untCadastroCidade.pas' {frmCadastroCidade},
  untCadastroClientes in 'forms\untCadastroClientes.pas' {frmCadastroClientes},
  untCadastroEnderecos in 'forms\untCadastroEnderecos.pas' {frmCadastroEnderecos},
  untCadastroUsuarios in 'forms\untCadastroUsuarios.pas' {frmCadastroUsuarios},
  untCadastroPessoas in 'forms\untCadastroPessoas.pas' {frmCadastroPessoas},
  untLogin in 'forms\untLogin.pas' {frmLogin},
  ClasseCadastro in 'classes\ClasseCadastro.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TFrmLogin, FrmLogin);
  if FrmLogin.ShowModal = mrOk then //Caso o retorno da tela seja Ok
  begin
    FreeAndNil(FrmLogin); //Libera o form de Login da memória
    Application.CreateForm(TfrmPrincipal, frmPrincipal); //Cria a janela main
    Application.Run; //Roda a aplicação
  end
  else //Caso o retorno da tela de Login seja mrCancel então
    Application.Terminate; //Encerra a aplicação
    Application.Run;
end.
