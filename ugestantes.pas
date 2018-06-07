unit uGestantes;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, db, FileUtil, Forms, Controls, Graphics, Dialogs, DBGrids,
  DbCtrls, DBExtCtrls, StdCtrls, Buttons, ZDataset, ZSqlUpdate, DateUtils,
  uRiscos, uMedicos, LCLType, LCLIntf, Grids;

type

  { TFormGestantes }

  TFormGestantes = class(TForm)
    BitBtn1: TBitBtn;
    DBText2: TDBText;
    DBText3: TDBText;
    DSGestante: TDataSource;
    DBComboBox1: TDBComboBox;
    DBComboBox2: TDBComboBox;
    DBDateEdit1: TDBDateEdit;
    DBEdit1: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ZQueryGestante: TZQuery;
    ZQueryGestanteDPP: TDateField;
    ZQueryGestanteDUM: TDateField;
    ZQueryGestanteid: TLargeintField;
    ZQueryGestanteIdadeGestacional: TStringField;
    ZQueryGestanteMedico: TStringField;
    ZQueryGestanteRisco: TStringField;
    ZQueryGestanteUnidade: TStringField;
    ZUpSQLGestante: TZUpdateSQL;
    procedure BitBtn1Click(Sender: TObject;const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBDateEdit1Change(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBNavigator1Click(Sender: TObject; Button: TDBNavButtonType);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ZQueryGestanteAfterPost(DataSet: TDataSet);
    procedure ZQueryGestanteBeforePost(DataSet: TDataSet);
  private

  public

  end;

var
  FormGestantes: TFormGestantes;

implementation

{$R *.lfm}

{ TFormGestantes }

procedure TFormGestantes.FormCreate(Sender: TObject);
begin
  ZQueryGestante.Active:=true;

  DBComboBox1.Items.Clear; ///Exclui todos os itens do combo
  FormRiscos.ZQueryRiscos.Active:=true;
  FormRiscos.ZQueryRiscos.First;
  While not (FormRiscos.ZQueryRiscos.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox1.Items.Add(FormRiscos.ZQueryRiscos.FieldByName('DescricaoRisco').AsString);
      FormRiscos.ZQueryRiscos.Next;
   end;

  DBComboBox2.Items.Clear; ///Exclui todos os itens do combo
  FormMedicos.ZQueryMedicos.Active:=true;
  FormMedicos.ZQueryMedicos.First;
  While not (FormMedicos.ZQueryMedicos.Eof) do //Adiciona os dados campo no combo
    begin
      DBComboBox2.Items.Add(FormMedicos.ZQueryMedicos.FieldByName('nomeMedico').AsString);
      FormMedicos.ZQueryMedicos.Next;
    end;
end;

procedure TFormGestantes.ZQueryGestanteAfterPost(DataSet: TDataSet);
begin
  ZQueryGestante.ApplyUpdates;
  ZQueryGestante.Refresh;
end;

procedure TFormGestantes.ZQueryGestanteBeforePost(DataSet: TDataSet);
var Ano, Mes, Dia, DiaM: string;
    Data, Ultimo_dia : string;
    AnoC, DiaC, MesC, DiaS: Integer;
    DiaResto, semanas: real;
    U_dia: TDate;
begin
  MesC := 0;
  AnoC := 0;
  Data := ZQueryGestante.FieldbyName('DUM').value;
  Dia := formatdatetime('dd',StrToDate(Data));
  Mes := formatdatetime('mm',StrToDate(Data));
  Ano := formatdatetime('yyyy',StrToDate(Data));
  U_dia := EndOfTheMonth(ZQueryGestante.FieldbyName('DUM').value);
  Ultimo_dia := formatdatetime('dd',U_dia);

  DiaC := StrtoInt(Dia)+7;
  Case StrtoInt(Mes) of
    2: Begin
         MesC := StrtoInt(Mes)+9;
         if (DiaC > 28) then
           Begin
             DiaC := DiaC - StrtoInt(Ultimo_dia);
             MesC :=  MesC+1;
             AnoC := StrtoInt(Ano);
           end
           Else
             AnoC := StrtoInt(Ano);
       end;
    1,3: Begin
           MesC := StrtoInt(Mes)+9;
           if (DiaC > 31) then
             Begin
               DiaC := DiaC - StrtoInt(Ultimo_dia);
               MesC := MesC +1;
               AnoC := StrtoInt(Ano);
               if (MesC = 13) then
                 Begin
                   MesC:=1;
                   AnoC:=AnoC+1;
                 End;
             end
             Else
             AnoC:=StrtoInt(Ano);
         end;
    5,7,8,10,12:Begin
                  MesC:= StrtoInt(Mes) -3;
                  AnoC:= StrtoInt(Ano)+1;
                  if (DiaC > 31 )then
                    Begin
                       U_dia:= EndOfAMonth(AnoC,MesC) ;
                       Ultimo_dia:=FormatDateTime('dd',U_dia);
                       DiaC:= DiaC-StrtoInt(Ultimo_dia);
                       MesC:=MesC+1;
                       if (MesC = 13) then
                         Begin
                            MesC:=1;
                            AnoC:=AnoC+1;
                         end;
                    end
                    Else
                      AnoC:=StrtoInt(Ano)+1;
                End;
    4,6,9,11:Begin
               MesC:= StrtoInt(Mes) -3;
               AnoC:= StrtoInt(Ano)+1;
               if (DiaC > 30 )then
                    Begin
                       U_dia:= EndOfAMonth(AnoC,MesC) ;
                       Ultimo_dia:=FormatDateTime('dd',U_dia);
                       DiaC:= DiaC-StrtoInt(Ultimo_dia);
                       MesC:=MesC+1;
                       if (MesC = 13) then
                         Begin
                            MesC:=1;
                            AnoC:=AnoC+1;
                         end;
                    end
                    Else
                      AnoC:=StrtoInt(Ano)+1;
             end;
    Else ShowMessage('Mês inválido!');
  end;
  DiaS:=DaysBetween(Now,StrToDate(Data));
  semanas:=  Trunc((DiaS / 7));
  DiaResto := (DiaS mod 7);
  DBText2.Field.Value:=StrtoDate(InttoStr(DiaC)+'/'+InttoStr(MesC)+'/'+InttoStr(AnoC));
  if (semanas <= 40) then
         DBText3.Field.Value:=FloattoStr(semanas)+' semanas e ' + FloattoStr(DiaResto) + ' dias.'
      else
         begin
           DBText3.Field.Value:=FloattoStr(semanas)+' semanas e ' + FloattoStr(DiaResto) + ' dias. Já pode ter nascido!';
           DBGrid1.Canvas.Brush.Color:=clRed;
         end;
end;

procedure TFormGestantes.DBDateEdit1Change(Sender: TObject);
begin
end;

procedure TFormGestantes.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var Data: String;
    DiaS: Integer;
    semanas: real;
begin
  //Data:= FormGestantes.ZQueryGestante.FieldByName('DUM').AsString;
  //DiaS:=DaysBetween(Now,StrToDate(Data));
  //semanas:=  Trunc((DiaS / 7));
  //if (Column.Field.FieldName = 'IdadeGestacional') then
    //begin
      //if (semanas >= 40) then
        //DBgrid1.Canvas.Font.Color:= clRed;
        //DBGrid1.Canvas.FillRect(Rect);
        //DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
    //end;
end;

procedure TFormGestantes.BitBtn1Click(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
Var Data: String;
    DiaS: Integer;
    DiaResto, semanas: real;
begin
  FormGestantes.ZQueryGestante.Active:=true;
  FormGestantes.ZQueryGestante.Edit;
  While not (FormGestantes.ZQueryGestante.Eof) do //Adiciona os dados campo no combo
    begin
      Data:= FormGestantes.ZQueryGestante.FieldByName('DUM').AsString;
      FormGestantes.ZQueryGestante.Edit;
      DiaS:=DaysBetween(Now,StrToDate(Data));
      semanas:=  Trunc((DiaS / 7));
      DiaResto := (DiaS mod 7);
      if (semanas <= 40) then
         DBText3.Field.Value:=FloattoStr(semanas)+' semanas e ' + FloattoStr(DiaResto) + ' dias.'
      else
         begin
           DBText3.Field.Value:=FloattoStr(semanas)+' semanas e ' + FloattoStr(DiaResto) + ' dias. Já pode ter nascido!';
           DBgrid1.Canvas.Font.Color:= clRed;
         end;
      FormGestantes.ZQueryGestante.ApplyUpdates;
      FormGestantes.ZQueryGestante.Next;
    end;



end;

procedure TFormGestantes.DBNavigator1Click(Sender: TObject;
  Button: TDBNavButtonType);
begin

end;

procedure TFormGestantes.FormActivate(Sender: TObject);
begin

end;

end.

