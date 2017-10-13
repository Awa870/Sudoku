unit SudokuPhoneLib;

interface

// More comment added
// Oh my god more changes!
// HAHAHAHA
// hahaha
uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, Math;

type

  tvalue = record
    possible: array of integer;
    answer: integer;
    count: integer;
    test_index: integer;
    skip: boolean;
    x: integer;
    y: integer;
    current: integer;

  end;

  Ttest = array [0 .. 8] of tvalue;
  AoA = array [0 .. 8] of Ttest;

function StrConvert(var sudoku: AoA; var box: tvalue; var val: TButton)
  : integer;
function StrConvertc(var val: TButton): integer;
function IntConvert(box: integer): string;
function sudokuSolver(var sudoku: AoA; y: integer; x: integer): boolean;
function appearOnce(var sudoku: AoA; location: integer; ArrType: integer;
  iteration: integer): boolean;
function backtracking(var sudoku: AoA): boolean;

var
  dupCounter: integer = 0;
  faultCounter: integer = 0;
  isExist, validated: boolean;

implementation

procedure prevbox(var y: integer; var x: integer);
begin
  x := x - 1;
  if (x = -1) then
  begin
    x := 8;
    y := y - 1;
  end;
end;

procedure nextbox(var y: integer; var x: integer);
begin
  x := x + 1;
  if (x = 9) then
  begin
    x := 0;
    y := y + 1;
  end;
end;

function StrConvertc(var val: TButton): integer;
begin
  if (val.text = '') or (val.text = '0') then
    result := 0
  else
    result := strtoint(val.text);

end;

procedure arrayGen(var sudoku: AoA; var row: array of tvalue;
  var column: array of tvalue; var region: array of tvalue; y: integer;
  x: integer);
var
  i: integer;
begin
  for i := 0 to 8 do
  begin
    row[i] := sudoku[y][i];
    column[i] := sudoku[i][x];
  end;
  region[0] := sudoku[(y - (y mod 3))][(x - (x mod 3))];
  region[1] := sudoku[(y - (y mod 3))][(x + 1 - (x mod 3))];
  region[2] := sudoku[(y - (y mod 3))][(x + 2 - (x mod 3))];
  region[3] := sudoku[(y + 1 - (y mod 3))][(x - (x mod 3))];
  region[4] := sudoku[(y + 1 - (y mod 3))][(x + 1 - (x mod 3))];
  region[5] := sudoku[(y + 1 - (y mod 3))][(x + 2 - (x mod 3))];
  region[6] := sudoku[(y + 2 - (y mod 3))][(x - (x mod 3))];
  region[7] := sudoku[(y + 2 - (y mod 3))][(x + 1 - (x mod 3))];
  region[8] := sudoku[(y + 2 - (y mod 3))][(x + 2 - (x mod 3))];
end;

function check(arr1: array of tvalue; arr2: array of tvalue;
  arr3: array of tvalue; testing: integer): boolean;
var
  i: integer;
begin
  result := true;
  for i := 0 to length(arr1) - 1 do
  begin
    if (arr1[i].answer = testing) or (arr2[i].answer = testing) or
      (arr3[i].answer = testing) then
    begin
      result := false;
      break;
    end;
  end;
end;

function backtracking(var sudoku: AoA): boolean;
var
  y, x: integer;
  row, column, region: array [0 .. 8] of tvalue;
  allow: boolean;
begin
  y := 0;
  x := 0;
  result := true;

  while (y < 9) and (y >= 0) do
  begin

    while (sudoku[y][x].skip) do
    begin
      if (y < 9) then
        nextbox(y, x)
      else
        break;
    end;

    if (y >= 9) then
      break;
    arrayGen(sudoku, row, column, region, y, x);
    repeat
      if (sudoku[y][x].test_index < 0) then
      begin
        sudoku[y][x].test_index := sudoku[y][x].count - 1;
        sudoku[y][x].answer := 0;
        repeat
          prevbox(y, x)
        until (not sudoku[y][x].skip);

        sudoku[y][x].test_index := sudoku[y][x].test_index - 1;

        break;
      end;

      allow := check(row, column, region,
        sudoku[y][x].possible[sudoku[y][x].test_index]);

      if (not allow) then
      begin
        sudoku[y][x].test_index := sudoku[y][x].test_index - 1;
      end

      else
      begin
        sudoku[y][x].answer := sudoku[y][x].possible[sudoku[y][x].test_index];
        repeat
          nextbox(y, x)
        until (not sudoku[y][x].skip);
      end;

    until (allow);

  end;

  if y < 0 then
    result := false;

