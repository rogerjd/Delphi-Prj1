object frmEmpPers: TfrmEmpPers
  Left = 218
  Top = 188
  Width = 979
  Height = 563
  Caption = 'Employee Personal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBText1: TDBText
    Left = 72
    Top = 48
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'EmpFullName'
    DataSource = dmMain.dsEmps
  end
  object Button1: TButton
    Left = 184
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Edit'
    TabOrder = 0
    OnClick = Button1Click
  end
end
