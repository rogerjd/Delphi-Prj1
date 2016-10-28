object Form1: TForm1
  Left = 0
  Top = 0
  Width = 488
  Height = 281
  ActiveControl = Button1
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 112
    Top = 53
    Width = 31
    Height = 13
    Caption = 'Label1'
  end
  object Button1: TButton
    Left = 148
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 112
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object SQLConnection1: TSQLConnection
    ConnectionName = 
      'Data Source=(localdb)\MSSQLLocalDB;AttachDbFilename="C:\Users\ro' +
      'ger\Documents\Visual Studio 2015\Projects\PayRoll\PayRoll\App_Da' +
      'ta\PRContext.mdf";Initial Catalog=PRContext;Integrated Security=' +
      'True;MultipleActiveResultSets=True'
    DriverName = 'MSSQL'
    Params.Strings = (
      'SchemaOverride=%.dbo'
      'DriverUnit=Data.DBXMSSQL'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DBXCommonDriver240.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXMsSqlMetaDataCommandFactory,DbxMSSQLDr' +
        'iver240.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXMsSqlMetaDataCommandFact' +
        'ory,Borland.Data.DbxMSSQLDriver,Version=24.0.0.0,Culture=neutral' +
        ',PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverMSSQL'
      'LibraryName=dbxmss.dll'
      'VendorLib=sqlncli10.dll'
      'VendorLibWin64=sqlncli10.dll'
      'HostName=ServerName'
      'DataBase=Database Name'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OSAuthentication=False'
      'PrepareSQL=True'
      'User_Name=user'
      'Password=password'
      'BlobSize=-1'
      'ErrorResourceFile='
      'OS Authentication=False'
      'Prepare SQL=False')
    Left = 232
    Top = 128
  end
  object SQLDataSet1: TSQLDataSet
    MaxBlobSize = 0
    Params = <>
    Left = 312
    Top = 144
  end
  object SQLQuery1: TSQLQuery
    SQLConnection = SQLConnection1
    Params = <>
    Left = 320
    Top = 96
  end
  object SQLTable1: TSQLTable
    SQLConnection = SQLConnection1
    Left = 256
    Top = 184
  end
  object DataSource1: TDataSource
    DataSet = SQLTable1
    Left = 392
    Top = 184
  end
  object ADOConnection1: TADOConnection
    Left = 64
    Top = 144
  end
end
