unit uMedicos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, StdCtrls, ZDataset, ZSqlUpdate;

type

  { TFormMedicos }

  TFormMedicos = class(TForm)
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    DSMedicos: TDataSource;
    Label1: TLabel;
    ZQueryMedicos: TZQuery;
    ZQueryMedicosid: TLargeintField;
    ZQueryMedicosnomeMedico: TStringField;
    ZUpSQLMedicos: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ZQueryMedicosAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  FormMedicos: TFormMedicos;

implementation

{$R *.lfm}

{ TFormMedicos }

procedure TFormMedicos.ZQueryMedicosAfterPost(DataSet: TDataSet);
begin

end;

procedure TFormMedicos.FormCreate(Sender: TObject);
begin

end;

end.

