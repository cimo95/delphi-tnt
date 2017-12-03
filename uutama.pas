Unit uutama;

Interface

Uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ShellAPI, FileCtrl, XPMan, StdCtrls, MMSystem;

Type
  Tca = Class(TForm)
    cb: TEdit;
    cc: TButton;
    cd: TCheckBox;
    ce: TCheckBox;
    cf: TButton;
    cg: TButton;
    ch: TLabel;
    Procedure cbKeyPress(Sender: TObject; Var Key: Char);
    Procedure ccClick(Sender: TObject);
    Procedure cfClick(Sender: TObject);
    Procedure cdClick(Sender: TObject);
    Procedure cgClick(Sender: TObject);
    Procedure ceClick(Sender: TObject);
    Procedure FormCreate(Sender: TObject);
    Procedure cbChange(Sender: TObject);
    Procedure cbContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
  Private
    { Deklarasi hanya untuk penggunaan dalam unit ini saja }

  Public
    { Deklarasi untuk penggunaan ke semua unit yang terintegerasi }
  End;

(*
Program :
Terbilang dan Terbaca

Pengembang awal :
Arachmadi Putra Pambudi

Deskripsi :
Menampilkan dan membaca teks terbilang dari nominal yang diberikan

Catatan :
Untuk pembacaan ada dua mode, yaitu mode Sinkronus (Single Thread) dan Asinkronus (Separated Thread)
Mode Sinkronus berjalan dengan lancar tetapi akan menginterupsi (menangguhkan) interaksi pengguna
dengan program ketika pembacaan sedang berjalan
Mode Asinkronus berjalan dengan lancar namun kurang tepat, tetapi tidak menginterupsi (menangguhkan)
interaksi pengguna dengan program ketika pembacaan berjalan
Anda harus memperbaiki Mode Asinkronus ini agar penggunaannya lebih maksimal
Penamaan variabel sengaja di minimalkan agar anda juga turut mempelajari alur setiap prosedur dan fungsi
yang ada di proyek ini

Lisensi :
Gratis - Perangkat Lunak Sumber Terbuka
*)

Var
  ca: Tca;
  va, vb: boolean;

Implementation

Uses
  terbilang, putarwav;
{$R *.dfm}  //template tweaked by : Araachmadi Putra Pambudi

Procedure pa(a: String);
Var
  b, c: THandle;
  d: pointer;
Begin
  vb := ca.cf.Enabled;
  ca.cf.Enabled := false;
  ca.cd.Enabled := false;
  b := FindResource(HInstance, PChar(a), 'WAVE');
  c := LoadResource(HInstance, b);
  d := LockResource(c);
  sndPlaySound(d, SND_SYNC Or SND_MEMORY);
  Application.ProcessMessages;
  If (c <> 0) Then
  Begin
    UnlockResource(c);
    FreeResource(c);
  End;
  ca.cf.Enabled := vb;
  ca.cd.Enabled := True;
End;

Procedure pb;
Var
  a: integer;
  b, c: String;
Begin
  b := fc(fa('0' + ca.cb.Text)) + ' ';
  a := 0;
  Repeat
    c := Copy(b, a, Pos(' ', b) - 1);
    b := Copy(b, Pos(' ', b) + 1, Length(b));
    If va Then
      pa(c)
    Else
    Begin
      ca.cf.Enabled := false;
      ca.cd.Enabled := false;
	  With TputarWav.Create(true) Do
      Begin
        pa(c);
        pb(False);
        FreeOnTerminate := true;
        resume;
      End;
	  ca.cf.Enabled := vb;
      ca.cd.Enabled := True;
    End;
  Until Length(b) <= 2;
End;

Procedure Tca.cbKeyPress(Sender: TObject; Var Key: Char);
Begin
  If Not (Key In ['0'..'9', #8]) Then
    Key := #0;
End;

Procedure Tca.ccClick(Sender: TObject);
Begin
  ch.Caption := 'Nominal :' + #13 + fd(cb.Text) + #13#13 + 'Terbilang :' + #13 + fc(fa(cb.Text));
  Application.ProcessMessages;
  If cd.Checked Then
    pb;
End;

Procedure Tca.cfClick(Sender: TObject);
Begin
  pb;
End;

Procedure Tca.cdClick(Sender: TObject);
Begin
  cf.Enabled := Not cd.Checked;
End;

Procedure Tca.cgClick(Sender: TObject);
Var
  a: TMemo;
Begin
  Try
    a := TMemo.Create(nil);
    a.Visible := false;
    a.Parent := ca;
    a.Lines.Text := ch.Caption;
    a.SelectAll;
    a.CopyToClipboard;
    ShowMessage('Sudah tersalin di papan klip, silahkan digunakan ^_^');
  Finally
    a.Free;
  End;
End;

Procedure Tca.ceClick(Sender: TObject);
Begin
  If ce.Checked Then
    ce.Checked := MessageBox(Handle, 'Jika anda mengaktifkan Threaded(async), proses tidak akan ' + 'ditangguhkan selama pembacaan, tetapi hasil pembacaan bisa jadi tidak sesuai dengan teks terbilang'#13#13 + 'Anda yakin ingin mengaktifkan Threaded(async) ?', 'Aktifkan threaded (async)', 48 + 4) = mrYes;
  va := Not ce.Checked;
End;

Procedure Tca.FormCreate(Sender: TObject);
Begin
  va := true;
End;

Procedure Tca.cbChange(Sender: TObject);
Var
  a, c: String;
  b: integer;
Begin
  Application.ProcessMessages;
  For b := 1 To Length(cb.Text) Do
  Begin
    If cb.Text[b] In ['0'..'9'] Then
      a := a + cb.Text[b];
    Application.ProcessMessages;
  End;
  cb.Text := a;
  If Length(cb.Text) <= 0 Then
    cb.Text := '0';
End;

Procedure Tca.cbContextPopup(Sender: TObject; MousePos: TPoint; Var Handled: Boolean);
Begin
  cb.Clear;
End;

End.

