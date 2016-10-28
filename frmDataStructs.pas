unit frmDataStructs;

interface

//uses
(*

  System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections, Data.DBXDataSnap, Data.DBXCommon, IPPeerClient,
  Data.FMTBcd, Data.DB, Data.SqlExpr, Data.DBXMSSQL, Data.Win.ADODB,
  DBXpress, FMTBcd, ADODB, DB, SqlExpr, StdCtrls, Controls, Classes;
*)

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  DBXpress, FMTBcd, ADODB, DB, SqlExpr;

type
  TForm1 = class(TForm)
    btnList: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    SQLConnection1: TSQLConnection;
    SQLDataSet1: TSQLDataSet;
    SQLQuery1: TSQLQuery;
    SQLTable1: TSQLTable;
    DataSource1: TDataSource;
    ADOConnection1: TADOConnection;
    btnStrList: TButton;
    btnArray: TButton;
    BitBtn1: TBitBtn;
    Button1: TButton;
    procedure btnListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnStrListClick(Sender: TObject);
    procedure btnArrayClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    a: Integer;
  public
    { Public declarations }
  end;

  TMyArray = array [0 .. 10] of Integer;

  TMyObjArray = array [0 .. 9] of TObject;

  EnumColors = (Red, Green, Blue);
  SetHiColors = set of EnumColors;

var
  Form1: TForm1;
  MyArray: TMyArray;
  // HiColors: set of Colors = [Red]; //ok

//  dict: TDictionary<string, Integer>;  //2009
//  list: TList<Integer>;              //2009
  slTest: TStringList;

implementation

uses
  Unit2, Emp;


{$R *.dfm}

procedure BitsTst();
var
  bits: TBits;
begin
  bits := TBits.Create();
  try

  finally
    FreeAndNil(bits);
  end;
end;

procedure TstArray();
begin
  ShowMessage(IntToStr(Low(MyArray)));
  ShowMessage(IntToStr(High(MyArray)));
end;

function TstFunc(): Integer;
begin
  Result := 3;
end;

(*
procedure ListTst();
var
  n: Integer;
begin
  list := TList<Integer>.Create();
  list.AddRange([1, 2, 3]);
  n := list.IndexOf(2);
  ShowMessage(IntToStr(n));

  n := list[2];
  ShowMessage(IntToStr(n));

  n := list.IndexOf(3);
  ShowMessage(IntToStr(n));

  for n := 0 to list.Count - 1 do
  begin
    ShowMessage(IntToStr(n));
  end;

  ShowMessage(IntToStr(list.Count));
  list.Insert(1, 99);
  ShowMessage(IntToStr(list.Count));

  list.Free();
end;

procedure DictTst();
var
  n: Integer;
  b: Boolean;
begin
  dict := TDictionary<string, Integer>.Create();
  try
    dict.Add('abc', 123);
    // red: dups not allowed    dict.Add('abc', 123);

    dict.AddOrSetValue('abc', 123);

    b := dict.TryGetValue('abc', n);

    n := dict['abc'];
    // ref: exception if not found    n := dict['def'];
  finally
    dict.Free();
  end;
end;
*)


procedure TstParams(var n: Integer; out c: Integer; const z: Integer);
begin

end;

(*
procedure ArrayTst();
var
  objArray: TMyObjArray;
  DynAry: array of integer;
begin
  objArray[0] := TStringList.Create();
  TStringList(objArray[0]).Add('abc');
  objArray[0].Free();

  ShowMessage(IntToStr(Length(DynAry)));
end;
*)

procedure UnitFuncTst();
var
  n: Integer;
begin
  n := MyFunction();
  ShowMessage(IntToStr(n));
  ShowMessage(IntToStr(Unit2.MyFunction()));
end;

procedure TForm1.btnListClick(Sender: TObject);
var
  i: Integer;
  b: Boolean;
  l: TList;
begin
  ShowMessage('List');

  l := TList.Create();
  try
    ShowMessage(IntToStr(l.Count));
    l.Add(TEmp.New('Joe', 'Smith'));
    ShowMessage(IntToStr(l.Count));
    ShowMessage(TEmp(l[0]).FName);
//    l.Error();
  finally
    TEmp(l[0]).Free();
    l.Free();
  end;


(*
  TstArray();

  MyArray[0] := 1;
  MyArray[1] := 2;

  b := True;
  while b do
  begin
    b := False;
  end;

  repeat

  until (True);

  for i in MyArray do
  begin
    // ShowMessage(IntToStr(i));
  end;

  for i := 0 to High(MyArray) do
  begin
    // ShowMessage(IntToStr(i));
  end;

  ListTst();
  ArrayTst();
  DictTst();
  UnitFuncTst();
*)  
end;

procedure StrList();
begin
  slTest.Create();
  try
    slTest.IndexOf('a');
  finally
    slTest.Free();
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
(*
  ADOConnection1.ConnectionString := 'Data Source=(localdb)\MSSQLLocalDB;AttachDbFilename="C:\Users\roger\Documents\Visual Studio 2015\Projects\PayRoll\PayRoll\App_Data\PRContext.mdf";Initial Catalog=PRContext;Integrated Security=True;MultipleActiveResultSets=True';
  ADOConnection1.Open();
  ADOConnection1.Close();
*)
end;

procedure TForm1.btnStrListClick(Sender: TObject);
var
  sl: TStringList;
begin
  ShowMessage('string list');

  sl := TStringList.Create();
  try
    sl.LoadFromFile('test.txt');
    ShowMessage(IntToStr(sl.Count));
  finally
    sl.Free;
  end;

end;

procedure TForm1.btnArrayClick(Sender: TObject);
var
  ary1: array[0..9] of integer;
  ary2: array of boolean;
  objArray: TMyObjArray;
  DynAry: array of integer;
begin
  ShowMessage('array');
  objArray[0] := TStringList.Create();
  TStringList(objArray[0]).Add('abc');
  objArray[0].Free();

  ShowMessage(IntToStr(Length(DynAry)));
  //  DynAry[0] := 1;  must set len
  SetLength(DynAry, 10);
  DynAry[0] := 1;
  ShowMessage(IntToStr(Length(DynAry)));
  ShowMessage(IntToStr(DynAry[0]));
end;


procedure TForm1.Button1Click(Sender: TObject);

(*
  procedure Reverse();
  var
    s, s2: string;
    i: integer;
  begin
    s := 'abc';
    s2 := '';
    for i := 1 to Length(s) do
    begin
      s2 := s[i] + s2;
    end;
    ShowMessage(s + ' reversed is ' + s2);

    s2 := '';
    for i := length(s) downto 1 do
    begin
      s2 := s2 + s[i];
    end;
    ShowMessage(s + ' reversed is ' + s2);
  end;
*)

  //always use the available Result variable, (if possible), much faster
  function Reverse(s: string): string;
  var
    i: Integer;
  begin
    Result := '';
    for i := 1 to Length(s) do
    begin
      Result := s[i] + Result;
    end;
    ShowMessage(s + ' reversed is ' + Result);

    Result := '';
    for i := length(s) downto 1 do
    begin
      Result := Result + s[i];
    end;
    ShowMessage(s + ' reversed is ' + Result);
  end;

begin
// index 1 to length
//  ShowMessage(s[0]);  index 0 is not allowed (use SetLength, Length)

  ShowMessage(Reverse('abc'));

end;

end.
