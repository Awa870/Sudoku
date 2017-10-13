unit SudokuPhone;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, System.UIConsts,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, SudokuPhoneLib, FMX.Menus,
  FMX.ImgList,FMX.Colors, System.ImageList;

type
  TForm1 = class(TForm)
    Box30: TButton;
    Box31: TButton;
    Box32: TButton;
    Box33: TButton;
    Box34: TButton;
    Box35: TButton;
    Box36: TButton;
    Box37: TButton;
    Box38: TButton;
    Box40: TButton;
    Box41: TButton;
    Box42: TButton;
    Box43: TButton;
    Box44: TButton;
    Box45: TButton;
    Box47: TButton;
    Box46: TButton;
    Box48: TButton;
    Box50: TButton;
    Box51: TButton;
    Box52: TButton;
    Box53: TButton;
    Box54: TButton;
    Box55: TButton;
    Box57: TButton;
    Box56: TButton;
    Box58: TButton;
    Box60: TButton;
    Box61: TButton;
    Box62: TButton;
    Box63: TButton;
    Box64: TButton;
    Box65: TButton;
    Box67: TButton;
    Box66: TButton;
    Box68: TButton;
    Box70: TButton;
    Box71: TButton;
    Box72: TButton;
    Box73: TButton;
    Box74: TButton;
    Box75: TButton;
    Box77: TButton;
    Box76: TButton;
    Box78: TButton;
    Box80: TButton;
    Box81: TButton;
    Box82: TButton;
    Box83: TButton;
    Box84: TButton;
    Box85: TButton;
    Box87: TButton;
    Box86: TButton;
    Box88: TButton;
    Box20: TButton;
    Box21: TButton;
    Box22: TButton;
    Box23: TButton;
    Box24: TButton;
    Box25: TButton;
    Box27: TButton;
    Box26: TButton;
    Box28: TButton;
    Box10: TButton;
    Box11: TButton;
    Box12: TButton;
    Box13: TButton;
    Box14: TButton;
    Box15: TButton;
    Box17: TButton;
    Box16: TButton;
    Box18: TButton;
    Box00: TButton;
    Box01: TButton;
    Box02: TButton;
    Box03: TButton;
    Box04: TButton;
    Box05: TButton;
    Box07: TButton;
    Box06: TButton;
    Box08: TButton;
    Panel1: TPanel;
    StyleBook1: TStyleBook;
    Solve_Button: TButton;
    Clear_Button: TButton;
    Check_Button: TButton;
    Set_Button: TButton;
    Selection1: TButton;
    Selection2: TButton;
    Selection3: TButton;
    Selection4: TButton;
    Selection5: TButton;
    Selection6: TButton;
    Selection7: TButton;
    Selection8: TButton;
    Selection9: TButton;
    ClosePanel: TPanel;
    ImageList1: TImageList;
    Glyph1: TGlyph;
    Glyph2: TGlyph;
    procedure BoxClick(Sender: TObject);
    procedure SelectionClick(Sender: TObject);
    procedure BoxHold(Sender: TObject; const EventInfo: TGestureEventInfo;
      var Handled: Boolean);
    procedure Check_ButtonClick(Sender: TObject);
    procedure Clear_ButtonClick(Sender: TObject);
    procedure ClosePanelClick(Sender: TObject);
    procedure Set_ButtonClick(Sender: TObject);
    procedure Solve_ButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  sudoku: AoA;
  input: integer;
  Form1: TForm1;
  modify: Boolean = true;
  setty, checky, cleary, solvy: Boolean;
  colorCtrl: Boolean = true;
  BoxName, beforeHold: string;

implementation

{$R *.fmx}

procedure TForm1.BoxHold(Sender: TObject; const EventInfo: TGestureEventInfo;
  var Handled: Boolean);
