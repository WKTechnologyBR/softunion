object ModifierFrm: TModifierFrm
  Left = 244
  Top = 174
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Generate Modifier'
  ClientHeight = 134
  ClientWidth = 580
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 120
  TextHeight = 16
  object OKBtn: TBitBtn
    Left = 383
    Top = 99
    Width = 93
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelBtn: TBitBtn
    Left = 483
    Top = 99
    Width = 93
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TGroupBox
    Left = 5
    Top = 10
    Width = 571
    Height = 81
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = '&Modifiers'
    TabOrder = 0
    object UniqueModifierCb: TCheckBox
      Left = 230
      Top = 50
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Unique modifier'
      TabOrder = 3
      OnClick = ModifierClick
    end
    object MachineModifierCb: TCheckBox
      Left = 230
      Top = 20
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Machine modifier'
      TabOrder = 1
      OnClick = ModifierClick
    end
    object DateModifierCb: TCheckBox
      Left = 410
      Top = 20
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Date modifier'
      TabOrder = 2
      OnClick = ModifierClick
    end
    object NoModifierCb: TCheckBox
      Left = 20
      Top = 20
      Width = 131
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'No modifier'
      TabOrder = 0
      OnClick = ModifierClick
    end
    object ModifierEd: TEdit
      Left = 20
      Top = 45
      Width = 181
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 4
      OnChange = InfoChanged
      OnKeyPress = ModifierEdKeyPress
    end
    object ModDateEd: TEdit
      Left = 409
      Top = 46
      Width = 96
      Height = 24
      Hint = 'Code is invalid after this date'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Color = clBtnFace
      Enabled = False
      MaxLength = 10
      TabOrder = 5
      OnChange = ModifierClick
      OnKeyPress = DateEdKeyPress
    end
  end
end
