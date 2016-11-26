object frmFormCtrl: TfrmFormCtrl
  Left = 587
  Top = 238
  BorderStyle = bsSingle
  Caption = 'frmFormCtrl'
  ClientHeight = 331
  ClientWidth = 716
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 608
    Top = 288
    Width = 75
    Height = 25
    Cancel = True
    Caption = '&Close'
    TabOrder = 0
    OnClick = BitBtn1Click
    Glyph.Data = {
      DE010000424DDE01000000000000760000002800000024000000120000000100
      0400000000006801000000000000000000001000000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00388888888877
      F7F787F8888888888333333F00004444400888FFF444448888888888F333FF8F
      000033334D5007FFF4333388888888883338888F0000333345D50FFFF4333333
      338F888F3338F33F000033334D5D0FFFF43333333388788F3338F33F00003333
      45D50FEFE4333333338F878F3338F33F000033334D5D0FFFF43333333388788F
      3338F33F0000333345D50FEFE4333333338F878F3338F33F000033334D5D0FFF
      F43333333388788F3338F33F0000333345D50FEFE4333333338F878F3338F33F
      000033334D5D0EFEF43333333388788F3338F33F0000333345D50FEFE4333333
      338F878F3338F33F000033334D5D0EFEF43333333388788F3338F33F00003333
      4444444444333333338F8F8FFFF8F33F00003333333333333333333333888888
      8888333F00003333330000003333333333333FFFFFF3333F00003333330AAAA0
      333333333333888888F3333F00003333330000003333333333338FFFF8F3333F
      0000}
    NumGlyphs = 2
  end
  object btnPosition: TButton
    Left = 24
    Top = 280
    Width = 75
    Height = 25
    Caption = 'Position Form'
    TabOrder = 1
    OnClick = btnPositionClick
  end
  object btnFocus: TButton
    Left = 64
    Top = 80
    Width = 75
    Height = 25
    Caption = 'Focus'
    TabOrder = 2
    OnClick = btnFocusClick
  end
  object Edit1: TEdit
    Left = 144
    Top = 80
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object btnCtrls: TButton
    Left = 64
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Controls'
    TabOrder = 4
    OnClick = btnCtrlsClick
  end
  inline Frame11: TFrame1
    Left = 392
    Top = 8
    Width = 289
    Height = 177
    TabOrder = 5
    inherited Edit1: TEdit
      OnClick = Frame11Edit1Click
    end
  end
end
