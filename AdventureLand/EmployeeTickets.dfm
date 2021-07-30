object frmEmployeeTickets: TfrmEmployeeTickets
  Left = 0
  Top = 0
  Caption = 'Tickets'
  ClientHeight = 561
  ClientWidth = 784
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel
    Left = -2
    Top = 520
    Width = 786
    Height = 41
    BorderStyle = bsSingle
    TabOrder = 0
    object lblDateTime: TLabel
      Left = 24
      Top = 15
      Width = 69
      Height = 13
      Caption = 'Date and Time'
    end
    object lblUsername: TLabel
      Left = 324
      Top = 15
      Width = 50
      Height = 13
      Caption = 'Employee:'
    end
    object BitBtn2: TBitBtn
      Left = 695
      Top = 7
      Width = 75
      Height = 25
      Hint = 'Return to Employee Home'
      Caption = 'Back'
      DoubleBuffered = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A6883E19883D1A883E19883D1AD1B3
        A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFC5A08E8C41178B40188B40188B4018D1B3A6FFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F45168F44178E45178F44
        168F4416FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFF924814B8710AC68006B8710A924815FFFFFFFFFFFFFFFFFFD1B3A6
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A6964D13C8850EC8850EC884
        0E974C13FFFFFFFFFFFFFFFFFF9B5111D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFD1
        B3A69B5111BD7918CC8B17CC8B18CC8B189B5111FFFFFFFFFFFFFFFFFF9F570F
        A0560FD1B3A6FFFFFFFFFFFFD1B3A6A0570FC07F21D09122D19123D19122C07F
        21A0560FFFFFFFFFFFFFFFFFFFA55C0DC4852AA45B0DD1B3A6D1B3A6A55B0DC4
        852AD5992ED5992ED5992EC4842AA55C0DD1B3A6FFFFFFFFFFFFFFFFFFA9600B
        DAA13AC78B34AA610BA9610BC78B33D9A03BDAA03AD9A13BC88A33A9610BD1B3
        A6FFFFFFFFFFFFFFFFFFFFFFFFAE6509DEA846DFA847CB913DDEA847DFA846DE
        A847DEA846CB913DAE6509D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB36A07
        E3AF52E2AF52E2AF52E3AF52E2AF52E2AF53CF9646B26B07D1B3A6FFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB66F05E6B65DE7B65DE7B75DE6B65DE6B65DE6
        B65DB76F05D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFBA7304
        EBBC67EABC67EBBD67EABC67EABC67D4A156BB7304D1B3A6FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFBE7602EDC16FEEC16FEEC16FEDC16FEEC16FED
        C16FD7A45CBE7602D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC07A01
        F0C575F0C575F0C575F0C575F0C575F0C575F0C575D8A761C17901D1B3A6FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFC37C00C37C00C37C00C37C00C37C00C37C00C3
        7C00C37C00C37C00C37C00C37C00D1B3A6FFFFFFFFFFFFFFFFFF}
      ParentDoubleBuffered = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = BitBtn2Click
    end
    object BitBtn6: TBitBtn
      Left = 590
      Top = 7
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkHelp
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = BitBtn6Click
    end
  end
  object pgcTickets: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 521
    ActivePage = EntranceTickets
    Style = tsFlatButtons
    TabOrder = 1
    object EntranceTickets: TTabSheet
      Caption = 'Entrance Tickets'
      OnShow = EntranceTicketsShow
      object GroupBox1: TGroupBox
        Left = 20
        Top = 64
        Width = 287
        Height = 193
        Caption = 'Number of tickets'
        TabOrder = 0
        object Label3: TLabel
          Left = 24
          Top = 40
          Width = 34
          Height = 13
          Caption = 'Adults:'
        end
        object Label4: TLabel
          Left = 24
          Top = 75
          Width = 43
          Height = 13
          Caption = 'Children:'
        end
        object Label5: TLabel
          Left = 24
          Top = 110
          Width = 45
          Height = 13
          Caption = 'Toddlers:'
        end
        object spnChildren: TSpinEdit
          Left = 112
          Top = 72
          Width = 121
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object spnToddlers: TSpinEdit
          Left = 112
          Top = 107
          Width = 121
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object spnAdults: TSpinEdit
          Left = 112
          Top = 37
          Width = 121
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object btnEprocess: TButton
          Left = 112
          Top = 152
          Width = 121
          Height = 25
          Caption = 'Process Transaction'
          TabOrder = 3
          OnClick = btnEprocessClick
        end
      end
      object btnEnew: TButton
        Left = 98
        Top = 22
        Width = 91
        Height = 25
        Caption = 'New Transaction'
        TabOrder = 1
        OnClick = btnEnewClick
      end
      object redReceiptEntrance: TRichEdit
        Left = 368
        Top = 64
        Width = 329
        Height = 365
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object RideTickets: TTabSheet
      Caption = 'Ride Tickets'
      ImageIndex = 1
      OnShow = RideTicketsShow
      object btnRnew: TButton
        Left = 98
        Top = 22
        Width = 91
        Height = 25
        Caption = 'New Transaction'
        TabOrder = 0
        OnClick = btnRnewClick
      end
      object GroupBox2: TGroupBox
        Left = 20
        Top = 64
        Width = 303
        Height = 153
        Caption = 'Number of tickets'
        TabOrder = 1
        object Label6: TLabel
          Left = 24
          Top = 64
          Width = 89
          Height = 13
          Caption = 'No. of ride tickets:'
        end
        object Label7: TLabel
          Left = 24
          Top = 32
          Width = 92
          Height = 13
          Caption = 'Entrance Ticket ID:'
        end
        object spnRideTickets: TSpinEdit
          Left = 160
          Top = 61
          Width = 121
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 0
          Value = 0
        end
        object btnRprocess: TButton
          Left = 160
          Top = 104
          Width = 113
          Height = 25
          Caption = 'Process Transaction'
          TabOrder = 1
          OnClick = btnRprocessClick
        end
        object cmbEntranceID: TComboBox
          Left = 158
          Top = 28
          Width = 123
          Height = 21
          TabOrder = 2
          Text = 'Ticket ID'
        end
      end
      object redReceiptRide: TRichEdit
        Left = 368
        Top = 64
        Width = 329
        Height = 365
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 112
    Top = 528
  end
end
