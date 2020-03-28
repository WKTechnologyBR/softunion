unit ClasseCadastro;

interface

uses
  System.SysUtils;

type
  TCidades = class
  private
    CD_ESTADOS: Integer;
    DS_CIDADES: String;
    DT_REGISTRO: String;
    CD_USUARIO: Integer;
  public
    property FCD_ESTADOS: Integer read CD_ESTADOS write CD_ESTADOS;
    property FDS_CIDADES: String read DS_CIDADES write DS_CIDADES;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIO: Integer read CD_USUARIO write CD_USUARIO;
  end;

type
  TClientes = class
  private
    NM_CLIENTES: String;
    CPF: String;
    RG: String;
    DT_NASCIMENTO:  String;
    TELEFONE: String;
    CELULAR: String;
    EMAIL: String;

    CD_CIDADES: Integer;
    CD_ESTADOS: Integer;
    DS_ENDERECOS: String;
    BAIRRO: String;
    COMPLEMENTO: String;
    NUMERO: String;

    DT_REGISTRO:    String;
    CD_USUARIOS: Integer;
  public
    property FNM_CLIENTES: String read NM_CLIENTES write NM_CLIENTES;
    property FCPF: String read CPF write CPF;
    property FRG: String read RG write RG;
    property FDT_NASCIMENTO: String read DT_NASCIMENTO write DT_NASCIMENTO;
    property FTELEFONE: String read TELEFONE write TELEFONE;
    property FCELULAR: String read CELULAR write CELULAR;
    property FEMAIL: String read EMAIL write EMAIL;

    property FCD_CIDADES: Integer read CD_CIDADES write CD_CIDADES;
    property FCD_ESTADOS: Integer read CD_ESTADOS write CD_ESTADOS;
    property FDS_ENDERECOS: String read DS_ENDERECOS write DS_ENDERECOS;
    property FBAIRRO: String read BAIRRO write BAIRRO;
    property FCOMPLEMENTO: String read COMPLEMENTO write COMPLEMENTO;
    property FNUMERO: String read NUMERO write NUMERO;

    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TEnderecos = class
  private
    CD_CIDADES: Integer;
    DS_ENDERECOS: String;
    BAIRRO: String;
    COMPLEMENTO: String;
    NUMERO: String;
    DT_REGISTRO: String;
    CD_USUARIO: Integer;
  public
    property FCD_CIDADES: Integer read CD_CIDADES write CD_CIDADES;
    property FDS_ENDERECOS: String read DS_ENDERECOS write DS_ENDERECOS;
    property FBAIRRO: String read BAIRRO write BAIRRO;
    property FCOMPLEMENTO: String read COMPLEMENTO write COMPLEMENTO;
    property FNUMERO: String read NUMERO write NUMERO;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIO write CD_USUARIO;
  end;

type
  TEstados = class
  private
    DS_ESTADOS: String;
    SIGLA: String;
    DT_REGISTRO: String;
    CD_USUARIO: Integer;
  public
    property FDS_ESTADOS: String read DS_ESTADOS write DS_ESTADOS;
    property FSIGLA: String read SIGLA write SIGLA;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIO write CD_USUARIO;
  end;

type
  TEstado_Civil = class
  private
    DS_ESTADO_CIVIL: String;
    DT_REGISTRO: TDateTime;
    CD_USUARIOS: Integer;
  public
    property FDS_ESTADO_CIVIL: String read DS_ESTADO_CIVIL write DS_ESTADO_CIVIL;
    property FDT_REGISTRO: TDateTime read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TPessoasJuridica = class
  private
    NM_PESSOAS: String;
    NM_FANTASIA: String;
    CNPJ: String;
    RAZAO_SOCIAL: String;
    TIPO_PESSOA: Integer;
    CD_CIDADES: Integer;
    CD_ESTADOS: Integer;
    DS_ENDERECOS: String;
    BAIRRO: String;
    COMPLEMENTO: String;
    NUMERO: String;
    DT_REGISTRO: String;
    CD_USUARIOS: Integer;
  public
    property FNM_PESSOAS: String read NM_PESSOAS write NM_PESSOAS;
    property FNM_FANTASIA: String read NM_FANTASIA write NM_FANTASIA;
    property FCNPJ: String read CNPJ write CNPJ;
    property FRAZAO_SOCIAL: String read RAZAO_SOCIAL write RAZAO_SOCIAL;
    property FTIPO_PESSOA: Integer read TIPO_PESSOA write TIPO_PESSOA;
    property FCD_CIDADES: Integer read CD_CIDADES write CD_CIDADES;
    property FCD_ESTADOS: Integer read CD_ESTADOS write CD_ESTADOS;
    property FDS_ENDERECOS: String read DS_ENDERECOS write DS_ENDERECOS;
    property FBAIRRO: String read BAIRRO write BAIRRO;
    property FCOMPLEMENTO: String read COMPLEMENTO write COMPLEMENTO;
    property FNUMERO: String read NUMERO write NUMERO;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TPessoasFisica = class
  private
    NM_PESSOAS: String;
    DT_NASCIMENTO: String;
    CD_SEXO: Integer;
    CPF: String;
    CD_ESTADO_CIVIL: Integer;
    TIPO_PESSOA: Integer;
    CD_CIDADES: Integer;
    CD_ESTADOS: Integer;
    DS_ENDERECOS: String;
    BAIRRO: String;
    COMPLEMENTO: String;
    NUMERO: String;
    DT_REGISTRO: String;
    CD_USUARIOS: Integer;
  public
    property FNM_PESSOAS: String read NM_PESSOAS write NM_PESSOAS;
    property FDT_NASCIMENTO: String read DT_NASCIMENTO write DT_NASCIMENTO;
    property FCD_SEXO: Integer read CD_SEXO write CD_SEXO;
    property FCPF: String read CPF write CPF;
    property FCD_ESTADO_CIVIL: Integer read CD_ESTADO_CIVIL write CD_ESTADO_CIVIL;
    property FTIPO_PESSOA: Integer read TIPO_PESSOA write TIPO_PESSOA;
    property FCD_CIDADES: Integer read CD_CIDADES write CD_CIDADES;
    property FCD_ESTADOS: Integer read CD_ESTADOS write CD_ESTADOS;
    property FDS_ENDERECOS: String read DS_ENDERECOS write DS_ENDERECOS;
    property FBAIRRO: String read BAIRRO write BAIRRO;
    property FCOMPLEMENTO: String read COMPLEMENTO write COMPLEMENTO;
    property FNUMERO: String read NUMERO write NUMERO;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TSexo = class
  private
    DS_SEXO: String;
    DT_REGISTRO: String;
    CD_USUARIOS: Integer;
  public
    property FDS_SEXO: String read DS_SEXO write DS_SEXO;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
  end;

type
  TUsuarios = class
  private
    CD_USUARIOS: Integer;
    NM_USUARIOS: String;
    USUARIO: String;
    SENHA: String;
    TOKEN: String;
    DT_REGISTRO: String;
    IN_ATIVO: String;
  public
    property FCD_USUARIOS: Integer read CD_USUARIOS write CD_USUARIOS;
    property FNM_USUARIOS: String read NM_USUARIOS write NM_USUARIOS;
    property FUSUARIO: String read USUARIO write USUARIO;
    property FSENHA: String read SENHA write SENHA;
    property FTOKEN: String read TOKEN write TOKEN;
    property FDT_REGISTRO: String read DT_REGISTRO write DT_REGISTRO;
    property FIN_ATIVO: String read IN_ATIVO write IN_ATIVO;
  end;

implementation

{ TPessoas }

end.
