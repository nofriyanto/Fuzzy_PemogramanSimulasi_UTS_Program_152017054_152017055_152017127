unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid, DB, DBCtrls, Mask,
  ExtCtrls, jpeg, Chart, Math;

type
  TForm3 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    grp1: TGroupBox;
    lbl2: TLabel;
    lbl3: TLabel;
    grp2: TGroupBox;
    lbl4: TLabel;
    lbl5: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    edt_hasilpanen: TEdit;
    edt_perkons: TEdit;
    edt_bertambah: TEdit;
    edt_berkurang: TEdit;
    edt_banyak: TEdit;
    edt_sedikit: TEdit;
    edt_naik: TEdit;
    edt_turun: TEdit;
    img1: TImage;
    lbl6: TLabel;
    btn2: TBitBtn;
    btn1: TBitBtn;
    btn3: TBitBtn;
    btn4: TBitBtn;
    lbl7: TLabel;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  hasilpanen, permintaankonsumen, pkbertambah, pkberkurang, hpbanyak, hpsedikit, hpnaik, hpturun:Real;
  Form3: TForm3;

implementation

uses Unit5, unit1;

{$R *.dfm}

procedure TForm3.btn2Click(Sender: TObject);
begin
  // CLear data input
edt_hasilpanen.Text:='';
edt_perkons.Text:='';
edt_bertambah.Text:='';
edt_berkurang.Text:='';
edt_banyak.Text:='';
edt_sedikit.Text:='';
edt_naik.Text:='';
edt_turun.Text:='';
end;

procedure TForm3.btn1Click(Sender: TObject);
var
  ubertambah, uberkurang, ubanyak, usedikit :Single;
  OF_R1, OF_R2, OF_R3, OF_R4 : Single;
  ImpNaik, ImpTurun: Single;
