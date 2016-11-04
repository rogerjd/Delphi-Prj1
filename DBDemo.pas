unit DBDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DBClient, DB, Grids, DBGrids, DBTables, StdCtrls,
  DBCtrls;

type
  TfrmDBDemo = class(TForm)
    Database1: TDatabase;
    qryEmps: TQuery;
    Table1: TTable;
    dbgdEmps: TDBGrid;
    dsEmps: TDataSource;
    cdsEmps: TClientDataSet;
    dspEmps: TDataSetProvider;
    Button1: TButton;
    Button2: TButton;
    btnEmpTblOpen: TButton;
    btnEmpTblClose: TButton;
    GroupBox1: TGroupBox;
    edtEmpFilter: TEdit;
    btnFilterTbl: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnSkillTblOpen: TButton;
    btnSkillTblClose: TButton;
    edtSkillFilter: TEdit;
    Button5: TButton;
    dbgdSkills: TDBGrid;
    btnEmpSkill: TButton;
    btnSkillEmps: TButton;
    qrySkills: TQuery;
    dspSkills: TDataSetProvider;
    cdsSkills: TClientDataSet;
    qryEmpSkill: TQuery;
    dspEmpSkill: TDataSetProvider;
    cdsEmpSkill: TClientDataSet;
    dsEmpSkill: TDataSource;
    dsSkills: TDataSource;
    Button3: TButton;
    dbgEmpSkills: TDBGrid;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnEmpTblOpenClick(Sender: TObject);
    procedure btnEmpTblCloseClick(Sender: TObject);
    procedure btnFilterTblClick(Sender: TObject);
    procedure btnSkillTblOpenClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnEmpSkillClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSkillEmpsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure SetTblFilter(tbl: string);
    procedure ToggleButtons();
  public
    { Public declarations }
  end;

var
  frmDBDemo: TfrmDBDemo;

implementation

{$R *.dfm}

procedure TfrmDBDemo.Button2Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmDBDemo.Button1Click(Sender: TObject);
var
  mr: integer;
begin
  mr := MessageDlg('test', mtInformation, [mbOk], 0);
end;

procedure TfrmDBDemo.btnEmpTblOpenClick(Sender: TObject);
begin
  btnEmpTblOpen.Enabled := False;
  SetTblFilter('emp');
  cdsEmps.Open();
//  ShowMessage(BoolToStr(Database1.Connected));
  btnEmpTblClose.Enabled := True;
end;

procedure TfrmDBDemo.btnEmpTblCloseClick(Sender: TObject);
begin
  btnEmpTblClose.Enabled := False;
  cdsEmps.Close();
  btnEmpTblOpen.Enabled := True;
end;

procedure TfrmDBDemo.btnFilterTblClick(Sender: TObject);
begin
  cdsEmps.Close(); //must close, for new filter
  SetTblFilter('emp');
  cdsEmps.Open();

//  ClientDataSet1.ap
(*
  ShowMessage(BoolToStr(Query1.Active));
  ShowMessage(BoolToStr(Database1.Connected));
*)
end;

procedure TfrmDBDemo.SetTblFilter(tbl: string);
begin
  if tbl = 'emp' then
    qryEmps.Params[0].Value := edtEmpFilter.Text + '%'
  else if tbl = 'skill' then
    qrySkills.Params[0].Value := edtSkillFilter.Text + '%'
end;

procedure TfrmDBDemo.ToggleButtons;
begin

end;

procedure TfrmDBDemo.btnSkillTblOpenClick(Sender: TObject);
begin
  btnSkillTblOpen.Enabled := False;
  SetTblFilter('skill');
  cdsSkills.Open();
//  ShowMessage(BoolToStr(Database1.Connected));
  btnSkillTblOpen.Enabled := True;
end;

procedure TfrmDBDemo.Button3Click(Sender: TObject);
begin
  ShowMessage(cdsEmps.FieldByName('EmpNo').Value);
end;
//todo: put emp name in lbl, above the skills
procedure TfrmDBDemo.btnEmpSkillClick(Sender: TObject);
begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select skill from empSkills e, skills s where (e.EmpID = :eid) and s.SkillID = e.SkillID');
  qryEmpSkill.Params[0].Value := cdsEmps.FieldByName('EmpNo').AsInteger;
  cdsEmpSkill.Open();
end;

procedure TfrmDBDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Database1.Connected := False;
  cdsEmps.Close();
  cdsSkills.Close();
  cdsEmpSkill.Close();
end;
//todo: put label w/skill above emps
procedure TfrmDBDemo.btnSkillEmpsClick(Sender: TObject);
begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select LastName from employee e, EmpSkills s where (s.SkillID = :sid) and e.EmpNo = s.EmpID');
  qryEmpSkill.Params[0].Value := cdsSkills.FieldByName('SkillID').Value;
  cdsEmpSkill.Open();
end;
//TODO:
procedure TfrmDBDemo.FormCreate(Sender: TObject);
begin
  SetTblFilter('emp');
  SetTblFilter('skill');  
  cdsEmps.Open();
  cdsSkills.Open();
end;

end.
