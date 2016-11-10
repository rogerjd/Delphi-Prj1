program Project1;

{%ToDo 'Project1.todo'}

uses
  Forms,
  MainForm in 'MainForm.pas' {frmMain},
  frmDataStructs in 'frmDataStructs.pas' {Form1},
  DBDemo in 'DBDemo.pas' {frmDBDemo},
  frmIntfU in 'frmIntfU.pas' {frmIntf},
  Emp in 'Emp.pas',
  LangUnit in 'LangUnit.pas' {frmLang},
  frmDemoUnit in 'frmDemoUnit.pas' {frmDemo};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmDBDemo, frmDBDemo);
  Application.CreateForm(TfrmIntf, frmIntf);
  Application.CreateForm(TfrmLang, frmLang);
  Application.CreateForm(TfrmDemo, frmDemo);
  Application.Run;
end.
