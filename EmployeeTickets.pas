unit EmployeeTickets;

interface

uses
 Windows,Messages,SysUtils, Variants,Classes,Graphics,
 Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Buttons,
  ComCtrls, Spin, clsEntranceTicket, Printers; //added clsEntranceTicket, Printers

type
  TfrmEmployeeTickets = class(TForm)
    Panel2: TPanel;
    lblDateTime: TLabel;
    lblUsername: TLabel;
    BitBtn2: TBitBtn;
    BitBtn6: TBitBtn;
    Timer1: TTimer;
    pgcTickets: TPageControl;
    EntranceTickets: TTabSheet;
    RideTickets: TTabSheet;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    spnAdults: TSpinEdit;
    spnChildren: TSpinEdit;
    spnToddlers: TSpinEdit;
    btnEprocess: TButton;
    btnEnew: TButton;
    btnRnew: TButton;
    GroupBox2: TGroupBox;
    spnRideTickets: TSpinEdit;
    btnRprocess: TButton;
    Label6: TLabel;
    Label7: TLabel;
    cmbEntranceID: TComboBox;
    redReceiptRide: TRichEdit;
    redReceiptEntrance: TRichEdit;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure EntranceTicketsShow(Sender: TObject);
    procedure btnEnewClick(Sender: TObject);
    procedure btnEprocessClick(Sender: TObject);
    procedure btnRnewClick(Sender: TObject);
    procedure btnRprocessClick(Sender: TObject);
    procedure RideTicketsShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmEmployeeTickets: TfrmEmployeeTickets;
  iArrEntrancePrices:array[1..3] of integer; //integer bec. doing calculations
  iRideTicketPrice, iAdultPrice, iChildPrice, iToddlerPrice:integer;

  objEntranceTicket:TEntranceTicket;  //declare the object

implementation

{$R *.dfm}

uses EmployeeHome, Login, dmAdventureLand_u;

procedure TfrmEmployeeTickets.BitBtn1Click(Sender: TObject);
begin
Application.Terminate;
end;

procedure TfrmEmployeeTickets.BitBtn2Click(Sender: TObject);
begin
frmEmployeeTickets.Close;

end;

procedure TfrmEmployeeTickets.BitBtn6Click(Sender: TObject);
var
sHelp:string;
begin
sHelp:='                                  HELP - Employee Tickets Screen'+#13+#13;
sHelp:=sHelp+'1. Click a button at the top left corner to switch between Entrance Tickets and Ride Tickets.'+#13+#13;
sHelp:=sHelp+'2. Click ''New Transaction'' to begin a new transaction.'+#13+#13;
sHelp:=sHelp+'3. Entrance Tickets: Use the spinners to input the number of tickets for each category.'+#13+#13;
sHelp:=sHelp+'4. Ride Tickets: Select the Entrance Ticket Number from the combo box and use the spinner to input the number of tickets.'+#13+#13;
sHelp:=sHelp+'5. Click ''Process Transaction'' to process the transaction and print the tickets.'+#13+#13;
sHelp:=sHelp+'6. Click ''Back'' to return to the Employee Home Screen.';

ShowMessage(sHelp);
end;

procedure TfrmEmployeeTickets.btnEnewClick(Sender: TObject);
begin
btnEnew.Enabled:=False;
btnEProcess.Enabled:=True;

spnAdults.Value:=0;
spnChildren.Value:=0;
spnToddlers.Value:=0;
redReceiptEntrance.Clear;



end;

procedure TfrmEmployeeTickets.btnRnewClick(Sender: TObject);
begin
btnRnew.Enabled:=False;
btnRProcess.Enabled:=True;

cmbEntranceID.ItemIndex:=-1;
spnRideTickets.Value:=0;
redReceiptRide.Clear;
end;

procedure TfrmEmployeeTickets.btnEprocessClick(Sender: TObject);
var
iEmployeeID, iTransactionID, I, J, K:integer;
rAmountTendered, rChange:real;
sEmployee, sDate, sTime:string;
bPrinted:boolean;
PrintFile:TextFile;
PrintDialog:TPrintDialog;
begin
//initialising variables. | Cant initialise local variables in declaration statement

