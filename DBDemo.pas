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
    Table1: TTable;
    dbgdEmps: TDBGrid;
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
    btnExcept: TButton;
    DBText1: TDBText;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupListBox1: TDBLookupListBox;
    tblEmps: TTable;
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
    procedure btnExceptClick(Sender: TObject);
    procedure cdsEmpsCalcFields(DataSet: TDataSet);
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

uses
  DataMod;

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
  dmMain.cdsEmps.Open();
//  ShowMessage(BoolToStr(Database1.Connected));
	SetupEmpCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.btnSkillTblCloseClick(Sender: TObject);
begin
  dmMain.cdsSkills.Close();
  SetupSkillCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.btnEmpFilterClick(Sender: TObject);
begin
  dmMain.cdsEmps.Close(); //must close, for new filter
  SetEmpSkillsQryFilter('emp');
  dmMain.cdsEmps.Open();
(*
  ShowMessage(BoolToStr(Query1.Active));
  ShowMessage(BoolToStr(Database1.Connected));
*)
end;

procedure TfrmDBDemo.SetEmpSkillsQryFilter(tbl: string);
begin
  if tbl = 'emp' then
    dmMain.qryEmps.Params[0].Value := edtEmpFilter.Text + '%'
  else if tbl = 'skill' then
    dmMain.qrySkills.Params[0].Value := edtSkillFilter.Text + '%'
end;

procedure TfrmDBDemo.btnSkillTblOpenClick(Sender: TObject);
begin
  SetEmpSkillsQryFilter('skill');
  dmMain.cdsSkills.Open();
	SetupSkillCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.Button3Click(Sender: TObject);
begin
  ShowMessage(dmMain.cdsEmps.FieldByName('EmpNo').Value);
end;

procedure TfrmDBDemo.btnEmpSkillClick(Sender: TObject);
begin
  dmMain.qryEmpSkill.SQL.Clear();
  dmMain.cdsEmpSkill.Close();
  dmMain.qryEmpSkill.SQL.Add('select EmpID, e.SkillID, skill, skillLevel from empSkills e, skills s where (e.EmpID = :eid) and s.SkillID = e.SkillID');
  dmMain.qryEmpSkill.Params[0].Value := dmMain.cdsEmps.FieldByName('EmpNo').AsInteger;
  dmMain.cdsEmpSkill.Open(); //todo: exception
  EmpSkillMode := esEmp;
  SetupEmpSkillsCtrls();
  HideEmpSkillsGridCols();
end;

procedure TfrmDBDemo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
//  Database1.Connected := False;
  dmMain.cdsEmps.Close();
  dmMain.cdsSkills.Close();
  dmMain.cdsEmpSkill.Close();
end;

procedure TfrmDBDemo.btnSkillEmpsClick(Sender: TObject);
begin
  dmMain.qryEmpSkill.SQL.Clear();
  dmMain.cdsEmpSkill.Close();
  dmMain.qryEmpSkill.SQL.Add('select es.EmpID, es.SkillID, LastName from EmpSkills es, employee e where (es.SkillID = :sid) and e.EmpNo = es.EmpID');
  dmMain.qryEmpSkill.Params[0].Value := dmMain.cdsSkills.FieldByName('SkillID').Value;
  dmMain.cdsEmpSkill.Open();
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
  btnEmpSkill.Enabled := dmMain.cdsEmpSkill.Active;
  btnSkillEmps.Enabled := dmMain.cdsEmpSkill.Active;

  btnDelEmpSkill.Enabled := dmMain.cdsEmpSkill.Active and (dmMain.cdsEmpSkill.RecordCount > 0);

  if EmpSkillMode = esEmp then begin
    btnAddEmpSkill.Enabled := dmMain.cdsSkills.RecordCount > 0;
