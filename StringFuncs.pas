unit StringFuncs;

(*
  funcs that return a string and other string like ops
*)

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmStrFuncs = class(TForm)
    BitBtn1: TBitBtn;
    btnFmt: TButton;
    procedure btnFmtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmStrFuncs: TfrmStrFuncs;

implementation

{$R *.dfm}

procedure TfrmStrFuncs.btnFmtClick(Sender: TObject);
var
  dt: TDateTime;
begin
	dt := StrtoDate('11/09/2016');
	ShowMessage(FormatDateTime('mm/dd/yyyy', dt));
end;

end.
