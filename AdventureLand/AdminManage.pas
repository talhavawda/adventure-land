unit AdminManage;

interface

uses
  Windows,Messages, SysUtils,Variants, Classes, Graphics,
  Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, Grids, DBGrids, DBCtrls, jpeg, Spin, dmAdventureLand_u, Mask;

type
  TfrmAdminManage = class(TForm)
    Panel2: TPanel;
    lblDateTime: TLabel;
    Timer1: TTimer;
    lblUsername: TLabel;
    btnBack: TBitBtn;
    pgcManage: TPageControl;
    tbsAdmin: TTabSheet;
    tbsEmployees: TTabSheet;
    tbsRides: TTabSheet;
    rgpAdmin: TGroupBox;
    dbnAdmin: TDBNavigator;
    rgpASearch: TGroupBox;
    edtAsearch: TEdit;
    rgpAFilter: TRadioGroup;
    btnAsearch: TBitBtn;
    rgpADetails: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtAdminID: TEdit;
    edtAusername: TEdit;
    edtAname: TEdit;
    edtAEmail: TEdit;
    edtAsurname: TEdit;
    edtApassword: TEdit;
    rgpEmployee: TGroupBox;
    dbnEmployee: TDBNavigator;
    rgpESearch: TGroupBox;
    rgpEFilter: TRadioGroup;
    edtEsearch: TEdit;
    btnEsearch: TBitBtn;
    rgpEDetails: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    edtEmployeeID: TEdit;
    edtEusername: TEdit;
    edtEname: TEdit;
    edtEemail: TEdit;
    edtEsurname: TEdit;
    edtEpassword: TEdit;
    rgpRide: TGroupBox;
    rgpRDetails: TGroupBox;
    Label23: TLabel;
    edtRideID: TEdit;
    Label24: TLabel;
    edtRname: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    cmbCategory: TComboBox;
    Label28: TLabel;
    memDescription: TMemo;
    rgpRSearch: TGroupBox;
    rgpRFilter: TRadioGroup;
    edtRsearch: TEdit;
    btnRsearch: TBitBtn;
    tbsTickets: TTabSheet;
    GroupBox10: TGroupBox;
    GroupBox11: TGroupBox;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    spnAdult: TSpinEdit;
    spnChild: TSpinEdit;
    spnToddler: TSpinEdit;
    btnUpdTicket: TButton;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    GroupBox12: TGroupBox;
    btnUpdRide: TButton;
    Label36: TLabel;
    Label37: TLabel;
    spnRide: TSpinEdit;
    GroupBox13: TGroupBox;
    btnUpdInfo: TButton;
    grpParkInfo: TGroupBox;
    btnUpdTimes: TButton;
    tbsPark: TTabSheet;
    btnAclear: TButton;
    btnEclear: TButton;
    btnRclear: TButton;
    btnHelp: TBitBtn;
    Label10: TLabel;
    dbgEmployee: TDBGrid;
    dbgRide: TDBGrid;
    dbgAdmin: TDBGrid;
    rgpAOption: TRadioGroup;
    edtAcell: TMaskEdit;
    edtAId: TMaskEdit;
    edtEcell: TMaskEdit;
    edtEId: TMaskEdit;
    spnRideCost: TSpinEdit;
    rgpEOption: TRadioGroup;
    rgpROption: TRadioGroup;
    spnAdrenalineRush: TSpinEdit;
    btnFirst: TBitBtn;
    btnPrevious: TBitBtn;
    btnNext: TBitBtn;
    btnLast: TBitBtn;
    btnRefresh: TBitBtn;
    memInfo: TMemo;
    memTimes: TMemo;
    procedure Timer1Timer(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbsParkShow(Sender: TObject);
    procedure btnUpdInfoClick(Sender: TObject);
    procedure btnUpdTimesClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnUpdRideClick(Sender: TObject);
    procedure tbsTicketsShow(Sender: TObject);
    procedure btnUpdTicketClick(Sender: TObject);
    procedure edtAdminIDChange(Sender: TObject);
    procedure dbgAdminCellClick(Column: TColumn);
    procedure rgpAOptionClick(Sender: TObject);
    procedure tbsAdminShow(Sender: TObject);

    procedure btnOptionClick (Sender: TObject);  //on-click event for dynamically instantiated button btnOption

    procedure ButtonInstantiate (sType:string);  //procedure to instantiate btnOption

    procedure tbsEmployeesShow(Sender: TObject);
    procedure tbsRidesShow(Sender: TObject);
    procedure dbgEmployeeCellClick(Column: TColumn);
    procedure dbgRideCellClick(Column: TColumn);
    procedure rgpEOptionClick(Sender: TObject);
    procedure rgpROptionClick(Sender: TObject);
    procedure edtEmployeeIDChange(Sender: TObject);
    procedure edtRideIDChange(Sender: TObject);
    procedure btnAclearClick(Sender: TObject);
    procedure btnEclearClick(Sender: TObject);
    procedure btnRclearClick(Sender: TObject);
    procedure btnAsearchClick(Sender: TObject);
    procedure btnEsearchClick(Sender: TObject);
    procedure btnRsearchClick(Sender: TObject);
    procedure btnFirstClick(Sender: TObject);
    procedure btnLastClick(Sender: TObject);
    procedure btnNextClick(Sender: TObject);
    procedure btnPreviousClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure edtAIdChange(Sender: TObject);
    procedure edtEIdChange(Sender: TObject);
    procedure edtEcellChange(Sender: TObject);
    procedure edtAcellChange(Sender: TObject);
    procedure spnAdrenalineRushChange(Sender: TObject);
    procedure spnRideCostChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminManage: TfrmAdminManage;

  iArrEntrancePrices:array[1..3] of integer;
  btnOption:TButton; //dynamically instantiated button
  bBtnCreated:boolean =false;  //also declared the variable
  sOption:string ='';
  sType:string='';

implementation

{$R *.dfm}

uses AdminHome, Login;


procedure TfrmAdminManage.btnAsearchClick(Sender: TObject);
var
sSearch:string;
iFilter:integer;

begin
sSearch:=edtAsearch.Text;
//Ensures that a search value has been entered and that a filter has been selected
if sSearch='' then
  begin
    ShowMessage('Please enter a value in the search field');
    Exit;
  end;

if rgpAFilter.ItemIndex=-1 then
  begin
    ShowMessage('Please select a filter to search by');
    Exit;
  end;

iFilter:=rgpAFilter.ItemIndex;


with dmAdventureLand do
  begin
    with tblAdmin do
      begin
        //used filters to search admin
        case iFilter of
        0:  Filter:='[Admin ID] LIKE '+sSearch; //Admin ID    //Admin ID is an integer
        1:  Filter:='[ID Number] LIKE ''%'+sSearch+'%'''; //ID Number  //ID Number is a string
        2:  Filter:='Username LIKE ''%'+sSearch+'%''';   //Username
        3:  Filter:='[First Name(s)] LIKE ''%'+sSearch+'%''';   //First Name(s)
        4:  Filter:='Surname LIKE ''%'+sSearch+'%''';   //Surname
        end;
        Filtered:=True;  //will apply to all cases.
      end;
  end;



end;

procedure TfrmAdminManage.btnBackClick(Sender: TObject);
begin
//Close form
frmAdminManage.Close;

end;


procedure TfrmAdminManage.btnOptionClick(Sender: TObject);   //on-click event for dynamically instantiated button btnOption
var
sCell, sUsername, sName, sSurname, sID, sChar, sPass, sPassword, sEmployeeID:string;
iPos :integer;
bValid:boolean;
  I: Integer;
begin

if sType='Admin' then
  begin

    if sOption='Add' then
     begin
        //validate that all fields have been populated
        if (edtAId.Text='') OR (edtAusername.Text='') OR (edtAname.Text='') OR (edtAsurname.Text='') OR (edtAcell.Text='') OR (edtAemail.Text='') then
          begin
            ShowMessage('Please fill in all the fields');
            Exit;
          end;

         //validate that the cell number begins with 0
        sCell:=edtAcell.Text;
        if sCell[1]<>'0' then
          begin
            ShowMessage('Please enter a valid cellphone number (starts with 0)');
            Exit;
          end;

        //Validation: edtAID has EditMask that forces 13 digits

        sUsername:=edtAusername.Text;

        //Ensures that username is between 5 and 20 characters
        if (length(sUsername)<5) OR (length(sUsername)>20) then
          begin
            ShowMessage('Username must contain between 5 to 20 characters');
            Exit;
          end;


        //ensures that a unique username is entered
        if dmAdventureLand.tblAdmin.Locate('Username',sUsername,[]) = True then
          begin
            ShowMessage('An admin with this username '''+sUsername+''' already exists'+#13+'Please enter a unique admin username');
            Exit;
          end;

        sName:=edtAname.Text;
        sSurname:=edtAsurname.Text;

        //ensure that only alphabets and characters are entered for the name and surname

        bValid:=True;

        for I := 1 to length(sName) do
          begin
            if Not (upcase(sName[I]) In ['A'..'Z', ' ']) then  //Upcase is used for char
              begin
                bValid:=False;
              end;
          end;

        if bValid=False then
          begin
             ShowMessage('Please enter a valid First Name.'+#13+'Only alphabets and spaces are allowed');
            Exit;
          end;


        bValid:=True;

        for I := 1 to length(sSurname) do
          begin
            if Not (upcase(sSurname[I]) In['A'..'Z', ' ']) then
              begin
                bValid:=False;
              end;
          end;

        if bValid=False then
          begin
             ShowMessage('Please enter a valid Surname.'+#13+'Only alphabets and spaces are allowed');
            Exit;
          end;


     //Generate a password

        sPass:='';  //password variable


        //get the middle character of the first name
        repeat
          sChar:=lowercase(Copy(sName,(length(sName) div 2),1));
        until (Not(sChar = ' '));    //ensure that sChar is not a space

        Insert(sChar,sPass,length(sPass)+1);  //inserting (appending) into password varaible



        //get two characters from the surname
        Randomize;

        //ensure that sChar doesnt have any spaces
        repeat
          //Generate a random number to extract a character from sSurname.
          //position cannot be the last letter of the surname as you will be copying 2 letters
          iPos:=Random(length(sSurname)-1)+1;
          sChar:=lowercase(Copy(sSurname,iPos,2));
        until (sChar[1] In ['a'..'z']) AND (sChar[2] In ['a'..'z']);

        Insert(sChar,sPass,length(sPass)+1); //appending to sPass

        sID:=edtAId.Text;
        iPos:=Random(6)+8;  //Generate a random number from the 8th to the 13th character of the ID number
        sChar:=copy(sID,iPos,2); //copy 2 characters from the ID number
        Insert(sChar,sPass,length(sPass)+1);

        sChar:=Copy(sCell,(length(sCell) div 2),1);
        Insert(sChar,sPass,length(sPass)+1);

        sPassword:='';  //final password

       repeat
        //scramble the password
        while length(sPass)>0 do
          begin
            iPos:=Random(length(sPass))+1; //Generate a random number to extract a character from sPass
            sChar:=copy(sPass,iPos,1);     //copy from that position the character
            Insert(sChar,sPassword,length(sPassword)+1);  //append the character into the password
            Delete(sPass,iPos,1);
          end;
       until (length(sPassword)>5);  //ensure that the password is 6 characters

        //insert a new record
        with dmAdventureLand do
          begin
            tblAdmin.Append;  //Admin ID is PK and auto-generated therefore no need to give it a value
            tblAdmin['ID Number']:=sID;
            tblAdmin['Username']:=sUsername;
            tblAdmin['Password']:=sPassword;
            tblAdmin['First Name(s)']:=sName;
            tblAdmin['Surname']:=sSurname;
            tblAdmin['Cell Number']:=sCell;
            tblAdmin['Email Address']:=edtAemail.Text;
            tblAdmin.Post;
          end;
        ShowMessage('This Admin has been successfully added.');

        //clear fields after admin has been added
        rgpAoption.ItemIndex:=-1;

        edtAId.Clear;
        edtAusername.Clear;
        edtApassword.Clear;
        edtApassword.Enabled:=True;
        edtAname.Clear;
        edtAsurname.Clear;
        edtAcell.Clear;
        edtAemail.Clear;
      end
      else
        if sOption='Update' then
          begin
            if (edtAId.Text='') OR (edtAusername.Text='') OR (edtApassword.Text='') OR (edtAname.Text='') OR (edtAsurname.Text='') OR (edtAcell.Text='') OR (edtAemail.Text='') then
             begin
                ShowMessage('Please fill in all the fields');
               Exit;
             end;
            sCell:=edtAcell.Text;
            if sCell[1]<>'0' then
               begin
                ShowMessage('Please enter a valid cellphone number (starts with 0)');
                Exit;
              end;

            sUsername:=edtAusername.Text;
            if (length(sUsername)<5) OR (length(sUsername)>20) then
              begin
                ShowMessage('Username must contain between 5 to 20 characters');
                Exit;
              end;


           sName:=edtAname.Text;
           sSurname:=edtAsurname.Text;

           //ensure that only alphabets and characters are entered for the name and surname

           bValid:=True;

            for I := 1 to length(sName) do
              begin
                if Not (upcase(sName[I]) In ['A'..'Z', ' ']) then  //Upcase is used for char
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid First Name.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;


            bValid:=True;

            for I := 1 to length(sSurname) do
              begin
                if Not (upcase(sSurname[I]) In['A'..'Z', ' ']) then
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid Surname.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;



           sPassword:=edtApassword.Text;
            if (length(sPassword)<6) OR (length(sPassword)>20) then
              begin
                ShowMessage('Password must contain between 6 to 20 characters');
                Exit;
              end;

            with dmAdventureLand do
              begin
                //update a record
                tblAdmin.Edit; //edit the current active record selected
                tblAdmin['ID Number']:=edtAId.Text;
                tblAdmin['Username']:=edtAusername.Text;
                tblAdmin['Password']:=edtApassword.Text;
                tblAdmin['First Name(s)']:=sName;
                tblAdmin['Surname']:=sSurname;
                tblAdmin['Cell Number']:=edtAcell.Text;
                tblAdmin['Email Address']:=edtAemail.Text;
              end;
            ShowMessage('This Admin''s details has been successfully updated.');

            rgpAoption.ItemIndex:=-1;
          end
          else
            if sOption='Delete' then
              begin
                if MessageDlg('Are you sure you want to delete this Admin?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
                  begin
                    with dmAdventureLand do
                      begin
                        tblAdmin.Delete; //delete current active record selected in dbgrid
                        ShowMessage('This Admin has been successfully deleted.');

                        rgpAoption.ItemIndex:=-1;

                        //details of deleted record will still display if dont click on a new record so clear the components
                        edtAdminID.Clear;
                        edtAId.Clear;
                        edtAusername.Clear;
                        edtApassword.Clear;
                        edtAname.Clear;
                        edtAsurname.Clear;
                        edtAcell.Clear;
                        edtAemail.Clear;
                      end;
                  end;
              end;
  end;

if sType='Employee' then
  begin
    if sOption='Add' then
     begin   //validate that all fields have been populated
        if (edtEId.Text='') OR (edtEusername.Text='') OR (edtEname.Text='') OR (edtEsurname.Text='') OR (edtEcell.Text='') OR (edtEemail.Text='') then
          begin
            ShowMessage('Please fill in all the fields');
            Exit;
          end;

        sCell:=edtEcell.Text;    //ensure valid cell number entered (starts with 0) . EditMask ensures 10 digits entered
        if sCell[1]<>'0' then
          begin
            ShowMessage('Please enter a valid cellphone number (starts with 0)');
            Exit;
          end;

        //Validation: edtEID has EditMask that forces 13 digits

        sUsername:=edtEusername.Text;
        if (length(sUsername)<5) OR (length(sUsername)>20) then
          begin
            ShowMessage('Username must contain between 5 to 20 characters');
            Exit;
          end;

        //ensures that a unique username is entered
        if dmAdventureLand.tblEmployee.Locate('Username',sUsername,[]) = True then
          begin
            ShowMessage('An employee with this username '''+sUsername+''' already exists'+#13+'Please enter a unique employee username');
            Exit;
          end;

        sName:=edtEname.Text;
        sSurname:=edtEsurname.Text;

        //ensure that only alphabets and characters are entered for the name and surname

           bValid:=True;

            for I := 1 to length(sName) do
              begin
                if Not (upcase(sName[I]) In ['A'..'Z', ' ']) then  //Upcase is used for char
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid First Name.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;


            bValid:=True;

            for I := 1 to length(sSurname) do
              begin
                if Not (upcase(sSurname[I]) In['A'..'Z', ' ']) then
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid Surname.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;

     //Generate a password

        sPass:='';

        //get the middle character of the first name
        repeat
          sChar:=lowercase(Copy(sName,(length(sName) div 2),1));
        until (Not(sChar = ' '));    //ensure that sChar is not a space

        Insert(sChar,sPass,length(sPass)+1);

        //get two characters from the surname

        Randomize;

        //ensure that sChar doesnt have any spaces
        repeat
          //Generate a random number to extract a character from sSurname.
          //position cannot be the last letter of the surname as you will be copying 2 letters
          iPos:=Random(length(sSurname)-1)+1;
          sChar:=lowercase(Copy(sSurname,iPos,2));
        until (sChar[1] In ['a'..'z']) AND (sChar[2] In ['a'..'z']);
        Insert(sChar,sPass,length(sPass)+1);

        sID:=edtEId.Text;
        iPos:=Random(6)+8;  //Generate a random number from the 8th to the 13th character of the ID number
        sChar:=copy(sID,iPos,2);
        Insert(sChar,sPass,length(sPass)+1);

        sChar:=Copy(sCell,(length(sCell) div 2),1);
        Insert(sChar,sPass,length(sPass)+1);

        sPassword:='';

       repeat
        //scramble the password
        while length(sPass)>0 do
          begin
            iPos:=Random(length(sPass))+1; //Generate a random number to extract a character from sPass
            sChar:=copy(sPass,iPos,1);
            Insert(sChar,sPassword,length(sPassword)+1);
            Delete(sPass,iPos,1);
          end;
       until (length(sPassword)>5);  //ensure that the password is 6 characters

        with dmAdventureLand do
          begin
            tblEmployee.Append;  //Employee ID is PK and auto-generated therefore no need to give it a value
            tblEmployee['ID Number']:=sID;
            tblEmployee['Username']:=sUsername;
            tblEmployee['Password']:=sPassword;
            tblEmployee['First Name(s)']:=sName;
            tblEmployee['Surname']:=sSurname;
            tblEmployee['Cell Number']:=sCell;
            tblEmployee['Email Address']:=edtEemail.Text;
            tblEmployee.Post;
          end;
        ShowMessage('This Employee has been successfully added.');

        rgpEoption.ItemIndex:=-1;

        edtEId.Clear;
        edtEusername.Clear;
        edtEpassword.Clear;
        edtEpassword.Enabled:=True;
        edtEname.Clear;
        edtEsurname.Clear;
        edtEcell.Clear;
        edtEemail.Clear;
     end
      else
        if sOption='Update' then
          begin         //validate that all fields have been populated
            if (edtEId.Text='') OR (edtEusername.Text='') OR (edtEpassword.Text='') OR (edtEname.Text='') OR (edtEsurname.Text='') OR (edtEcell.Text='') OR (edtEemail.Text='') then
          begin
            ShowMessage('Please fill in all the fields');
            Exit;
          end;
        sCell:=edtEcell.Text;
        if sCell[1]<>'0' then
          begin
            ShowMessage('Please enter a valid cellphone number (starts with 0)');
            Exit;
          end;
        sUsername:=edtEusername.Text;
        if (length(sUsername)<5) OR (length(sUsername)>20) then
          begin
            ShowMessage('Username must contain between 5 to 20 characters');
            Exit;
          end;

        sName:=edtEname.Text;
        sSurname:=edtEsurname.Text;

        //ensure that only alphabets and characters are entered for the name and surname

           bValid:=True;

            for I := 1 to length(sName) do
              begin
                if Not (upcase(sName[I]) In ['A'..'Z', ' ']) then  //Upcase is used for char
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid First Name.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;


            bValid:=True;

            for I := 1 to length(sSurname) do
              begin
                if Not (upcase(sSurname[I]) In['A'..'Z', ' ']) then
                  begin
                    bValid:=False;
                  end;
              end;

            if bValid=False then
              begin
                ShowMessage('Please enter a valid Surname.'+#13+'Only alphabets and spaces are allowed');
                Exit;
              end;

        sPassword:=edtEpassword.Text;
        if (length(sPassword)<6) OR (length(sPassword)>20) then   //ensure correct size of password is entered
          begin
            ShowMessage('Password must contain between 6 to 20 characters');
              Exit;
          end;

        with dmAdventureLand do
          begin
            tblEmployee.Edit;  //edit the current active record selected
            tblEmployee['ID Number']:=edtEId.Text;
            tblEmployee['Username']:=edtEusername.Text;
            tblEmployee['Password']:=edtEpassword.Text;
            tblEmployee['First Name(s)']:=sName;
            tblEmployee['Surname']:=sSurname;
            tblEmployee['Cell Number']:=edtEcell.Text;
            tblEmployee['Email Address']:=edtEemail.Text;
          end;
            ShowMessage('This Employee''s details has been successfully updated.');

            rgpEoption.ItemIndex:=-1;
          end
          else
            if sOption='Delete' then
              begin
                if MessageDlg('Are you sure you want to delete this Employee?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
                  begin
                    with dmAdventureLand do
                      begin
                        sEmployeeID:=edtEmployeeID.Text;
                        //Ensure Referential Integrity
                        if dmAdventureLand.tblEntranceTransaction.Locate('Employee ID',sEmployeeID,[]) = True then
                          begin
                            ShowMessage('Cannot delete this employee as he has generated tickets');
                          end
                            else    //delete the employee f he hasnt generated any tickets
                              begin
                                tblEmployee.Delete; //delete current active record selected in dbgrid
                                ShowMessage('This Employee has been successfully deleted.');

                                rgpEoption.ItemIndex:=-1;

                                //details of deleted record will still display if dont click on a new record so clear the components
                                edtAdminID.Clear;
                                edtAId.Clear;
                                edtAusername.Clear;
                                edtApassword.Clear;
                                edtAname.Clear;
                                edtAsurname.Clear;
                               edtAcell.Clear;
                               edtAemail.Clear;
                              end;

                      end;
                  end;
              end;
  end;

if sType='Ride' then
  begin
    if sOption='Add' then
     begin
        //validation  - ensure that all values have been entered and in correct range
        if (edtRname.Text='') OR (cmbCategory.ItemIndex=-1)  OR (spnRideCost.Value>99) OR (spnRideCost.Value<0) OR (spnAdrenalineRush.Value>10) OR (spnAdrenalineRush.Value<0) then
          begin
            if (edtRname.Text='') then
              begin
                ShowMessage('Please enter a Ride Name');
                Exit;
              end;
            if (cmbCategory.ItemIndex=-1)  then
              begin
                ShowMessage('Please select a Category from the combo box');
                Exit;
              end;
            if (spnRideCost.Value>99) OR (spnRideCost.Value<0) then
              begin
                ShowMessage('Please select a value for the Ride Cost in the range 0 to 99');
                Exit;
              end;
            if (spnAdrenalineRush.Value>10) OR (spnAdrenalineRush.Value<0)  then
              begin
                ShowMessage('Please select a value for the Adrenaline Rush in the range 0 to 10');
                Exit;
              end;
          end;
        with dmAdventureLand do
          begin

           //added Ride to table
            tblRide.Append;
            tblRide['Ride Name']:=edtRname.Text;
            tblRide['Category']:=cmbCategory.Items[cmbCategory.ItemIndex];
            tblRide['Adrenaline Rush']:=IntToStr(spnAdrenalineRush.Value);
            tblRide['Ride Cost']:=IntToStr(spnRideCost.Value);
            tblRide['Description']:=memDescription.Text;
            tblRide.Post;
          end;
        ShowMessage('This Ride has been successfully added.');


        //clearing fields after adding ride
        rgpRoption.ItemIndex:=-1;

        edtRideID.Clear;
        edtRname.Clear;
        cmbCategory.ItemIndex:=-1;
        spnAdrenalineRush.Value:=0;
        spnRideCost.Value:=0;
        memDescription.Text:='';
      end
      else
        if sOption='Update' then
          begin
            //validation
        if (edtRname.Text='') OR (cmbCategory.ItemIndex=-1)  OR (spnRideCost.Value>99) OR (spnRideCost.Value<0) OR (spnAdrenalineRush.Value>10) OR (spnAdrenalineRush.Value<0) then
          begin
            if (edtRname.Text='') then
              begin
                ShowMessage('Please enter a Ride Name');
                Exit;
              end;
            if (cmbCategory.ItemIndex=-1)  then
              begin
                ShowMessage('Please select a Category from the combo box');
                Exit;
              end;
            if (spnRideCost.Value>99) OR (spnRideCost.Value<0) then
              begin
                ShowMessage('Please select a value for the Ride Cost in the range 0 to 99');
                Exit;
              end;
            if (spnAdrenalineRush.Value>10) OR (spnAdrenalineRush.Value<0)  then
              begin
                ShowMessage('Please select a value for the Adrenaline Rush in the range 0 to 10');
                Exit;
              end;
          end;
            with dmAdventureLand do
              begin
                tblRide.Edit;
                tblRide['Ride Name']:=edtRname.Text;
                tblRide['Category']:=cmbCategory.Items[cmbCategory.ItemIndex];
                tblRide['Adrenaline Rush']:=IntToStr(spnAdrenalineRush.Value);
                tblRide['Ride Cost']:=IntToStr(spnRideCost.Value);
                tblRide['Description']:=memDescription.Text;
              end;
            ShowMessage('This Ride''s details has been successfully updated.');

            rgpRoption.ItemIndex:=-1;
          end
          else
            if sOption='Delete' then
              begin
                if MessageDlg('Are you sure you want to delete this Ride?',mtConfirmation,[mbYes,mbNo],0)=mrYes then
                  begin
                    with dmAdventureLand do
                      begin
                        tblRide.Delete; //delete current active record selected in dbgrid
                        ShowMessage('This Ride has been successfully deleted.');


                        rgpRoption.ItemIndex:=-1;

                        //details of deleted record will still display if dont click on a new record so clear the components
                        edtRideID.Clear;
                        edtRname.Clear;
                        cmbCategory.ItemIndex:=-1;
                        spnAdrenalineRush.Value:=0;
                        spnRideCost.Value:=0;
                        memDescription.Text:='';
                      end;
                  end;
              end;
  end;
end;

procedure TfrmAdminManage.btnPreviousClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Prior; //go to previous record
end;

procedure TfrmAdminManage.btnUpdInfoClick(Sender: TObject);
begin


memInfo.Lines.SaveToFile('Park Info.txt');
ShowMessage('Park Info has been updated.');


end;

procedure TfrmAdminManage.btnUpdTicketClick(Sender: TObject);
var
txtEntrancePrice:TextFile;
  I: Integer;
begin
//update ticket prices -> write from array to text file
AssignFile(txtEntrancePrice,'Entrance Ticket Price.txt');
Rewrite(txtEntrancePrice);

iArrEntrancePrices[1]:=spnAdult.Value;
iArrEntrancePrices[2]:=spnChild.Value;
iArrEntrancePrices[3]:=spnToddler.Value;

for I := 1 to 3 do
  begin
    writeln(txtEntrancePrice,iArrEntrancePrices[I]);
  end;

CloseFile(txtEntrancePrice);
ShowMessage('Entrance Ticket Price has been updated');
end;

procedure TfrmAdminManage.btnUpdTimesClick(Sender: TObject);
begin//update park times

memTimes.Lines.SaveToFile('Park Times.txt');
ShowMessage('Park Times has been updated.');
end;

procedure TfrmAdminManage.dbgAdminCellClick(Column: TColumn);
begin

//when user clicks on another record/field, remove the option selected
rgpAOption.ItemIndex:=-1;

edtApassword.Enabled:=True;

//if an option was selected (the button was therefore created), free the button
if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;
//display selected record in components
with dmAdventureLand do
  begin
    edtAdminID.Text:=tblAdmin['Admin ID'];
    edtAId.Text:=tblAdmin['ID Number'];
    edtAusername.Text:=tblAdmin['Username'];
    edtApassword.Text:=tblAdmin['Password'];
    edtAname.Text:=tblAdmin['First Name(s)'];
    edtAsurname.Text:=tblAdmin['Surname'];
    edtAcell.Text:=tblAdmin['Cell Number'];
    edtAemail.Text:=tblAdmin['Email Address'];
  end;

end;



procedure TfrmAdminManage.dbgEmployeeCellClick(Column: TColumn);
begin
//when user clicks on another record/field, remove the option selected
rgpEOption.ItemIndex:=-1;

edtEpassword.Enabled:=True;

//if an option was selected (the button was therefore created), free the button
if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;

  with dmAdventureLand do  //display selected record in components
  begin
    edtEmployeeID.Text:=tblEmployee['Employee ID'];
    edtEId.Text:=tblEmployee['ID Number'];
    edtEusername.Text:=tblEmployee['Username'];
    edtEpassword.Text:=tblEmployee['Password'];
    edtEname.Text:=tblEmployee['First Name(s)'];
    edtEsurname.Text:=tblEmployee['Surname'];
    edtEcell.Text:=tblEmployee['Cell Number'];
    edtEemail.Text:=tblEmployee['Email Address'];
  end;

end;

procedure TfrmAdminManage.dbgRideCellClick(Column: TColumn);
begin
//when user clicks on another record/field, remove the option selected
rgpROption.ItemIndex:=-1;

//if an option was selected (the button was therefore created), free the button
if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;

with dmAdventureLand do   //display selected record in components
  begin
    edtRideID.Text:=tblRide['Ride ID'];
    edtRname.Text:=tblRide['Ride Name'];

    if tblRide['Category']='Toddler' then
      begin
        cmbCategory.ItemIndex:=0;
      end
      else if tblRide['Category']='Child' then
        begin
          cmbCategory.ItemIndex:=1;
        end
          else if tblRide['Category']='Adult' then
            begin
              cmbCategory.ItemIndex:=2;
            end
              else if tblRide['Category']='Family' then
                begin
                  cmbCategory.ItemIndex:=3;
                end;

    spnAdrenalineRush.Value:=StrToInt(tblRide['Adrenaline Rush']);
    spnRideCost.Value:=StrToInt(tblRide['Ride Cost']);

    memDescription.Text:='';
    memDescription.Lines.Text:=tblRide['Description'];
  end;
end;

procedure TfrmAdminManage.edtRideIDChange(Sender: TObject);
begin
//Enabled=False (Cant be edited by user because auto generated) and ReadOnly =True for extra measure
//record will be appended to table so PK (Ride ID) will be auto-generated
//no user interaction allowed
//will still be able to display current Ride ID if select a record
end;

procedure TfrmAdminManage.edtAcellChange(Sender: TObject);
begin
//Validation: EditMask - forces 10 digits
end;

procedure TfrmAdminManage.edtAdminIDChange(Sender: TObject);
begin
//Enabled=False (Cant be edited by user because auto generated) and ReadOnly =True for extra measure
//record will be appended to table so PK (Admin ID) will be auto-generated
//no user interaction allowed
//will still be able to display current Admin ID if select a record
end;

procedure TfrmAdminManage.edtAIdChange(Sender: TObject);
begin
//Validation: EditMask - forces 13 digits
end;

procedure TfrmAdminManage.edtEcellChange(Sender: TObject);
begin
//Validation: EditMask - forces 10 digits
end;

procedure TfrmAdminManage.edtEIdChange(Sender: TObject);
begin
//Validation: EditMask - forces 13 digits
end;

procedure TfrmAdminManage.edtEmployeeIDChange(Sender: TObject);
begin
//Enabled=False (Cant be edited by user because auto generated) and ReadOnly =True for extra measure
//record will be appended to table so PK (Employee ID) will be auto-generated
//no user interaction allowed
//will still be able to display current Employee ID if select a record
end;

procedure TfrmAdminManage.btnUpdRideClick(Sender: TObject);
var
txtRidePrice:TextFile;
begin
       //update ride tikcet price -> write to text file
AssignFile(txtRidePrice,'Ride Ticket Price.txt');
Rewrite(txtRidePrice);

writeln(txtRidePrice,IntToStr(spnRide.Value));

CloseFile(txtRidePrice);
ShowMessage('Ride Ticket Price has been updated');
end;

procedure TfrmAdminManage.FormActivate(Sender: TObject);
begin
frmAdminManage.lblUsername.Caption:='Admin: '+frmLogin.getCurrentUser('Name');
pgcManage.ActivePage:=tbsAdmin;

with dmAdventureLand do
begin
  dsrAdmin.DataSet.Active:=True;
  dsrEmployee.DataSet.Active:=True;
  dsrRide.DataSet.Active:=True;
end;



end;

procedure TfrmAdminManage.FormCreate(Sender: TObject);
begin
frmAdminManage.AutoSize:=True; //dont allow user to resize form
end;

procedure TfrmAdminManage.btnNextClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Next;  //go to next record in dbgrid
end;

procedure TfrmAdminManage.btnLastClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Last; //go to last record
end;

procedure TfrmAdminManage.btnAclearClick(Sender: TObject);
begin  //display all records
dmAdventureLand.tblAdmin.Filtered:=False;
edtAsearch.Text:='';
rgpAFilter.ItemIndex:=-1;
end;

procedure TfrmAdminManage.btnEclearClick(Sender: TObject);
begin  //display all records
dmAdventureLand.tblEmployee.Filtered:=False;
edtEsearch.Text:='';
rgpEFilter.ItemIndex:=-1;
end;

procedure TfrmAdminManage.btnEsearchClick(Sender: TObject);
var
sSearch:string;
iFilter:integer;

begin
sSearch:=edtEsearch.Text;
//validation -> value entered as radio button selected
if sSearch='' then
  begin
    ShowMessage('Please enter a value in the search field');
    Exit;
  end;

if rgpEFilter.ItemIndex=-1 then
  begin
    ShowMessage('Please select a filter to search by');
    Exit;
  end;

iFilter:=rgpEFilter.ItemIndex;

{
with dmAdventureLand do
  begin
    dmAdventureLand.dsrEmployee.DataSet:=qryEmployee;
    with qryEmployee do
      begin

        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT * FROM tblEmployee WHERE ');
        case iFilter of
        0: qryEmployee.SQL.Add('[Employee ID] LIKE '+sSearch);   //Employee ID    //Employee ID is an integer
        1: qryEmployee.SQL.Add('[ID Number] LIKE ''%'+sSearch+'%''');   //ID Number   //ID Number is a string
        2: qryEmployee.SQL.Add('Username LIKE ''%'+sSearch+'%''');   //Username
        3: qryEmployee.SQL.Add('[First Name(s)] LIKE ''%'+sSearch+'%''');  //First Name(s)
        4: qryEmployee.SQL.Add('Surname LIKE ''%'+sSearch+'%''');   //Surname
        end;
        Active:=True;

        ShowMessage('');
      end;
  end;

dmAdventureLand.dsrEmployee.DataSet:=dmAdventureLand.tblEmployee;
}

