unit DataMod;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, DBTables;

type
  TdmMain = class(TDataModule)
    Database1: TDatabase;
    qryEmps: TQuery;
    dspEmps: TDataSetProvider;
    cdsEmps: TClientDataSet;
    cdsEmpsEmpFullName: TStringField;
    cdsEmpsEmpNo: TIntegerField;
    cdsEmpsLastName: TStringField;
    cdsEmpsFirstName: TStringField;
    cdsEmpsPhoneExt: TStringField;
    cdsEmpsHireDate: TDateTimeField;
    cdsEmpsSalary: TFloatField;
    dsEmps: TDataSource;
    qrySkills: TQuery;
    dspSkills: TDataSetProvider;
    cdsSkills: TClientDataSet;
    dsSkills: TDataSource;
    qryEmpSkill: TQuery;
    dspEmpSkill: TDataSetProvider;
    cdsEmpSkill: TClientDataSet;
    cdsEmpSkillEmpID: TIntegerField;
    cdsEmpSkillSkillID: TIntegerField;
    cdsEmpSkillSkillLevel: TStringField;
    cdsEmpSkillSkill: TStringField;
    dsEmpSkill: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmMain: TdmMain;

implementation

{$R *.dfm}

end.
