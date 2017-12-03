object ca: Tca
  Left = 616
  Top = 244
  Width = 398
  Height = 276
  Caption = 'Terbilang dan Terbaca'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  DesignSize = (
    390
    248)
  PixelsPerInch = 96
  TextHeight = 13
  object ch: TLabel
    Left = 8
    Top = 88
    Width = 377
    Height = 154
    Anchors = [akLeft, akTop, akRight, akBottom]
    AutoSize = False
    Caption = 'Nominal :'#13#10'0'#13#10#13#10'Terbilang :'#13#10'Nol'
    WordWrap = True
  end
  object cd: TCheckBox
    Left = 88
    Top = 60
    Width = 25
    Height = 17
    Cursor = crHandPoint
    Hint = 'Langsung baca setelah menampilkan terbilang'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = cdClick
  end
  object cb: TEdit
    Left = 7
    Top = 8
    Width = 377
    Height = 44
    Hint = 'Masukkan angka anda'#13#10'(klik kanan untuk menghapus semua)'
    Anchors = [akLeft, akTop, akRight]
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Courier New'
    Font.Style = [fsBold]
    MaxLength = 36
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    Text = '0'
    OnChange = cbChange
    OnContextPopup = cbContextPopup
    OnKeyPress = cbKeyPress
  end
  object cc: TButton
    Left = 8
    Top = 56
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Tampilkan terbilang dari angka yang anda masukkan'
    Caption = 'Terbilang'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    OnClick = ccClick
  end
  object cf: TButton
    Left = 106
    Top = 56
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Bacakan terbilang dari angka yang dimasukkan'
    Caption = 'Baca'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = cfClick
  end
  object cg: TButton
    Left = 307
    Top = 56
    Width = 75
    Height = 25
    Cursor = crHandPoint
    Hint = 'Salin teks nominal dan terbilang ke papan klip'
    Caption = 'Salin'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    OnClick = cgClick
  end
  object ce: TCheckBox
    Left = 187
    Top = 60
    Width = 110
    Height = 17
    Cursor = crHandPoint
    Hint = 'Aktifkan mode asinkronus'
    Caption = 'Threaded (async)'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = ceClick
  end
end
