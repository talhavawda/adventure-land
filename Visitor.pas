unit Visitor;

interface
//included EASendMailObjLib_TLB to project in uses so that you can send an email frm the application
uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, pngimage, jpeg, Spin,
  Grids, DBGrids, GIFImg, dmAdventureLand_u, EASendMailObjLib_TLB;

type
  TfrmVisitor = class(TForm)
    pnlDisplay: TPanel;
    lblDateTime: TLabel;
    Timer1: TTimer;
    pgcVisitor: TPageControl;
    tbsWelcome: TTabSheet;
    tbsRides: TTabSheet;
    lblUser: TLabel;
    Image1: TImage;
    btnLogout: TBitBtn;
    Label3: TLabel;
    Image2: TImage;
    dbgRide: TDBGrid;
    Label5: TLabel;
    btnRdetails: TButton;
    GroupBox1: TGroupBox;
    rgpRFilter: TRadioGroup;
    GroupBox2: TGroupBox;
    Label6: TLabel;
    cmbRateRide: TComboBox;
    cmbRides: TComboBox;
    spnRideRating: TSpinEdit;
    Label7: TLabel;
    btnRideRating: TButton;
    tbsFeedback: TTabSheet;
    btnRides: TButton;
    btnFeedback: TButton;
    grpSelect: TGroupBox;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    spnParkRating: TSpinEdit;
    btnParkRating: TButton;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    btnSuggestion: TButton;
    Image3: TImage;
    Label10: TLabel;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    GroupBox6: TGroupBox;
    GroupBox7: TGroupBox;
    lblName: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtCategory: TEdit;
    grpViewRide: TGroupBox;
    BitBtn6: TBitBtn;
    edtAdrenaline: TEdit;
    edtCost: TEdit;
    Label1: TLabel;
    btnFirst: TBitBtn;
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    btnLast: TBitBtn;
    memDescription: TMemo;
    btnClear: TButton;
    memParkInfo: TMemo;
    memTimes: TMemo;
    memSuggestion: TMemo;
    redPrices: TRichEdit;
    procedure Timer1Timer(Sender: TObject);
    procedure btnLogoutClick(Sender: TObject);
    procedure btnRidesClick(Sender: TObject);
    procedure btnFeedbackClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnLastClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure tbsRidesShow(Sender: TObject);
    procedure rgpRFilterClick(Sender: TObject);
    procedure btnRdetailsClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnSuggestionClick(Sender: TObject);
    procedure tbsFeedbackShow(Sender: TObject);
    procedure btnParkRatingClick(Sender: TObject);
    procedure btnRideRatingClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmVisitor: TfrmVisitor;
   sArrEntrancePrices:array[1..3] of string;  //string bec. no calc. done in this form. only displaying

implementation

{$R *.dfm}

uses Home, Login;




procedure TfrmVisitor.btnFirstClick(Sender: TObject);
begin
dmAdventureLand.tblRide.First;
end;

procedure TfrmVisitor.btnLastClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Last;
end;

procedure TfrmVisitor.btnLogoutClick(Sender: TObject);
begin
frmVisitor.Close;

end;

procedure TfrmVisitor.btnNextClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Next;
end;

procedure TfrmVisitor.btnPreviousClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Prior;
end;

procedure TfrmVisitor.btnRideRatingClick(Sender: TObject);
var
iRideID,iRideRating:integer;
sRideName:string;
vrtRide:variant;
begin
//validation: MinValue=0, MaxValue=10

if cmbRateRide.ItemIndex=1 then
  begin
    ShowMessage('Please select a ride to rate');
    Exit;
  end;

sRideName:=cmbRateRide.Items[cmbRateRide.ItemIndex];

iRideRating:=spnRideRating.Value;

with dmAdventureLand do
  begin
    with tblRide do
      begin
        Open;
        First;

        while not eof do
          begin
          if sRideName=tblRide['Ride Name'] then
            begin
              iRideID:=tblRide['Ride ID'];
            end;
          Next;
          end;
        Close;
      end;


    //vrtRide:=tblRide.Lookup('Ride Name',sRideName,'Ride Name');
    //tblRide.Close;
    //ShowMessage('');
    //sRideName:=string(vrtRide[0]);

    tblFeedback.Append;   //Feedback ID is PK and auto-generated therefore no need to give it a value
    tblFeedback['Entrance Ticket ID']:=frmLogin.getCurrentUser('ID'); //GetCurrentUser returns a string value
    tblFeedback['Category']:='Ride Feedback';
    tblFeedback['Rating']:=IntToStr(iRideRating); //Rating is a Short Text data type in Access
    tblFeedback['Ride ID']:=iRideID;
    tblFeedback.Post;
  end;

