unit AdminReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes,Graphics,
 Controls, Forms, Dialogs, ExtCtrls, StdCtrls, Grids,
  DBGrids, ComCtrls, Buttons,DBCtrls,  Spin,Math, dmAdventureLand_u, DB,
  TeEngine, TeeDBEdit, TeeDBCrossTab, Series, GanttCh, TeeProcs, Chart;
   //added math, DB

type
  TfrmAdminReports = class(TForm)
    Panel2: TPanel;
    lblDateTime: TLabel;
    lblUsername: TLabel;
    btnClose: TBitBtn;
    pgcReports: TPageControl;
    tbsSales: TTabSheet;
    dbgEntranceSales: TDBGrid;
    gbxEntrance: TGroupBox;
    rgpEgroup: TRadioGroup;
    btnDispEtickets: TBitBtn;
    GroupBox1: TGroupBox;
    dbgRideSales: TDBGrid;
    rgpRgroup: TRadioGroup;
    btnDispRtickets: TBitBtn;
    tbsFeedback: TTabSheet;
    tbsStatistics: TTabSheet;
    tbsGraphs: TTabSheet;
    btnHelp: TBitBtn;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    GroupBox6: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    edtTIncome: TEdit;
    edtTTransactions: TEdit;
    edtTTickets: TEdit;
    edtETickets: TEdit;
    edtETransactions: TEdit;
    edtEIncome: TEdit;
    edtRTickets: TEdit;
    edtRTransactions: TEdit;
    edtRIncome: TEdit;
    edtAEntIncome: TEdit;
    edtAEntranceT: TEdit;
    dbgRideFeedback: TDBGrid;
    GroupBox9: TGroupBox;
    GroupBox10: TGroupBox;
    Label28: TLabel;
    edtVotes: TEdit;
    Label29: TLabel;
    edtAvrRating: TEdit;
    GroupBox11: TGroupBox;
    dbgSuggestion: TDBGrid;
    Label30: TLabel;
    Label31: TLabel;
    edtSID: TEdit;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    DBNavigator3: TDBNavigator;
    Time: TTimer;
    GroupBox12: TGroupBox;
    Chart1: TChart;
    rgpEntranceSales: TRadioGroup;
    GroupBox13: TGroupBox;
    rgpRideSales: TRadioGroup;
    tbsSinkingFund: TTabSheet;
    grpSinkingFund: TGroupBox;
    edtCurrentEquip: TLabeledEdit;
    spnDepreciation: TSpinEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    spnYears: TSpinEdit;
    edtNewEquip: TLabeledEdit;
    Label39: TLabel;
    Label40: TLabel;
    spnInflation: TSpinEdit;
    Label41: TLabel;
    spnInterest: TSpinEdit;
    Label42: TLabel;
    cmbCompoundType: TComboBox;
    btnCalculate: TButton;
    lblDisplay: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label4: TLabel;
    edtMCategory: TEdit;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    edtCEntIncome: TEdit;
    edtCEntranceT: TEdit;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    edtTEntIncome: TEdit;
    edtTEntranceT: TEdit;
    ctsEEmployeeID: TDBCrossTabSource;
    ctsECategory: TDBCrossTabSource;
    ctsEMonth: TDBCrossTabSource;
    memSuggestion: TMemo;
    DBNavigator4: TDBNavigator;
    ctsRMonth: TDBCrossTabSource;
    ctsREmployeeID: TDBCrossTabSource;
    Chart2: TChart;
    Series4: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series5: TBarSeries;
    Series1: TBarSeries;
    lblEcategory: TLabel;
    lblRcategory: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure TimeTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tbsSinkingFundShow(Sender: TObject);
    procedure btnCalculateClick(Sender: TObject);
    procedure btnDispEticketsClick(Sender: TObject);
    procedure tbsSalesShow(Sender: TObject);
    procedure btnDispRticketsClick(Sender: TObject);
    procedure tbsStatisticsShow(Sender: TObject);
    procedure rgpEntranceSalesClick(Sender: TObject);
    procedure dbgSuggestionCellClick(Column: TColumn);
    procedure btnParkAverageClick(Sender: TObject);
    procedure btnRidesAverageClick(Sender: TObject);
    procedure tbsFeedbackShow(Sender: TObject);
    procedure rgpEgroupClick(Sender: TObject);
    procedure rgpRgroupClick(Sender: TObject);
    procedure btnHelpClick(Sender: TObject);
    procedure rgpRideSalesClick(Sender: TObject);
    procedure tbsGraphsShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAdminReports: TfrmAdminReports;

