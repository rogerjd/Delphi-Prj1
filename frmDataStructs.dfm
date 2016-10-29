object Form1: TForm1
  Left = 233
  Top = 143
  Width = 488
  Height = 281
  ActiveControl = btnList
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
  object btnList: TButton
    Left = 20
    Top = 112
    Width = 75
    Height = 25
    Caption = 'List'
    TabOrder = 0
    OnClick = btnListClick
  end
  object Edit1: TEdit
    Left = 112
    Top = 72
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object btnStrList: TButton
    Left = 108
    Top = 112
    Width = 75
    Height = 25
    Caption = 'String List'
    TabOrder = 2
    OnClick = btnStrListClick
  end
  object btnArray: TButton
    Left = 108
    Top = 144
    Width = 75
    Height = 25
    Caption = 'Array'
    TabOrder = 3
    OnClick = btnArrayClick
  end
  object BitBtn1: TBitBtn
    Left = 376
    Top = 200
    Width = 75
    Height = 25
    Caption = '&Close'
    ModalResult = 1
    TabOrder = 4
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
  object Button1: TButton
    Left = 248
    Top = 32
    Width = 75
    Height = 25
    Caption = 'String'
    TabOrder = 5
    OnClick = Button1Click
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