ShowMessage('Thank You for your feedback.'+#13+'We appreciate it greatly.');
spnParkRating.Value:=0;
cmbRateRide.ItemIndex:=-1;
end;

procedure TfrmVisitor.btnRidesClick(Sender: TObject);
begin
pgcVisitor.ActivePage := tbsRides;
end;

procedure TfrmVisitor.btnParkRatingClick(Sender: TObject);
var
iParkRating:integer;
begin
//validation: MinValue=0, MaxValue=10

iParkRating:=spnParkRating.Value;

with dmAdventureLand do
  begin
    tblFeedback.Append;   //Feedback ID is PK and auto-generated therefore no need to give it a value
    tblFeedback['Entrance Ticket ID']:=frmLogin.getCurrentUser('ID'); //GetCurrentUser returns a string value
    tblFeedback['Category']:='Park Feedback';
    tblFeedback['Rating']:=IntToStr(iParkRating); //Rating is a Short Text data type in Access
    //No value for Ride ID field. because thsi is Park Feeback. Ride ID is not a required field
    tblFeedback.Post;
  end;

ShowMessage('Thank You for your feedback.'+#13+'We appreciate it greatly.');
spnParkRating.Value:=0;
end;

procedure TfrmVisitor.btnSuggestionClick(Sender: TObject);
var
sSuggestion, sVisitorEmail, sBody:string;
oSmtp:TMail;
begin
sSuggestion:=memSuggestion.Text;

if sSuggestion='' then
  begin
    ShowMessage('Please enter your suggestions, complaints or compliments in the space provided');
    Exit;
  end;

with dmAdventureLand do
  begin
    tblSuggestion.Append;  //Suggestion ID is PK and auto-generated therefore no need to give it a value
    tblSuggestion['Entrance Ticket ID']:=frmLogin.getCurrentUser('ID'); //GetCurrentUser returns a string value
    tblSuggestion['Suggestion']:=sSuggestion;
    tblSuggestion.Post;
  end;

//included EASendMailObjLib_TLB to project in uses so that you can send an email frm the application

//the coding below is  used for email functionality
//it works using EASendMail, this adds a seperate class to the current project

sVisitorEmail:='';

repeat
sVisitorEmail:=InputBox('Visitor Email','Please enter your email address for us to respond to your feedback','');
until not (sVisitorEmail='') ;

  oSmtp := TMail.Create(Application);

  //Before using Mail, LicenseCode must be assigned.
  oSmtp.LicenseCode := 'TryIt';


  // Set your sender email address
  oSmtp.FromAddr := 'feedback.adventureland@gmail.com';



  // Add recipient email address
  oSmtp.AddRecipientEx( sVisitorEmail, 0);

  // Set email subject
  oSmtp.Subject := 'Visitor Feedback';

  // Set email body

  sBody:='Hi, this email serves as confirmation that we, Adventure Land Amusement Park, have received the feedback that you have provided.'+#13+#13;
  sBody:=sBody+'Your feedback is as follows:'+#13;
  sBody:=sBody+''' '+sSuggestion+''''+#13+#13;
  sBody:=sBody+'Thank You for the feedback that you have provided. We appreciate it. We will consider your suggestions and/or complaints and will try to follow it up.'+#13+#13;
  sBody:=sBody+'Yours sincerely'+#13+'Adventure Land Amusement Park';

  oSmtp.BodyText := sBody;

  // Your SMTP server address
  oSmtp.ServerAddr := 'smtp.gmail.com';

  //oSmtp.ServerPort:=465;


  // User and password for ESMTP authentication

  oSmtp.UserName := 'feedback.adventureland@gmail.com';
  oSmtp.Password := 'adventureland7';

  // If your SMTP server requires SSL connection, please add this line
  oSmtp.SSL_init();

  ShowMessage( 'start to send email ...' );  // this requires for the user to wait a minute a two

  if oSmtp.SendMail() = 0 then
  begin
    ShowMessage( 'We have received your feedback and will respond shortly.' )  ;
  end
  else
  begin
    ShowMessage( 'Failed to receive your feedback with the following error: '
    + oSmtp.GetLastErrDescription());
  end;

memSuggestion.Lines.Clear;
end;

procedure TfrmVisitor.BitBtn6Click(Sender: TObject);
var
sHelp:string;
begin

case iUser of
1:  //Employee
  begin
    sHelp:='                                        HELP - Park Info Screen'+#13+#13;
    sHelp:=sHelp+'1. Click a button at the top left corner to switch between pages.'+#13+#13;
    sHelp:=sHelp+'2. Rides:'+#13;
    sHelp:=sHelp+'    a. Navigate the Ride table by either clicking on the grid or by using the navigate buttons.'+#13;
    sHelp:=sHelp+'    b. Select a radio button to filter the rides by category.'+#13;
    sHelp:=sHelp+'    c. Select a ride from the combo box and click ''View Ride Details'' to view that ride''s details.'+#13+#13;
    sHelp:=sHelp+'3. Click ''Back'' to return to the Employee Home Screen';
  end;
2:  //Visitor
  begin
    sHelp:='                                        HELP - Visitor Screen'+#13+#13;
    sHelp:=sHelp+'1. Click a button at the top left corner to switch between pages.'+#13+#13;
    sHelp:=sHelp+'2. Rides:'+#13;
    sHelp:=sHelp+'    a. Navigate the Ride table by either clicking on the grid or by using the navigate buttons.'+#13;
    sHelp:=sHelp+'    b. Select a radio button to filter the rides by category.'+#13;
    sHelp:=sHelp+'    c. Select a ride from the combo box and click ''View Ride Details'' to view that ride''s details.'+#13+#13;
    sHelp:=sHelp+'3. Feedback:'+#13;
    sHelp:=sHelp+'    a. Rate a ride by selecting a ride from the combo box and giving it a rating from 0 to 10.'+#13;
    sHelp:=sHelp+'    b. Rate your visit to Adventure Land by selecting a value from 0 to 10.'+#13;
    sHelp:=sHelp+'    c.  Provide your suggestions, complaints or compliments by typing in the area provided.'+#13;
    sHelp:=sHelp+'    d. In each case, click ''Submit'' to submit your ratings and/or feedback.'+#13+#13;
    sHelp:=sHelp+'4. Click ''Logout'' to return to the Home Screen';
  end;
end;



ShowMessage(sHelp);
end;

procedure TfrmVisitor.btnRdetailsClick(Sender: TObject);
var
sRideName:string;
begin

if cmbRides.ItemIndex=-1 then
  begin
    ShowMEssage('Please select a Ride from the combo box');
    Exit;
  end;

sRideName:=cmbRides.Items[cmbRides.ItemIndex];

with dmAdventureLand do
  begin
    with tblRide do
      begin
        Open;
        First;
        while not eof do
          begin
            if sRideName=tblRide['Ride Name'] then
              begin
                lblName.Caption:=tblRide['Ride Name'];
                edtCategory.Text:=tblRide['Category'];
                edtAdrenaline.Text:=tblRide['Adrenaline Rush'];
                edtCost.Text:=tblRide['Ride Cost'];
                memDescription.Text:='';
                memDescription.Text:=tblRide['Description'];
                grpViewRide.Visible:=True;
                Exit;
              end;
            Next;
          end;
        Close;
      end;
  end;

end;

procedure TfrmVisitor.btnClearClick(Sender: TObject);
begin
cmbRides.ItemIndex:=-1;
lblName.Caption:='';
edtCategory.Clear;
edtAdrenaline.Clear;
edtCost.Clear;
memDescription.Text:='';

grpViewRide.Visible:=False;
end;

procedure TfrmVisitor.btnFeedbackClick(Sender: TObject);
begin
pgcVisitor.ActivePage := tbsFeedback;
end;

procedure TfrmVisitor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if frmLogin.cmbUser.ItemIndex=2 then
  begin
    ShowMessage('Thank You for visiting Adventure Land.'+#13+'Have a great day!');
    frmHome.Show;
  end;


//form will close after above coding is executed because event is FormClose
end;

procedure TfrmVisitor.FormCreate(Sender: TObject);
begin
frmVisitor.AutoSize:=True;
end;

procedure TfrmVisitor.FormShow(Sender: TObject);
var
iUser, I:integer;
txtEntrancePrice,txtRidePrice:TextFile;
sRidePrice:string;

begin
//redParkInfo.Clear;        //no need to clear bec. loading from file -> will overwrite
//redTimesPrices.Clear;

redPrices.Paragraph.TabCount:=1;
redPrices.Paragraph.Tab[0]:=45; //1st tab (1st #9)



if FileExists('Park Info.txt')=False then
  begin
    ShowMessage('Park Info not found');    //cant use Exit if not found because then wont be able to set properties if txt not found
  end
    else
      begin
        memParkInfo.Lines.LoadFromFile('Park Info.txt');
      end;

if FileExists('Park Times.txt')=False then
  begin
    ShowMessage('Park Times not found');    //cant use Exit if not found because then wont be able to set properties if txt not found
  end
    else
      begin

        memTimes.Lines.LoadFromFile('Park Times.txt');
      end;


redPrices.Lines.Clear;

if FileExists('Entrance Ticket Price.txt')=False then
  begin
    ShowMessage('Entrance Ticket Price not found');
  end
    else
      begin
       AssignFile(txtEntrancePrice,'Entrance Ticket Price.txt');
       Reset(txtEntrancePrice);

       for I := 1 to 3 do
        begin
          readln(txtEntrancePrice,sArrEntrancePrices[I]);
        end;

       CloseFile(txtEntrancePrice);

       redPrices.Lines.Add('Adult:       '+#9+'R'+sArrEntrancePrices[1]);
       redPrices.Lines.Add('Child:       '+#9+'R'+sArrEntrancePrices[2]);
       redPrices.Lines.Add('Toddler:     '+#9+'R'+sArrEntrancePrices[3]);

      end;

if FileExists('Ride Ticket Price.txt')=False then
  begin
    ShowMessage('Ride Ticket Price not found');
  end
    else
      begin
       AssignFile(txtRidePrice,'Ride Ticket Price.txt');
       Reset(txtRidePrice);
       readln(txtRidePrice,sRidePrice);  //only need to read in the first line
       CloseFile(txtRidePrice);

       redPrices.Lines.Add('');
       redPrices.Lines.Add('Ride Ticket: '+#9+'R'+sRidePrice);
      end;


iUser:=frmLogin.cmbUser.ItemIndex;

case iUser of

1:
  begin
    frmVisitor.pgcVisitor.Pages[2].TabVisible:=False;
    frmVisitor.grpSelect.Visible:=False;
    frmVisitor.btnLogout.Caption:='Back';
    frmVisitor.lblUser.Caption:='Employee: '+frmLogin.getCurrentUser('Name');  //will display name of employee
  end;

2:
  begin
    frmVisitor.pgcVisitor.Pages[2].TabVisible:=true;
    frmVisitor.grpSelect.Visible:=True;
    frmVisitor.btnLogout.Caption:='Logout';
    frmVisitor.lblUser.Caption:='Ticket Number : '+frmLogin.getCurrentUser('');  //no need for parameter (Id/Name) for visitor
  end;

end;

pgcVisitor.ActivePage := tbsWelcome;
(Image4.Picture.Graphic as TGIFImage).Animate := True;



end;

procedure TfrmVisitor.rgpRFilterClick(Sender: TObject);
var
iIndex:integer;
sCategory:string;
begin

if rgpRFilter.ItemIndex=-1 then
  begin
    ShowMessage('Please select a category to search by');
    Exit;
  end;

iIndex:=rgpRFilter.ItemIndex;
sCategory:=rgpRfilter.Items[rgpRFilter.ItemIndex];

with dmAdventureLand do
  begin
    with tblRide do
      begin
        case iIndex of
        0: Filtered:=False;
        1,2,3,4:
          begin
            Filter:='Category LIKE '''+sCategory+'''';
            Filtered:=True;
          end;
        end;
      end;
  end;


end;

procedure TfrmVisitor.tbsFeedbackShow(Sender: TObject);
begin

cmbRateRide.Items.Clear;

with dmAdventureLand do
  begin
    with tblRide do
      begin
        Open;
        First;
        while not Eof do
          begin
          cmbRateRide.Items.Add(tblRide['Ride Name']);
          Next;
          end;
        Close;
      end;
  end;

cmbRateRide.ItemIndex:=-1;

memSuggestion.Lines.Clear;

spnRideRating.Value:=0;
spnParkRating.Value:=0;
end;

procedure TfrmVisitor.tbsRidesShow(Sender: TObject);
begin
rgpRFilter.ItemIndex:=-1;
dmAdventureLand.tblRide.Filtered:=False;

cmbRides.Items.Clear;

with dmAdventureLand do
  begin
    with tblRide do
      begin
        Open;
        First;
        while not Eof do
          begin
          cmbRides.Items.Add(tblRide['Ride Name']);
          Next;
          end;
        Close;
      end;
  end;

cmbRides.ItemIndex:=-1;

dmAdventureLand.tblRide.Active:=True;

lblName.Caption:='';
edtCategory.Clear;
edtAdrenaline.Clear;
edtCost.Clear;
memDescription.Text:='';

grpViewRide.Visible:=False;
end;

procedure TfrmVisitor.Timer1Timer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