with dmAdventureLand do
  begin                //display according to critera
    with tblEmployee do
      begin
        case iFilter of
        0:  Filter:='[Employee ID] LIKE '+sSearch; //Employee ID    //Employee ID is an integer
        1:  Filter:='[ID Number] LIKE ''%'+sSearch+'%''';  //ID Number   //ID Number is a string
        2:  Filter:='Username LIKE ''%'+sSearch+'%''';   //Username
        3:  Filter:='[First Name(s)] LIKE ''%'+sSearch+'%''';  //First Name(s)
        4:  Filter:='Surname LIKE ''%'+sSearch+'%''';   //Surname
        end;
        Filtered:=True; //will apply to all cases

      end;
  end;


end;

procedure TfrmAdminManage.btnFirstClick(Sender: TObject);
begin
dmAdventureLand.tblRide.First;  //go to first record
end;

procedure TfrmAdminManage.btnHelpClick(Sender: TObject);
var
sHelp:string;
begin            //help text
sHelp:='                                     HELP - Admin Manage Screen'+#13+#13;
sHelp:=sHelp+'1. Click a button at the top left corner to switch between pages.'+#13+#13;
sHelp:=sHelp+'2. Admin / Employees / Rides:'+#13;
sHelp:=sHelp+'    a. Click on the grid or use the navigate buttons to navigate through the table.'+#13;
sHelp:=sHelp+'    b. The record data  is displayed in the fields below.'+#13;
sHelp:=sHelp+'    c. Select an option from the radio button to either add / update / delete a record.'+#13;
sHelp:=sHelp+'    d. Enter / change the data in the fields provided if adding / updating.'+#13;
sHelp:=sHelp+'    e. Note that ID and password (Admin/Employee) are auto-generated.'+#13;
sHelp:=sHelp+'    f. Click on the button to Add / Update / Delete the record.'+#13;
sHelp:=sHelp+'    g. Search: Enter value in area provided and filter by selecting a radio button.'+#13+#13;
sHelp:=sHelp+'3. Tickets / Park:'+#13;
sHelp:=sHelp+'    a. Tickets: Use the spinners to change the ticket prices.'+#13;
sHelp:=sHelp+'    b. Park: Change the Park Info / Park Times in the area provided.'+#13;
sHelp:=sHelp+'    c. Click on the respective buttons to process the changes'+#13+#13;
sHelp:=sHelp+'4. Click ''Back'' to return to the Admin Home Screen.';

