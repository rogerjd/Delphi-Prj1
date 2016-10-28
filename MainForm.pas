unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Database1: TMenuItem;
    Exit1: TMenuItem;
    hreading1: TMenuItem;
    ListStrList1: TMenuItem;
    Interface1: TMenuItem;
    procedure Database1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure ListStrList1Click(Sender: TObject);
    procedure Interface1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
   DBDemo, frmDataStructs, frmIntfU;

{$R *.dfm}

procedure TfrmMain.Database1Click(Sender: TObject);
var
  n: Integer;
begin
  frmDBDemo := TfrmDBDemo.Create(nil);
  frmDBDemo.ShowModal();
  FreeAndNil(frmDBDemo);
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmMain.ListStrList1Click(Sender: TObject);
begin
  Form1 := TForm1.Create(nil);
  Form1.ShowModal();
  Form1.Free();
end;

procedure TfrmMain.Interface1Click(Sender: TObject);
begin
  frmIntf := TfrmIntf.Create(nil);
  frmIntf.ShowModal();
  frmIntf.Free();
end;

end.
