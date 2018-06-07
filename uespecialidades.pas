unit uEspecialidades;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids, StdCtrls, ZSqlUpdate, ZDataset;

type

  { TFormEspecialidades }

  TFormEspecialidades = class(TForm)
    DSEspec: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    ZQueryEspec: TZQuery;
    ZQueryEspecDescricaoEspecialidade: TStringField;
    ZQueryEspecid: TLargeintField;
    ZUpSQLEspec: TZUpdateSQL;
  private

  public

  end;

var
  FormEspecialidades: TFormEspecialidades;

implementation

{$R *.lfm}

end.