begin
  if (modify) and not(TButton(Sender).textsettings.FontColor = TAlphacolorRec.BurlyWood) then
  begin
    if (colorCtrl) then
      TButton(Sender).textsettings.FontColor := TAlphacolorRec.Wheat
    else
      TButton(Sender).textsettings.FontColor := TAlphacolorRec.Black;
    BoxName := TButton(Sender).name;
    beforeHold := TButton(Sender).Text;
    TButton(Sender).Text := ' ';
    setty := Set_Button.Enabled;
    checky := Check_Button.Enabled;
    solvy := Solve_Button.Enabled;
    cleary := Clear_Button.Enabled;
    Set_Button.Enabled := false;
    Check_Button.Enabled := false;
    Solve_Button.Enabled := false;
    Clear_Button.Enabled := false;
    Selection1.Visible := true;
    Selection2.Visible := true;
    Selection3.Visible := true;
    Selection4.Visible := true;
    Selection5.Visible := true;
    Selection6.Visible := true;
    Selection7.Visible := true;
    Selection8.Visible := true;
    Selection9.Visible := true;
    ClosePanel.Visible := true;
  end;
end;

procedure TForm1.ClosePanelClick(Sender: TObject);
var i : integer;
begin

 for i := 0 to ComponentCount - 1 do
    if Components[i].name = BoxName then
    begin
      TButton(Components[i]).Text := beforeHold;
    end;

  Selection1.Visible := false;
  Selection2.Visible := false;
  Selection3.Visible := false;
  Selection4.Visible := false;
  Selection5.Visible := false;
  Selection6.Visible := false;
  Selection7.Visible := false;
  Selection8.Visible := false;
  Selection9.Visible := false;
  ClosePanel.Visible := false;
  Set_Button.Enabled := setty;
  Check_Button.Enabled := checky;
  Solve_Button.Enabled := solvy;
  Clear_Button.Enabled := cleary;

end;

procedure TForm1.SelectionClick(Sender: TObject);
var
  i:integer;
begin

  for i := 0 to ComponentCount - 1 do
    if Components[i].name = BoxName then
    begin
      TButton(Components[i]).Text := TButton(Sender).Text;
    end;

  ClosePanel.Visible := false;
  Selection1.Visible := false;
  Selection2.Visible := false;
  Selection3.Visible := false;
  Selection4.Visible := false;
  Selection5.Visible := false;
  Selection6.Visible := false;
  Selection7.Visible := false;
  Selection8.Visible := false;
  Selection9.Visible := false;
  Set_Button.Enabled := setty;
  Check_Button.Enabled := checky;
  Solve_Button.Enabled := solvy;
  Clear_Button.Enabled := cleary;

end;

procedure TForm1.BoxClick(Sender: TObject);
var
  tempint: integer;
  tempstr: string;
begin
  if (modify) and not(TButton(Sender).textsettings.FontColor = TAlphacolorRec.BurlyWood) then
  begin
    if (colorCtrl) then
      TButton(Sender).textsettings.FontColor := TAlphacolorRec.Wheat
    else
      TButton(Sender).textsettings.FontColor := TAlphacolorRec.Black;

    if not(TButton(Sender).Text = ' ') then
    begin
      if (TButton(Sender).Text = '') or (TButton(Sender).Text = '0') then
        tempint := 0
      else
        tempint := strtoint(TButton(Sender).Text);

      if not(TButton(Sender).FontColor = TAlphacolorRec.Bisque) then
        tempint := tempint + 1;

      if tempint = 10 then
      begin
        tempstr := '';
        TButton(Sender).textsettings.FontColor := TAlphacolorRec.Black;
      end
      else
        tempstr := inttostr(tempint);

      TButton(Sender).Text := tempstr;
    end;
  end;
end;

procedure TForm1.Check_ButtonClick(Sender: TObject);
var
  i, j: integer;
