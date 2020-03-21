object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sistema Cliente'
  ClientHeight = 498
  ClientWidth = 786
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object StatusBar1: TStatusBar
    Left = 0
    Top = 479
    Width = 786
    Height = 19
    Panels = <
      item
        Width = 150
      end>
  end
  object MainMenu1: TMainMenu
    Left = 64
    Top = 64
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Usurios1: TMenuItem
        Caption = 'Usu'#225'rios'
        OnClick = Usurios1Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Estados1: TMenuItem
        Caption = 'Estados'
        OnClick = Estados1Click
      end
      object Cidades1: TMenuItem
        Caption = 'Cidades'
        OnClick = Cidades1Click
      end
      object Endereos1: TMenuItem
        Caption = 'Endere'#231'os'
        OnClick = Endereos1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Clientes1: TMenuItem
        Caption = 'Clientes'
        OnClick = Clientes1Click
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Pessoas1: TMenuItem
        Caption = 'Pessoas'
        OnClick = Pessoas1Click
      end
    end
  end
end