rAmountTendered:=0;
rChange:=0;

sDate:='';
sTime:='';

iEmployeeID:=0;
iTransactionID:=0;


//Validation: SpinEdits' MinValue property and Value (Default) set to 0  and MaxValue to 100

//iAdultPrice, iChildPrice, iToddlerPrice initialised on FormActivate
objEntranceTicket:=tEntranceTicket.Create(spnAdults.Value,iAdultPrice,spnChildren.Value,iChildPrice,spnToddlers.Value,iToddlerPrice);


if objEntranceTicket.GetTotalTickets=0 then
  begin
    ShowMessage('Please select the number of tickets to be purchased');
    Exit;
  end;


redReceiptEntrance.Clear;
redReceiptEntrance.Paragraph.TabCount:=2;
redReceiptEntrance.Paragraph.Tab[0]:=40;
redReceiptEntrance.Paragraph.Tab[1]:=100;

//putting date and time in variables bec. will be used later when posting to database
sDate:=DateToStr(now);
sTime:=TimeToStr(now);

redReceiptEntrance.Lines.Add(#9+ 'ADVENTURE LAND AMUSEMENT PARK');
redReceiptEntrance.Lines.Add(#9+ '          ''It''s My Kind Of Adventure'' ');
redReceiptEntrance.Lines.Add('');
redReceiptEntrance.Lines.Add(#9+ '                      Receipt');
redReceiptEntrance.Lines.Add(#9+ '            ENTRANCE TICKETS');
redReceiptEntrance.Lines.Add('');
redReceiptEntrance.Lines.Add('Date: '+ sDate);
redReceiptEntrance.Lines.Add('Time: '+ sTime);
redReceiptEntrance.Lines.Add('Cashier: '+frmLogin.getCurrentUser('Name'));
redReceiptEntrance.Lines.Add('========================================');

redReceiptEntrance.Lines.Add('Tickets'+#9+#9+'Amount');
redReceiptEntrance.Lines.Add('');

if objEntranceTicket.GetAdults>0 then
  begin
    redReceiptEntrance.Lines.Add(IntToStr(objEntranceTicket.GetAdults)+'x Adults @ R'+IntToStr(objEntranceTicket.GetAdultPrice)+' each'+#9+FloatToStrF(objEntranceTicket.CalcAdultCost,ffCurrency,10,2));
  end;

if objEntranceTicket.GetChildren>0 then
  begin
    redReceiptEntrance.Lines.Add(IntToStr(objEntranceTicket.GetChildren)+'x Children @ R'+IntToStr(objEntranceTicket.GetChildPrice)+' each'+#9+FloatToStrF(objEntranceTicket.CalcChildCost,ffCurrency,10,2));
  end;

if objEntranceTicket.GetToddlers>0 then
  begin
    redReceiptEntrance.Lines.Add(IntToStr(objEntranceTicket.GetToddlers)+'x Toddlers @ R'+IntToStr(objEntranceTicket.GetToddlerPrice)+' each'+#9+FloatToStrF(objEntranceTicket.CalcToddlerCost,ffCurrency,10,2));
  end;

redReceiptEntrance.Lines.Add('--------------------------------------------------------------------------------');

//rDiscount iniitialised to 0 above

if objEntranceTicket.CalcDiscount>0 then
  begin
    redReceiptEntrance.Lines.Add('');
    redReceiptEntrance.Lines.Add('Subtotal: '+#9+#9+FloatToStrf(objEntranceTicket.CalcSubtotal,ffCurrency,10,2));
    redReceiptEntrance.Lines.Add('Discount: '+#9+#9+FloatToStrf(objEntranceTicket.CalcDiscount,ffCurrency,10,2));
    redReceiptEntrance.Lines.Add('');
  end;

redReceiptEntrance.Lines.Add('Total Due: '+#9+FloatToStrf(objEntranceTicket.CalcTotal,ffCurrency,10,2));


//Get amount tendered by visitor. Display total due bec. visitor needs to know how much to pay
//will run atleast once
repeat
  rAmountTendered:=StrToFloat(InputBox('Amount Tendered','Total Amount due is '+FloatToStrF(objEntranceTicket.CalcTotal,ffCurrency,10,2)+#13+'Please request the visitor to tender a valid amount: R','0'));
until (rAmountTendered>=objEntranceTicket.CalcTotal);


rChange:=rAmountTendered-objEntranceTicket.CalcTotal;

redReceiptEntrance.Lines.Add('');
redReceiptEntrance.Lines.Add('Amount Tendered: '+#9+FloatToStrf(rAmountTendered,ffCurrency,10,2));
redReceiptEntrance.Lines.Add('Change: '+#9+#9+FloatToStrF(rChange,ffCurrency,10,2));

redReceiptEntrance.Lines.Add('========================================');
redReceiptEntrance.Lines.Add(#9+ 'Thank You for visiting Adventure Land');
redReceiptEntrance.Lines.Add(#9+ '           Have an Adventurous Day! ');




with dmAdventureLand do
  begin
    iEmployeeID:=StrToInt(frmLogin.getCurrentUser('ID')); //get Employee ID of cashier (current user - employee)

    if iEmployeeID=0 then
      begin
        ShowMessage('Database Error. Employee not found.');
        Exit;
      end;


    with qryEntranceTransaction do
      begin
        //Active:=False;  //Inserting works without this

        //no need to insert Entrance Transaction ID because it is auto-generated in the database by Access
        SQL.Text:='INSERT INTO [Entrance Transaction] ([Employee ID],[Entry Date],[Entry Time]) Values (:EmployeeID,:EntryDate,:EntryTime)';

        with Parameters do   //qryEntranceTransaction.Parameters
          begin
            ParamByName('EmployeeID').Value:=iEmployeeID;
            ParamByName('EntryDate').Value:=sDate;
            ParamByName('EntryTime').Value:=sTime;

        {Below is an alternate method to posting the date and time field but then
         the time posted to the database will be a few seconds later than the time
         on the receipt, so  variables were used  (above) to store date and time
          so that same time will be displayed on both the receipt and the table}

            //ParamByName('EntryDate').Value:=FormatDateTime('dd mmm yyyy',Date);  //Date is a built-in function in SysUtils that returns the current date
            //ParamByName('EntryTime').Value:=FormatDateTime('hh:mm:ss',Time);
          end;
        ExecSQL;
        //Active:=True;   //Inserting works without this
      end;

    //Get this entrance transaction's ID
    with tblEntranceTransaction do
      begin
        Close;
        Open;
        Last; //this entrance transaction will be the last record because it was inserted (gets appended to the bottom)
        iTransactionID:=tblEntranceTransaction['Entrance Transaction ID'];  //no conversion bec. Field data type is an integer
        Close;
      end;

    with qryEntranceTicket do
      begin

      if objEntranceTicket.GetAdults>0 then
        begin
          for I := 1 to objEntranceTicket.GetAdults do
            begin
              //no need to insert Entrance Ticket ID because it is auto-generated in the database by Access
              SQL.Text:='INSERT INTO [Entrance Ticket] ([Entrance Transaction ID],Category,[Entrance Ticket Price]) Values (:ETransactionID,''Adult'',:ETicketPrice)';

              with Parameters do
                begin
                  ParamByName('ETransactionID').Value:=iTransactionID;
                  ParamByName('ETicketPrice').Value:=objEntranceTicket.GetAdultPrice-objEntranceTicket.CalcDiscountPerTicket;
                end;
              ExecSQL;
            end;
        end;

      if objEntranceTicket.GetChildren>0 then
        begin
          for J := 1 to objEntranceTicket.GetChildren do
            begin
              SQL.Text:='INSERT INTO [Entrance Ticket] ([Entrance Transaction ID],Category,[Entrance Ticket Price]) Values (:ETransactionID,''Child'',:ETicketPrice)';

              with Parameters do
                begin
                  ParamByName('ETransactionID').Value:=iTransactionID;
                  ParamByName('ETicketPrice').Value:=objEntranceTicket.GetChildPrice-objEntranceTicket.CalcDiscountPerTicket;
                end;
              ExecSQL;
            end;
        end;

      if objEntranceTicket.GetToddlers>0 then
        begin
          for K := 1 to objEntranceTicket.GetToddlers do
            begin
              SQL.Text:='INSERT INTO [Entrance Ticket] ([Entrance Transaction ID],Category,[Entrance Ticket Price]) Values (:ETransactionID,''Toddler'',:ETicketPrice)';

              with Parameters do
                begin
                  ParamByName('ETransactionID').Value:=iTransactionID;
                  ParamByName('ETicketPrice').Value:=objEntranceTicket.GetToddlerPrice-objEntranceTicket.CalcDiscountPerTicket;
                end;
              ExecSQL;
            end;
        end;

      end;

  end;




//print the receipt
bPrinted:=False;
PrintDialog:=TPrintDialog.Create(frmEmployeeTickets);

if PrintDialog.Execute then
  begin
    AssignPrn(PrintFile);
    Rewrite(PrintFile);

    for I := 0 to redReceiptEntrance.Lines.Count do
      begin
        Writeln(PrintFile,redReceiptEntrance.Lines[I]);
      end;

    CloseFile(PrintFile);
    bPrinted:=True;

  end;

  PrintDialog.Free;

  if bPrinted=True then
    begin
      ShowMessage('The transaction has been completed and processed.'+#13+'The receipt has been printed');
    end
      else
        begin
          ShowMessage('The transaction has been completed and processed.'+#13+'The receipt has not been printed');
        end;

objEntranceTicket.Free;

btnEnew.Enabled:=True;
btnEprocess.Enabled:=False;


end;

procedure TfrmEmployeeTickets.btnRprocessClick(Sender: TObject);
var
iTicketID, iRideTickets, iEmployeeID, I:integer;
rSubtotal,rDiscount, rTotal, rAmountTendered, rChange, rDiscountPerTicket:real;
sDate,sTime:string;
PrintDialog:TPrintDialog;
PrintFile:TextFile;
bPrinted:boolean;
begin

//initialise variables
iTicketID:=-1;
iRideTickets:=0;
rSubtotal:=0;
rDiscount:=0;
rDiscountPerTicket:=0;
rTotal:=0;
rAmountTendered:=0;
rChange:=0;

iEmployeeID:=0;


iTicketID:=StrToInt(cmbEntranceID.Items[cmbEntranceID.ItemIndex]);

if iTicketID=-1 then
  begin
    ShowMessage('Please select a ticket number');
    Exit;
  end;


//Validation: spnRideTickets' MinValue property and Value (Default) set to 0  and MaxValue to 100
iRideTickets:=spnRideTickets.Value;

if iRideTickets=0 then
  begin
    ShowMessage('Please select the number of tickets to be purchased');
    Exit;
  end;

rSubtotal:=iRideTickets*iRideTicketPrice;

//rDiscount iniitialised to 0 above

case iRideTickets of
10..19: rDiscount:=rSubtotal*0.05;  //5% discount
20..29: rDiscount:=rSubtotal*0.10;  //10% discount
30..100: rDiscount:=rSubtotal*0.15; //15% discount | Max Tickets able to purchase is 100
end;

{
  rDiscountPerTicket is to be used when posting tickets to database so that when
  total sales will be calculated by summing the Ride Ticket Prices in the 
  database, an accurate figure will be achieved
}
rDiscountPerTicket:=rDiscount/iRideTickets;

rTotal:=rSubTotal-rDiscount;


redReceiptRide.Clear;
redReceiptRide.Paragraph.TabCount:=2;
redReceiptRide.Paragraph.Tab[0]:=45;
redReceiptRide.Paragraph.Tab[1]:=100;

//putting date and time in variables bec. will be used later when posting to database
sDate:=DateToStr(now);
sTime:=TimeToStr(now);

redReceiptRide.Lines.Add(#9+ 'ADVENTURE LAND AMUSEMENT PARK');
redReceiptRide.Lines.Add(#9+ '          ''It''s My Kind Of Adventure'' ');
redReceiptRide.Lines.Add('');
redReceiptRide.Lines.Add(#9+ '                      Receipt');
redReceiptRide.Lines.Add(#9+ '                  RIDE TICKETS ');
redReceiptRide.Lines.Add('');
redReceiptRide.Lines.Add('Date: '+ sDate);
redReceiptRide.Lines.Add('Time: '+ sTime);
redReceiptRide.Lines.Add('Cashier: '+frmLogin.getCurrentUser('Name'));
redReceiptRide.Lines.Add('========================================');

redReceiptRide.Lines.Add('Tickets'+#9+#9+'Amount');
redReceiptRide.Lines.Add('');
redReceiptRide.Lines.Add(IntToStr(iRideTickets)+'x Ride Tickets @ R'+IntToStr(iRideTicketPrice)+' each'+#9+FloatToStrF(rSubTotal,ffCurrency,10,2));
redReceiptRide.Lines.Add('--------------------------------------------------------------------------------');
redReceiptRide.Lines.Add('');

if rDiscount>0 then
  begin
    redReceiptRide.Lines.Add('Discount: '+#9+#9+FloatToStrf(rDiscount,ffCurrency,10,2));
    redReceiptRide.Lines.Add('');
  end;

redReceiptRide.Lines.Add('Total Due: '+#9+#9+FloatToStrf(rTotal,ffCurrency,10,2));


//Get amount tendered by visitor. Display total due bec. visitor needs to know how much to pay

repeat
  rAmountTendered:=StrToFloat(InputBox('Amount Tendered','Total Amount due is '+FloatToStrF(rTotal,ffCurrency,10,2)+#13+'Please request the visitor to tender a valid amount: R','0'));
until rAmountTendered>=rTotal ;





rChange:=rAmountTendered-rTotal;

redReceiptRide.Lines.Add('');
redReceiptRide.Lines.Add('Amount Tendered: '+#9+FloatToStrf(rAmountTendered,ffCurrency,10,2));
redReceiptRide.Lines.Add('Change: '+#9+#9+FloatToStrF(rChange,ffCurrency,10,2));

redReceiptRide.Lines.Add('========================================');
redReceiptRide.Lines.Add(#9+ 'Thank You for visiting Adventure Land');
redReceiptRide.Lines.Add(#9+ '           Have an Adventurous Day! ');

//insert record in db using sql

with dmAdventureLand do
  begin

    iEmployeeID:=StrToInt(frmLogin.getCurrentUser('ID')); //get Employee ID of cashier (current user - employee)

    if iEmployeeID=0 then
      begin
        ShowMessage('Database Error. Employee not found.');
        Exit;
      end;

    with qryRideTicket do
      begin  
        //no need to insert Ride Transaction ID because it is auto-generated in the database by Access
        SQL.Text:='INSERT INTO [Ride Ticket] ([Entrance Ticket ID],[Employee ID],[Purchase Time],[Tickets Purchased],[Ride Ticket Price]) Values (:ETicketID,:EmployeeID,:Time,:TicketsPurchased,:RTicketPrice)';

        with Parameters do
          begin
            ParamByName('ETicketID').Value:=iTicketID;
            ParamByName('EmployeeID').Value:=iEmployeeID;
            ParamByName('Time').Value:=sTime;
            ParamByName('TicketsPurchased').Value:=IntToStr(iRideTickets); //Tickets Purchased is stored in database as a Short Text
            ParamByName('RTicketPrice').Value:=iRideTicketPrice-rDiscountPerTicket;
          end;
        ExecSQL;
      end;
  end;


//print the receipt
bPrinted:=False;
PrintDialog:=TPrintDialog.Create(frmEmployeeTickets);

if PrintDialog.Execute then
  begin
    AssignPrn(PrintFile);
    Rewrite(PrintFile);

    for I := 0 to redReceiptRide.Lines.Count do
      begin
        Writeln(PrintFile,redReceiptRide.Lines[I]);
      end;

    CloseFile(PrintFile);
    bPrinted:=True;

  end;

  PrintDialog.Free;

  if bPrinted=True then
    begin
      ShowMessage('The transaction has been completed and processed.'+#13+'The receipt has been printed');
    end
      else
        begin
          ShowMessage('The transaction has been completed and processed.'+#13+'The receipt has not been printed');
        end;



//must go last so that if validation error, wont reset all values


btnRnew.Enabled:=True;
btnRprocess.Enabled:=False;


end;

procedure TfrmEmployeeTickets.EntranceTicketsShow(Sender: TObject);
begin
btnEnew.Enabled:=True;
btnEprocess.Enabled:=False;

spnAdults.Value:=0;
spnChildren.Value:=0;
spnToddlers.Value:=0;

redReceiptEntrance.Lines.Clear;

dmAdventureLand.tblEmployee.Active:=True;
end;

procedure TfrmEmployeeTickets.FormActivate(Sender: TObject);
var
txtEntrancePrice, txtRidePrice :TextFile;
I:integer;
begin

frmEmployeeTickets.lblUsername.Caption:='Employee: '+frmLogin.getCurrentUser('Name');


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

       iAdultPrice:=iArrEntrancePrices[1];
       iChildPrice:=iArrEntrancePrices[2];
       iToddlerPrice:=iArrEntrancePrices[3];
      end;

if FileExists('Ride Ticket Price.txt')=False then
  begin
    ShowMessage('Ride Ticket Price not found');
  end
    else
      begin
       AssignFile(txtRidePrice,'Ride Ticket Price.txt');
       Reset(txtRidePrice);
       readln(txtRidePrice,iRideTicketPrice);  //only need to read in the first line
       CloseFile(txtRidePrice);
      end;

pgcTickets.ActivePage:=EntranceTickets;


end;

procedure TfrmEmployeeTickets.FormCreate(Sender: TObject);
begin
frmEmployeeTickets.AutoSize:=True;
end;

procedure TfrmEmployeeTickets.RideTicketsShow(Sender: TObject);
begin
btnRnew.Enabled:=True;
btnRprocess.Enabled:=False;


cmbEntranceID.Items.Clear; //reset so that can add the ticket numbers

cmbEntranceID.ItemIndex:=-1;
spnRideTickets.Value:=0;
redReceiptRide.Lines.Clear;

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
  tblEntranceTicket.Refresh;  //Refresh table after new tickets have been entered
  tblEntranceTicket.First;

  while not tblEntranceTicket.Eof do
    begin
    tblEntranceTransaction.Open;
    tblEntranceTransaction.Refresh;  //Refresh table after new tickets have been entered
    tblEntranceTransaction.First;
      while not tblEntranceTransaction.Eof do
        begin
          if (tblEntranceTicket['Entrance Transaction ID']=tblEntranceTransaction['Entrance Transaction ID']) and (tblEntranceTransaction['Entry Date']=DateToStr(Now))  then
            begin
              cmbEntranceID.Items.Add(tblEntranceTicket['Entrance Ticket ID']);
            end;
          tblEntranceTransaction.Next;
        end;
     tblEntranceTicket.Next;
     tblEntranceTransaction.Close;
    end;
  tblEntranceTicket.Close;
  end;

//coding if displaying all Entrance Ticket ID's not just for today only
{
  with dmAdventureLand do
        begin
          tblEntranceTicket.Open;
          tblEntranceTicket.First;
          while not tblEntranceTicket.Eof do
            begin
              cmbEntranceID.Items.Add(tblEntranceTicket['Entrance Ticket ID']);
              tblEntranceTicket.Next;
            end;
          tblEntranceTicket.Close;;
        end;
}
end;





procedure TfrmEmployeeTickets.Timer1Timer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
