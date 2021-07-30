unit About;

interface

uses Windows,SysUtils, Classes, Graphics,
 Forms, Controls,StdCtrls, Buttons, ExtCtrls,
  pngimage;

type
  TfrmAbout = class(TForm)
    pnlDisplay: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    OKButton: TButton;
    lblAppName: TLabel;
    lblVersion: TLabel;
    lblCopyright: TLabel;
    lblDescription: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAbout: TfrmAbout;

implementation

{$R *.dfm}

end.
 
