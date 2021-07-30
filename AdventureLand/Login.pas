unit Login;

interface

uses
  Windows, Messages,SysUtils,Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  dmAdventureLand_u, Grids, DBGrids;

type
  TfrmLogin = class(TForm)
    pnlSystem: TPanel;
    btnExit: TBitBtn;
    btnHelp: TBitBtn;
    lblDateTime: TLabel;
    tmrDateTime: TTimer;
    pnlLogin: TPanel;
    cmbUsername: TComboBox;
    edtPassword: TEdit;
    lblUserName: TLabel;
    lblPassword: TLabel;
    lblUserType: TLabel;
    cmbUser: TComboBox;
    btnLogin: TBitBtn;
    chbShowPassword: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure tmrDateTimeTimer(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure chbShowPasswordClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);

    //user-defined methods
    procedure SetProperties (iUser:integer);
    procedure PopulateUsernames (iUser:integer);
    procedure setCurrentUser (sUsername:string);


    function getCurrentUser (sType:string) :string;
    procedure btnHelpClick(Sender: TObject); //sType is either ID or Name



  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;
  iUser,iTries:integer;       //global variables

implementation

{$R *.dfm}

uses AdminHome, Home, EmployeeHome, Visitor;

procedure TfrmLogin.SetProperties (iUser:integer);  //user defined procedure
begin

case iUser of   //if user is Admin or Employee
  0,1:  
    begin  
      cmbUser.Enabled:= False;
      lblUsername.Caption:='Username:';
      cmbUsername.Clear;
      cmbUsername.Text:='Select username';
      lblPassword.Visible:=True;
      edtPassword.Visible:=True;
      edtPassword.PasswordChar := '*';
      edtPassword.Clear;
      chbShowPassword.Visible:=True;
      chbShowPassword.Checked:=False;
      btnLogin.Top:=181;
      btnLogin.Caption:='Login';
      pnlLogin.Height:=226;
      pnlSystem.Top:=226;
      Height:=305;
    end;
  2:        //if user is visitor -> hide password field, change captions, make form smaller
    begin
      cmbUser.Enabled:= False;
      lblUsername.Caption:='Ticket Number:';
      cmbUsername.Clear;
      cmbUsername.Text:='Select Ticket Number';
      lblPassword.Visible:=False;
      edtPassword.Visible:=False;
      chbShowPassword.Visible:=False;
      btnLogin.Top:=120;
      btnLogin.Caption:='Proceed';
      pnlLogin.Height:=166;
      pnlSystem.Top:=166;
      Height:=245;
    end;
end;

end;

procedure TfrmLogin.PopulateUsernames(iUser: integer);  //user defined procedure
begin

//add usernames based on user type (admin/employee)
case iUser of
  0:
    begin  
      with dmAdventureLand do
        begin
          tblAdmin.Open;
          tblAdmin.Refresh;
          tblAdmin.First;
          while not tblAdmin.Eof do
            begin
              cmbUsername.Items.Add(tblAdmin['Username']);
              tblAdmin.Next;
            end;
          tblAdmin.Close;
        end;
    end;
  1:
    begin
      with dmAdventureLand do
        begin
          tblEmployee.Open;
          tblEmployee.Refresh;
          tblEmployee.First;
          while not tblEmployee.Eof do
            begin
              cmbUsername.Items.Add(tblEmployee['Username']);
              tblEmployee.Next;
            end;
          tblEmployee.Close;
        end;
    end;
  2:
    begin
      //populate TicketID combo box with Entrance Ticket ID for current day only (Entrance Ticket ID is a day-pass)
      {
        Entrance Ticket ID stored in table Entrance Ticket but Entry Date
        is stored in table Entrance Transaction so will  have to link
        the 2 tables together to get the date.
        Will have to link the child record with the parent record
        (will have to match each Entrance Transaction ID in tbl Entrance Transaction (PK)
        with the Entrance Transaction ID in tbl Entrance Ticket (FK) )
        and if the Entry Date is today's date then display the Entrance Ticket ID
        in table Entrance Ticket in the combobox
      }

      with dmAdventureLand do
        begin
        tblEntranceTicket.Open;
        tblEntranceTicket.Refresh;
        tblEntranceTicket.First;

        while not tblEntranceTicket.Eof do
          begin
            tblEntranceTransaction.Open;
            tblEntranceTransaction.Refresh;
            tblEntranceTransaction.First;
            while not tblEntranceTransaction.Eof do
              begin
                if (tblEntranceTicket['Entrance Transaction ID']=tblEntranceTransaction['Entrance Transaction ID']) and (tblEntranceTransaction['Entry Date']=DateToStr(Now))  then
                  begin
                    cmbUsername.Items.Add(tblEntranceTicket['Entrance Ticket ID']);
                  end;
                tblEntranceTransaction.Next;
              end;
          tblEntranceTicket.Next;
          tblEntranceTransaction.Close;
          end;
        tblEntranceTicket.Close;;
        end;

      //coding if displaying all Entrance Ticket ID's not just for today only but display all tickets
      {
        with dmAdventureLand do
              begin
                tblEntranceTicket.Open;
                tblEntranceTicket.First;
                while not tblEntranceTicket.Eof do
                  begin
                    cmbUsername.Items.Add(tblEntranceTicket['Entrance Ticket ID']);
                    tblEntranceTicket.Next;
                  end;
                tblEntranceTicket.Close;;
              end;
      }
    end;
