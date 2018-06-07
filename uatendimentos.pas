unit uAtendimentos;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, DBExtCtrls, StdCtrls, ZSqlUpdate, ZDataset, uProcedimentos, uMedicos,
  uEspecialidades, uTipoAtend;

type

  { TFormAtend }

  TFormAtend = class(TForm)
    DSAtend: TDataSource;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ZQueryAtend: TZQuery;
    ZQueryAtendDataAtend: TDateField;
    ZQueryAtendEspMedica: TStringField;
    ZQueryAtendid: TLargeintField;
    ZQueryAtendMedico: TStringField;
    ZQueryAtendNome: TStringField;
    ZQueryAtendProcedimentos: TStringField;
    ZQueryAtendTipoAtendi: TStringField;
    ZUpSQLAtend: TZUpdateSQL;
    procedure FormCreate(Sender: TObject);
    procedure ZQueryAtendAfterPost(DataSet: TDataSet);
  private

  public

  end;

var
  FormAtend: TFormAtend;

implementation

{$R *.lfm}

{ TFormAtend }

procedure TFormAtend.FormCreate(Sender: TObject);
begin
  ZQueryAtend.Active:=true;
  DBComboBox1.Items.Clear; ///Exclui todos os itens do combo
  FormProcedimentos.ZQueryProc.Active:=true;
  FormProcedimentos.ZQueryProc.First;
  While not (FormProcedimentos.ZQueryProc.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox1.Items.Add(FormProcedimentos.ZQueryProc.FieldByName('DescricaProcedimento').AsString);
      FormProcedimentos.ZQueryProc.Next;
    end;

  DBComboBox2.Items.Clear; ///Exclui todos os itens do combo
  FormMedicos.ZQueryMedicos.Active:=true;
  FormMedicos.ZQueryMedicos.First;
  While not (FormMedicos.ZQueryMedicos.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox2.Items.Add(FormMedicos.ZQueryMedicos.FieldByName('nomeMedico').AsString);
      FormMedicos.ZQueryMedicos.Next;
    end;

  DBComboBox3.Items.Clear; ///Exclui todos os itens do combo
  FormEspecialidades.ZQueryEspec.Active:=true;
  FormEspecialidades.ZQueryEspec.First;
  While not (FormEspecialidades.ZQueryEspec.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox3.Items.Add(FormEspecialidades.ZQueryEspec.FieldByName('DescricaoEspecialidade').AsString);
      FormEspecialidades.ZQueryEspec.Next;
    end;

  DBComboBox4.Items.Clear; ///Exclui todos os itens do combo
  FormTipoAtend.ZQueryTipoAtend.Active:=true;
  FormTipoAtend.ZQueryTipoAtend.First;
  While not (FormTipoAtend.ZQueryTipoAtend.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox4.Items.Add(FormTipoAtend.ZQueryTipoAtend.FieldByName('DescricaoAtendimento').AsString);
      FormTipoAtend.ZQueryTipoAtend.Next;
    end;
end;

procedure TFormAtend.ZQueryAtendAfterPost(DataSet: TDataSet);
begin
  ZQueryAtend.ApplyUpdates;
  ZQueryAtend.Refresh;
end;

end.

