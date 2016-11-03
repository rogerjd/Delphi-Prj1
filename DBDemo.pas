unit DBDemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Provider, DBClient, DB, Grids, DBGrids, DBTables, StdCtrls;

type
  TfrmDBDemo = class(TForm)
    Database1: TDatabase;
    Query1: TQuery;
    Table1: TTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    DataSetProvider1: TDataSetProvider;
    Button1: TButton;
    Button2: TButton;
    btnOpenTbl: TButton;
    btnCloseTbl: TButton;
    GroupBox1: TGroupBox;
    edtFilterTbl: TEdit;
    btnFilterTbl: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnOpenTblClick(Sender: TObject);
    procedure btnCloseTblClick(Sender: TObject);
    procedure btnFilterTblClick(Sender: TObject);
  private
    { Private declarations }
    procedure SetTblFilter();
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

procedure TfrmDBDemo.btnOpenTblClick(Sender: TObject);
begin
  btnOpenTbl.Enabled := False;
  SetTblFilter();
  ClientDataSet1.Open();
  ShowMessage(BoolToStr(Database1.Connected));
  btnCloseTbl.Enabled := True;
end;

procedure TfrmDBDemo.btnCloseTblClick(Sender: TObject);
begin
  btnCloseTbl.Enabled := False;
  ClientDataSet1.Close();
  btnOpenTbl.Enabled := True;
end;

procedure TfrmDBDemo.btnFilterTblClick(Sender: TObject);
begin
  ClientDataSet1.Close(); //must close, for new filter
  SetTblFilter();
  ClientDataSet1.Open();
(*
  ShowMessage(BoolToStr(Query1.Active));
  ShowMessage(BoolToStr(Database1.Connected));
*)
end;

procedure TfrmDBDemo.SetTblFilter;
begin
  Query1.Params[0].Value := edtFilterTbl.Text + '%';
end;

procedure TfrmDBDemo.ToggleButtons;
begin

end;

end.
