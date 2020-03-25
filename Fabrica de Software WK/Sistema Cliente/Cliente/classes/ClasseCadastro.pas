unit ClasseCadastro;

interface

uses
  System.SysUtils;

type
  TCidades = class
  private
    CD_ESTADOS: Integer;
    DS_CIDADES: String;
    // DT_REGISTRO: String;
    CD_USUARIO: Integer;
  public
    property FCD_ESTADOS: Integer read CD_ESTADOS write CD_ESTADOS;
    property FDS_CIDADES: String read DS_CIDADES write DS_CIDADES;
    // property FDT_REGISTRO: TDateTime read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIO: Integer read CD_USUARIO write CD_USUARIO;
  end;

type
  TClientes = class
  private
    NM_CLIENTES: String;
    CPF: String;
    RG: String;
    CD_ENDERECOS: Integer;
    // DT_NASCIMENTO:  TDate;
    TELEFONE: String;
    CELULAR: String;
    EMAIL: String;
    // DT_REGISTRO:    TDateTime;
    CD_USUARIOS: Integer;
  public
    property FNM_CLIENTES: String read NM_CLIENTES write NM_CLIENTES;
    property FCPF: String read CPF write CPF;
    property FRG: String read RG write RG;
    property FCD_ENDERECOS: Integer read CD_ENDERECOS write CD_ENDERECOS;
    // property FDT_NASCIMENTO: TDate read DT_NASCIMENTO write DT_NASCIMENTO;
    property FTELEFONE: String read TELEFONE write TELEFONE;
    property FCELULAR: String read CELULAR write CELULAR;
    property FEMAIL: String read EMAIL write EMAIL;
    // property FDT_REGISTRO: TDateTime read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TEstados = class
  private
    // CD_ESTADOS: String;
    DS_ESTADOS: String;
    SIGLA: String;
    // DT_REGISTRO: TDateTime;
  public
    // property FCD_ESTADOS: String read CD_ESTADOS write CD_ESTADOS;
    property FDS_ESTADOS: String read DS_ESTADOS write DS_ESTADOS;
    property FSIGLA: String read SIGLA write SIGLA;
    // property FDT_REGISTRO: TDateTime read DT_REGISTRO write DT_REGISTRO;
  end;

implementation

end.
