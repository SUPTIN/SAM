unit uRelatorios;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LR_Class, LR_DBSet, Forms, Controls, Graphics,
  Dialogs, ZConnection, ZDataset, LR_DSet;

type

  { TFormRelatorios }

  TFormRelatorios = class(TForm)
    DSRelAteEspMed: TfrDBDataSet;
    DSAte: TfrDBDataSet;
    ReportAte: TfrReport;
    ReportAtendDia: TfrReport;
    ReportAteEspMed: TfrReport;
    ZCRelatorios: TZConnection;
    ROQueryAteEspMed: TZReadOnlyQuery;
    ROQueryAte: TZReadOnlyQuery;
    procedure DSRelAteEspMedCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormRelatorios: TFormRelatorios;

implementation

{$R *.lfm}

{ TFormRelatorios }

procedure TFormRelatorios.FormCreate(Sender: TObject);
begin

end;

procedure TFormRelatorios.DSRelAteEspMedCheckEOF(Sender: TObject;
  var Eof: Boolean);
begin

end;

end.

