unit EmpPersonal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, Buttons, Mask;

type
  TfrmEmpPers = class(TForm)
    DBText1: TDBText;
    Button1: TButton;
    btnClose: TBitBtn;
    DBEdit1: TDBEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmpPers: TfrmEmpPers;

implementation

uses
  DataMod;

{$R *.dfm}

procedure TfrmEmpPers.Button1Click(Sender: TObject);
begin
  dmMain.cdsEmps.Edit();
  dmMain.cdsEmps.FieldByName('FirstName').Value := 'tst edit';
  dmMain.cdsEmps.Post();
end;

end.