end;

function inside(testee: integer; tester: array of integer): integer;
var
  i: integer;
begin
  result := -1;
  for i := 0 to high(tester) do
    if testee = tester[i] then
    begin
      result := i;
      break;
    end;
end;

function appearOnce(var sudoku: AoA; location: integer; ArrType: integer;
  iteration: integer): boolean;
var
  i, j, k, test, count: integer;
  x, y: integer;
  arr: array [0 .. 8] of tvalue;
  arr2: array [0 .. 8] of integer;
  found: boolean;
begin

  result := false;
  if ArrType = 1 then // create row
  begin
    for i := 0 to 8 do
    begin
      arr[i] := sudoku[location][i];
      if (iteration = 73) then
        arr2[i] := sudoku[location][i].answer;
    end;

  end
  else if ArrType = 2 then // create column
  begin
    for i := 0 to 8 do
    begin
      arr[i] := sudoku[i][location];
      if (iteration = 73) then
        arr2[i] := sudoku[i][location].answer;
    end;
  end
  else if ArrType = 3 then // create region
  begin
    k := 0;
    for i := floor(location / 10) to floor(location / 10) + 2 do
    begin
      for j := (location mod 10) to (location mod 10) + 2 do
      begin

        begin
          arr[k] := sudoku[i][j];
          k := k + 1;
        end;
      end;
    end;
    if (iteration = 73) then
    begin
      k := 0;
      for i := floor(location / 10) to floor(location / 10) + 2 do
      begin
        for j := (location mod 10) to (location mod 10) + 2 do
        begin

          begin
            arr2[k] := sudoku[i][j].answer;
            k := k + 1;
          end;
        end;
      end;
    end;
  end;

  for test := 1 to 9 do
  begin

    count := 0;
    for i := 0 to high(arr) do
    // loop through the array to count number of current test value
    begin
      if inside(test, arr[i].possible) >= 0 then
      begin
        count := count + 1;
        if count = 1 then
        begin
          x := arr[i].x;
          y := arr[i].y;
          // aquiring location of the target value
        end;
      end;

      if count > 1 then // to save time, break loop when count larger than 1
        break;

    end;
    if (count = 1) and (not sudoku[y][x].skip) then
    begin
      sudoku[y][x].answer := test;
      sudoku[y][x].skip := true;
      result := true;
    end;

  end;

  if (iteration = 73) then
  begin
    isExist := true;

    for test := 1 to 9 do
    begin
      found := false;

      if inside(test, arr2) >= 0 then
      begin
        found := true;
        continue;
      end;

      for i := 0 to high(arr) do
        if inside(test, arr[i].possible) >= 0 then
        begin
          found := true;
          continue;
        end;

      if found = false then
      begin
        isExist := false;
        break;
      end;
    end;

  end;
end;

function findpossible(var box: tvalue; arr1: array of tvalue;
  arr2: array of tvalue; arr3: array of tvalue): boolean;
var
  testing: integer;
begin
  result := false;
  for testing := 1 to 9 do
  begin

    if (check(arr1, arr2, arr3, testing)) then
    begin
      box.count := box.count + 1;
      setlength(box.possible, box.count);
      box.possible[box.count - 1] := testing;
    end;

  end;
  if box.count = 1 then
  begin
    box.answer := box.possible[0];
    box.skip := true;
    result := true;
  end;
end;

function StrConvert(var sudoku: AoA; var box: tvalue; var val: TButton)
  : integer;
var
  row, column, region: array [0 .. 8] of tvalue;
  temp: integer;
begin
  if (val.text = '') or (val.text = '0') then
    temp := 0
  else
    temp := strtoint(val.text);

  arrayGen(sudoku, row, column, region, box.y, box.x);
  if temp > 0 then
  begin
    if check(row, column, region, temp) then
    begin
      result := temp;
      box.skip := true;
    end
    else
    begin
      result := 0;
      dupCounter := dupCounter + 1;
      val.FontColor := TAlphacolorRec.Black;
      val.text := IntConvert(0);
    end;
  end

  else
    result := 0;

end;

function IntConvert(box: integer): string;
begin
  if box = 0 then
    result := ''

  else
    result := inttostr(box);

end;

function sudokuSolver(var sudoku: AoA; y: integer; x: integer): boolean;
var
  row, column, region: array [0 .. 8] of tvalue;
begin
  arrayGen(sudoku, row, column, region, y, x);
  findpossible(sudoku[y][x], row, column, region);
end;

end.