ShowMessage(sHelp); //display help
end;

procedure TfrmAdminManage.btnRclearClick(Sender: TObject);
begin    //displal all records
dmAdventureLand.tblRide.Filtered:=False;
edtRsearch.Text:='';
rgpRFilter.ItemIndex:=-1;
end;

procedure TfrmAdminManage.btnRefreshClick(Sender: TObject);
begin
dmAdventureLand.tblRide.Refresh;    //refresh dbgrid
end;

procedure TfrmAdminManage.btnRsearchClick(Sender: TObject);
var
sSearch:string;
iFilter:integer;

begin
sSearch:=edtRsearch.Text;
//validation -> value entered as radio button selected
if sSearch='' then
  begin
    ShowMessage('Please enter a value in the search field');
    Exit;
  end;

if rgpRFilter.ItemIndex=-1 then
  begin
    ShowMessage('Please select a filter to search by');
    Exit;
  end;

iFilter:=rgpRFilter.ItemIndex;


with dmAdventureLand do
  begin
    with tblRide do
      begin
        case iFilter of
        0:  Filter:='[Ride ID] LIKE '+sSearch;   //Ride ID           //Ride ID is an integer
        1:  Filter:='[Ride Name] LIKE ''%'+sSearch+'%''';   //Ride Name    //Ride Name is a string
        2:  Filter:='Category LIKE ''%'+sSearch+'%''';   //Category
        3:   Filter:='[Adrenaline Rush] LIKE ''%'+sSearch+'%''';   //Adrenaline Rush
        4:   Filter:='[Ride Cost] LIKE ''%'+sSearch+'%''';  //Ride Cost
        end;
        Filtered:=True; //will apply to all cases
      end;
  end;

