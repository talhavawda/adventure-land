unit SplashScreen;

interface

uses
  Windows, Messages, SysUtils,Variants, Classes, Graphics,
  Controls, Forms, Dialogs, jpeg, ExtCtrls,
  ComCtrls, StdCtrls,pngimage;

type
  TfrmSplashScreen = class(TForm)
    tmrSplashScreen: TTimer;
    pgbSplashScreen: TProgressBar;
    lblSplashScreen: TLabel;
    imgAdventureLand: TImage;
    lblCopyright: TLabel;
    lblVersion: TLabel;
    procedure tmrSplashScreenTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSplashScreen: TfrmSplashScreen;
 // iStep:integer;                     //variable
     k:integer;
implementation

{$R *.dfm}



procedure TfrmSplashScreen.FormActivate(Sender: TObject);
begin
lblSplashScreen.Parent := pgbSplashScreen;
lblSplashScreen.AutoSize := False;
lblSplashScreen.Transparent := True;
lblSplashScreen.Top :=  0;
lblSplashScreen.Left :=  125;
lblSplashScreen.Width := pgbSplashScreen.ClientWidth;
lblSplashScreen.Height := pgbSplashScreen.ClientHeight;
lblSplashScreen.Alignment := taLeftJustify;
lblSplashScreen.Layout := tlCenter;

//iStep:=1;
  k:=0;

end;

procedure TfrmSplashScreen.tmrSplashScreenTimer(Sender: TObject);
begin
pgbSplashScreen.StepIt;

{if iStep=1 then
  begin
  lblSplashScreen.Caption:='Loading.';
  Inc(iStep);
  end
     else
     if iStep=2 then
     begin
     lblSplashScreen.Caption:='Loading..';
     Inc(iStep);
     end
        else
        if iStep=3 then
        begin
        lblSplashScreen.Caption:='Loading...';
        iStep:=1;
        end;
}


      k := k + 1;
      lblSplashScreen.Caption := 'Loading '+IntToStr(k)+'%';

      if (k = 100) then   // pgbSplashScreen.Step=1 & pgbSplashScreen.Max=100
      begin
            tmrSplashScreen.Enabled := false;
            frmSplashScreen.Close;
            frmSplashScreen.Release;

{if pgbSplashScreen.Position=pgbSplashScreen.Max then
  begin
    tmrSplashScreen.Enabled:=False;
    frmSplashScreen.Close;
    frmSplashScreen.Release;
  end;
}

end;
end;
end.
