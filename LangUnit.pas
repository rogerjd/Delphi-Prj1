unit LangUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmLang = class(TForm)
  private
    { Private declarations }
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

end.