//todo: bug: qry is showing results for another emp (inconsistent result)
    lblResult.Caption := dmMain.cdsEmps.FieldByName('LastName').Value + 'Num Skills: ' +
    	IntToStr(dmMain.cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Skills for Employee: ' + dmMain.cdsEmps.FieldByName('LastName').Value;
  end
  else if EmpSkillMode = esSkill then begin
    btnAddEmpSkill.Enabled := dmMain.cdsEmps.RecordCount > 0;
    lblResult.Caption := dmMain.cdsSkills.FieldByName('Skill').Value + '  Num Employees: ' +
      IntToStr(dmMain.cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Employees with Skill: ' + dmMain.cdsSkills.FieldByName('Skill').Value;
  end
  else if EmpSkillMode = esNone then
  begin
  	btnAddEmpSkill.Enabled := False;
    lblResult.Caption := '';
    gbxUpdtEmpSkill.Caption := '';
  end;

  btnEmpSkillsUpdtDB.Enabled := dmMain.cdsEmpSkill.Active;
end;

procedure TfrmDBDemo.btnAddEmpSkillClick(Sender: TObject);
var
  EmpID,
  SkillID: integer;

  function SkillExists(): Boolean;
  begin
    dmMain.cdsEmpSkill.IndexFieldNames := 'EmpID;SkillID';  //todo: dup: need EmpID? must be one emp
    Result := dmMain.cdsEmpSkill.FindKey([EmpID, SkillID]);
    dmMain.cdsEmpSkill.IndexFieldNames := '';
  end;

begin
  EmpID := dmMain.cdsEmps.FieldByName('EmpNo').AsInteger;  //todo: dup: bug, this is cdsEmps, not qryEmpSkill
  SkillID := dmMain.cdsSkills.FieldByName('SkillID').AsInteger;

  if SkillExists() then begin
    MessageDlg('Employee already has skill', mtError, [mbOk], 0);
    exit;
  end;

//ref: this passes by on 2 cases 1) emp > skills, and 2) skill > emps. the 3rd
//  varies per each case
  try
    dmMain.cdsEmpSkill.Insert;
  	dmMain.cdsEmpSkill.FieldByName('EmpID').Value := EmpID;
  	dmMain.cdsEmpSkill.FieldByName('SkillID').Value := SkillID;

		case EmpSkillMode	of
      esEmp: dmMain.cdsEmpSkill.FieldByName('Skill').Value := dmMain.cdsSkills.FieldByName('Skill').Value;
      esSkill: dmMain.cdsEmpSkill.FieldByName('LastName').Value := dmMain.cdsEmps.FieldByName('LastName').Value;
    end;

  	dmMain.cdsEmpSkill.Post;  //todo: dup: can add a rec that does not meet qry?? (incs rec count)
    //todo: dup: bug: shows results for 2 emps(skill dup'd) should be one emp > skills or skill > emps
  except
    dmMain.cdsEmpSkill.Cancel();
  end;
  SetupEmpSkillsCtrls();
end;

//these hold the PK, dont show
procedure TfrmDBDemo.HideEmpSkillsGridCols;
begin
//  dbgEmpSkills.Columns[0].Visible := False;
//  dbgEmpSkills.Columns[1].Visible := False;
end;

procedure TfrmDBDemo.btnEmpSkillsUpdtDBClick(Sender: TObject);
var
  n: Integer;
begin
	if dmMain.cdsEmpSkill.ChangeCount > 0 then
  begin
  	n := dmMain.cdsEmpSkill.ApplyUpdates(0);
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
  dmMain.cdsEmpSkill.Delete();
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
  btnSkillTblOpen.Enabled := not dmMain.cdsSkills.Active;
  btnSkillTblClose.Enabled := dmMain.cdsSkills.Active;

  edtSkillFilter.Enabled := dmMain.cdsSkills.Active;
	edtSkillFilter.Text := '';
  btnSkillFilter.Enabled := dmMain.cdsSkills.Active;

	btnSkillUpdtDB.Enabled := dmMain.cdsSkills.Active;
  btnSkillAdd.Enabled := dmMain.cdsSkills.Active;
  btnSkillDel.Enabled := dmMain.cdsSkills.Active and (dmMain.cdsSkills.RecordCount > 0);
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
  dmMain.cdsEmps.Close();
	SetupEmpCtrls();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.SetupEmpCtrls;
begin
	btnEmpTblOpen.Enabled := not dmMain.cdsEmps.Active;
  btnEmpTblClose.Enabled := dmMain.cdsEmps.Active;
	edtEmpFilter.Text := '';
  btnEmpFilter.Enabled := dmMain.cdsEmps.Active;
  edtEmpFilter.Enabled := dmMain.cdsEmps.Active;
end;

procedure TfrmDBDemo.EmpSkillsTblCtrl;
begin
  if dmMain.cdsEmps.Active and dmMain.cdsSkills.Active then
  	btnEmpSkill.Click()
  else begin
  	if dmMain.cdsEmpSkill.Active then
    begin
    	dmMain.cdsEmpSkill.Close();
      EmpSkillMode := esNone;
      SetupEmpSkillsCtrls();
    end;
  end;
end;

procedure TfrmDBDemo.btnSkillFilterClick(Sender: TObject);
begin
  dmMain.cdsSkills.Close(); //must close, for new filter
  SetEmpSkillsQryFilter('skill');
  dmMain.cdsSkills.Open();
end;

procedure TfrmDBDemo.dbgdEmpsTitleClick(Column: TColumn);
begin
  case Column.Index of
    0: dmMain.cdsEmps.IndexFieldNames := 'EmpNo';
    1: dmMain.cdsEmps.IndexFieldNames := 'LastName';
    2: dmMain.cdsEmps.IndexFieldNames := 'FirstName';
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

procedure TfrmDBDemo.btnExceptClick(Sender: TObject);
begin
	tblEmps.Open();
  try
    tblEmps.Insert();
    tblEmps.FieldByName('Salary').AsString := '12x3.34';
    tblEmps.Post();
  except
  	on E: Exception do
    begin
    	ShowMessage(E.Message);
    end;
  end;
  tblEmps.Close();
end;

procedure TfrmDBDemo.cdsEmpsCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('EmpFullName').Value :=
  	DataSet.fieldbyName('FirstName').Value + ' ' +
  	DataSet.fieldbyName('LastName').Value;
end;

end.
