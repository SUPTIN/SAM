unit uProcedimentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  DbCtrls, DBGrids, ZSqlUpdate, ZDataset;

type

  { TFormProcedimentos }

  TFormProcedimentos = class(TForm)
    DSProc: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    ZQueryProc: TZQuery;
    ZQueryProcDescricaProcedimento: TStringField;
    ZQueryProcid: TLargeintField;
    ZUpSQLProc: TZUpdateSQL;
    procedure ZQueryProcAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  FormProcedimentos: TFormProcedimentos;

implementation

{$R *.lfm}

{ TFormProcedimentos }

procedure TFormProcedimentos.ZQueryProcAfterPost(DataSet: TDataSet);
begin
  ZQueryProc.ApplyUpdates;
  ZQueryProc.Refresh;
end;

end.