implementation

{$R *.dfm}

uses Login;





procedure TfrmAdminReports.btnDispEticketsClick(Sender: TObject);
begin
rgpEgroup.ItemIndex:=-1;

with dmAdventureLand.qryEntranceSales do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT [Entrance Ticket ID],[Entrance Ticket].[Entrance Transaction ID], [Employee ID],[Entry Date],Category, [Entrance Ticket Price]');
    SQL.Add('FROM [Entrance Transaction], [Entrance Ticket] WHERE [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID]');
    Active:=True;
    TFloatField(FieldByName('Entrance Ticket Price')).Currency:=True;
  end;
end;

procedure TfrmAdminReports.btnDispRticketsClick(Sender: TObject);
begin
rgpRgroup.ItemIndex:=-1;

with dmAdventureLand.qryRideSales do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT [Ride Transaction ID],[Ride Ticket].[Entrance Ticket ID],[Ride Ticket].[Employee ID],[Entrance Transaction].[Entry Date],[Purchase Time],[Tickets Purchased],[Ride Ticket Price],[Tickets Purchased]*[Ride Ticket Price] AS [Total Sale]');
    SQL.Add('FROM [Ride Ticket],[Entrance Transaction], [Entrance Ticket]');
    SQL.Add('WHERE ( [Entrance Ticket].[Entrance Ticket ID]=[Ride Ticket].[Entrance Ticket ID] ) AND ( [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID] ) ');
    Active:=True;
    TDateTimeField(FieldByName('Purchase Time')).DisplayFormat:='hh:mm:ss';
    TFloatField(FieldByName('Ride Ticket Price')).Currency:=True;
    TFloatField(FieldByName('Total Sale')).Currency:=True;
  end;


end;

procedure TfrmAdminReports.btnHelpClick(Sender: TObject);
var
sHelp:string;
begin
sHelp:='                                     HELP - Admin Reports Screen'+#13+#13;
sHelp:=sHelp+'1. Click a button at the top left corner to switch between pages.'+#13+#13;
sHelp:=sHelp+'2. Ticket Sales:'+#13;
sHelp:=sHelp+'    a. Click on a record or use the navigate buttons to navigate through either of the tables.'+#13;
sHelp:=sHelp+'    b. Select a category from the radio button to group by.'+#13;
sHelp:=sHelp+'    c. Click ''Display all Tickets'' to display all the tickets.'+#13+#13;
sHelp:=sHelp+'3. Feedback:'+#13;
sHelp:=sHelp+'    a. Click on a record or use the navigate buttons to navigate through either of the tables.'+#13;
sHelp:=sHelp+'    b. For Suggestions, the Suggestion is displayed in the area alongside the grid.'+#13+#13;
sHelp:=sHelp+'4.  Sinking Fund: Enter the values in the fields and spinners provided and click ''Calculate'' to calculate the amount to save monthly.'+#13+#13;
sHelp:=sHelp+'5. Click ''Back'' to return to the Admin Home Screen.';

ShowMessage(sHelp);
end;

procedure TfrmAdminReports.btnRidesAverageClick(Sender: TObject);
begin

