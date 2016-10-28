unit Emp;

interface

uses
  frmIntfU;

type
  TEmp = class(TObject, TMyIntf)
    FName,
    LName: String;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function Tst(): string;
    constructor New(fn, ln: string);
  end;

  TDept = class(TObject, TMyIntf)
    Name: String;
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    function Tst(): string;
    constructor New(dept: string);
  end;

implementation


{ TEmp }

constructor TEmp.New(fn, ln: string);
begin
  FName := fn;
  LName := ln;
end;


function TEmp.QueryInterface(const IID: TGUID; out Obj): HResult;
begin

end;

function TEmp.Tst: string;
begin
  result := 'emp tst';
end;

function TEmp._AddRef: Integer;
begin

end;

function TEmp._Release: Integer;
begin

end;

{ TDept }

constructor TDept.New(dept: string);
begin
  Name := dept;
end;

function TDept._AddRef: Integer;
begin

end;

function TDept._Release: Integer;
begin

end;

function TDept.QueryInterface(const IID: TGUID; out Obj): HResult;
begin

end;

function TDept.Tst: string;
begin
  result := 'dept tst';
end;

end.
 