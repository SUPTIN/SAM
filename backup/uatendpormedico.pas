unit uAtendPorMedico;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, ListViewFilterEdit, LvlGraphCtrl, LR_Class,
  LR_DBSet, LR_Shape, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  uMedicos, ZDataset;

type

  { TFormAtendPorMedico }

  TFormAtendPorMedico = class(TForm)
    BitBtn1: TBitBtn;
    ComboBox1: TComboBox;
    DSAtePorMed: TfrDBDataSet;
    ReportAtePorMed: TfrReport;
    Label1: TLabel;
    ZQAtePorMed: TZQuery;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListViewFilterEdit1Change(Sender: TObject);
    procedure LvlGraphControl1Click(Sender: TObject);
  private

  public

  end;

var
  FormAtendPorMedico: TFormAtendPorMedico;

implementation

{$R *.lfm}

{ TFormAtendPorMedico }

procedure TFormAtendPorMedico.FormCreate(Sender: TObject);
begin
  ComboBox1.Items.Clear; ///Exclui todos os itens do combo
  FormMedicos.ZQueryMedicos.Active:=true;
  FormMedicos.ZQueryMedicos.First;
  While not (FormMedicos.ZQueryMedicos.Eof) do //Adiciona os dados campo no combo
    begin
      ComboBox1.Items.Add(FormMedicos.ZQueryMedicos.FieldByName('nomeMedico').AsString);
      FormMedicos.ZQueryMedicos.Next;
    end;
end;

procedure TFormAtendPorMedico.ListViewFilterEdit1Change(Sender: TObject);
begin

end;

procedure TFormAtendPorMedico.LvlGraphControl1Click(Sender: TObject);
begin

end;

procedure TFormAtendPorMedico.BitBtn1Click(Sender: TObject);
begin
  ZQAtePorMed.Active:=true;
  ZQAtePorMed.Refresh;

  ZQAtePorMed.close;
  ZQAtePorMed.SQL.Text:='select * from Atendimentos where Medico = '+':PMedico'+';' ;
  ZQAtePorMed.ParamByName('PMedico').AsString:=ComboBox1.Text;
  ZQAtePorMed.ParamByName('PMedico').Text:=ComboBox1.Text;
  ZQAtePorMed.ParamByName('PMedico').Value:=ComboBox1.Text;
  ZQAtePorMed.open;
  ReportAtePorMed.loadFromfile('RelatAtePorMed.lrf');
  ReportAtePorMed.PrepareReport;
  ReportAtePorMed.ShowReport;
end;

end.