with dmAdventureLand.qryFeedback do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT [Ride ID], Count([Ride ID]) AS [Number of Votes], (Sum(Rating)/Count([Ride ID])) AS [Average Rating]');
    SQL.Add('FROM Feedback WHERE Category Like''Ride Feedback'' Group By [Ride ID] ');
    Active:=True;
    TFloatField(FieldByName('Average Rating')).DisplayFormat:='####.0';
  end;
end;

procedure TfrmAdminReports.btnParkAverageClick(Sender: TObject);
var
  I, iCount,iSum,iRating: integer;
  rAverage:real;
begin

with dmAdventureLand do
  begin
    tblFeedback.Open;
    tblFeedback.First;

    iCount:=0;
    iSum:=0;

    for I := 1 to tblFeedback.RecordCount do
      begin
        if tblFeedback['Category']='Park Feedback' then
          begin
            Inc(iCount);
            iRating:=tblFeedback['Rating'];
            inc(iSum,iRating);
          end;
        tblFeedback.Next;
      end;

    rAverage:=iSum/iCount;

    edtVotes.Text:=IntToStr(iCount);
    edtAvrRating.Text:=FloatToStrF(rAverage,ffFixed,8,1);
  end;
end;

procedure TfrmAdminReports.dbgSuggestionCellClick(Column: TColumn);
begin
with dmAdventureLand do
  begin
    edtSID.Text:=tblSuggestion['Suggestion ID'];
    memSuggestion.Lines.Text:=''; //clear
    memSuggestion.Lines.Text:=tblSuggestion['Suggestion'];
  end;

end;

procedure TfrmAdminReports.btnCalculateClick(Sender: TObject);
var
rScrapValue, rCostNew, rSinkingFund, rInterest, rMonthlyPayment:real;
iCurrentEquip, iNewEquip, iDepreciationRate, iYears, iInflationRate, iInterestRate, iCompoundType, iInstallments:integer;
begin
//Validation: NumbersOnly property of LabeledEdit's set to True

if edtCurrentEquip.Text='' then
  begin
    ShowMessage('Please enter a value for existing equipment');
    Exit;
  end;

if edtNewEquip.Text='' then
  begin
    ShowMessage('Please enter a value for new equipment');
    Exit;
  end;


//Validation -> MinValue of SpinEdits' set to zero so user cant enter any value less than 0

//Min Value must be greater than 0.
//Having this validation over and above MinValue property to force the user to enter a value
if spnDepreciation.Value<=0 then
  begin
    ShowMessage('Please select a value for the rate of depreciation');
    Exit;
  end;

if spnYears.Value<=0 then
  begin
    ShowMessage('Please select a value for the number of years');
    Exit;
  end;

if spnInflation.Value<=0 then
  begin
   ShowMessage('Please select a value for the rate of inflation');
   Exit;
  end;

if spnInterest.Value<=0 then
  begin
    ShowMessage('Please select a value for the rate of interest');
    Exit;
  end;

if cmbcompoundType.ItemIndex=-1 then
  begin
    ShowMessage('Please select a compound period');
    Exit;
  end;


iCurrentEquip:=StrToInt(edtCurrentEquip.Text);
iDepreciationRate:=spnDepreciation.Value;

iNewEquip:=StrToInt(edtNewEquip.Text);
iYears:=spnYears.Value;
iInflationRate:=spnInflation.Value;

iInterestRate:=spnInterest.Value;
iCompoundType:=cmbCompoundType.ItemIndex;


rScrapValue:=(iCurrentEquip)*power(1-(iDepreciationRate/100),iYears);
rCostNew:=(iNewEquip)*power(1+(iInflationRate/100),iYears);

rSinkingFund:=rCostNew-rScrapValue;

if rSinkingFund<0 then //if cost of new equipment is less than value of current equipment when at the time needed to purchase new equipment
  begin
    lblDisplay.Caption:='Sale of current equipment will be sufficient to purchase new equipment';
    Exit;
  end;