end;

procedure TfrmAdminManage.ButtonInstantiate(sType:string);  //user defined procedure  -> dynamically instantiate button
begin
//code to instantiate button
if bBtnCreated=True then
  begin
    btnOption.Free;    //if previously created and radio group clicked again
  end;

btnOption:=TButton.Create(frmAdminManage);

if (sType='Admin') or (sType='Employee') then
  begin
    if sType='Admin' then
      begin
        btnOption.Parent:=rgpADetails;  //put on admin tab
      end;
    if sType='Employee' then
      begin
        btnOption.Parent:=rgpEDetails;  //put on employee tab
      end;
    //applies for both admin and employee
    btnOption.Left:=170;
    btnOption.Top:=155;
    btnOption.Width:=200;
  end;
                                     //put on ride tab
if sType='Ride' then
  begin
    btnOption.Parent:=rgpRDetails;
    btnOption.Left:=50;
    btnOption.Top:=200;
    btnOption.Width:=200;
  end;

btnOption.Caption:='';
btnOption.Visible:=False;

btnOption.OnClick:=btnOptionClick;

bBtnCreated:=True;


end;

procedure TfrmAdminManage.rgpAOptionClick(Sender: TObject);
begin
//instantiate button
ButtonInstantiate(sType);

//set the button's caption and the option selected to be used when user clicks on the button
with dmAdventureLand do
  begin
    case rgpAOption.ItemIndex of
    0:          //Add Admin
      begin
        edtAdminID.Clear;  //clear components


        edtAId.Clear;
        edtAusername.Clear;
        edtApassword.Clear;
        edtApassword.Enabled:=False;
        edtAname.Clear;
        edtAsurname.Clear;
        edtAcell.Clear;
        edtAemail.Clear;

        btnOption.Caption:='Add this Admin to Database';
        sOption:='Add';
        btnOption.Visible:=True;

      end;
    1:     //update
      begin
        if edtAdminID.Text='' then //if no record is selected
          begin
            ShowMessage('Please select an Admin');
            btnOption.Free;
            bBtnCreated:=False;
            Exit
          end;

        btnOption.Caption:='Update this Admin''s Details';
        sOption:='Update';
        edtApassword.Enabled:=True;
        btnOption.Visible:=True;

      end;
    2:
      begin
        if edtAdminID.Text='' then
            begin
             ShowMessage('Please select an Admin');
             btnOption.Free;
             bBtnCreated:=False;
             Exit
            end;

        btnOption.Caption:='Delete this Admin';
        sOption:='Delete';
        edtApassword.Enabled:=True;
        btnOption.Visible:=True;

      end;

    end;
  end;
