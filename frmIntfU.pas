unit frmIntfU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmIntf = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyIntf = Interface(IInterface)
    function Tst(): string;
  end;

var
  frmIntf: TfrmIntf;

implementation

uses
  Emp;

{$R *.dfm}

procedure Tst(i: TMyIntf);
begin
  ShowMessage(i.Tst());
end;


procedure TfrmIntf.Button1Click(Sender: TObject);
var
  emp: TEmp;
  dept: TDept;
begin
  emp := TEmp.Create();
  Tst(emp);
  emp.Free();

  dept := TDept.Create();
  Tst(dept);
  dept.Free();

end;

end.