case iCompoundType of    //iInstallments is number of installments per year
0: iInstallments:=12; //monthly
1: iInstallments:=4;  //quarterly
2: iInstallments:=2;  //semi-annually
3: iInstallments:=1;  //annually
end;


rInterest:= iInterestRate/(100*iInstallments);

rMonthlyPayment:= (rSinkingFund*rInterest)/(power((1+rInterest),(iYears*iInstallments))-1);
//x=(Fi)/(power(1+i,n)-1)
//first payment made after one month, last payment made on due date -> important concept for formula

lblDisplay.Caption:='Monthly installments in sinking fund: '+FloatToStrF(rMonthlyPayment,ffCurrency,10,2);
end;

procedure TfrmAdminReports.btnCloseClick(Sender: TObject);
begin
frmAdminReports.Close;
end;

procedure TfrmAdminReports.FormActivate(Sender: TObject);
begin
frmAdminReports.lblUsername.Caption:='Admin: '+frmLogin.getCurrentUser('Name');

pgcReports.ActivePage:=tbsSales;
end;

procedure TfrmAdminReports.FormCreate(Sender: TObject);
begin
frmAdminReports.AutoSize:=True;

end;

procedure TfrmAdminReports.rgpEgroupClick(Sender: TObject);
var
iGroup:integer;
begin

if rgpEgroup.ItemIndex=-1 then
  begin
    ShowMessage('Please select a category to group by');
    Exit;
  end;

iGroup:=rgpEgroup.ItemIndex;


with dmAdventureLand.qryEntranceSales do
  begin
    Active:=False;
    SQL.Clear;
    case iGroup of
    0:      //Transaction ID
      begin
      SQL.Add('SELECT [Entrance Transaction ID],Sum([Entrance Ticket Price]) AS [Total Sales]');
      SQL.Add('FROM [Entrance Ticket] GROUP BY [Entrance Transaction ID]');
      end;
    1:      //Date
      begin
        //SQL - pulling info from 2 tables
        SQL.Add('SELECT [Entry Date],Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Transaction],[Entrance Ticket] WHERE [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID] GROUP BY [Entry Date]');
      end;
    2:     //Category
      begin
        SQL.Add('SELECT Category,Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Ticket] GROUP BY Category');
      end;
    3:     //Employee ID
      begin
        SQL.Add('SELECT [Employee ID],Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Transaction],[Entrance Ticket] WHERE [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID] GROUP BY [Employee ID]');
      end;
    end;
    Active:=True;
    TFloatField(FieldByName('Total Sales')).Currency:=True;
  end;

end;

procedure TfrmAdminReports.rgpEntranceSalesClick(Sender: TObject);
var
iOption:integer;
begin
ctsEMonth.Active:=False;
series1.Active:=False;

ctsEEmployeeID.Active:=False;
series2.Active:=False;

ctsECategory.Active:=False;
series3.Active:=False;




iOption:=rgpEntranceSales.ItemIndex;

dmAdventureLand.dsrEntranceSales.DataSet.Active:=True;



with dmAdventureLand.qryEntranceSales do
  begin
    Active:=False;
    SQL.Clear;

    case iOption of
    0:   //Month
      begin
        SQL.Add('SELECT Month([Entry Date]) AS SaleMonth, Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Transaction],[Entrance Ticket] WHERE [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID] GROUP BY Month([Entry Date])');
        Active:=True;
        ctsEMonth.Active:=True;
        series1.Active:=True;
        lblEcategory.Caption:='Month';
      end;
    1:  //Employee ID
      begin
        SQL.Add('SELECT [Employee ID],Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Transaction],[Entrance Ticket] WHERE [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID] GROUP BY [Employee ID]');
        Active:=True;
        ctsEEmployeeID.Active:=True;
        series2.Active:=True;
        lblEcategory.Caption:='Employee ID';
      end;
    2:  //Category
      begin
        SQL.Add('SELECT Category,Sum([Entrance Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Entrance Ticket] GROUP BY Category');
        Active:=True;
        ctsECategory.Active:=True;
        series3.Active:=True;
        lblEcategory.Caption:='Category';
      end;
    end;
    //Active:=True;
  end;




