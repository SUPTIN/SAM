unit uRiscos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids, StdCtrls, ZDataset, ZSqlUpdate;

type

  { TFormRiscos }

  TFormRiscos = class(TForm)
    DSRiscos: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    ZQueryRiscos: TZQuery;
    ZQueryRiscosDescricaoRisco: TStringField;
    ZQueryRiscosid: TLargeintField;
    ZUpSQLRiscos: TZUpdateSQL;
    procedure ZQueryRiscosAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  FormRiscos: TFormRiscos;

implementation

{$R *.lfm}

{ TFormRiscos }

procedure TFormRiscos.ZQueryRiscosAfterPost(DataSet: TDataSet);
begin

end;

end.

