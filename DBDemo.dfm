object frmDBDemo: TfrmDBDemo
  Left = 247
  Top = 358
  Width = 979
  Height = 481
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
  object DBText1: TDBText
    Left = 8
    Top = 288
    Width = 42
    Height = 13
    AutoSize = True
    DataField = 'EmpFullName'
    DataSource = dsEmps
  end
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
    OnTitleClick = dbgdEmpsTitleClick
    Columns = <
      item
        Expanded = False
        FieldName = 'EmpNo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LastName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FirstName'
        Visible = True
      end>
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
    object btnEmpFilter: TButton
      Left = 144
      Top = 72
      Width = 75
      Height = 25
      Caption = '&Filter'
      TabOrder = 3
      OnClick = btnEmpFilterClick
    end
  end
  object GroupBox2: TGroupBox
    Left = 352
    Top = 48
    Width = 225
    Height = 105
    Caption = 'Results'
    TabOrder = 4
    object lblResult: TLabel
      Left = 11
      Top = 80
      Width = 3
      Height = 13
    end
    object btnEmpSkill: TButton
      Left = 60
      Top = 12
      Width = 105
      Height = 25
      Caption = 'Employee Skills'
      TabOrder = 0
      OnClick = btnEmpSkillClick
    end
    object btnSkillEmps: TButton
      Left = 59
      Top = 44
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
    Width = 320
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
      OnClick = btnSkillTblCloseClick
    end
    object edtSkillFilter: TEdit
      Left = 16
      Top = 72
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object btnSkillFilter: TButton
      Left = 144
      Top = 72
      Width = 75
      Height = 25
      Caption = 'Filter'
      TabOrder = 3
      OnClick = btnSkillFilterClick
    end
  end
  object dbgdSkills: TDBGrid
    Left = 616
    Top = 160
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
    Top = 160
    Width = 225
    Height = 120
    DataSource = dsEmpSkill
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object gbxUpdtEmpSkill: TGroupBox
    Left = 352
    Top = 288
    Width = 225
    Height = 105
    Caption = 'gbxUpdtEmpSkill'
    TabOrder = 9
    object btnDelEmpSkill: TButton
      Left = 119
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 0
      OnClick = btnDelEmpSkillClick
    end
    object btnAddEmpSkill: TButton
      Left = 31
      Top = 24
      Width = 75
      Height = 25
      Caption = 'Add'
      Enabled = False
      TabOrder = 1
      OnClick = btnAddEmpSkillClick
    end
    object btnEmpSkillsUpdtDB: TButton
      Left = 64
      Top = 64
      Width = 105
      Height = 25
      Caption = 'Update Data Base'
      TabOrder = 2
      OnClick = btnEmpSkillsUpdtDBClick
    end
  end
  object gbxSkills: TGroupBox
    Left = 656
    Top = 288
    Width = 225
    Height = 105
    Caption = 'Skills'
    TabOrder = 10
    object btnSkillDel: TButton
      Left = 151
      Top = 24
      Width = 50
      Height = 25
      Caption = 'Delete'
      Enabled = False
      TabOrder = 0
      OnClick = btnSkillDelClick
    end
    object btnSkillAdd: TButton
      Left = 23
      Top = 24
      Width = 50
      Height = 25
      Caption = 'Add'
      Enabled = False
      TabOrder = 1
      OnClick = btnSkillAddClick
    end
    object btnSkillUpdtDB: TButton
      Left = 60
      Top = 64
      Width = 105
      Height = 25
      Caption = 'Update Data Base'
      TabOrder = 2
      OnClick = btnEmpSkillsUpdtDBClick
    end
    object btnSkillUpdt: TButton
      Left = 87
      Top = 24
      Width = 50
      Height = 25
      Caption = 'Update'
      Enabled = False
      TabOrder = 3
      OnClick = btnSkillUpdtClick
    end
  end
  object btnExcept: TButton
    Left = 576
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Exception'
    TabOrder = 11
    OnClick = btnExceptClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 176
    Top = 304
    Width = 145
    Height = 21
    DataField = 'SkillID'
    DataSource = dsEmpSkill
    KeyField = 'SkillID'
    ListField = 'Skill'
    ListSource = dsSkills
    TabOrder = 12
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 256
    Top = 328
    Width = 121
    Height = 95
    DataField = 'Skill'
    DataSource = dsSkills
    ListField = 'Skill'
    TabOrder = 13
  end
  object Database1: TDatabase
    AliasName = 'DBDEMOS'
    Connected = True
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
      'where lastname like :p'
      'order by lastname, firstname')
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
    OnCalcFields = cdsEmpsCalcFields
    Left = 216
    Top = 8
    object cdsEmpsEmpFullName: TStringField
      FieldKind = fkCalculated
      FieldName = 'EmpFullName'
      Calculated = True
    end
    object cdsEmpsEmpNo: TIntegerField
      FieldName = 'EmpNo'
    end
    object cdsEmpsLastName: TStringField
      FieldName = 'LastName'
    end
    object cdsEmpsFirstName: TStringField
      FieldName = 'FirstName'
      Size = 15
    end
    object cdsEmpsPhoneExt: TStringField
      FieldName = 'PhoneExt'
      Size = 4
    end
    object cdsEmpsHireDate: TDateTimeField
      FieldName = 'HireDate'
    end
    object cdsEmpsSalary: TFloatField
      FieldName = 'Salary'
    end
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
    UpdateMode = upWhereKeyOnly
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
    UpdateMode = upWhereKeyOnly
    OnUpdateData = dspEmpSkillUpdateData
    OnGetTableName = dspEmpSkillGetTableName
    Left = 400
    Top = 8
  end
  object cdsEmpSkill: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmpSkill'
    OnReconcileError = cdsEmpSkillReconcileError
    Left = 448
    Top = 8
  end
  object dsEmpSkill: TDataSource
    DataSet = cdsEmpSkill
    Left = 360
    Top = 208
  end
  object dsSkills: TDataSource
    DataSet = cdsSkills
    Left = 664
    Top = 160
  end
  object tblEmps: TTable
    DatabaseName = 'DBDEMOS'
    TableName = 'employee.db'
    Left = 536
    Top = 408
  end
end
