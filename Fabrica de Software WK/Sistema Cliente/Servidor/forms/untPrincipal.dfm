object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Sistema Cliente - Server'
  ClientHeight = 192
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 29
    Width = 26
    Height = 13
    Caption = 'Porta'
  end
  object Label2: TLabel
    Left = 56
    Top = 77
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label3: TLabel
    Left = 56
    Top = 125
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtPorta: TEdit
    Left = 56
    Top = 48
    Width = 57
    Height = 21
    NumbersOnly = True
    TabOrder = 0
    Text = '8082'
  end
  object Button1: TButton
    Left = 126
    Top = 46
    Width = 123
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edtUsuario: TEdit
    Left = 56
    Top = 96
    Width = 193
    Height = 21
    TabOrder = 2
    Text = 'admin'
  end
  object edtSenha: TEdit
    Left = 56
    Top = 144
    Width = 193
    Height = 21
    PasswordChar = '*'
    TabOrder = 3
    Text = 'admin'
  end
  object RESTServicePooler1: TRESTServicePooler
    Active = False
    CORS = False
    CORS_CustomHeaders.Strings = (
      
        'Access-Control-Allow-Methods:GET, POST, PATCH, PUT, DELETE, OPTI' +
        'ONS'
      
        'Access-Control-Allow-Headers:Content-Type, Origin, Accept, Autho' +
        'rization, X-CUSTOM-HEADER')
    RequestTimeout = -1
    ServicePort = 8082
    ProxyOptions.Port = 8888
    ServerParams.HasAuthentication = True
    ServerParams.UserName = 'admin'
    ServerParams.Password = 'admin'
    SSLMethod = sslvSSLv2
    SSLVersions = []
    Encoding = esUtf8
    ServerContext = 'restdataware'
    RootPath = '/'
    SSLVerifyMode = []
    SSLVerifyDepth = 0
    ForceWelcomeAccess = False
    CriptOptions.Use = False
    CriptOptions.Key = 'RDWBASEKEY256'
    MultiCORE = False
    Left = 128
    Top = 96
  end
end