begin
  sudoku[0][0].current := StrConvertc(Box00);
  sudoku[0][1].current := StrConvertc(Box01);
  sudoku[0][2].current := StrConvertc(Box02);
  sudoku[0][3].current := StrConvertc(Box03);
  sudoku[0][4].current := StrConvertc(Box04);
  sudoku[0][5].current := StrConvertc(Box05);
  sudoku[0][6].current := StrConvertc(Box06);
  sudoku[0][7].current := StrConvertc(Box07);
  sudoku[0][8].current := StrConvertc(Box08);

  sudoku[1][0].current := StrConvertc(Box10);
  sudoku[1][1].current := StrConvertc(Box11);
  sudoku[1][2].current := StrConvertc(Box12);
  sudoku[1][3].current := StrConvertc(Box13);
  sudoku[1][4].current := StrConvertc(Box14);
  sudoku[1][5].current := StrConvertc(Box15);
  sudoku[1][6].current := StrConvertc(Box16);
  sudoku[1][7].current := StrConvertc(Box17);
  sudoku[1][8].current := StrConvertc(Box18);

  sudoku[2][0].current := StrConvertc(Box20);
  sudoku[2][1].current := StrConvertc(Box21);
  sudoku[2][2].current := StrConvertc(Box22);
  sudoku[2][3].current := StrConvertc(Box23);
  sudoku[2][4].current := StrConvertc(Box24);
  sudoku[2][5].current := StrConvertc(Box25);
  sudoku[2][6].current := StrConvertc(Box26);
  sudoku[2][7].current := StrConvertc(Box27);
  sudoku[2][8].current := StrConvertc(Box28);

  sudoku[3][0].current := StrConvertc(Box30);
  sudoku[3][1].current := StrConvertc(Box31);
  sudoku[3][2].current := StrConvertc(Box32);
  sudoku[3][3].current := StrConvertc(Box33);
  sudoku[3][4].current := StrConvertc(Box34);
  sudoku[3][5].current := StrConvertc(Box35);
  sudoku[3][6].current := StrConvertc(Box36);
  sudoku[3][7].current := StrConvertc(Box37);
  sudoku[3][8].current := StrConvertc(Box38);

  sudoku[4][0].current := StrConvertc(Box40);
  sudoku[4][1].current := StrConvertc(Box41);
  sudoku[4][2].current := StrConvertc(Box42);
  sudoku[4][3].current := StrConvertc(Box43);
  sudoku[4][4].current := StrConvertc(Box44);
  sudoku[4][5].current := StrConvertc(Box45);
  sudoku[4][6].current := StrConvertc(Box46);
  sudoku[4][7].current := StrConvertc(Box47);
  sudoku[4][8].current := StrConvertc(Box48);

  sudoku[5][0].current := StrConvertc(Box50);
  sudoku[5][1].current := StrConvertc(Box51);
  sudoku[5][2].current := StrConvertc(Box52);
  sudoku[5][3].current := StrConvertc(Box53);
  sudoku[5][4].current := StrConvertc(Box54);
  sudoku[5][5].current := StrConvertc(Box55);
  sudoku[5][6].current := StrConvertc(Box56);
  sudoku[5][7].current := StrConvertc(Box57);
  sudoku[5][8].current := StrConvertc(Box58);

  sudoku[6][0].current := StrConvertc(Box60);
  sudoku[6][1].current := StrConvertc(Box61);
  sudoku[6][2].current := StrConvertc(Box62);
  sudoku[6][3].current := StrConvertc(Box63);
  sudoku[6][4].current := StrConvertc(Box64);
  sudoku[6][5].current := StrConvertc(Box65);
  sudoku[6][6].current := StrConvertc(Box66);
  sudoku[6][7].current := StrConvertc(Box67);
  sudoku[6][8].current := StrConvertc(Box68);

  sudoku[7][0].current := StrConvertc(Box70);
  sudoku[7][1].current := StrConvertc(Box71);
  sudoku[7][2].current := StrConvertc(Box72);
  sudoku[7][3].current := StrConvertc(Box73);
  sudoku[7][4].current := StrConvertc(Box74);
  sudoku[7][5].current := StrConvertc(Box75);
  sudoku[7][6].current := StrConvertc(Box76);
  sudoku[7][7].current := StrConvertc(Box77);
  sudoku[7][8].current := StrConvertc(Box78);

  sudoku[8][0].current := StrConvertc(Box80);
  sudoku[8][1].current := StrConvertc(Box81);
  sudoku[8][2].current := StrConvertc(Box82);
  sudoku[8][3].current := StrConvertc(Box83);
  sudoku[8][4].current := StrConvertc(Box84);
  sudoku[8][5].current := StrConvertc(Box85);
  sudoku[8][6].current := StrConvertc(Box86);
  sudoku[8][7].current := StrConvertc(Box87);
  sudoku[8][8].current := StrConvertc(Box88);
  faultCounter := 0;
  for i := 0 to 8 do
    for j := 0 to 8 do
    begin
      if not sudoku[i][j].skip then
      begin
        if sudoku[i][j].current = 0 then
          faultCounter := 82
        else if sudoku[i][j].current <> sudoku[i][j].answer then
          faultCounter := faultCounter + 1;

      end;
    end;

  if faultCounter > 81 then
    showmessage('Your Puzzle is not complete.')
  else if faultCounter > 0 then
    showmessage('Your answer is not correct.')
  else if faultCounter = 0 then
  begin
    showmessage('Congratulations! This is a correct solution!');
    Solve_Button.Enabled := false;
    Solve_Button.Text := 'Solved.';
    Check_Button.Enabled := false;
    Check_Button.Text := 'Checked.';
    modify := false;
  end;