end;

procedure TfrmAdminManage.rgpEOptionClick(Sender: TObject);
begin
ButtonInstantiate(sType);

with dmAdventureLand do
  begin
    case rgpEOption.ItemIndex of
    0:
      begin
        edtEmployeeID.Clear;  //clear components


        edtEId.Clear;
        edtEusername.Clear;
        edtEpassword.Clear;
        edtEpassword.Enabled:=False;
        edtEname.Clear;
        edtEsurname.Clear;
        edtEcell.Clear;
        edtEemail.Clear;

        btnOption.Caption:='Add this Employee to Database';
        sOption:='Add';
        btnOption.Visible:=True;

      end;
    1:
      begin
        if edtEmployeeID.Text='' then  //if no record is selected
          begin
            ShowMessage('Please select an Employeee');
            btnOption.Free;
            bBtnCreated:=False;
            Exit
          end;

        btnOption.Caption:='Update this Employee''s Details';
        sOption:='Update';
        edtEpassword.Enabled:=True;
        btnOption.Visible:=True;

      end;
    2:
      begin
        if edtEmployeeID.Text='' then
            begin
             ShowMessage('Please select an Employee');
             btnOption.Free;
             bBtnCreated:=False;
             Exit
            end;

        btnOption.Caption:='Delete this Employee';
        sOption:='Delete';
        edtEpassword.Enabled:=True;
        btnOption.Visible:=True;

      end;

    end;
  end;
