program SAM;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, tachartlazaruspkg, memdslaz, uPrincipal, uProcedimentos,
  uEspecialidades, uTipoAtend, uMedicos, uRiscos, zcomponent, uAtendimentos,
  uGestantes, uRelatorios, uAtendDoDia, uAtendPorMedico, uSobre, uAtenEspMed
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.CreateForm(TFormProcedimentos, FormProcedimentos);
  Application.CreateForm(TFormEspecialidades, FormEspecialidades);
  Application.CreateForm(TFormTipoAtend, FormTipoAtend);
  Application.CreateForm(TFormMedicos, FormMedicos);
  Application.CreateForm(TFormRiscos, FormRiscos);
  Application.CreateForm(TFormAtend, FormAtend);
  Application.CreateForm(TFormGestantes, FormGestantes);
  Application.CreateForm(TFormRelatorios, FormRelatorios);
  Application.CreateForm(TFormAtendDoDia, FormAtendDoDia);
  Application.CreateForm(TFormAtendPorMedico, FormAtendPorMedico);
  Application.CreateForm(TformSobre, formSobre);
  Application.CreateForm(TFormAtenEspMed, FormAtenEspMed);
  Application.Run;
end.

