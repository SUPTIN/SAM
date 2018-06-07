unit uAtendDoDia;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, LR_Class, LR_DBSet, Forms, Controls,
  Graphics, Dialogs, DbCtrls, DBExtCtrls, Calendar, EditBtn, StdCtrls, Buttons,
  ZDataset, LR_DSet;

type

  { TFormAtendDoDia }

  TFormAtendDoDia = class(TForm)
    BitBtn1: TBitBtn;
    DateEdit1: TDateEdit;
    DSAtendDoDia: TfrDBDataSet;
    ReportAtendDoDia: TfrReport;
    Label1: TLabel;
    ROQueryAtendDoDia: TZReadOnlyQuery;
    ROQueryAtendDoDiaDataAtend: TDateField;
    ROQueryAtendDoDiaEspMedica: TStringField;
    ROQueryAtendDoDiaid: TLargeintField;
    ROQueryAtendDoDiaMedico: TStringField;
    ROQueryAtendDoDiaNome: TStringField;
    ROQueryAtendDoDiaProcedimentos: TStringField;
    ROQueryAtendDoDiaTipoAtendi: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure DSAtendDoDiaCheckEOF(Sender: TObject; var Eof: Boolean);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  FormAtendDoDia: TFormAtendDoDia;

implementation

{$R *.lfm}

{ TFormAtendDoDia }

procedure TFormAtendDoDia.BitBtn1Click(Sender: TObject);
var Data: String;
begin
  ROQueryAtendDoDia.Active:=true;
  ROQueryAtendDoDia.Refresh;

  ROQueryAtendDoDia.close;
  ROQueryAtendDoDia.SQL.Text:='select * from Atendimentos where DataAtend = '+':PData'+';' ;
  Data:= FormatDateTime('yyyy-mm-dd',StrtoDate(DateEdit1.Text)) ;
  ROQueryAtendDoDia.ParamByName('PData').AsString:=Data;
  ROQueryAtendDoDia.open;
  ReportAtendDoDia.loadFromfile('RelatAtendDoDia.lrf');
  ReportAtendDoDia.PrepareReport;
  ReportAtendDoDia.ShowReport;
end;

procedure TFormAtendDoDia.DSAtendDoDiaCheckEOF(Sender: TObject; var Eof: Boolean
  );
begin

end;

procedure TFormAtendDoDia.FormCreate(Sender: TObject);
begin

end;

end.

