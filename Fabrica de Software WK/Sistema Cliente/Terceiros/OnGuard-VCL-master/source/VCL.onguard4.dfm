object EditProductFrm: TEditProductFrm
  Left = 299
  Top = 201
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Description and Key'
  ClientHeight = 135
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
  PixelsPerInch = 120
  TextHeight = 16
  object OKBtn: TButton
    Left = 375
    Top = 98
    Width = 93
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object CancelBtn: TButton
    Left = 474
    Top = 98
    Width = 92
    Height = 31
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 1
  end
  object Panel1: TPanel
    Left = 5
    Top = 6
    Width = 561
    Height = 84
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    TabOrder = 2
    object Label1: TLabel
      Left = 15
      Top = 15
      Width = 71
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Description:'
      FocusControl = ProductEd
    end
    object Label2: TLabel
      Left = 15
      Top = 49
      Width = 26
      Height = 16
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = '&Key:'
      FocusControl = KeyEd
    end
    object GenerateKeySb: TSpeedButton
      Left = 524
      Top = 46
      Width = 29
      Height = 28
      Hint = 'Generate encryption key'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        82020000424D8202000000000000420000002800000012000000100000000100
        1000030000004002000000000000000000000000000000000000007C0000E003
        00001F000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E0000
        00000000F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        00000000000000000000F75EF75E0000F75EF75EF75EF75E0000F75EF75EF75E
        F75E00000000007CF75E007C00000000F75E0000F75E00000000F75E0000F75E
        F75EF75EF75E00000000F75E007CF75E00000000000000000000000000000000
        0000F75EF75EF75EF75E00000000F75E007CF75E000000000000000000000000
        000000000000F75EF75EF75EF75E00000000007CF75E007C00000000F75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75E00000000000000000000F75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E000000000000
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75EF75E
        F75EF75EF75E}
      OnClick = GenerateKeySbClick
    end
    object KeyPasteSb: TSpeedButton
      Left = 492
      Top = 46
      Width = 29
      Height = 28
      Hint = 'Paste from clipboard'
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Glyph.Data = {
        42010000424D4201000000000000760000002800000011000000110000000100
        040000000000CC00000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00222222222222
        2222200000002222222222222222200000002222224444444444200000002000
        004FFFFFFFF4200000000838384F000000F4200000000383834FFFFFFFF42000
        00000838384F000F4444200000000383834FFFFF4F42200000000838384FFFFF
        4422200000000383834444444022200000000838383838383022200000000380
        0000000380222000000008307777770830222000000003830B00B08380222000
        0000200000BB0000022220000000222220000222222220000000222222222222
        222220000000}
      OnClick = KeyPasteSbClick
    end
    object ProductEd: TEdit
      Left = 98
      Top = 10
      Width = 392
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      OnChange = InfoChanged
    end
    object KeyEd: TEdit
      Left = 98
      Top = 47
      Width = 392
      Height = 24
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabStop = False
      TabOrder = 1
      OnChange = InfoChanged
    end
  end
end
