program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  frmDataStructs in 'frmDataStructs.pas' {Form1},
  DBDemo in 'DBDemo.pas' {frmDBDemo},
  frmIntfU in 'frmIntfU.pas' {frmIntf},
  Emp in 'Emp.pas',
  LangFuncs in 'LangFuncs.pas' {frmLangFuncs},
  FormCtrl in 'FormCtrl.pas' {frmFormCtrl},
  StringFuncs in 'StringFuncs.pas' {frmStrFuncs},
  FrameTst in 'FrameTst.pas' {Frame1: TFrame},
  EmpSkill in 'EmpSkill.pas' {frmEmpSkill},
  EmpPersonal in 'EmpPersonal.pas' {frmEmpPers},
  DataMod in 'DataMod.pas' {dmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.Run;
end.
