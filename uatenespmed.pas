unit uAtenEspMed;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, memds, FileUtil, TADbSource, TAGraph, TASeries,
  LR_DBSet, LR_Class, Forms, Controls, Graphics, Dialogs, DBGrids, Buttons,
  ZDataset, TACustomSource, Grids, TADrawUtils;

type

  { TFormAtenEspMed }

  TFormAtenEspMed = class(TForm)
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
    procedure DataSource1DataChange(Sender: TObject; Field: TField);
    procedure DbChartSource1GetItem(ASender: TDbChartSource;
      var AItem: TChartDataItem);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid1EditingDone(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure frReport1EnterRect(Memo: TStringList; View: TfrView);
  private

  public

  end;

var
  FormAtenEspMed: TFormAtenEspMed;

implementation

{$R *.lfm}

{ TFormAtenEspMed }

procedure TFormAtenEspMed.DataSource1DataChange(Sender: TObject; Field: TField);
begin

end;

procedure TFormAtenEspMed.BitBtn1Click(Sender: TObject);
begin
  Chart1.Repaint;
  Chart1.SaveToFile(TPortableNetworkGraphic, 'icones\GraficoPorEspMedica.png');
  ZReadOnlyQuery1.Active:=true;
  ZReadOnlyQuery1.Refresh;
  frReport1.loadFromfile('RelatEspecMedica.lrf');
  frReport1.PrepareReport;
  frReport1.ShowReport;
end;

procedure TFormAtenEspMed.Chart1AfterDraw(ASender: TChart; ADrawer: IChartDrawer
  );
begin
end;

procedure TFormAtenEspMed.DbChartSource1GetItem(ASender: TDbChartSource;
  var AItem: TChartDataItem);
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

procedure TFormAtenEspMed.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if Column.Field.FieldName = 'Color' then begin
    DBGrid1.Canvas.Brush.Color := Column.Field.AsInteger;
    DBGrid1.Canvas.Rectangle(Rect.Left + 2, Rect.Top+2, Rect.Right-2, Rect.Bottom-2);
  end else
    DBGrid1.Canvas.TextOut(Rect.Left+2, Rect.Top+2, Column.Field.DisplayText);
end;

procedure TFormAtenEspMed.DBGrid1EditingDone(Sender: TObject);
begin
end;

procedure TFormAtenEspMed.FormCreate(Sender: TObject);
 Var
 i: Integer;
 Fx, Fy, FTxt, Fcolor: TField;
begin
  ZReadOnlyQuery1.Active:=true;
  ZReadOnlyQuery1.First;
  MemDataset1.Open;
  Fx := MemDataset1.FieldByName('X');
  Fy := MemDataset1.FieldByName('Y');
  FTxt := MemDataset1.FieldByName('Txt');
  Fcolor := MemDataset1.FieldByName('Color');

  While not (ZReadOnlyQuery1.Eof) do
   begin
      MemDataset1.Append;
      if i=1 then Fx.AsFloat := 0.1 else Fx.AsFloat := 0;
      Fy.AsFloat := ZReadOnlyQuery1.FieldByName('Total').AsFloat;
      FTxt.AsString := ZReadOnlyQuery1.FieldByName('DescricaoEspecialidade').AsString;
      FColor.AsInteger := RgbToColor(Random(255), Random(255), Random(255));
      MemDataset1.Post;
      ZReadOnlyQuery1.Next;
   end;
end;

procedure TFormAtenEspMed.FormShow(Sender: TObject);
 Var
  i: Integer;
  Fx, Fy, FTxt, Fcolor: TField;
begin
  ZReadOnlyQuery1.First;
  MemDataset1.First;
  MemDataset1.Open;
  Fx := MemDataset1.FieldByName('X');
  Fy := MemDataset1.FieldByName('Y');
  FTxt := MemDataset1.FieldByName('Txt');
  Fcolor := MemDataset1.FieldByName('Color');
  While not (ZReadOnlyQuery1.Eof) do
   begin
      ZReadOnlyQuery1.Refresh;
      dbgrid1.Refresh;
      Fy.AsFloat := ZReadOnlyQuery1.FieldByName('Total').AsFloat;
      dbgrid1.Columns[1].Field.AsFloat:=Fy.AsFloat;

      showmessage(FloatToStr(dbgrid1.Columns[1].Field.AsFloat));
      //FTxt.AsString := ZReadOnlyQuery1.FieldByName('DescricaoEspecialidade').AsString;
      //FColor.AsInteger := RgbToColor(Random(255), Random(255), Random(255));
      MemDataset1.Append;
      MemDataset1.Refresh;
      MemDataset1.Next;
      ZReadOnlyQuery1.Next;
   end;
end;

procedure TFormAtenEspMed.frReport1EnterRect(Memo: TStringList; View: TfrView);
begin
  chart1.Refresh;
  if (view.Name = 'Picture2') then
     TFrPictureView(View).Picture.LoadFromFile('icones\GraficoPorEspMedica.png');
end;

end.