end;

procedure TfrmAdminReports.rgpRgroupClick(Sender: TObject);
var
iGroup:integer;
begin
if rgpRgroup.ItemIndex=-1 then
  begin
    ShowMessage('Please select a category to Group By');
    Exit;
  end;

iGroup:=rgpRgroup.ItemIndex;

with dmAdventureLand.qryRideSales do
  begin
    Active:=False;
    SQL.Clear;
    case iGroup of
    0:  //Date
      begin
        SQL.Add('Select [Entry Date], Sum([Tickets Purchased]*[Ride Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Ride Ticket],[Entrance Transaction], [Entrance Ticket]');
        SQL.Add('WHERE ( [Entrance Ticket].[Entrance Ticket ID]=[Ride Ticket].[Entrance Ticket ID] ) AND ( [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID]) ');
        SQL.Add('GROUP BY [Entry Date]');
      end;
    1:  //Employee ID
      begin
      SQL.Add('SELECT [Employee ID],Sum([Tickets Purchased]*[Ride Ticket Price]) AS [Total Sales] ');
      SQL.Add('FROM [Ride Ticket] GROUP BY [Employee ID]');
      end;
    end;
    Active:=True;
    TFloatField(FieldByName('Total Sales')).Currency:=True;
  end;
end;

procedure TfrmAdminReports.rgpRideSalesClick(Sender: TObject);
var
iOption:integer;
begin
ctsRMonth.Active:=False;
series4.Active:=False;

ctsREmployeeID.Active:=False;
series5.Active:=False;

iOption:=rgpRideSales.ItemIndex;


dmAdventureLand.dsrRideSales.DataSet.Active:=True;


with dmAdventureLand.qryRideSales do
  begin
    Active:=False;
    SQL.Clear;

    case iOption of
    0:   //Month
      begin
        SQL.Add('SELECT Month([Entry Date]) AS SaleMonth, Sum([Tickets Purchased]*[Ride Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Ride Ticket],[Entrance Transaction], [Entrance Ticket] ');
        SQL.Add('WHERE ( [Entrance Ticket].[Entrance Ticket ID]=[Ride Ticket].[Entrance Ticket ID] ) AND ( [Entrance Transaction].[Entrance Transaction ID] =  [Entrance Ticket].[Entrance Transaction ID]) ');
        SQL.Add('GROUP BY Month([Entry Date])');
        Active:=True;
        ctsRMonth.Active:=True;
        series4.Active:=True;
        lblRcategory.Caption:='Month';
      end;
    1:  //Employee ID
      begin
        SQL.Add('SELECT [Employee ID],Sum([Tickets Purchased]*[Ride Ticket Price]) AS [Total Sales]');
        SQL.Add('FROM [Ride Ticket] GROUP BY [Employee ID]');
        Active:=True;
        ctsREmployeeID.Active:=True;
        series5.Active:=True;
        lblRcategory.Caption:='Employee ID';
      end;
    end;
    ///Active:=True;
  end;


end;

procedure TfrmAdminReports.tbsFeedbackShow(Sender: TObject);
var
  I, iCount,iSum,iRating: integer;
  rAverage:real;
begin

//Ride Feedback -> calculate average
with dmAdventureLand.qryFeedback do
  begin
    Active:=False;
    SQL.Clear;
    SQL.Add('SELECT [Ride ID], Count([Ride ID]) AS [Number of Votes], (Sum(Rating)/Count([Ride ID])) AS [Average Rating]');
    SQL.Add('FROM Feedback WHERE Category Like''Ride Feedback'' Group By [Ride ID] ');
    Active:=True;
    TFloatField(FieldByName('Average Rating')).DisplayFormat:='####.0';
  end;


//Park Feedback -> calculate average

