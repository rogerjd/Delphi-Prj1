unit LangFuncs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLangFuncs = class(TForm)
    bbtnParams: TButton;
    btnExcept: TButton;
    btnPtr: TButton;
    procedure bbtnParamsClick(Sender: TObject);
    procedure btnExceptClick(Sender: TObject);
    procedure btnPtrClick(Sender: TObject);
  private
    { Private declarations }
    procedure CaseTst();
    procedure ForTst();
    procedure WhileTst();
    procedure ReapeatTst();
    procedure IfTst();
    procedure constParam(const x: integer);
    procedure outParam(out x: integer);
    procedure ExceptionTst();
    procedure PointerTst();
    class procedure TstClassStatic();
  public
    { Public declarations }
  end;

var
  frmLangFuncs: TfrmLangFuncs;

implementation

{$R *.dfm}

type
  TMyEnum = (red, green, blue);

var
  colors: set of TMyEnum; 

procedure TfrmLangFuncs.CaseTst();
var
  me: TMyEnum;
begin
	me := red;
  case me of
    red: ;
    green: ;
    blue: ;
    else ;
  end;
end;

procedure TfrmLangFuncs.bbtnParamsClick(Sender: TObject);
var
  x: integer;
begin
  x := 5;
  constParam(x);

  x := 3;
  outParam(x);
  ShowMessage(IntToStr(x));
end;

procedure TfrmLangFuncs.constParam(const x: integer);
begin
  ShowMessage(IntToStr((x)));
//x := 2;  compiler error: can not assign to
end;

procedure TfrmLangFuncs.outParam(out x: integer);
begin
  ShowMessage(IntToStr(x));
  x := x + 1;
  ShowMessage(IntToStr(x));
end;

procedure TfrmLangFuncs.ForTst;
begin
//the incex var must be local, and it is undefined when loop ends, so dont use it
end;

procedure TfrmLangFuncs.ReapeatTst;
var
  done: Boolean;
begin
	done := False;
  repeat
  until done;
end;

procedure TfrmLangFuncs.WhileTst;
var
  done: Boolean;
begin
	done := False;
  while not done do
  begin

  end;
end;

procedure TfrmLangFuncs.IfTst;
begin
// watch out when using if, don't cut off too little or too much, downstream, too:
// other parts/code paths may need the same if tst to func right
end;

procedure TfrmLangFuncs.ExceptionTst;
begin
  raise Exception.Create('tst exception');
end;

procedure TfrmLangFuncs.btnExceptClick(Sender: TObject);
begin
 ExceptionTst();  //no handler, uses sys handler, does not stop pgm
 // ** flow stops here, does not continue fwd **

 try
   ExceptionTst();
 except
   ShowMessage('exception caught');   //flow continues onward
 end;

end;

class procedure TfrmLangFuncs.TstClassStatic;
begin
//
end;

type
  ps = ^String;

procedure GetColor(ptr: ps);
begin
	ptr^ := 'abc123';
end;

procedure TfrmLangFuncs.PointerTst;
var
  str: String;
begin
  GetColor(Addr(str)); //will work with Modal frm, too. just pass ptr in ctor. if
  //frm is freed, can read the str pointed to. if frm is still active, then just
  //read a reg prop/fld/func (dont need ptr)
  ShowMessage(str);
end;

procedure TfrmLangFuncs.btnPtrClick(Sender: TObject);
begin
  PointerTst;
end;

end.
