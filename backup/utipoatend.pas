unit uTipoAtend;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DbCtrls,
  DBGrids, StdCtrls, ZDataset, ZSqlUpdate;

type

  { TFormTipoAtend }

  TFormTipoAtend = class(TForm)
    DSAtend: TDataSource;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    ZQueryTipoAtend: TZQuery;
    ZQueryTipoAtenddescricaoAtendimento: TStringField;
    ZQueryTipoAtendid: TLargeintField;
    ZUpSQLTipoAtend: TZUpdateSQL;
  private

  public

  end;

var
  FormTipoAtend: TFormTipoAtend;

implementation

{$R *.lfm}

end.