end;

procedure TForm1.Clear_ButtonClick(Sender: TObject);
var
  iRow, iColumn, i: integer;
begin
  Set_Button.Enabled := true;
  Set_Button.Text := 'Set Puzzle';
  Solve_Button.Enabled := false;
  Solve_Button.Text := 'Solve!';
  Check_Button.Enabled := false;
  Check_Button.Text := 'Check!';
  modify := true;
  colorCtrl := true;

  for iRow := 0 to 8 do
  begin
    for iColumn := 0 to 8 do
    begin
      sudoku[iRow][iColumn].answer := 0;
      sudoku[iRow][iColumn].skip := false;
      setlength(sudoku[iRow][iColumn].possible, 0);
      sudoku[iRow][iColumn].count := 0;
      sudoku[iRow][iColumn].current := 0;
    end;
  end;

  for i := 0 to ComponentCount - 1 do
    if Components[i] is TButton then
    begin
      TButton(Components[i]).FontColor := TAlphacolorRec.Black;
      TButton(Components[i]).Text := '';
    end;
  Solve_Button.Text := 'Solve!';
  Clear_Button.Text := 'Clear';
  Set_Button.Text := 'Set Puzzle';
  Check_Button.Text := 'Check!';
  Solve_Button.textsettings.FontColor := TAlphacolorRec.Tan;
  Clear_Button.textsettings.FontColor := TAlphacolorRec.Tan;
  Set_Button.textsettings.FontColor := TAlphacolorRec.Tan;
  Check_Button.textsettings.FontColor := TAlphacolorRec.Tan;
  Selection1.Text := '1';
  Selection2.Text := '2';
  Selection3.Text := '3';
  Selection4.Text := '4';
  Selection5.Text := '5';
  Selection6.Text := '6';
  Selection7.Text := '7';
  Selection8.Text := '8';
  Selection9.Text := '9';

end;

procedure TForm1.Set_ButtonClick(Sender: TObject);
var
  i, l, iRow, iColumn: integer;
