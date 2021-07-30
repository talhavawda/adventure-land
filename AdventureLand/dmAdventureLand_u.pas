unit dmAdventureLand_u;

interface

uses
Dialogs, Forms, SysUtils, Classes, ADODB, DB; //added dialogs and forms

type
  TdmAdventureLand = class(TDataModule)
    conAdventureLand: TADOConnection;
    tblAdmin: TADOTable;
    tblEmployee: TADOTable;
    tblRide: TADOTable;
    tblEntranceTransaction: TADOTable;
    tblRideTicket: TADOTable;
    tblEntranceTicket: TADOTable;
    tblSuggestion: TADOTable;
    tblFeedback: TADOTable;
    dsrAdmin: TDataSource;
    dsrEmployee: TDataSource;
    dsrRide: TDataSource;
    dsrEntranceTransaction: TDataSource;
    dsrEntranceTicket: TDataSource;
    dsrRideTicket: TDataSource;
    dsrSuggestion: TDataSource;
    dsrFeedback: TDataSource;
    qryEntranceTransaction: TADOQuery;
    qryEntranceTicket: TADOQuery;
    qryRideTicket: TADOQuery;
    qryEntranceSales: TADOQuery;
    dsrEntranceSales: TDataSource;
    dsrRideSales: TDataSource;
    qryRideSales: TADOQuery;
    qryFeedback: TADOQuery;
    qryEmployee: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmAdventureLand: TdmAdventureLand;

implementation

{$R *.dfm}

procedure TdmAdventureLand.DataModuleCreate(Sender: TObject);
begin

//dynamic connection to database
if FileExists(ExtractFilePath(Application.ExeName)+'Adventure Land.mdb') then
  begin
    with dmAdventureLand do
    begin
    conAdventureLand.ConnectionString:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+'Adventure Land.mdb;Persist Security Info=False';
    conAdventureLand.LoginPrompt:=False;
    tblAdmin.Connection:=conAdventureLand;
    tblEmployee.Connection:=conAdventureLand;
    tblRide.Connection:=conAdventureLand;
    tblEntranceTransaction.Connection:=conAdventureLand;
    tblEntranceTicket.Connection:=conAdventureLand;
    tblRideTicket.Connection:=conAdventureLand;
    tblSuggestion.Connection:=conAdventureLand;
    tblFeedback.Connection:=conAdventureLand;

    tblAdmin.TableName:='Admin';
    tblEmployee.TableName:='Employee';
    tblRide.TableName:='Ride';
    tblEntranceTransaction.TableName:='Entrance Transaction';
    tblEntranceTicket.TableName:='Entrance Ticket';
    tblRideTicket.TableName:='Ride Ticket';
    tblSuggestion.TableName:='Suggestion';
    tblFeedback.TableName:='Feedback';

    dsrAdmin.DataSet:=tblAdmin;
    dsrEmployee.DataSet:=tblEmployee;
    dsrRide.DataSet:=tblRide;
    dsrEntranceTransaction.DataSet:=tblEntranceTransaction;
    dsrEntranceTicket.DataSet:=tblEntranceTicket;
    dsrRideTicket.DataSet:=tblRideTicket;
    dsrSuggestion.DataSet:=tblSuggestion;


    tblAdmin.Active:=True;
    tblEmployee.Active:=True;
    tblRide.Active:=True;
    tblEntranceTransaction.Active:=True;
    tblEntranceTicket.Active:=True;
    tblRideTicket.Active:=True;
    tblSuggestion.Active:=True;
    tblFeedback.Active:=True;

    dsrAdmin.DataSet.Active:=True;
    dsrEmployee.DataSet.Active:=True;
    dsrRide.DataSet.Active:=True;
    dsrEntranceTransaction.DataSet.Active:=True;
    dsrEntranceTicket.DataSet.Active:=True;
    dsrRideTicket.DataSet.Active:=True;
    dsrSuggestion.DataSet.Active:=True;

    qryEmployee.Connection:=conAdventureLand;
    qryEmployee.Active:=False;


    qryEntranceTransaction.Connection:=conAdventureLand;
    qryEntranceTransaction.DataSource:=dsrEntranceTransaction;
    qryEntranceTransaction.Active:=False;

    qryEntranceTicket.Connection:=conAdventureLand;
    qryEntranceTicket.DataSource:=dsrEntranceTicket;
    qryEntranceTicket.Active:=False;

    qryRideTicket.Connection:=conAdventureLand;
    qryRideTicket.DataSource:=dsrRideTicket;
    qryRideTicket.Active:=False;


    qryEntranceSales.Connection:=conAdventureLand;
    qryEntranceSales.Active:=False;

    dsrEntranceSales.DataSet:=qryEntranceSales;
    dsrEntranceSales.DataSet.Active:=False;  //SQL text not set yet


    qryRideSales.Connection:=conAdventureLand;
    qryRideSales.Active:=False;

    dsrRideSales.DataSet:=qryRideSales;
    dsrRideSales.DataSet.Active:=False;  //SQL text not set yet



    qryFeedback.Connection:=conAdventureLand;
    qryFeedback.Active:=False;

    dsrFeedback.DataSet:=qryFeedback;
    dsrFeedback.DataSet.Active:=False;
    end;

    //ShowMessage('Database successfully connected');
  end
    else
      begin
      //ShowMessage('Database NOT connected');
      end;


end;

end.
