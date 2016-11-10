unit DateTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDateTime = class(TForm)
    BitBtn1: TBitBtn;
    btnFmt: TButton;
    procedure btnFmtClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDateTime: TfrmDateTime;

implementation

{$R *.dfm}

procedure TfrmDateTime.btnFmtClick(Sender: TObject);
var
  dt: TDateTime;
begin
	dt := StrtoDate('11/09/2016');
	ShowMessage(FormatDateTime('mm/dd/yyyy', dt));
end;

end.
