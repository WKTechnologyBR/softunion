object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 228
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
    Left = 19
    Top = 21
    Width = 36
    Height = 13
    Caption = 'Usuario'
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
  end
  object edtSenha: TEdit
    Left = 18
    Top = 95
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 149
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 230
    Top = 192
    Width = 75
    Height = 25
    Caption = 'Acessar'
    Default = True
    TabOrder = 4
    OnClick = Button2Click
  end
  object edtToken: TEdit
    Left = 18
    Top = 151
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 2
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
