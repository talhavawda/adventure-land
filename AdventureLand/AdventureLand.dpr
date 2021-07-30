program AdventureLand;

uses
  Forms,
  Home in 'Home.pas' {frmHome},
  SplashScreen in 'SplashScreen.pas' {frmSplashScreen},
  About in 'About.pas' {frmAbout},
  Login in 'Login.pas' {frmLogin},
  dmAdventureLand_u in 'dmAdventureLand_u.pas' {dmAdventureLand: TDataModule},
  AdminHome in 'AdminHome.pas' {frmAdminHome},
  EmployeeHome in 'EmployeeHome.pas' {frmEmployeeHome},
  Visitor in 'Visitor.pas' {frmVisitor},
  AdminManage in 'AdminManage.pas' {frmAdminManage},
  AdminReports in 'AdminReports.pas' {frmAdminReports},
  EmployeeTickets in 'EmployeeTickets.pas' {frmEmployeeTickets},
  clsEntranceTicket in 'clsEntranceTicket.pas',
  EASendMailObjLib_TLB in 'EASendMailObjLib_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := False;    //original was True
  Application.Title := 'Adventure Land';
  Application.CreateForm(TfrmHome, frmHome);
  Application.CreateForm(TfrmSplashScreen, frmSplashScreen);
  Application.CreateForm(TfrmAbout, frmAbout);
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TdmAdventureLand, dmAdventureLand);
  Application.CreateForm(TfrmAdminHome, frmAdminHome);
  Application.CreateForm(TfrmEmployeeHome, frmEmployeeHome);
  Application.CreateForm(TfrmVisitor, frmVisitor);
  Application.CreateForm(TfrmAdminManage, frmAdminManage);
  Application.CreateForm(TfrmAdminReports, frmAdminReports);
  Application.CreateForm(TfrmEmployeeTickets, frmEmployeeTickets);
  Application.Run;
end.
