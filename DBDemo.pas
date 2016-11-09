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
  TEmpSkill = (esEmp, esSkill);

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
    procedure btnSkillTblCloseClick(Sender: TObject);
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
    procedure btnSkillDelClick(Sender: TObject);
    procedure btnSkillUpdtClick(Sender: TObject);
    procedure btnEmpTblCloseClick(Sender: TObject);
  private
    EmpSkillMode: TEmpSkill;
    { Private declarations }
    procedure SetEmpSkillsQryFilter(tbl: string);
    procedure SetupEmpSkillsCtrls(tbl: string);
    procedure HideEmpSkillsGridCols();

    procedure SetupSkillEditBtns;
    procedure SetupSkillTblBtns();

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
  SetupSkillTblBtns();
  EmpSkillsTblCtrl();
end;

procedure TfrmDBDemo.btnFilterTblClick(Sender: TObject);
begin
  cdsEmps.Close(); //must close, for new filter
  SetEmpSkillsQryFilter('emp');
  cdsEmps.Open();

//  ClientDataSet1.ap
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
	SetupSkillTblBtns();
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
  SetupEmpSkillsCtrls('emp');
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
  SetupEmpSkillsCtrls('skill');
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

procedure TfrmDBDemo.SetupEmpSkillsCtrls(tbl: string);
begin
  btnEmpSkill.Enabled := cdsEmpSkill.Active;
  btnSkillEmps.Enabled := cdsEmpSkill.Active;

  btnDelEmpSkill.Enabled := cdsEmpSkill.Active and (cdsEmpSkill.RecordCount > 0);

  if tbl = 'emp' then begin
    btnAddEmpSkill.Enabled := cdsSkills.RecordCount > 0;

    lblResult.Caption := cdsEmps.FieldByName('LastName').Value + 'Num Skills: ' +
    	IntToStr(cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Skills for Employee: ' + cdsEmps.FieldByName('LastName').Value;
  end
  else if tbl = 'skill' then begin
    btnAddEmpSkill.Enabled := cdsEmps.RecordCount > 0;
    lblResult.Caption := cdsSkills.FieldByName('Skill').Value + '  Num Employees: ' +
      IntToStr(cdsEmpSkill.RecordCount);
    gbxUpdtEmpSkill.Caption := 'Employees with Skill: ' + cdsSkills.FieldByName('Skill').Value;
  end
  else begin
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

  	cdsEmpSkill.Post;
  except
    cdsEmpSkill.Cancel();
  end;
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
  n := cdsEmpSkill.ApplyUpdates(0);
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
  btnFilterTbl.Enabled := cdsEmps.Active;
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
      SetupEmpSkillsCtrls('');
    end;
  end;
end;

end.
