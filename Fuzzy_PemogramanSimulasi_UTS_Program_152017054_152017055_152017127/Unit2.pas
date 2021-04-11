unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, Menus, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    lbl1: TLabel;
    img1: TImage;
    img2: TImage;
    btn2: TBitBtn;
    btn3: TBitBtn;
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
uses Unit1;

{$R *.dfm}

procedure TForm2.btn2Click(Sender: TObject);
begin
if(Application.MessageBox('Apakah Anda Yakin Ingin Mengakhiri Program Ini?','CLOSE',MB_YesNo)=ID_Yes)then
begin
Application.Terminate;
end;
end;

procedure TForm2.btn3Click(Sender: TObject);
begin
Form2.Hide;
Form1.Show;
end;

end.