begin
  TButton(Sender).Enabled := false;
  for i := 0 to ComponentCount - 1 do
    if (Components[i] is TButton) and
      (TButton(Components[i]).TextSettings.FontColor = TAlphacolorRec.Wheat) then
      TButton(Components[i]).TextSettings.FontColor := TAlphacolorRec.BurlyWood;

  begin
    for iRow := 0 to 8 do
      for iColumn := 0 to 8 do
      begin
        sudoku[iRow][iColumn].answer := 0;
        sudoku[iRow][iColumn].skip := false;
        setlength(sudoku[iRow][iColumn].possible, 0);
        sudoku[iRow][iColumn].count := 0;
        sudoku[iRow][iColumn].y := iRow;
        sudoku[iRow][iColumn].x := iColumn;
        sudoku[iRow][iColumn].current := 0;
      end;
  end;

  sudoku[0][0].answer := StrConvert(sudoku, sudoku[0][0], Box00);
  sudoku[0][1].answer := StrConvert(sudoku, sudoku[0][1], Box01);
  sudoku[0][2].answer := StrConvert(sudoku, sudoku[0][2], Box02);
  sudoku[0][3].answer := StrConvert(sudoku, sudoku[0][3], Box03);
  sudoku[0][4].answer := StrConvert(sudoku, sudoku[0][4], Box04);
  sudoku[0][5].answer := StrConvert(sudoku, sudoku[0][5], Box05);
  sudoku[0][6].answer := StrConvert(sudoku, sudoku[0][6], Box06);
  sudoku[0][7].answer := StrConvert(sudoku, sudoku[0][7], Box07);
  sudoku[0][8].answer := StrConvert(sudoku, sudoku[0][8], Box08);

  sudoku[1][0].answer := StrConvert(sudoku, sudoku[1][0], Box10);
  sudoku[1][1].answer := StrConvert(sudoku, sudoku[1][1], Box11);
  sudoku[1][2].answer := StrConvert(sudoku, sudoku[1][2], Box12);
  sudoku[1][3].answer := StrConvert(sudoku, sudoku[1][3], Box13);
  sudoku[1][4].answer := StrConvert(sudoku, sudoku[1][4], Box14);
  sudoku[1][5].answer := StrConvert(sudoku, sudoku[1][5], Box15);
  sudoku[1][6].answer := StrConvert(sudoku, sudoku[1][6], Box16);
  sudoku[1][7].answer := StrConvert(sudoku, sudoku[1][7], Box17);
  sudoku[1][8].answer := StrConvert(sudoku, sudoku[1][8], Box18);

  sudoku[2][0].answer := StrConvert(sudoku, sudoku[2][0], Box20);
  sudoku[2][1].answer := StrConvert(sudoku, sudoku[2][1], Box21);
  sudoku[2][2].answer := StrConvert(sudoku, sudoku[2][2], Box22);
  sudoku[2][3].answer := StrConvert(sudoku, sudoku[2][3], Box23);
  sudoku[2][4].answer := StrConvert(sudoku, sudoku[2][4], Box24);
  sudoku[2][5].answer := StrConvert(sudoku, sudoku[2][5], Box25);
  sudoku[2][6].answer := StrConvert(sudoku, sudoku[2][6], Box26);
  sudoku[2][7].answer := StrConvert(sudoku, sudoku[2][7], Box27);
  sudoku[2][8].answer := StrConvert(sudoku, sudoku[2][8], Box28);

  sudoku[3][0].answer := StrConvert(sudoku, sudoku[3][0], Box30);
  sudoku[3][1].answer := StrConvert(sudoku, sudoku[3][1], Box31);
  sudoku[3][2].answer := StrConvert(sudoku, sudoku[3][2], Box32);
  sudoku[3][3].answer := StrConvert(sudoku, sudoku[3][3], Box33);
  sudoku[3][4].answer := StrConvert(sudoku, sudoku[3][4], Box34);
  sudoku[3][5].answer := StrConvert(sudoku, sudoku[3][5], Box35);
  sudoku[3][6].answer := StrConvert(sudoku, sudoku[3][6], Box36);
  sudoku[3][7].answer := StrConvert(sudoku, sudoku[3][7], Box37);
  sudoku[3][8].answer := StrConvert(sudoku, sudoku[3][8], Box38);

  sudoku[4][0].answer := StrConvert(sudoku, sudoku[4][0], Box40);
  sudoku[4][1].answer := StrConvert(sudoku, sudoku[4][1], Box41);
  sudoku[4][2].answer := StrConvert(sudoku, sudoku[4][2], Box42);
  sudoku[4][3].answer := StrConvert(sudoku, sudoku[4][3], Box43);
  sudoku[4][4].answer := StrConvert(sudoku, sudoku[4][4], Box44);
  sudoku[4][5].answer := StrConvert(sudoku, sudoku[4][5], Box45);
  sudoku[4][6].answer := StrConvert(sudoku, sudoku[4][6], Box46);
  sudoku[4][7].answer := StrConvert(sudoku, sudoku[4][7], Box47);
  sudoku[4][8].answer := StrConvert(sudoku, sudoku[4][8], Box48);

  sudoku[5][0].answer := StrConvert(sudoku, sudoku[5][0], Box50);
  sudoku[5][1].answer := StrConvert(sudoku, sudoku[5][1], Box51);
  sudoku[5][2].answer := StrConvert(sudoku, sudoku[5][2], Box52);
  sudoku[5][3].answer := StrConvert(sudoku, sudoku[5][3], Box53);
  sudoku[5][4].answer := StrConvert(sudoku, sudoku[5][4], Box54);
  sudoku[5][5].answer := StrConvert(sudoku, sudoku[5][5], Box55);
  sudoku[5][6].answer := StrConvert(sudoku, sudoku[5][6], Box56);
  sudoku[5][7].answer := StrConvert(sudoku, sudoku[5][7], Box57);
  sudoku[5][8].answer := StrConvert(sudoku, sudoku[5][8], Box58);

  sudoku[6][0].answer := StrConvert(sudoku, sudoku[6][0], Box60);
  sudoku[6][1].answer := StrConvert(sudoku, sudoku[6][1], Box61);
  sudoku[6][2].answer := StrConvert(sudoku, sudoku[6][2], Box62);
  sudoku[6][3].answer := StrConvert(sudoku, sudoku[6][3], Box63);
  sudoku[6][4].answer := StrConvert(sudoku, sudoku[6][4], Box64);
  sudoku[6][5].answer := StrConvert(sudoku, sudoku[6][5], Box65);
  sudoku[6][6].answer := StrConvert(sudoku, sudoku[6][6], Box66);
  sudoku[6][7].answer := StrConvert(sudoku, sudoku[6][7], Box67);
  sudoku[6][8].answer := StrConvert(sudoku, sudoku[6][8], Box68);

  sudoku[7][0].answer := StrConvert(sudoku, sudoku[7][0], Box70);
  sudoku[7][1].answer := StrConvert(sudoku, sudoku[7][1], Box71);
  sudoku[7][2].answer := StrConvert(sudoku, sudoku[7][2], Box72);
  sudoku[7][3].answer := StrConvert(sudoku, sudoku[7][3], Box73);
  sudoku[7][4].answer := StrConvert(sudoku, sudoku[7][4], Box74);
  sudoku[7][5].answer := StrConvert(sudoku, sudoku[7][5], Box75);
  sudoku[7][6].answer := StrConvert(sudoku, sudoku[7][6], Box76);
  sudoku[7][7].answer := StrConvert(sudoku, sudoku[7][7], Box77);
  sudoku[7][8].answer := StrConvert(sudoku, sudoku[7][8], Box78);

  sudoku[8][0].answer := StrConvert(sudoku, sudoku[8][0], Box80);
  sudoku[8][1].answer := StrConvert(sudoku, sudoku[8][1], Box81);
  sudoku[8][2].answer := StrConvert(sudoku, sudoku[8][2], Box82);
  sudoku[8][3].answer := StrConvert(sudoku, sudoku[8][3], Box83);
  sudoku[8][4].answer := StrConvert(sudoku, sudoku[8][4], Box84);
  sudoku[8][5].answer := StrConvert(sudoku, sudoku[8][5], Box85);
  sudoku[8][6].answer := StrConvert(sudoku, sudoku[8][6], Box86);
  sudoku[8][7].answer := StrConvert(sudoku, sudoku[8][7], Box87);
  sudoku[8][8].answer := StrConvert(sudoku, sudoku[8][8], Box88);

  if (dupcounter > 0) then
  begin
    if dupcounter = 1 then
      showmessage('1 duplicated input is removed automatically.')
    else
      showmessage(inttostr(dupcounter) +
        ' duplicated inputs are removed automatically.');
  end;

  dupcounter := 0;

  for l := 0 to 73 do
  begin
    for iRow := 0 to 8 do
    begin
      for iColumn := 0 to 8 do
      begin
      setlength(sudoku[iRow][iColumn].possible, 0);
        if not sudoku[iRow][iColumn].skip then
        begin
          sudoku[iRow][iColumn].count := 0;


          sudokuSolver(sudoku, iRow, iColumn)

        end;

      end;
    end;
    if l = 73 then
      validated := true;
    for iRow := 0 to 8 do
    begin
      for iColumn := 0 to 8 do
      begin
        sudoku[iRow][iColumn].test_index := sudoku[iRow][iColumn].count - 1;
        if ((iRow mod 3 = 2) and (iColumn mod 3 = 2)) then
        begin
          appearOnce(sudoku, (iRow - 2) * 10 + (iColumn - 2), 3, l);
          if (l = 73) and (not isExist) then
            validated := false;
        end;
        if iRow = 8 then
        begin
          appearOnce(sudoku, iColumn, 2, l);
          if (l = 73) and (not isExist) then
            validated := false;
        end;

      end;
      appearOnce(sudoku, iRow, 1, l);
      if (l = 73) and (not isExist) then
        validated := false;
    end;

  end;

  if (validated) then
  begin
    backtracking(sudoku);
    colorCtrl := false;
    Solve_Button.Enabled := true;
    Check_Button.Enabled := true;
    TButton(Sender).Text := 'Puzzle Set.';
  end
  else
  begin
    begin
      TButton(Sender).Enabled := true;
      TButton(Sender).Text := 'Set Puzzle';
      for i := 0 to ComponentCount - 1 do
        if (Components[i] is TButton) and
          (TButton(Components[i]).TextSettings.FontColor = TAlphacolorRec.BurlyWood )then
          TButton(Components[i]).TextSettings.FontColor := TAlphacolorRec.Wheat;
      showmessage('This sudoku is unsolvable. Please modify this puzzle.');
      for iRow := 0 to 8 do
      begin
        for iColumn := 0 to 8 do
        begin
          sudoku[iRow][iColumn].answer := 0;
          sudoku[iRow][iColumn].skip := false;
          setlength(sudoku[iRow][iColumn].possible, 0);
          sudoku[iRow][iColumn].count := 0;
        end;
      end;

    end;

  end;
end;

procedure TForm1.Solve_ButtonClick(Sender: TObject);
var i,y,x : integer;
begin

  modify := false;

   for i := 0 to ComponentCount - 1 do
    if copy(Components[i].name,low(Components[i].Name),3) = 'Box' then
    begin
    y:= strtoint(copy(TButton(Components[i]).name,low(TButton(Components[i]).Name)+4,1)) ;
    x:= strtoint(copy(TButton(Components[i]).name,low(TButton(Components[i]).Name)+5,1)) ;
        TButton(Components[i]).text:= IntConvert(sudoku[y][x].answer)
    end;

  Solve_Button.Text := 'Solved.';
  Solve_Button.Enabled := false;
  Check_Button.Enabled := false;

end;

end.
