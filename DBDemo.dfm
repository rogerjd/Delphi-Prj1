object frmDBDemo: TfrmDBDemo
  Left = 252
  Top = 329
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
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgdEmps: TDBGrid
    Left = 8
    Top = 160
    Width = 313
    Height = 120
    DataSource = dsEmps
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
    Cancel = True
    Caption = 'E&xit'
    TabOrder = 2
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 48
    Width = 313
    Height = 105
    Caption = 'Employees'
    TabOrder = 3
    object btnEmpTblOpen: TButton
      Left = 6
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnEmpTblOpenClick
    end
    object btnEmpTblClose: TButton
      Left = 62
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Close'
      Enabled = False
      TabOrder = 1
      OnClick = btnEmpTblCloseClick
    end
    object edtEmpFilter: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btnFilterTbl: TButton
      Left = 144
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Filter'
      TabOrder = 3
      OnClick = btnFilterTblClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 48
    Width = 225
    Height = 105
    Caption = 'Results'
    TabOrder = 4
    object btnEmpSkill: TButton
      Left = 60
      Top = 20
      Width = 105
      Height = 25
      Caption = 'Employee Skills'
      TabOrder = 0
      OnClick = btnEmpSkillClick
    end
    object btnSkillEmps: TButton
      Left = 59
      Top = 60
      Width = 107
      Height = 25
      Caption = 'Skill Employees'
      TabOrder = 1
      OnClick = btnSkillEmpsClick
    end
  end
  object GroupBox3: TGroupBox
    Left = 616
    Top = 48
    Width = 313
    Height = 105
    Caption = 'Skills'
    TabOrder = 5
    object btnSkillTblOpen: TButton
      Left = 6
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Open'
      TabOrder = 0
      OnClick = btnSkillTblOpenClick
    end
    object btnSkillTblClose: TButton
      Left = 62
      Top = 16
      Width = 50
      Height = 25
      Caption = 'Close'
      Enabled = False
      TabOrder = 1
      OnClick = btnEmpTblCloseClick
    end
    object edtSkillFilter: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object Button5: TButton
      Left = 144
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Filter'
      TabOrder = 3
      OnClick = btnFilterTblClick
    end
  end
  object dbgdSkills: TDBGrid
    Left = 616
    Top = 168
    Width = 320
    Height = 120
    DataSource = dsSkills
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button3: TButton
    Left = 40
    Top = 328
    Width = 75
    Height = 25
    Caption = 'Selected Emp'
    TabOrder = 7
    OnClick = Button3Click
  end
  object dbgEmpSkills: TDBGrid
    Left = 352
    Top = 168
    Width = 217
    Height = 120
    DataSource = dsEmpSkill
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    DatabaseName = 'Database1'
    SessionName = 'Default'
    Left = 8
    Top = 8
  end
  object qryEmps: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      'select *'
      ' from'
      '  employee'
      'where lastname like :p')
    Left = 128
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptInput
      end>
  end
  object Table1: TTable
    DatabaseName = 'Database1'
    TableName = 'animals.dbf'
    Left = 40
    Top = 456
  end
  object dsEmps: TDataSource
    DataSet = cdsEmps
    Left = 248
    Top = 152
  end
  object cdsEmps: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmps'
    Left = 216
    Top = 8
  end
  object dspEmps: TDataSetProvider
    DataSet = qryEmps
    Constraints = True
    Left = 168
    Top = 8
  end
  object qrySkills: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      'select *'
      ' from'
      '  skills'
      'where skill like :p'
      '')
    Left = 640
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptInput
      end>
  end
  object dspSkills: TDataSetProvider
    DataSet = qrySkills
    Constraints = True
    Left = 680
    Top = 16
  end
  object cdsSkills: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSkills'
    Left = 728
    Top = 16
  end
  object qryEmpSkill: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      '')
    Left = 360
    Top = 8
  end
  object dspEmpSkill: TDataSetProvider
    DataSet = qryEmpSkill
    Constraints = True
    Left = 400
    Top = 8
  end
  object cdsEmpSkill: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpSkill'
    Left = 448
    Top = 8
  end
  object dsEmpSkill: TDataSource
    DataSet = cdsEmpSkill
    Left = 384
    Top = 152
  end
  object dsSkills: TDataSource
    DataSet = cdsSkills
    Left = 664
    Top = 160
  end
end
