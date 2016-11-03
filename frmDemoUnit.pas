unit frmDemoUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TfrmDemo = class(TForm)
    BitBtn1: TBitBtn;
    btnPosition: TButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDemo: TfrmDemo;

implementation

{$R *.dfm}

procedure TfrmDemo.BitBtn1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmDemo.btnPositionClick(Sender: TObject);
begin
  Position := poScreenCenter;
end;

procedure TfrmDemo.FormCreate(Sender: TObject);
begin
  Caption := 'Form Demo';
end;

end.
