object dmMain: TdmMain
  OldCreateOrder = False
  Left = 517
  Top = 244
  Height = 283
  Width = 283
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
    Left = 8
    Top = 56
    ParamData = <
      item
        DataType = ftString
        Name = 'p'
        ParamType = ptInput
      end>
  end
  object dspEmps: TDataSetProvider
    DataSet = qryEmps
    Constraints = True
    Left = 45
    Top = 56
  end
  object cdsEmps: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspEmps'
    Left = 82
    Top = 56
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
  object dsEmps: TDataSource
    DataSet = cdsEmps
    Left = 120
    Top = 56
  end
  object qrySkills: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      'select *'
      ' from'
      '  skills'
      'where skill like :p'
      '')
    Left = 8
    Top = 112
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
    Left = 45
    Top = 112
  end
  object cdsSkills: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSkills'
    Left = 82
    Top = 112
  end
  object dsSkills: TDataSource
    DataSet = cdsSkills
    Left = 120
    Top = 112
  end
  object qryEmpSkill: TQuery
    DatabaseName = 'Database1'
    SQL.Strings = (
      'select * from EmpSkills')
    Left = 8
    Top = 168
  end
  object dspEmpSkill: TDataSetProvider
    DataSet = qryEmpSkill
    Constraints = True
    UpdateMode = upWhereKeyOnly
    Left = 48
    Top = 168
  end
  object cdsEmpSkill: TClientDataSet
    Aggregates = <>
    IndexFieldNames = 'EmpID'
    MasterFields = 'EmpNo'
    MasterSource = dsEmps
    PacketRecords = 0
    Params = <>
    ProviderName = 'dspEmpSkill'
    Left = 160
    Top = 56
    object cdsEmpSkillEmpID: TIntegerField
      FieldName = 'EmpID'
    end
    object cdsEmpSkillSkillID: TIntegerField
      FieldName = 'SkillID'
    end
    object cdsEmpSkillSkillLevel: TStringField
      FieldName = 'SkillLevel'
      Size = 1
    end
    object cdsEmpSkillSkill: TStringField
      FieldKind = fkLookup
      FieldName = 'Skill'
      LookupDataSet = cdsSkills
      LookupKeyFields = 'SkillID'
      LookupResultField = 'Skill'
      KeyFields = 'SkillID'
      Lookup = True
    end
  end
  object dsEmpSkill: TDataSource
    DataSet = cdsEmpSkill
    Left = 200
    Top = 56
  end
end