begin
  if edt_hasilpanen.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_hasilpanen.Clear;
    end
  else
  if edt_perkons.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_perkons.Clear;
    end
  else
  if edt_bertambah.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_bertambah.Clear;
    end
  else
  if edt_berkurang.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_berkurang.Clear;
    end
  else
  if edt_banyak.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_banyak.Clear;
    end
  else
  if edt_sedikit.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_sedikit.Clear;
    end
  else
  if edt_naik.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_naik.Clear;
    end
  else
  if edt_turun.Text='' then
    begin
    Application.MessageBox('Data yang diinputkan belum lengkap!','Error');
    edt_turun.Clear;
    end
    else
  begin
    Form3.Hide;
    Form5.Show;
    // input data manual
 hasilpanen := strtofloat(edt_hasilpanen.Text);
 permintaankonsumen := strtofloat(edt_perkons.Text);
 pkbertambah := strtofloat(edt_bertambah.Text);
 pkberkurang := strtofloat(edt_berkurang.Text);
 hpbanyak := strtofloat(edt_banyak.Text);
 hpsedikit := strtofloat(edt_sedikit.Text);
 hpnaik := strtofloat(edt_naik.Text);
 hpturun := strtofloat(edt_turun.Text);

 //tahap 1 fuzzifikasi
 Form5.edt_utambah.Text := FloatToStr((-(hasilpanen-pkbertambah))/(pkbertambah-pkberkurang));
 Form5.edt_ukurang.Text := FloatToStr(((hasilpanen-pkberkurang))/(pkbertambah-pkberkurang));
 Form5.edt_ubanyak.Text := FloatToStr((-(permintaankonsumen-hpbanyak))/(hpbanyak-hpsedikit));
 Form5.edt_usedikit.Text := FloatToStr(((permintaankonsumen-hpsedikit))/(hpbanyak-hpsedikit));

 // grafik tahap 1
 Form5.cht_perkons.Series[0].Clear;
 Form5.cht_perkons.Series[0].AddXY(StrToFloat(edt_bertambah.Text), 1);
 Form5.cht_perkons.Series[0].AddXY(StrToFloat(edt_berkurang.Text), 0);
 Form5.cht_perkons.Series[1].Clear;
 Form5.cht_perkons.Series[1].AddXY(StrToFloat(edt_bertambah.Text), 0);
 Form5.cht_perkons.Series[1].AddXY(StrToFloat(edt_berkurang.Text), 1);

 Form5.cht_hasilpanen.Series[0].Clear;
 Form5.cht_hasilpanen.Series[0].AddXY(StrToFloat(edt_banyak.Text), 1);
 Form5.cht_hasilpanen.Series[0].AddXY(StrToFloat(edt_sedikit.Text), 0);
 Form5.cht_hasilpanen.Series[1].Clear;
 Form5.cht_hasilpanen.Series[1].AddXY(StrToFloat(edt_banyak.Text), 0);
 Form5.cht_hasilpanen.Series[1].AddXY(StrToFloat(edt_sedikit.Text), 1);

 Form5.cht_harpen.Series[0].Clear;
 Form5.cht_harpen.Series[0].AddXY(StrToFloat(edt_naik.Text), 1);
 Form5.cht_harpen.Series[0].AddXY(StrToFloat(edt_turun.Text), 0);
 Form5.cht_harpen.Series[1].Clear;
 Form5.cht_harpen.Series[1].AddXY(StrToFloat(edt_naik.Text), 0);
 Form5.cht_harpen.Series[1].AddXY(StrToFloat(edt_turun.Text), 1);

 //mengambbil data dari fuzzifikasi tahap 1
 ubertambah := StrToFloat(Form5.edt_utambah.Text);
 uberkurang := StrToFloat(Form5.edt_ukurang.Text);
 ubanyak := StrToFloat(Form5.edt_ubanyak.Text);
 usedikit := StrToFloat(Form5.edt_usedikit.Text);

 //tahap 2 Operasi fuzzy
 OF_R1 := Min(ubertambah,ubanyak);
 OF_R2 := Min(ubertambah,usedikit);
 OF_R3 := Min(uberkurang,ubanyak);
 OF_R4 := Min(uberkurang,usedikit);

 Form5.edt_OFR1.Text := FloatToStr(OF_R1);
 Form5.edt_OFR1.Text := FormatFloat('0.##',OF_R1);
 Form5.edt_OFR2.Text := FloatToStr(OF_R2);
 Form5.edt_OFR2.Text := FormatFloat('0.##',OF_R2);
 Form5.edt_OFR3.Text := FloatToStr(OF_R3);
 Form5.edt_OFR3.Text := FormatFloat('0.##',OF_R3);
 Form5.edt_OFR4.Text := FloatToStr(OF_R4);
 Form5.edt_OFR4.Text := FormatFloat('0.##',OF_R4);

 //TAHAP 3 NILAI IMPLIKASI
 Form5.edt_IMPR1.Text := FloatToStr(OF_R1);
 Form5.edt_IMPR1.Text := FormatFloat('0.##',OF_R1);
 Form5.edt_IMPR2.Text := FloatToStr(OF_R2);
 Form5.edt_IMPR2.Text := FormatFloat('0.##',OF_R2);
 Form5.edt_IMPR3.Text := FloatToStr(OF_R3);
 Form5.edt_IMPR3.Text := FormatFloat('0.##',OF_R3);
 Form5.edt_IMPR4.Text := FloatToStr(OF_R4);
 Form5.edt_IMPR4.Text := FormatFloat('0.##',OF_R4);

 //Komposisi Aturan
 ImpNaik := Max(OF_R3, OF_R4);
 ImpTurun := Max(OF_R1, OF_R2);
 Form5.edt_KaTurun.Text := FloatToStr(ImpTurun);
 Form5.edt_KaTurun.Text := FormatFloat('0.##',ImpTurun);
 Form5.edt_KaNaik.Text := FloatToStr(ImpNaik);
 Form5.edt_KaNaik.Text := FormatFloat('0.##',ImpNaik);

  end;
end;

procedure TForm3.btn3Click(Sender: TObject);
begin
edt_hasilpanen.Text:='';
edt_perkons.Text:='';
edt_bertambah.Text:='';
edt_berkurang.Text:='';
edt_banyak.Text:='';
edt_sedikit.Text:='';
edt_naik.Text:='';
edt_turun.Text:='';
Form3.Hide;
Form1.Show;
end;

procedure TForm3.btn4Click(Sender: TObject);
begin
if(Application.MessageBox('Apakah Anda Yakin Ingin Mengakhiri Program Ini?','CLOSE',MB_YesNo)=ID_Yes)then
begin
Application.Terminate;
end;
end;

end.
