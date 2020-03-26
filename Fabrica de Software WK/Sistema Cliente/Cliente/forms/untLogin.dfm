object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Login'
  ClientHeight = 266
  ClientWidth = 346
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    346
    266)
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel
    Left = 35
    Top = 117
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Label6: TLabel
    Left = 183
    Top = 117
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object Label1: TLabel
    Left = 35
    Top = 172
    Width = 29
    Height = 13
    Caption = 'Token'
  end
  object Image1: TImage
    Left = 34
    Top = 6
    Width = 292
    Height = 105
  end
  object edtDescricao: TEdit
    Left = 34
    Top = 136
    Width = 143
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 183
    Top = 136
    Width = 143
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 170
    Top = 230
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = Button1Click
    ExplicitLeft = 149
    ExplicitTop = 192
  end
  object Button2: TButton
    Left = 251
    Top = 230
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Acessar'
    Default = True
    TabOrder = 4
    OnClick = Button2Click
    ExplicitLeft = 230
    ExplicitTop = 192
  end
  object edtToken: TEdit
    Left = 35
    Top = 191
    Width = 287
    Height = 21
    CharCase = ecUpperCase
    PasswordChar = '*'
    TabOrder = 2
  end
end
