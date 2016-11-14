unit LangUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TfrmLang = class(TForm)
    bbtnParams: TButton;
    procedure bbtnParamsClick(Sender: TObject);
  private
    { Private declarations }
    procedure constParam(const x: integer);
    procedure outParam(out x: integer);
  public
    { Public declarations }
  end;

var
  frmLang: TfrmLang;

implementation

{$R *.dfm}

type
  TMyEnum = (red, green, blue);

var
  colors: set of TMyEnum; 

procedure CaseTst();
var
  me: TMyEnum;
begin
	me := red;
  case me of
    red: ;
    green: ;
    blue: ;
  end;
end;

procedure TfrmLang.bbtnParamsClick(Sender: TObject);
var
  x: integer;
begin
  x := 5;
  constParam(x);

  x := 3;
  outParam(x);
end;

procedure TfrmLang.constParam(const x: integer);
begin
  ShowMessage(IntToStr((x)));
//x := 2;  compiler error: can not assign to
end;

procedure TfrmLang.outParam(out x: integer);
begin
  ShowMessage(IntToStr(x));
end;

end.