end;

procedure TfrmAdminManage.rgpROptionClick(Sender: TObject);
begin
ButtonInstantiate(sType);

with dmAdventureLand do
  begin
    case rgpROption.ItemIndex of
    0:
      begin      //clear components
        edtRideID.Clear;
        edtRname.Clear;
        cmbCategory.ItemIndex:=-1;
        spnAdrenalineRush.Value:=0;
        spnRideCost.Value:=0;
        memDescription.Text:='';



        btnOption.Caption:='Add this Ride to Database';
        sOption:='Add';
        btnOption.Visible:=True;

      end;
    1:
      begin
        if edtRideID.Text='' then
          begin
            ShowMessage('Please select a Ride');
            btnOption.Free;
            bBtnCreated:=False;
            Exit
          end;

        btnOption.Caption:='Update this Ride''s Details';
        sOption:='Update';
        btnOption.Visible:=True;

      end;
    2:
      begin
        if edtRideID.Text='' then
            begin
             ShowMessage('Please select a Ride');
             btnOption.Free;
             bBtnCreated:=False;
             Exit
            end;

        btnOption.Caption:='Delete this Ride';
        sOption:='Delete';
        btnOption.Visible:=True;

      end;

    end;
  end;
end;

procedure TfrmAdminManage.spnAdrenalineRushChange(Sender: TObject);
begin
//Validation: MinValue=0, MaxValue=10
end;

