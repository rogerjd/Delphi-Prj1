unit FormCtrl;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, FrameTst;

type
  TfrmFormCtrl = class(TForm)
    BitBtn1: TBitBtn;
    btnPosition: TButton;
    btnFocus: TButton;
    Edit1: TEdit;
    btnCtrls: TButton;
    Frame11: TFrame1;
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPositionClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFocusClick(Sender: TObject);
    procedure btnCtrlsClick(Sender: TObject);
    procedure Frame11Edit1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFormCtrl: TfrmFormCtrl;

implementation

{$R *.dfm}

procedure TfrmFormCtrl.BitBtn1Click(Sender: TObject);
begin
  Close();
end;

procedure TfrmFormCtrl.btnPositionClick(Sender: TObject);
begin
  Position := poScreenCenter;
end;

procedure TfrmFormCtrl.FormCreate(Sender: TObject);
begin
  Caption := 'Form Demo';
end;

procedure TfrmFormCtrl.btnFocusClick(Sender: TObject);
begin
  Edit1.SetFocus();
end;

procedure TfrmFormCtrl.btnCtrlsClick(Sender: TObject);
var
  o: TObject;
  ctrl: TControl;
  comp: TComponent;
  wc: TWinControl;
begin
  ShowMessage(IntToStr(ControlCount));
  ShowMessage(IntToStr(ComponentCount));

  o := Controls[0];
end;

procedure TfrmFormCtrl.Frame11Edit1Click(Sender: TObject);
begin
  ShowMessage(Frame11.Edit1.Text);
end;

end.
