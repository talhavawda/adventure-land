unit Home;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, ExtCtrls, StdCtrls,
 pngimage,  Buttons, dmAdventureLand_u, Grids, DBGrids;

type
  TfrmHome = class(TForm)
    pnlHome: TPanel;
    imgAdventure: TImage;
    imgAdmin: TImage;
    imgEmployee: TImage;
    imgVisitor: TImage;
    lblAdmin: TLabel;
    lblVisitor: TLabel;
    lblEmployee: TLabel;
    pnlSystem: TPanel;
    lblDateTime: TLabel;
    btnExit: TBitBtn;
    btnAbout: TBitBtn;
    btnHelp: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);

    procedure btnExitClick(Sender: TObject);
    procedure btnAboutClick(Sender: TObject);
    procedure imgAdminClick(Sender: TObject);
    procedure imgEmployeeClick(Sender: TObject);
    procedure imgVisitorClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  frmHome: TfrmHome;
  tmrDateTime:TTimer;  //dynamic component (Timer)


implementation

{$R *.dfm}

uses SplashScreen, About, Login;



procedure TfrmHome.btnExitClick(Sender: TObject);
begin
frmHome.Close; //call form OnClose event
end;

procedure TfrmHome.btnHelpClick(Sender: TObject);
var
sHelp:string;
begin
sHelp:='                              HELP - Home Screen'+#13+#13;
sHelp:=sHelp+'1.Click on a user icon to proceed'+#13;
sHelp:=sHelp+'     a. Admin and Employee accounts are password protected'+#13;
sHelp:=sHelp+'     b. The visitor will need his Entrance Ticket Number to proceed'+#13+#13;
sHelp:=sHelp+'2.Click on ''About'' to show the About screen'+#13+#13;
sHelp:=sHelp+'3.Click on ''Exit'' to exit the application';

ShowMessage(sHelp);
end;

procedure TfrmHome.btnAboutClick(Sender: TObject);
begin
frmAbout.ShowModal;
end;

procedure TfrmHome.FormActivate(Sender: TObject);
begin
ShowMessage('Welcome to Adventure Land Amusement Park!');



end;

procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if MessageDlg('Are you sure you want to exit Adventure Land?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
    Application.Terminate
  else
    Application.Run;
end;

procedure TfrmHome.FormCreate(Sender: TObject);
begin
frmHome.AutoSize:=True; //doesnt allow resizing by user


//dynamically instantiated a timer
tmrDateTime:=TTimer.Create(frmHome);
tmrDateTime.Interval:=1000;
tmrDateTime.OnTimer:=tmrDateTimeTimer;

end;

procedure TfrmHome.FormShow(Sender: TObject);
begin
frmSplashScreen.ShowModal;
end;

procedure TfrmHome.imgAdminClick(Sender: TObject);
begin
frmlogin.cmbUser.ItemIndex:= 0;

frmLogin.ShowModal;
end;

procedure TfrmHome.imgEmployeeClick(Sender: TObject);
begin
frmlogin.cmbUser.ItemIndex:= 1;

frmLogin.ShowModal;
end;

procedure TfrmHome.imgVisitorClick(Sender: TObject);
begin
frmLogin.cmbUser.ItemIndex:=2;

frmLogin.ShowModal;
end;

procedure TfrmHome.tmrDateTimeTimer(Sender: TObject);
begin
lblDatetime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