procedure TfrmAdminManage.spnRideCostChange(Sender: TObject);
begin
//Validation: MinValue=0, MaxValue=99
end;

procedure TfrmAdminManage.tbsAdminShow(Sender: TObject);
begin
dmAdventureLand.tblAdmin.Open;
dmAdventureLand.tblAdmin.First;
//clear components
edtAdminID.Clear;
edtAId.Clear;
edtAusername.Clear;
edtApassword.Clear;
edtAname.Clear;
edtAsurname.Clear;
edtAcell.Clear;
edtAemail.Clear;



rgpAOption.ItemIndex:=-1;
rgpAFilter.ItemIndex:=-1;

edtAsearch.Text:='';

if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;

sOption:='';
sType:='Admin';

dmAdventureLand.tblAdmin.Filtered:=False; //display all records

end;

procedure TfrmAdminManage.tbsEmployeesShow(Sender: TObject);
begin

dmAdventureLand.tblEmployee.Open;
dmAdventureLand.tblEmployee.First;
//clear components
edtEmployeeID.Clear;
edtEId.Clear;
edtEusername.Clear;
edtEpassword.Clear;
edtEname.Clear;
edtEsurname.Clear;
edtEcell.Clear;
edtEemail.Clear;


rgpEOption.ItemIndex:=-1;
rgpEFilter.ItemIndex:=-1;

