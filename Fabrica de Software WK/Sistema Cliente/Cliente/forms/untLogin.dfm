object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 236
  ClientWidth = 325
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 18
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label6: TLabel
    Left = 18
    Top = 76
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label1: TLabel
    Left = 18
    Top = 132
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object edtDescricao: TEdit
    Left = 18
    Top = 40
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    Text = 'LUCIVAL'
  end
  object edtSenha: TEdit
    Left = 18
    Top = 95
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
    Text = 'L'
  end
  object Button1: TButton
    Left = 149
    Top = 197
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 230
    Top = 197
    Width = 75
    Height = 25
    Caption = 'Acessar'
    Default = True
    TabOrder = 3
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 18
    Top = 151
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 4
    Text = '8CCAD0E419DB5393'
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 112
    Top = 32
  end
end
