unit DBDemo;

(*
  - for EmpSkills (middle) to be 'open', both Emps and Skills must be open.
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DBClient, DB, Grids, DBGrids, DBTables, StdCtrls,
  DBCtrls;

type
  TEmpSkill = (esEmp, esSkill, esNone);

  TEmpSkillCtrl = class
    //todo: fine grain methods instead of one catch all??
    class procedure UpdtEditBtns;
  end;

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
    btnEmpFilter: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnSkillTblOpen: TButton;
    btnSkillTblClose: TButton;
    edtSkillFilter: TEdit;
    btnSkillFilter: TButton;
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
    procedure btnSkillTblCloseClick(Sender: TObject);
    procedure btnEmpFilterClick(Sender: TObject);
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
    procedure btnSkillDelClick(Sender: TObject);
    procedure btnSkillUpdtClick(Sender: TObject);
    procedure btnEmpTblCloseClick(Sender: TObject);
    procedure btnSkillFilterClick(Sender: TObject);
    procedure dbgdEmpsTitleClick(Column: TColumn);
    procedure cdsEmpSkillReconcileError(DataSet: TCustomClientDataSet;
      E: EReconcileError; UpdateKind: TUpdateKind;
      var Action: TReconcileAction);
  private
    EmpSkillMode: TEmpSkill;
    { Private declarations }
    procedure SetEmpSkillsQryFilter(tbl: string);
    procedure SetupEmpSkillsCtrls();
    procedure HideEmpSkillsGridCols();

    procedure SetupSkillCtrls();
    procedure SetupEmpCtrls;

    procedure EmpSkillsTblCtrl();
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
  SetEmpSkillsQryFilter('emp');
  cdsEmps.Open();
//  ShowMessage(BoolToStr(Database1.Connected));
	SetupEmpCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.btnSkillTblCloseClick(Sender: TObject);
begin
  cdsSkills.Close();
  SetupSkillCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.btnEmpFilterClick(Sender: TObject);
begin
  cdsEmps.Close(); //must close, for new filter
  SetEmpSkillsQryFilter('emp');
  cdsEmps.Open();
(*
  ShowMessage(BoolToStr(Query1.Active));
  ShowMessage(BoolToStr(Database1.Connected));
*)
end;

procedure TfrmDBDemo.SetEmpSkillsQryFilter(tbl: string);
begin
  if tbl = 'emp' then
    qryEmps.Params[0].Value := edtEmpFilter.Text + '%'
  else if tbl = 'skill' then
    qrySkills.Params[0].Value := edtSkillFilter.Text + '%'
end;

procedure TfrmDBDemo.btnSkillTblOpenClick(Sender: TObject);
begin
  SetEmpSkillsQryFilter('skill');
  cdsSkills.Open();
	SetupSkillCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.Button3Click(Sender: TObject);
begin
  ShowMessage(cdsEmps.FieldByName('EmpNo').Value);
end;

procedure TfrmDBDemo.btnEmpSkillClick(Sender: TObject);
begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select EmpID, e.SkillID, skill from empSkills e, skills s where (e.EmpID = :eid) and s.SkillID = e.SkillID');
  qryEmpSkill.Params[0].Value := cdsEmps.FieldByName('EmpNo').AsInteger;
  cdsEmpSkill.Open();
  EmpSkillMode := esEmp;
  SetupEmpSkillsCtrls();
  HideEmpSkillsGridCols();
end;

procedure TfrmDBDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Database1.Connected := False;
  cdsEmps.Close();
  cdsSkills.Close();
  cdsEmpSkill.Close();
end;

procedure TfrmDBDemo.btnSkillEmpsClick(Sender: TObject);
begin
  qryEmpSkill.SQL.Clear();
  cdsEmpSkill.Close();
  qryEmpSkill.SQL.Add('select es.EmpID, es.SkillID, LastName from EmpSkills es, employee e where (es.SkillID = :sid) and e.EmpNo = es.EmpID');
  qryEmpSkill.Params[0].Value := cdsSkills.FieldByName('SkillID').Value;
  cdsEmpSkill.Open();
  EmpSkillMode := esSkill;
  SetupEmpSkillsCtrls();
  HideEmpSkillsGridCols();
end;

procedure TfrmDBDemo.FormCreate(Sender: TObject);
begin
(*
  SetEmpSkillsQryFilter('emp');
  SetEmpSkillsQryFilter('skill');
*)
  btnEmpTblOpen.Click();
  btnSkillTblOpen.Click();
//  cdsSkills.Open();
end;

//ref: some cases in here are redundant (ie: they could not have changed, so dont
//	need updt. but it simpler to think about it this way, it just as fast.
procedure TfrmDBDemo.SetupEmpSkillsCtrls();
begin
  btnEmpSkill.Enabled := cdsEmpSkill.Active;
  btnSkillEmps.Enabled := cdsEmpSkill.Active;

  btnDelEmpSkill.Enabled := cdsEmpSkill.Active and (cdsEmpSkill.RecordCount > 0);

  if EmpSkillMode = esEmp then begin
    btnAddEmpSkill.Enabled := cdsSkills.RecordCount > 0;
//todo: bug: qry is showing results for another emp
    lblResult.Caption := cdsEmps.FieldByName('LastName').Value + 'Num Skills: ' +
    	IntToStr(cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Skills for Employee: ' + cdsEmps.FieldByName('LastName').Value;
  end
  else if EmpSkillMode = esSkill then begin
    btnAddEmpSkill.Enabled := cdsEmps.RecordCount > 0;
    lblResult.Caption := cdsSkills.FieldByName('Skill').Value + '  Num Employees: ' +
      IntToStr(cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Employees with Skill: ' + cdsSkills.FieldByName('Skill').Value;
  end
  else if EmpSkillMode = esNone then
  begin
  	btnAddEmpSkill.Enabled := False;
    lblResult.Caption := '';
    gbxUpdtEmpSkill.Caption := '';
  end;

  btnEmpSkillsUpdtDB.Enabled := cdsEmpSkill.Active;
end;

procedure TfrmDBDemo.btnAddEmpSkillClick(Sender: TObject);
var
  EmpID,
  SkillID: integer;

  function SkillExists(): Boolean;
  begin
    cdsEmpSkill.IndexFieldNames := 'EmpID;SkillID';  //todo: dup: need EmpID? must be one emp
    Result := cdsEmpSkill.FindKey([EmpID, SkillID]);
    cdsEmpSkill.IndexFieldNames := '';
  end;

begin
  EmpID := cdsEmps.FieldByName('EmpNo').AsInteger;  //todo: dup: bug, this is cdsEmps, not qryEmpSkill
  SkillID := cdsSkills.FieldByName('SkillID').AsInteger;

  if SkillExists() then begin
    MessageDlg('Employee already has skill', mtError, [mbOk], 0);
    exit;
  end;

//ref: this passes by on 2 cases 1) emp > skills, and 2) skill > emps. the 3rd
//  varies per each case
  try
    cdsEmpSkill.Insert;
  	cdsEmpSkill.FieldByName('EmpID').Value := EmpID;
  	cdsEmpSkill.FieldByName('SkillID').Value := SkillID;

		case EmpSkillMode	of
      esEmp: cdsEmpSkill.FieldByName('Skill').Value := cdsSkills.FieldByName('Skill').Value;
      esSkill: cdsEmpSkill.FieldByName('LastName').Value := cdsEmps.FieldByName('LastName').Value;
    end;

  	cdsEmpSkill.Post;  //todo: dup: can add a rec that does not meet qry?? (incs rec count)
    //todo: dup: bug: shows results for 2 emps(skill dup'd) should be one emp > skills or skill > emps
  except
    cdsEmpSkill.Cancel();
  end;
  SetupEmpSkillsCtrls();
end;

//these hold the PK, dont show
procedure TfrmDBDemo.HideEmpSkillsGridCols;
begin
  dbgEmpSkills.Columns[0].Visible := False;
  dbgEmpSkills.Columns[1].Visible := False;
end;

procedure TfrmDBDemo.btnEmpSkillsUpdtDBClick(Sender: TObject);
var
  n: Integer;
begin
	if cdsEmpSkill.ChangeCount > 0 then
  begin
  	n := cdsEmpSkill.ApplyUpdates(0);
  end;
end;

procedure TfrmDBDemo.dspEmpSkillUpdateData(Sender: TObject;
  DataSet: TCustomClientDataSet);
begin
  with DataSet do
  begin
		FieldByName('EmpID').ProviderFlags := [pfInUpdate, pfInKey];
		FieldByName('SkillID').ProviderFlags := [pfInUpdate, pfInKey];
		case EmpSkillMode	of
      esEmp: FieldByName('Skill').ProviderFlags := [];
      esSkill: FieldByName('LastName').ProviderFlags := [];   
    end;
  end;
end;

procedure TfrmDBDemo.dspEmpSkillGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
  ShowMessage(TableName);
end;

procedure TfrmDBDemo.btnDelEmpSkillClick(Sender: TObject);
begin
  cdsEmpSkill.Delete();
  SetupEmpSkillsCtrls();
end;

procedure TfrmDBDemo.btnSkillAddClick(Sender: TObject);
var
  s: string;
begin
  s := InputBox('Add', 'enter', 'def');
  SetupSkillCtrls();
end;

//run through ctrls, and updt accordingly; though after Add/Updt/Del, some
//  cases are redundant(tbl must be open), but doesnt hurt and keeps it simple
procedure TfrmDBDemo.SetupSkillCtrls;
begin
  btnSkillTblOpen.Enabled := not cdsSkills.Active;
  btnSkillTblClose.Enabled := cdsSkills.Active;

  edtSkillFilter.Enabled := cdsSkills.Active;
	edtSkillFilter.Text := '';
  btnSkillFilter.Enabled := cdsSkills.Active;

	btnSkillUpdtDB.Enabled := cdsSkills.Active;
  btnSkillAdd.Enabled := cdsSkills.Active;
  btnSkillDel.Enabled := cdsSkills.Active and (cdsSkills.RecordCount > 0);
  btnSkillUpdt.Enabled := btnSkillDel.Enabled;
end;

procedure TfrmDBDemo.btnSkillDelClick(Sender: TObject);
begin
	MessageDlg('Delete ?', mtConfirmation, mbOKCancel, 0);
	SetupSkillCtrls();
end;

procedure TfrmDBDemo.btnSkillUpdtClick(Sender: TObject);
var
  s: String;
begin
  s := InputBox('Updt', 'enter', 'def');
end;

procedure TfrmDBDemo.btnEmpTblCloseClick(Sender: TObject);
begin
  cdsEmps.Close();
	SetupEmpCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.SetupEmpCtrls;
begin
	btnEmpTblOpen.Enabled := not cdsEmps.Active;
  btnEmpTblClose.Enabled := cdsEmps.Active;
	edtEmpFilter.Text := '';
  btnEmpFilter.Enabled := cdsEmps.Active;
  edtEmpFilter.Enabled := cdsEmps.Active;
end;

procedure TfrmDBDemo.EmpSkillsTblCtrl;
begin
  if cdsEmps.Active and cdsSkills.Active then
  	btnEmpSkill.Click()
  else begin
  	if cdsEmpSkill.Active then
    begin
    	cdsEmpSkill.Close();
      EmpSkillMode := esNone;
      SetupEmpSkillsCtrls();
    end;
  end;
end;

procedure TfrmDBDemo.btnSkillFilterClick(Sender: TObject);
begin
  cdsSkills.Close(); //must close, for new filter
  SetEmpSkillsQryFilter('skill');
  cdsSkills.Open();
end;

procedure TfrmDBDemo.dbgdEmpsTitleClick(Column: TColumn);
begin
  case Column.Index of
    0: cdsEmps.IndexFieldNames := 'EmpNo';
    1: cdsEmps.IndexFieldNames := 'LastName';
    2: cdsEmps.IndexFieldNames := 'FirstName';
  end;
end;

{ TEmpSkillCtrl }

class procedure TEmpSkillCtrl.UpdtEditBtns;
begin

end;

procedure TfrmDBDemo.cdsEmpSkillReconcileError(
 DataSet: TCustomClientDataSet; E: EReconcileError;
  UpdateKind: TUpdateKind; var Action: TReconcileAction);
begin
//
end;

end.