edtEsearch.Text:='';

if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;

sOption:='';
sType:='Employee';

dmAdventureLand.tblEmployee.Filtered:=False;  //display all records
end;

procedure TfrmAdminManage.tbsParkShow(Sender: TObject);
begin

//read in data from text file

if FileExists('Park Info.txt')=False then
  begin
    ShowMessage('Error. Park Info not found');
  end
    else
      begin
        memInfo.Lines.LoadFromFile('Park Info.txt');
      end;


if FileExists('Park Times.txt')=False then
  begin
    ShowMessage('Error. Park Times not found.');
  end
    else
      begin
      memTimes.Lines.LoadFromFile('Park Times.txt');
      end;




end;


procedure TfrmAdminManage.tbsRidesShow(Sender: TObject);
begin

dmAdventureLand.tblRide.Open;
dmAdventureLand.tblRide.First;
//clear vomponents
edtRideID.Clear;
        edtRname.Clear;
        cmbCategory.ItemIndex:=-1;
        spnAdrenalineRush.Value:=0;
        spnRideCost.Value:=0;
        memDescription.Text:='';


rgpROption.ItemIndex:=-1;
rgpRFilter.ItemIndex:=-1;

edtRsearch.Text:='';

if bBtnCreated=True then
  begin
    btnOption.Free;
    bBtnCreated:=False;
  end;

sOption:='';
sType:='Ride';

dmAdventureLand.tblRide.Filtered:=False;
end;

procedure TfrmAdminManage.tbsTicketsShow(Sender: TObject);
var
txtRidePrice, txtEntrancePrice:TextFile;
sRidePrice:string;
  I: Integer;
begin
//read in data from text file  -> ticket prices

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
       spnRide.Value:=StrToInt(sRidePrice);
      end;


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
          readln(txtEntrancePrice,iArrEntrancePrices[I]);
        end;

       CloseFile(txtEntrancePrice);
       spnAdult.Value:=iArrEntrancePrices[1];
       spnChild.Value:=iArrEntrancePrices[2];
       spnToddler.Value:=iArrEntrancePrices[3];
      end;


end;




procedure TfrmAdminManage.Timer1Timer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
