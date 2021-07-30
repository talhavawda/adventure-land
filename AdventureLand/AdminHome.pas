unit AdminHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
 pngimage;

type
  TfrmAdminHome = class(TForm)
    Panel2: TPanel;
    lblDateTime: TLabel;
    tmrDateTime: TTimer;
    btnLogout: TBitBtn;
    lblUsername: TLabel;
    Panel1: TPanel;
    btnHelp: TBitBtn;
    imgReports: TImage;
    imgManage: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure imgManageClick(Sender: TObject);
    procedure imgReportsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminHome: TfrmAdminHome;

implementation

{$R *.dfm}

uses Home, AdminManage, AdminReports;



procedure TfrmAdminHome.btnHelpClick(Sender: TObject);
var
sHelp:string;
begin
sHelp:='                              HELP - Admin Home Screen'+#13+#13;
sHelp:=sHelp+'1. Select an icon to proceed'+#13+#13;
sHelp:=sHelp+'2. Click ''Logout'' to return to the Home Screen'+#13+#13;

ShowMessage(sHelp);
end;

procedure TfrmAdminHome.btnLogoutClick(Sender: TObject);
begin
frmAdminHome.Close;
//no need to rewrite cookies.txt because it'll get rewritten when new user logins in
end;

procedure TfrmAdminHome.FormCreate(Sender: TObject);
begin
frmAdminHome.AutoSize:=True;
end;

procedure TfrmAdminHome.imgManageClick(Sender: TObject);
begin
frmAdminManage.ShowModal;
end;



procedure TfrmAdminHome.imgReportsClick(Sender: TObject);
begin
frmAdminReports.ShowModal;
end;

procedure TfrmAdminHome.tmrDateTimeTimer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.

