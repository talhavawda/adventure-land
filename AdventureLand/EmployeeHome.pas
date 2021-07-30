unit EmployeeHome;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  pngimage, Grids, DBGrids;

type
  TfrmEmployeeHome = class(TForm)
    Panel2: TPanel;
    lblDateTime: TLabel;
    lblUsername: TLabel;
    btnLogout: TBitBtn;
    Timer1: TTimer;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    Image1: TImage;
    Image3: TImage;
    Label3: TLabel;
    Label4: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployeeHome: TfrmEmployeeHome;

implementation

{$R *.dfm}

uses Visitor, Login, EmployeeTickets;



procedure TfrmEmployeeHome.BitBtn2Click(Sender: TObject);
var
sHelp:string;
begin
sHelp:='                              HELP - Employee Home Screen'+#13+#13;
sHelp:=sHelp+'1. Select an icon to proceed'+#13+#13;
sHelp:=sHelp+'2. Click ''Logout'' to return to the Home Screen'+#13+#13;



ShowMessage(sHelp);
end;

procedure TfrmEmployeeHome.btnLogoutClick(Sender: TObject);
begin
frmEmployeeHome.Close;
end;

procedure TfrmEmployeeHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
frmEmployeeHome.Close;
end;

procedure TfrmEmployeeHome.FormCreate(Sender: TObject);
begin
frmEmployeeHome.AutoSize:=True;
end;

procedure TfrmEmployeeHome.Image1Click(Sender: TObject);
begin
frmEmployeeTickets.ShowModal;

end;



procedure TfrmEmployeeHome.Image3Click(Sender: TObject);
begin

frmVisitor.ShowModal;


end;

procedure TfrmEmployeeHome.Timer1Timer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