end;

cmbUsername.ItemIndex:=-1; //initialise

end;

procedure TfrmLogin.setCurrentUser(sUsername: string);  //user defined procedure
var
txtUser:TextFile;
begin
AssignFile(txtUser,'cookie.txt');
Rewrite(txtUser);
Writeln(txtUser,sUsername);  //note that usernames are unique -> ensured when inserting/editing
CloseFile(txtUser);
end;

function TfrmLogin.getCurrentUser (sType:string) : string; //user-defined function  //sType is either ID or Name
//ID will be used when generating tickets (Employee)
//Name (full name) of user (admin/employee) will be displayed on each form
//note that usernames are unique
var
txtUser:TextFile;
sUser:string;
vrtUserDetails:variant;
begin

if FileExists('cookie.txt')=False then   //check if file exists
  begin
    ShowMessage('Error. Current user not found.');
    Exit;
  end;

//get username
AssignFile(txtUser,'cookie.txt');
Reset(txtUser);
Readln(txtUser,sUser);
CloseFile(txtUser);

case iUser of
0:     //admin
  begin
    with dmAdventureLand do
      begin
        tblAdmin.Open;
        vrtUserDetails:=tblAdmin.Lookup('Username',sUser,'Admin ID;First Name(s);Surname');  //find a match for username and return the User's name
        tblAdmin.Close;
      end;

      if sType='ID' then
        begin
          Result:=string(vrtUserDetails[0]);   //Admin ID of user (admin)
        end
          else
            if sType='Name' then
              begin
                Result:=string(vrtUserDetails[1])+' '+string(vrtUserDetails[2]); //name and surname of user
              end;
  end;

1:
  begin
    with dmAdventureLand do
      begin
        tblEmployee.Open;
        vrtUserDetails:=tblEmployee.Lookup('Username',sUser,'Employee ID;First Name(s);Surname'); //find a match for username and return the User's name
        tblEmployee.Close;
      end;

      if sType='ID' then
        begin
          Result:=string(vrtUserDetails[0]);  //Employee ID of user (employee)
        end
          else
            if sType='Name' then
              begin
                Result:=string(vrtUserDetails[1])+' '+string(vrtUserDetails[2]); //name and surname of user
              end;
  end;

2:    //for visitor, result is the Ticket ID
  begin
    Result:=sUser;
  end;

end;

end;



procedure TfrmLogin.btnExitClick(Sender: TObject);
begin
frmLogin.Close; //call form OnClose event
end;

procedure TfrmLogin.btnHelpClick(Sender: TObject);
var
//help text
sHelp:string;
begin
sHelp:='                              HELP - Login Screen'+#13+#13;
sHelp:=sHelp+'1. Admin / Employee:'+#13;
sHelp:=sHelp+'     a. Select your username from the combo box'+#13;
sHelp:=sHelp+'     b. Enter your password in the field provided'+#13;
sHelp:=sHelp+'     c. Click on ''Login'' to proceed'+#13+#13;
sHelp:=sHelp+'2. Visitor: Select your Ticket Number and click ''Proceed'' to proceed'+#13+#13;
sHelp:=sHelp+'3. Click on ''Close'' to return to the Home Screen';

