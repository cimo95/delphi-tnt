Unit terbilang;

Interface

Uses
  SysUtils;

Function fa(a: String): String;

Function fb(a: integer): String;

Function fc(a: String): String;

Function fd(a: String): String;

Var
  va, vc: String;
  vb: Integer;

Implementation

Function fa(a: String): String;
Var
  b, d: integer;
  c: Boolean;
Begin
  b := 1;
  d := 0;
  Repeat
    c := a[b] = '0';
    Inc(b);
    If c Then
      Inc(d);
  Until (b = Length(a)) Or (Not c);
  a := Copy(a, d, Length(a));
  vc := a;
  If Length(a) Mod 3 <> 0 Then
  Begin
    Repeat
      a := '0' + a
    Until Length(a) Mod 3 = 0
  End;
  If Not c Then
    If a = '' Then
      Result := '0'
    Else
      Result := a
  Else
    Result := '-1';
End;

Function fb(a: integer): String;
Const
  b: Array[0..11] Of String[15] = ('', 'Satu', 'Dua', 'Tiga', 'Empat', 'Lima', 'Enam', 'Tujuh', 'Delapan', 'Sembilan', 'Sepuluh', 'Sebelas');
Begin
  Case a Of
    0..11:
      fb := b[a];
    12..19:
      fb := fb(a - 10) + ' Belas';
    20..99:
      fb := fb(a Div 10) + ' Puluh ' + fb(a Mod 10);
    100..199:
      fb := 'Seratus ' + fb(a - 100);
    200..999:
      fb := fb(a Div 100) + ' Ratus ' + fb(a Mod 100);
    1000..1999:
      fb := 'Seribu ' + fb(a - 1000);
  End;
End;

Function fc(a: String): String;
Const
  b: Array[0..11] Of String[15] = ('', 'Ribu', 'Juta', 'Milyar', 'Triliun', 'Kuadriliun', 'Kuintiliun', 'Sekstiliun', 'Septiliun', 'Oktiliun', 'Noniliun', 'Desiliun');
Var
  c, d: String;
  e: Integer;
Begin
  If (a = '-1') Or (a = '0') Then
    d := 'Nol'
  Else
  Begin
    For e := Length(a) Downto 1 Do
    Begin
      c := a[e] + c;
      If Length(c) = 3 Then
      Begin
        If c = '000' Then
          d := fb(StrToInt(c)) + d
        Else
          d := fb(StrToInt(c)) + ' ' + b[(Length(a) - e) Div 3] + ' ' + d;
        c := '';
      End;
    End;
  End;
  Repeat
    d := StringReplace(d, '  ', ' ', [rfReplaceAll]);
  Until Pos('  ', d) = 0;
  fc := d;
End;

Function fd(a: String): String;
Var
  b, d: integer;
  c: String;
  e: Boolean;
Begin
  b := 1;
  d := -1;
  Repeat
    e := a[b] = '0';
    Inc(b);
    If e Then
      Inc(d);
  Until (Length(a) = b) Or (Not e);
  a := Copy(a, d, Length(a));
  For b := Length(a) Downto 1 Do
    If ((Length(a) - (b - 1)) Mod 3 = 0) And (b <> 1) Then
      c := '.' + a[b] + c
    Else
      c := a[b] + c;
  fd := c;
End;

End.

