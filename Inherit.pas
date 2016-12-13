unit Inherit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TfrmInherit = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmInherit: TfrmInherit;

implementation

type
  TPoint = class
  private
    x, y: integer;
  public
  	constructor Create(x, y: Integer);
    procedure Draw(); virtual;
  end;

  TSquare = class(TPoint)
  	constructor Create(x, y: Integer);
  end;

  TCircle = class(TPoint)
  	constructor Create(x, y: Integer);
  end;

{$R *.dfm}

{ TPoint }

constructor TPoint.Create(x, y: Integer);
begin

end;

procedure TPoint.Draw;
begin
  ShowMessage('POINT');
end;

{ TSquare }

constructor TSquare.Create(x, y: Integer);
begin
  inherited Create(x, y); 
end;

{ TCircle }

constructor TCircle.Create(x, y: Integer);
begin
  inherited Create(x, y);
end;

end.
