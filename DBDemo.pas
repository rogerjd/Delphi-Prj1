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
    lblResult: TLabel;
    gbxUpdtEmpSkill: TGroupBox;
    btnDelEmpSkill: TButton;
    btnAddEmpSkill: TButton;
    btnUpdtDB: TButton;
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
    procedure btnAddEmpSkillClick(Sender: TObject);
    procedure btnUpdtDBClick(Sender: TObject);
    procedure dspEmpSkillUpdateData(Sender: TObject;
      DataSet: TCustomClientDataSet);
  private
    { Private declarations }
    procedure SetTblFilter(tbl: string);
    procedure ToggleButtons();
    procedure SetupUpdtBtns(tbl: string);
    procedure HideGridCols();
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

procedure TfrmDBDemo.btnEmpSkillClick(Sender: TObject);

  procedure SetLbl();
  begin
    lblResult.Caption := cdsEmps.FieldByName('LastName').Value + '  Skills:';
    gbxUpdtEmpSkill.Caption := 'Skills for Employee: ' + cdsEmps.FieldByName('LastName').Value;
  end;

begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select EmpID, e.SkillID, skill from empSkills e, skills s where (e.EmpID = :eid) and s.SkillID = e.SkillID');
  qryEmpSkill.Params[0].Value := cdsEmps.FieldByName('EmpNo').AsInteger;
  cdsEmpSkill.Open();
  SetLbl();
  SetupUpdtBtns('emp');
  HideGridCols();
end;

procedure TfrmDBDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Database1.Connected := False;
  cdsEmps.Close();
  cdsSkills.Close();
  cdsEmpSkill.Close();
end;

procedure TfrmDBDemo.btnSkillEmpsClick(Sender: TObject);

  procedure SetLbl();
  begin
    lblResult.Caption := cdsSkills.FieldByName('Skill').Value + '  Employees:';
  end;

begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select LastName from employee e, EmpSkills s where (s.SkillID = :sid) and e.EmpNo = s.EmpID');
  qryEmpSkill.Params[0].Value := cdsSkills.FieldByName('SkillID').Value;
  cdsEmpSkill.Open();
  SetLbl();
  SetupUpdtBtns('skill');
end;

procedure TfrmDBDemo.FormCreate(Sender: TObject);
begin
  SetTblFilter('emp');
  SetTblFilter('skill');
  cdsEmps.Open();
  cdsSkills.Open();
end;


procedure TfrmDBDemo.SetupUpdtBtns(tbl: string);
begin
  btnDelEmpSkill.Enabled := cdsEmpSkill.RecordCount > 0;

  if tbl = 'emp' then
    btnAddEmpSkill.Enabled := cdsSkills.RecordCount > 0
  else if tbl = 'skill' then
    btnAddEmpSkill.Enabled := cdsEmps.RecordCount > 0
end;

procedure TfrmDBDemo.btnAddEmpSkillClick(Sender: TObject);
var
  EmpID,
  SkillID: integer;

  function SkillExists(): Boolean;
  var
    b: Boolean;
  begin
    cdsEmpSkill.IndexFieldNames := 'EmpID;SkillID';
    Result := cdsEmpSkill.FindKey([EmpID, SkillID]);
    cdsEmpSkill.IndexFieldNames := '';
  end;

begin
  EmpID := cdsEmps.FieldByName('EmpNo').AsInteger;
  SkillID := cdsSkills.FieldByName('SkillID').AsInteger;

  if SkillExists() then begin
    MessageDlg('Employee already has skill', mtError, [mbOk], 0);
    exit;
  end;

  try
    cdsEmpSkill.Insert;
  	cdsEmpSkill.FieldByName('EmpID').Value := EmpID;
  	cdsEmpSkill.FieldByName('SkillID').Value := SkillID;
  	cdsEmpSkill.FieldByName('Skill').Value := cdsSkills.FieldByName('Skill').Value;
  	cdsEmpSkill.Post;
  except
    cdsEmpSkill.Cancel();
  end;
end;

//these hold the PK, dont show
procedure TfrmDBDemo.HideGridCols;
begin
  dbgEmpSkills.Columns[0].Visible := False;
  dbgEmpSkills.Columns[1].Visible := False;
end;

procedure TfrmDBDemo.btnUpdtDBClick(Sender: TObject);
var
  n: Integer;
begin
  n := cdsEmpSkill.ApplyUpdates(0);
end;

procedure TfrmDBDemo.dspEmpSkillUpdateData(Sender: TObject;
  DataSet: TCustomClientDataSet);
begin
  with DataSet do
  begin
		FieldByName('EmpID').ProviderFlags := [pfInUpdate, pfInKey];
		FieldByName('SkillID').ProviderFlags := [pfInUpdate, pfInKey];
		FieldByName('Skill').ProviderFlags := [];
  end;
end;

end.
