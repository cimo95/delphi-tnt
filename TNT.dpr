Program TNT;

uses
  Forms,
  uutama in 'uutama.pas' {ca},
  terbilang in 'terbilang.pas',
  putarwav in 'putarwav.pas';

{$R *.res}  {$R baca.res}

Begin
  Application.Initialize;
  Application.Title := 'Terbilang dan Terbaca';
  Application.CreateForm(Tca, ca);
  Application.Run;
End.

