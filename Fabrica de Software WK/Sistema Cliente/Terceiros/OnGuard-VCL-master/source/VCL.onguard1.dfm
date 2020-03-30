object KeyGenerateFrm: TKeyGenerateFrm
  Left = 351
  Top = 190
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Key Generation'
  ClientHeight = 289
  ClientWidth = 571
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -14
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 120
  TextHeight = 16
  object Panel1: TPanel
    Left = 5
    Top = 7
    Width = 560
    Height = 235
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 0
    object Label2: TLabel
      Left = 10
      Top = 39
      Width = 72
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Key &Phrase:'
      FocusControl = KeyStringMe
    end
    object CopyBlockSb: TSpeedButton
      Left = 524
      Top = 161
      Width = 29
      Height = 29
      Hint = 'Copy key to clipboard'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        82020000424D8202000000000000420000002800000012000000100000000100
        1000030000004002000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E170017001700
        170017001700170017001700F75EF75EF75EF75EF75EF75EF75EF75EF75E1700
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700F75EF75EF75EF75EF75EF75EF75EF75E
        F75E1700FF7F00000000000000000000FF7F1700F75EF75EF75E000000000000
        0000000000001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700F75EF75EF75E0000
        FF7FFF7FFF7FFF7FFF7F1700FF7F00000000000000000000FF7F1700F75EF75E
        F75E0000FF7F00000000000000001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700
        F75EF75EF75E0000FF7FFF7FFF7FFF7FFF7F1700FF7F00000000FF7F17001700
        17001700F75EF75EF75E0000FF7F00000000000000001700FF7FFF7FFF7FFF7F
        1700FF7F1700F75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7F1700FF7FFF7F
        FF7FFF7F17001700F75EF75EF75EF75EF75E0000FF7F00000000FF7F00001700
        17001700170017001700F75EF75EF75EF75EF75EF75E0000FF7FFF7FFF7FFF7F
        0000FF7F0000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000FF7FFF7F
        FF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000
        00000000000000000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75E}
      OnClick = CopyBlockSbClick
    end
    object Label3: TLabel
      Left = 10
      Top = 138
      Width = 26
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Key:'
    end
    object Label4: TLabel
      Left = 10
      Top = 15
      Width = 61
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Key &Type:'
      FocusControl = KeyTypeCb
    end
    object CopyByteKeySb: TSpeedButton
      Left = 524
      Top = 196
      Width = 29
      Height = 28
      Hint = 'Copy key to clipboard'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        82020000424D8202000000000000420000002800000012000000100000000100
        1000030000004002000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E170017001700
        170017001700170017001700F75EF75EF75EF75EF75EF75EF75EF75EF75E1700
        FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700F75EF75EF75EF75EF75EF75EF75EF75E
        F75E1700FF7F00000000000000000000FF7F1700F75EF75EF75E000000000000
        0000000000001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700F75EF75EF75E0000
        FF7FFF7FFF7FFF7FFF7F1700FF7F00000000000000000000FF7F1700F75EF75E
        F75E0000FF7F00000000000000001700FF7FFF7FFF7FFF7FFF7FFF7FFF7F1700
        F75EF75EF75E0000FF7FFF7FFF7FFF7FFF7F1700FF7F00000000FF7F17001700
        17001700F75EF75EF75E0000FF7F00000000000000001700FF7FFF7FFF7FFF7F
        1700FF7F1700F75EF75EF75EF75E0000FF7FFF7FFF7FFF7FFF7F1700FF7FFF7F
        FF7FFF7F17001700F75EF75EF75EF75EF75E0000FF7F00000000FF7F00001700
        17001700170017001700F75EF75EF75EF75EF75EF75E0000FF7FFF7FFF7FFF7F
        0000FF7F0000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000FF7FFF7F
        FF7FFF7F00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000
        00000000000000000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75E}
      OnClick = CopyByteKeySbClick
    end
    object KeyStringMe: TMemo
      Left = 10
      Top = 59
      Width = 541
      Height = 60
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      ScrollBars = ssVertical
      TabOrder = 1
      OnChange = KeyStringMeChange
    end
    object BlockKeyEd: TEdit
      Left = 10
      Top = 162
      Width = 511
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = True
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 3
      OnChange = BlockKeyEdChange
    end
    object GenerateBtn: TButton
      Left = 423
      Top = 11
      Width = 127
      Height = 31
      Hint = 'Generate key'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Generate key'
      Enabled = False
      TabOrder = 2
      OnClick = GenerateBtnClick
    end
    object KeyTypeCb: TComboBox
      Left = 79
      Top = 10
      Width = 208
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Style = csDropDownList
      TabOrder = 0
      OnChange = KeyTypeCbChange
      Items.Strings = (
        'Random'
        'Standard Text'
        'Case-sensitive Text')
    end
    object ByteKeyEd: TEdit
      Left = 10
      Top = 197
      Width = 511
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Ctl3D = True
      ParentColor = True
      ParentCtl3D = False
      ReadOnly = True
      TabOrder = 4
      OnChange = ByteKeyEdChange
    end
  end
  object CancelBtn: TBitBtn
    Left = 473
    Top = 251
    Width = 92
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object OKBtn: TBitBtn
    Left = 375
    Top = 251
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
end
