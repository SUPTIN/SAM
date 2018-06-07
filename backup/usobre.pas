unit uSobre;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, memds, FileUtil, TAGraph, TADbSource, TASeries, Forms,
  Controls, Graphics, Dialogs, DBGrids, ZConnection, ZDataset, Grids, StdCtrls,
  ExtCtrls, TACustomSource;

type

  { TfromSobre }

  TfromSobre = class(TForm)
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure DbChartSource1GetItem(ASender: TDbChartSource;
      var AItem: TChartDataItem);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);

  private

  public

  end;

var
  fromSobre: TfromSobre;

implementation

{$R *.lfm}

{ TfromSobre }


procedure TfromSobre.FormCreate(Sender: TObject);
const
  N = 2;
var
  i: Integer;
  Fx, Fy, Ftxt, Fcolor: TField;
begin
end;

procedure TfromSobre.Image1Click(Sender: TObject);
begin

end;

procedure TfromSobre.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin

end;

procedure TfromSobre.DbChartSource1GetItem(ASender: TDbChartSource;
  var AItem: TChartDataItem);
const
  COLORS: array[1..3] of TColor = (clNavy, clBlue, clSkyBlue);
var
  s: String;
  i: integer;
begin
  //DbChartSource1.DefaultGetItem(AItem);
  //s := '';
  //i := Length(AItem.Text);
  //while (i > 0) and (AItem.Text[i] in ['0'..'9']) do begin
    //s := AItem.Text[i] + s;
    //dec(i);
 // end;
  //AItem.Color := COLORS[StrToInt(s)];
end;

end.