with dmAdventureLand do
  begin
    tblFeedback.Open;
    tblFeedback.First;

    iCount:=0;
    iSum:=0;

    for I := 1 to tblFeedback.RecordCount do
      begin
        if tblFeedback['Category']='Park Feedback' then
          begin
            Inc(iCount);
            iRating:=tblFeedback['Rating'];
            inc(iSum,iRating);
          end;
        tblFeedback.Next;
      end;

    rAverage:=iSum/iCount;

    edtVotes.Text:=IntToStr(iCount);
    edtAvrRating.Text:=FloatToStrF(rAverage,ffFixed,8,1);
  end;


end;

procedure TfrmAdminReports.tbsGraphsShow(Sender: TObject);
begin
lblEcategory.Caption:='';
lblRcategory.Caption:='';
end;

procedure TfrmAdminReports.tbsSalesShow(Sender: TObject);
begin
dmAdventureLand.dsrEntranceSales.DataSet.Active:=False;
dmAdventureLand.dsrRideSales.DataSet.Active:=False;

dmAdventureLand.qryEntranceSales.Active:=False;
dmAdventureLand.qryRideSales.Active:=False;


ctsEMonth.Active:=False;
series1.Active:=False;

ctsEEmployeeID.Active:=False;
series2.Active:=False;

ctsECategory.Active:=False;
series3.Active:=False;

ctsRMonth.Active:=False;
series4.Active:=False;

ctsREmployeeID.Active:=False;
series5.Active:=False;


rgpEgroup.ItemIndex:=-1;
rgpRgroup.ItemIndex:=-1;


//Display all the tickets when the Ticket Sales page is shown
//call the respective button OnClick events that display all the tickets
btnDispEtickets.Click;
btnDispRtickets.Click;
end;

procedure TfrmAdminReports.tbsSinkingFundShow(Sender: TObject);
begin
edtCurrentEquip.Text:='';
spnDepreciation.Value:=0;
edtNewEquip.Text:='';
spnYears.Value:=0;
spnInflation.Value:=0;
spnInterest.Value:=0;
cmbCompoundType.ItemIndex:=-1;
lblDisplay.Caption:='';




end;

procedure TfrmAdminReports.tbsStatisticsShow(Sender: TObject);
var
iETransactions,iRTransactions,iTTransactions, iETickets,iRTickets,iTTickets:integer;
iAEntranceT,iCEntranceT,iTEntranceT:integer;
rEIncome,rRIncome,rTIncome, rAEntIncome,rCEntIncome,rTEntIncome:real;
sModalCategory:string;
begin
dmAdventureLand.dsrEntranceSales.DataSet.Active:=False;
dmAdventureLand.dsrRideSales.DataSet.Active:=False;

dmAdventureLand.qryEntranceSales.Active:=False;
dmAdventureLand.qryRideSales.Active:=False;

ctsEMonth.Active:=False;
series1.Active:=False;

ctsEEmployeeID.Active:=False;
series2.Active:=False;

ctsECategory.Active:=False;
series3.Active:=False;

ctsRMonth.Active:=False;
series4.Active:=False;

ctsREmployeeID.Active:=False;
series5.Active:=False;



