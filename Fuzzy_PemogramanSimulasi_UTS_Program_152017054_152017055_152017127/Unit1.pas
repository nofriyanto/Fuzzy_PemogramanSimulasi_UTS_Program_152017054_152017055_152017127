unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg, Buttons;

type
  TForm1 = class(TForm)
    pnl1: TPanel;
    lbl1: TLabel;
    img1: TImage;
    lbl2: TLabel;
    btn3: TBitBtn;
    btn1: TBitBtn;
    btn2: TBitBtn;
    img2: TImage;
    img3: TImage;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit3,Unit2;



{$R *.dfm}

procedure TForm1.btn1Click(Sender: TObject);
begin
 Form1.Hide;
 Form3.Show;
end;

procedure TForm1.btn2Click(Sender: TObject);
begin
if(Application.MessageBox('Apakah Anda Yakin Ingin Mengakhiri Program Ini?','CLOSE',MB_YesNo)=ID_Yes)then
begin
Application.Terminate;
end;
end;

procedure TForm1.btn3Click(Sender: TObject);
begin
Form1.Hide;
Form2.Show;
end;

end.
