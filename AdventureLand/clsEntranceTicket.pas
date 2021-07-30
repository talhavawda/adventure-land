unit clsEntranceTicket;

interface
type
  TEntranceTicket=class(TObject)
  private
  fAdults:integer;
  fChildren:integer;
  fToddlers:integer;
  fAdultPrice:integer;
  fChildPrice:integer;
  fToddlerPrice:integer;

  public
  constructor Create(iAdults,iAdultPrice,iChildren,iChildPrice,iToddlers,iToddlerPrice:integer);
  function GetAdults:integer;
  function GetChildren:integer;
  function GetToddlers:integer;
  function GetAdultPrice:integer;
  function GetChildPrice:integer;
  function GetToddlerPrice:integer;
  function GetTotalTickets:integer;
  function CalcAdultCost:real;
  function CalcChildCost:real;
  function CalcToddlerCost:real;
  function CalcSubtotal:real;
  function CalcDiscount:real;
  function CalcDiscountPerTicket:real;
  function CalcTotal:real;
  end;

implementation

{ TEntranceTicket }

function TEntranceTicket.CalcAdultCost: real;
begin
Result:=GetAdults*GetAdultPrice;
end;

function TEntranceTicket.CalcChildCost: real;
begin
Result:=GetChildren*GetChildPrice;
end;

function TEntranceTicket.CalcDiscount: real;
begin
case GetTotalTickets of
10..19: Result:=CalcSubtotal*0.05;  //5% discount
20..29: Result:=CalcSubtotal*0.10;  //10% discount
30..100:Result:=CalcSubtotal*0.15; //15% discount | Max Tickets able to purchase is 100
end;
end;

function TEntranceTicket.CalcDiscountPerTicket: real;
begin
Result:=CalcDiscount/GetTotalTickets;
{
  rDiscountPerTicket is to be used when posting tickets to database so that when
  total sales will be calculated by summing the Entrance Ticket Prices in the
  database, an accurate figure will be achieved
}
end;

function TEntranceTicket.CalcSubtotal: real;
begin
Result:=CalcAdultCost+CalcChildCost+CalcToddlerCost;
end;

function TEntranceTicket.CalcToddlerCost: real;
begin
Result:=GetToddlers*GetToddlerPrice;
end;

function TEntranceTicket.CalcTotal: real;
begin
Result:=CalcSubtotal-CalcDiscount;
end;

constructor TEntranceTicket.Create(iAdults,iAdultPrice,iChildren,iChildPrice,iToddlers,iToddlerPrice:integer);
begin
fAdults:=iAdults;
fAdultPrice:=iAdultPrice;
fChildren:=iChildren;
fChildPrice:=iChildPrice;
fToddlers:=iToddlers;
fToddlerPrice:=iToddlerPrice;
end;

function TEntranceTicket.GetAdultPrice: integer;
begin
Result:=fAdultPrice;
end;

function TEntranceTicket.GetAdults: integer;
begin
Result:=fAdults;
end;

function TEntranceTicket.GetChildPrice: integer;
begin
Result:=fChildPrice;
end;

function TEntranceTicket.GetChildren: integer;
begin
Result:=fChildren;
end;

function TEntranceTicket.GetToddlerPrice: integer;
begin
Result:=fToddlerPrice;
end;

function TEntranceTicket.GetToddlers: integer;
begin
Result:=fToddlers;
end;

function TEntranceTicket.GetTotalTickets: integer;
begin
Result:=fAdults+fChildren+fToddlers;
end;

end.
