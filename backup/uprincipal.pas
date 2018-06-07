unit uPrincipal;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, Menus,
  Buttons, ExtCtrls, ComCtrls, ZConnection, uAtendimentos, uGestantes,
  uProcedimentos, uTipoAtend, uMedicos, uRiscos, uEspecialidades, uRelatorios,
  uAtendDoDia, uAtendPorMedico, uRelPorEspMedica, uSobre, uAtenEspMed;

type

  { TFormPrincipal }

  TFormPrincipal = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    Panel1: TPanel;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    ZConnection1: TZConnection;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.lfm}

{ TFormPrincipal }

procedure TFormPrincipal.BitBtn1Click(Sender: TObject);
begin
  FormAtend.showModal;
end;

procedure TFormPrincipal.BitBtn2Click(Sender: TObject);
begin
  FormGestantes.showModal;
end;

procedure TFormPrincipal.MenuItem10Click(Sender: TObject);
begin
  FormRelatorios.ROQueryAte.Active:=true;
  FormRelatorios.ROQueryAte.Refresh;
  FormRelatorios.ReportAte.loadFromfile('RelatAtend.lrf');
  FormRelatorios.ReportAte.PrepareReport;
  FormRelatorios.ReportAte.ShowReport;
end;

procedure TFormPrincipal.MenuItem11Click(Sender: TObject);
begin
    FormAtendPorMedico.ShowModal;
end;

procedure TFormPrincipal.MenuItem12Click(Sender: TObject);
begin
  formSobre.ShowModal;
end;

procedure TFormPrincipal.MenuItem2Click(Sender: TObject);
begin
  FormProcedimentos.ShowModal;
end;

procedure TFormPrincipal.MenuItem3Click(Sender: TObject);
begin
  FormEspecialidades.ShowModal;
end;

procedure TFormPrincipal.MenuItem4Click(Sender: TObject);
begin
  FormTipoAtend.ShowModal;
end;

procedure TFormPrincipal.MenuItem5Click(Sender: TObject);
begin
  FormMedicos.ShowModal;
end;

procedure TFormPrincipal.MenuItem6Click(Sender: TObject);
begin
  FormRiscos.ShowModal;
end;

procedure TFormPrincipal.MenuItem8Click(Sender: TObject);
begin
  FormAtendDoDia.ShowModal;
end;

procedure TFormPrincipal.MenuItem9Click(Sender: TObject);
begin
  //FormRelatorios.ROQueryAteEspMed.Active:=true;
  //FormRelatorios.ROQueryAteEspMed.Refresh;
  //FormRelatorios.ReportAteEspMed.loadFromfile('RelatEspecMedica.lrf');
  //FormRelatorios.ReportAteEspMed.PrepareReport;
  //FormRelatorios.ReportAteEspMed.ShowReport;
  //FormRelPorEspMedica.ShowModal;
  FormAtenEspMed.chart1.ClearSeries;
  FormAtenEspMed.ShowModal;

end;

procedure TFormPrincipal.Timer1Timer(Sender: TObject);
begin
  Statusbar1.Panels[0].Text:='Hora: '+TimeToStr(now);
  Statusbar1.Panels[1].Text:='Data: '+FormatDateTime('dd/mm/yyyy',Now);
end;

end.

