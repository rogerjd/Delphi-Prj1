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
    btnEmpSkillsUpdtDB: TButton;
    gbxSkills: TGroupBox;
    btnSkillDel: TButton;
    btnSkillAdd: TButton;
    btnSkillUpdtDB: TButton;
    btnSkillUpdt: TButton;
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
    procedure btnEmpSkillsUpdtDBClick(Sender: TObject);
    procedure dspEmpSkillUpdateData(Sender: TObject;
      DataSet: TCustomClientDataSet);
    procedure dspEmpSkillGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure btnDelEmpSkillClick(Sender: TObject);
    procedure btnSkillAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSkillDelClick(Sender: TObject);
    procedure btnSkillUpdtClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTblFilter(tbl: string);
    procedure SetupUpdtBtns(tbl: string);
    procedure HideGridCols();
    procedure SetupSkillEditBtns;
    procedure SetupSkillTblBtns();
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
  cdsSkills.Close();
  SetupSkillTblBtns();
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

procedure TfrmDBDemo.btnSkillTblOpenClick(Sender: TObject);
begin
  SetTblFilter('skill');
  cdsSkills.Open();
	SetupSkillTblBtns();
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

procedure TfrmDBDemo.btnEmpSkillsUpdtDBClick(Sender: TObject);
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

procedure TfrmDBDemo.dspEmpSkillGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  ShowMessage(TableName);
end;

procedure TfrmDBDemo.btnDelEmpSkillClick(Sender: TObject);
begin
  if cdsEmpSkill.RecNo < 1 then
  	exit;
  cdsEmpSkill.Delete();
end;

procedure TfrmDBDemo.btnSkillAddClick(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Add', 'enter', 'def');
  SetupSkillEditBtns();
end;

//enable or disable btns
procedure TfrmDBDemo.SetupSkillEditBtns;
begin
  if not cdsSkills.Active then
  begin
    btnSkillAdd.Enabled := False;
    btnSkillUpdt.Enabled := False;
    btnSkillDel.Enabled := False;
    btnSkillUpdtDB.Enabled := False;
    Exit;
  end;

	btnSkillUpdtDB.Enabled := True;
  btnSkillAdd.Enabled := True;
  btnSkillDel.Enabled := cdsSkills.RecordCount > 0;
  btnSkillUpdt.Enabled := btnSkillDel.Enabled;
end;

procedure TfrmDBDemo.FormShow(Sender: TObject);
begin
	btnSkillTblOpenClick(nil);
end;

procedure TfrmDBDemo.SetupSkillTblBtns;
begin
  btnSkillTblOpen.Enabled := not cdsSkills.Active;
  btnSkillTblClose.Enabled := cdsSkills.Active;

  SetupSkillEditBtns();
end;

procedure TfrmDBDemo.btnSkillDelClick(Sender: TObject);
var
  s: String;
begin
	MessageDlg('Delete ?', mtConfirmation, mbOKCancel, 0);
	SetupSkillEditBtns();
end;

procedure TfrmDBDemo.btnSkillUpdtClick(Sender: TObject);
var
  s: String;
begin
  s := InputBox('Updt', 'enter', 'def');
end;

end.
