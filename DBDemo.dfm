object frmDBDemo: TfrmDBDemo
  Left = 250
  Top = 287
  Width = 979
  Height = 563
  Caption = 'frmDBDemo'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 304
    Top = 200
    Width = 320
    Height = 120
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 24
    Top = 408
    Width = 75
    Height = 25
    Caption = 'MsgDlg'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 184
    Top = 400
    Width = 75
    Height = 25
    Caption = 'Exit'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 304
    Top = 88
    Width = 305
    Height = 105
    Caption = 'Table'
    TabOrder = 3
    object Button3: TButton
      Left = 6
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 62
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Close'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    Connected = True
    DatabaseName = 'Database1'
    SessionName = 'Default'
    Left = 80
    Top = 64
  end
  object Query1: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      'select *'
      'from'
      '  animals')
    Left = 120
    Top = 64
  end
  object Table1: TTable
    DatabaseName = 'Database1'
    TableName = 'animals.dbf'
    Left = 40
    Top = 456
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 248
    Top = 152
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 208
    Top = 64
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 160
    Top = 64
  end
end