with dmAdventureLand do
  begin
    iETransactions:=tblEntranceTransaction.RecordCount; //Total Entrance Ticket Transactions
    iRTransactions:=tblRideTicket.RecordCount;          //Total Ride Ticket Transactions
    iTTransactions:=iETransactions+iRTransactions;      //Total Transactions

    edtTTransactions.Text:=IntToStr(iTTransactions);
    edtETransactions.Text:=IntToStr(iETransactions);
    edtRTransactions.Text:=IntToStr(iRTransactions);


    iETickets:=tblEntranceTicket.RecordCount;          //Total number of entrance tickets issued

    with qryRideSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Sum([Tickets Purchased]) AS RideTickets FROM [Ride Ticket]');
        Active:=True;
        iRTickets:=StrToInt(FieldByName('RideTickets').AsString);  //Total number of ride tickets issued
      end;

    iTTickets:=iETickets+iRTickets;  //Total number of tickets issued

    edtETickets.Text:=IntToStr(iETickets);
    edtRTickets.Text:=IntToStr(iRTickets);
    edtTTickets.Text:=IntToStr(iTTickets);


    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Sum([Entrance Ticket Price]) AS EntranceIncome FROM [Entrance Ticket]');
        Active:=True;
        rEIncome:=StrToFloat(FieldByName('EntranceIncome').AsString); //Income from Entrance Tickets
      end;

    with qryRideSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Sum([Tickets Purchased]*[Ride Ticket Price]) AS RideIncome FROM [Ride Ticket]');
        Active:=True;
        rRIncome:=StrToFloat(FieldByName('RideIncome').AsString); //Income from Ride Tickets
      end;

    rTIncome:=rEIncome+rRIncome; //Total Income

    edtEIncome.Text:=FloatToStrF(rEIncome,ffCurrency,8,2);
    edtRIncome.Text:=FloatToStrF(rRIncome,ffCurrency,8,2);
    edtTIncome.Text:=FloatToStrF(rTIncome,ffCurrency,8,2);

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Category, Count(Category) FROM [Entrance Ticket] GROUP BY Category ORDER BY Count(Category) DESC');
        Active:=True;
        sModalCategory:=FieldByName('Category').AsString; //modal category (category with most tickets issued) will be the first record
      end;

    edtMCategory.Text:=sModalCategory;

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Count(*) AS AdultTickets FROM [Entrance Ticket] WHERE Category=''Adult'' ');
        Active:=True;
        iAEntranceT:=FieldByName('AdultTickets').AsInteger; //Total number of entrance tickets that are Adults
      end;

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Count(*) AS ChildTickets FROM [Entrance Ticket] WHERE Category=''Child'' ');
        Active:=True;
        iCEntranceT:=FieldByName('ChildTickets').AsInteger; //Total number of entrance tickets that are Children
      end;

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQL.Add('SELECT Count(*) AS ToddlerTickets FROM [Entrance Ticket] WHERE Category=''Toddler'' ');
        Active:=True;
        iTEntranceT:=FieldByName('ToddlerTickets').AsInteger; //Total number of entrance tickets that are Toddlers
      end;

    edtAEntranceT.Text:=IntToStr(iAEntranceT);
    edtCEntranceT.Text:=IntToStr(iCEntranceT);
    edtTEntranceT.Text:=IntToStr(iTEntranceT);


    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQl.Add('SELECT Sum([Entrance Ticket Price]) AS AdultIncome FROM [Entrance Ticket] WHERE Category=''Adult''');
        Active:=True;
        rAEntIncome:=FieldByName('AdultIncome').AsFloat;
      end;

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQl.Add('SELECT Sum([Entrance Ticket Price]) AS ChildIncome FROM [Entrance Ticket] WHERE Category=''Child''');
        Active:=True;
        rCEntIncome:=FieldByName('ChildIncome').AsFloat;
      end;

    with qryEntranceSales do
      begin
        Active:=False;
        SQL.Clear;
        SQl.Add('SELECT Sum([Entrance Ticket Price]) AS ToddlerIncome FROM [Entrance Ticket] WHERE Category=''Toddler''');
        Active:=True;
        rTEntIncome:=FieldByName('ToddlerIncome').AsFloat;
      end;


   edtAEntIncome.Text:=FloatToStrF(rAEntIncome,ffCurrency,8,2);
   edtCEntIncome.Text:=FloatToStrF(rCEntIncome,ffCurrency,8,2);
   edtTEntIncome.Text:=FloatToStrF(rTEntIncome,ffCurrency,8,2);
  end;

end;

procedure TfrmAdminReports.TimeTimer(Sender: TObject);
begin
lblDateTime.Caption:=DateToStr(Now)+'  |  '+TimeToStr(Now);
end;

end.
