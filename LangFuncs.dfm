object frmLangFuncs: TfrmLangFuncs
  Left = 192
  Top = 223
  Width = 979
  Height = 464
  Caption = 'Language'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object bbtnParams: TButton
    Left = 112
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Params'
    TabOrder = 0
    OnClick = bbtnParamsClick
  end
  object btnExcept: TButton
    Left = 200
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Exception'
    TabOrder = 1
    OnClick = btnExceptClick
  end
  object btnPtr: TButton
    Left = 344
    Top = 296
    Width = 75
    Height = 25
    Caption = 'Pointer'
    TabOrder = 2
    OnClick = btnPtrClick
  end
end
