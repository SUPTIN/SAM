unit urelporespmedica2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, memds, db, FileUtil, TAGraph, Dialogs, TASources,
  TADbSource, Forms, Controls, Graphics, DBGrids, ZDataset, Grids, Buttons,
  ExtDlgs, RLReport, TACustomSource, TASeries, LR_Class, LR_DBSet, LR_DSet,
  LR_Shape, TADrawUtils;

type

  { TFormRelPorEspMedica2 }

  TFormRelPorEspMedica2 = class(TForm)
    BitBtn1: TBitBtn;
    Chart1: TChart;
    Chart1PieSeries1: TPieSeries;
    DataSource1: TDataSource;
    DbChartSource1: TDbChartSource;
    DBGrid1: TDBGrid;
    frDBDataSet1: TfrDBDataSet;
    frReport1: TfrReport;
    MemDataset1: TMemDataset;
    ZReadOnlyQuery1: TZReadOnlyQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer);
    procedure Chart1Click(Sender: TObject);
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DbChartSource1GetItem(ASender: TDbChartSource;
      var AItem: TChartDataItem);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure frDBDataSet1CheckEOF(Sender: TObject; var Eof: Boolean);
    procedure frReport1EnterRect(Memo: TStringList; View: TfrView);
    procedure RLBand1AfterPrint(Sender: TObject);
    procedure RLBand2AfterPrint(Sender: TObject);
  private

  public

  end;

var
  FormRelPorEspMedica2: TFormRelPorEspMedica2;

implementation

{$R *.lfm}

{ TFormRelPorEspMedica2 }

procedure TFormRelPorEspMedica2.FormCreate(Sender: TObject);
var
  i, N: Integer;
  Fx, Fy, Ftxt, Fcolor: TField;
begin
  chart1.Refresh;
  ZReadOnlyQuery1.Active:=true;
  N:=0;
  ZReadOnlyQuery1.First;
  While not (ZReadOnlyQuery1.Eof) do
    begin
      N:=N+1;
      ZReadOnlyQuery1.Next;
   end;
  MemDataset1.Open;

  Fx := MemDataset1.FieldByName('X');
  Fy := MemDataset1.FieldByName('Y');
  Ftxt := MemDataset1.FieldByName('Txt');
  Fcolor := MemDataset1.FieldByName('Color');
  ZReadOnlyQuery1.First;
  for i:= 1 to N do begin
    MemDataset1.Append;
    if i=1 then Fx.AsFloat := 0.1 else Fx.AsFloat := 0;
    Fy.AsFloat := ZReadOnlyQuery1.FieldByName('Total').AsFloat;
    Ftxt.AsString := ZReadOnlyQuery1.FieldByName('DescricaoEspecialidade').AsString;
    FColor.AsInteger := RgbToColor(Random(255), Random(255), Random(255));
    MemDataset1.Post;
    ZReadOnlyQuery1.Next;
  end;

end;

procedure TFormRelPorEspMedica2.frDBDataSet1CheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;

procedure TFormRelPorEspMedica2.frReport1EnterRect(Memo: TStringList;
  View: TfrView);
begin
  chart1.Refresh;
  if (view.Name = 'Picture2') then
     TFrPictureView(View).Picture.LoadFromFile('icones\GraficoPorEspMedica.png');
end;

procedure TFormRelPorEspMedica2.RLBand1AfterPrint(Sender: TObject);
begin

end;

procedure TFormRelPorEspMedica2.RLBand2AfterPrint(Sender: TObject);
begin

end;

procedure TFormRelPorEspMedica2.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field.FieldName = 'Color' then begin
    DBGrid1.Canvas.Brush.Color := Column.Field.AsInteger;
    DBGrid1.Canvas.Rectangle(Rect.Left + 2, Rect.Top+2, Rect.Right-2, Rect.Bottom-2);
  end else
    DBGrid1.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.DisplayText);
end;

procedure TFormRelPorEspMedica2.DbChartSource1GetItem(ASender: TDbChartSource;
  var AItem: TChartDataItem);
const
  COLORS: array[1..3] of TColor = (clNavy, clBlue, clSkyBlue);
var
  s: String;
  i: integer;
begin
  DbChartSource1.DefaultGetItem(AItem);
  s := '';
  i := Length(AItem.Text);
  while (i > 0) and (AItem.Text[i] in ['0'..'9']) do begin
    s := AItem.Text[i] + s;
   dec(i);
  end;
  //AItem.Color := COLORS[StrToInt(s)];
end;

procedure TFormRelPorEspMedica2.BitBtn1Click(Sender: TObject);

begin
  Chart1.Repaint;
  Chart1.SaveToFile(TPortableNetworkGraphic, 'icones\GraficoPorEspMedica.png');
  ZReadOnlyQuery1.Active:=true;
  ZReadOnlyQuery1.Refresh;
  frReport1.loadFromfile('RelatEspecMedica.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

procedure TFormRelPorEspMedica2.Chart1AfterDraw(ASender: TChart;
  ADrawer: IChartDrawer);
begin
end;

procedure TFormRelPorEspMedica2.Chart1Click(Sender: TObject);
begin
end;

procedure TFormRelPorEspMedica2.DataSource1DataChange(Sender: TObject;
  Field: TField);
begin

end;

end.

