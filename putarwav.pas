Unit putarwav;

Interface

Uses
  Classes, MMSystem, Windows;

Type
  TputarWav = Class(TThread)
  Private
    { Private declarations }
    va, vb: String;
    vc: Boolean;
  Protected
    Procedure execute; Override;
  Public
    vd: String;
    Procedure pa(Const a: String);
    Procedure pb(Const a: Boolean);
  End;

Implementation

Procedure TputarWav.execute;
Var
  a, b: THandle;
  c: pointer;
Begin
  If vc Then
    PlaySound(PChar(va), 0, SND_SYNC)
  Else
  Begin
    a := FindResource(HInstance, PChar(va), 'WAVE');
    b := LoadResource(HInstance, a);
    c := LockResource(b);
    sndPlaySound(c, SND_SYNC Or SND_MEMORY);
    If (b <> 0) Then
    Begin
      UnlockResource(b);
      FreeResource(b);
    End;
  End;
End;

Procedure TputarWav.pb(Const a: Boolean);
Begin
  vc := a;
End;

Procedure TputarWav.pa(Const a: String);
Begin
  va := a;
End;

End.