ShowMessage(sHelp); //display help
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
var
sUsername,sPassword,sTicketNumber:string; //local variables
begin
//ensure username selected and password entered
case iUser of
0,1:
  begin
    if (cmbUsername.ItemIndex=-1) and (edtPassword.Text='')  then
      begin
        ShowMessage('Please select a username and enter a password');
        Exit;
      end
       else
          if cmbUsername.ItemIndex=-1 then
           begin
              ShowMessage('Please select a username');
              Exit;
           end
              else
                if edtPassword.Text='' then
                 begin
                    ShowMessage('Please enter a password');
                    Exit;
                  end;

    sUsername:=cmbUsername.Items[cmbUsername.ItemIndex];
    sPassword:=edtPassword.Text;


    case iUser of
      0:
        begin
          with dmAdventureLand do
            begin
              tblAdmin.Open;
              tblAdmin.First;

              while not tblAdmin.Eof do //find a match in database
                begin
                  if (tblAdmin['Username']=sUsername) and (tblAdmin['Password']=sPassword) then  //if match found, go to admin home screen
                    begin
                    setCurrentUser(sUsername);
                    cmbUsername.Clear;
                    edtPassword.Clear;
                    frmLogin.Close;
                    frmAdminHome.lblUsername.Caption:='Admin: '+getCurrentUser('Name');
                    frmAdminHome.ShowModal;
                    Exit;
                   end;
                  tblAdmin.Next;
                end;
              tblAdmin.Close;
           end;
        end;

      1:
        begin
          with dmAdventureLand do
            begin
              tblEmployee.Open;
              tblEmployee.First;
              while not tblEmployee.Eof do  //find a match in database
                begin
                  if (tblEmployee['Username']=sUsername) and (tblEmployee['Password']=sPassword) then   //if match found, go to employee home screen
                    begin
                      setCurrentUser(sUsername);
                      cmbUsername.Clear;
                      edtPassword.Clear;
                      frmLogin.Close;
                      frmEmployeeHome.lblUsername.Caption:='Employee: '+getCurrentUser('Name');
                      frmEmployeeHome.ShowModal;
                      Exit;
                    end;
                  tblEmployee.Next;
                end;
              tblEmployee.Close;
            end;
        end;
    end;

    //following code applies for first case statement: if iUser 0 or 1
    {
    following code will only apply if username and password doesnt match,
    //because if they matched it, respective form was shown and 'Exit'
     was used -> succeeding code will not be executed
    }

    Dec(iTries);

    if iTries=0 then   //close application if no tries remaining
      begin
        ShowMessage('Username and password do not match'+#13+'You have use up all your tries'+#13+'Due to security reasons, this application will terminate.');
        Application.Terminate;
      end
        else //if iTries>0
          begin
            edtPassword.Clear;
            edtPassword.SetFocus;
            ShowMessage('Username and password do not match.'+#13+'Please re-enter password.'+#13+'Tries Remaining: '+IntToStr(iTries));
          end;
      end;  // end for second case statement

2:
  begin
    if cmbUsername.ItemIndex=-1 then  //validation
      begin
        ShowMessage('Please select your Ticket Number');
        Exit;
      end;
    sTicketNumber:=cmbUsername.Items[cmbUsername.ItemIndex];
    setCurrentUser(sTicketNumber);
    frmLogin.Close;
    frmVisitor.ShowModal;

  end;
end;

end;

procedure TfrmLogin.chbShowPasswordClick(Sender: TObject);
begin
if chbShowPassword.Checked then
      begin
        edtPassword.PasswordChar := #0;  //displays text entered -> shows password
      end
      else
      begin
        edtPassword.PasswordChar := '*';  //show password character -> cant see characters entered -> hides password
      end;
end;



procedure TfrmLogin.FormActivate(Sender: TObject);
begin
//initialise depending on type of user
iUser:=cmbUser.ItemIndex;

SetProperties(iUser);
PopulateUsernames (iUser);


iTries:=3;
end;








procedure TfrmLogin.FormCreate(Sender: TObject);
begin
frmlogin.AutoSize:=True;  //doesnt allow user to resize screen
end;

procedure TfrmLogin.tmrDateTimeTimer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);  //display current system date and time

end;

end.
