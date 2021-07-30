object frmAdminReports: TfrmAdminReports
  Left = 0
  Top = 0
  Caption = 'Reports'
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
    Top = 521
    Width = 790
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
      Width = 33
      Height = 13
      Caption = 'Admin:'
    end
    object btnClose: TBitBtn
      Left = 695
      Top = 7
      Width = 75
      Height = 25
      Hint = 'Return to Admin Home'
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
      OnClick = btnCloseClick
    end
    object btnHelp: TBitBtn
      Left = 590
      Top = 7
      Width = 75
      Height = 25
      DoubleBuffered = True
      Kind = bkHelp
      ParentDoubleBuffered = False
      TabOrder = 1
      OnClick = btnHelpClick
    end
  end
  object pgcReports: TPageControl
    Left = 0
    Top = 0
    Width = 780
    Height = 521
    ActivePage = tbsSinkingFund
    Style = tsFlatButtons
    TabOrder = 1
    object tbsSales: TTabSheet
      Caption = 'Ticket Sales'
      OnShow = tbsSalesShow
      object gbxEntrance: TGroupBox
        Left = 18
        Top = 16
        Width = 755
        Height = 217
        Caption = 'Entrance Ticket Sales'
        TabOrder = 0
        object dbgEntranceSales: TDBGrid
          Left = 3
          Top = 17
          Width = 520
          Height = 153
          DataSource = dmAdventureLand.dsrEntranceSales
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object rgpEgroup: TRadioGroup
          Left = 529
          Top = 32
          Width = 104
          Height = 105
          Hint = 'Select a category to group by'
          Caption = 'Group By'
          Items.Strings = (
            'Transaction ID'
            'Date'
            'Category'
            'Employee ID')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rgpEgroupClick
        end
        object btnDispEtickets: TBitBtn
          Left = 639
          Top = 80
          Width = 97
          Height = 25
          Caption = 'Display All Tickets'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = btnDispEticketsClick
        end
        object DBNavigator2: TDBNavigator
          Left = 3
          Top = 176
          Width = 520
          Height = 25
          DataSource = dmAdventureLand.dsrEntranceSales
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
      object GroupBox1: TGroupBox
        Left = 20
        Top = 253
        Width = 755
        Height = 234
        Caption = 'Ride Ticket Sales'
        TabOrder = 1
        object dbgRideSales: TDBGrid
          Left = 3
          Top = 34
          Width = 528
          Height = 160
          DataSource = dmAdventureLand.dsrRideSales
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object rgpRgroup: TRadioGroup
          Left = 537
          Top = 58
          Width = 96
          Height = 71
          Hint = 'Select a category to group by'
          Caption = 'Group By'
          Items.Strings = (
            'Date'
            'Employee ID')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = rgpRgroupClick
        end
        object btnDispRtickets: TBitBtn
          Left = 639
          Top = 87
          Width = 113
          Height = 25
          Caption = 'Display All Tickets'
          DoubleBuffered = True
          ParentDoubleBuffered = False
          TabOrder = 2
          OnClick = btnDispRticketsClick
        end
        object DBNavigator3: TDBNavigator
          Left = 3
          Top = 200
          Width = 528
          Height = 25
          DataSource = dmAdventureLand.dsrRideSales
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
        end
      end
    end
    object tbsStatistics: TTabSheet
      Caption = 'Statistics'
      ImageIndex = 2
      OnShow = tbsStatisticsShow
      object GroupBox2: TGroupBox
        Left = 18
        Top = 16
        Width = 295
        Height = 123
        Caption = 'General Statistics'
        TabOrder = 0
        object Label3: TLabel
          Left = 18
          Top = 24
          Width = 66
          Height = 13
          Caption = 'Total Income:'
        end
        object Label11: TLabel
          Left = 18
          Top = 92
          Width = 118
          Height = 13
          Caption = 'Total Tickets Generated:'
        end
        object Label12: TLabel
          Left = 18
          Top = 58
          Width = 137
          Height = 13
          Caption = 'Total Transactions occurred:'
        end
        object edtTIncome: TEdit
          Left = 174
          Top = 21
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtTTransactions: TEdit
          Left = 174
          Top = 55
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edtTTickets: TEdit
          Left = 174
          Top = 89
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
      object GroupBox3: TGroupBox
        Left = 18
        Top = 151
        Width = 295
        Height = 162
        Caption = 'Entrance Tickets'
        TabOrder = 1
        object Label5: TLabel
          Left = 18
          Top = 62
          Width = 138
          Height = 13
          Caption = 'Total Entrance Transactions:'
        end
        object Label7: TLabel
          Left = 18
          Top = 96
          Width = 110
          Height = 13
          Caption = 'Total Entrance Tickets:'
        end
        object Label9: TLabel
          Left = 18
          Top = 28
          Width = 128
          Height = 13
          Caption = 'Income - Entrance Tickets:'
        end
        object Label4: TLabel
          Left = 18
          Top = 130
          Width = 155
          Height = 13
          Caption = 'Modal Category (tickets issued):'
        end
        object edtETickets: TEdit
          Left = 174
          Top = 93
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtETransactions: TEdit
          Left = 174
          Top = 59
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edtEIncome: TEdit
          Left = 174
          Top = 25
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
        object edtMCategory: TEdit
          Left = 174
          Top = 127
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GroupBox4: TGroupBox
        Left = 18
        Top = 336
        Width = 295
        Height = 123
        Caption = 'Ride Tickets'
        TabOrder = 2
        object Label10: TLabel
          Left = 18
          Top = 24
          Width = 106
          Height = 13
          Caption = 'Income - Ride Tickets:'
        end
        object Label6: TLabel
          Left = 18
          Top = 92
          Width = 88
          Height = 13
          Caption = 'Total Ride Tickets:'
        end
        object Label8: TLabel
          Left = 18
          Top = 58
          Width = 116
          Height = 13
          Caption = 'Total Ride Transactions:'
        end
        object edtRTickets: TEdit
          Left = 174
          Top = 89
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object edtRTransactions: TEdit
          Left = 174
          Top = 55
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object edtRIncome: TEdit
          Left = 174
          Top = 21
          Width = 99
          Height = 21
          ReadOnly = True
          TabOrder = 2
        end
      end
      object GroupBox5: TGroupBox
        Left = 351
        Top = 70
        Width = 380
        Height = 337
        Caption = 'Category - Entrance Tickets'
        TabOrder = 3
        object GroupBox6: TGroupBox
          Left = 17
          Top = 21
          Width = 328
          Height = 84
          Caption = 'Adult'
          TabOrder = 0
          object Label20: TLabel
            Left = 11
            Top = 52
            Width = 113
            Height = 13
            Caption = 'Total Entrance Tickets: '
          end
          object Label22: TLabel
            Left = 11
            Top = 22
            Width = 131
            Height = 13
            Caption = 'Income - Entrance Tickets: '
          end
          object edtAEntIncome: TEdit
            Left = 190
            Top = 19
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object edtAEntranceT: TEdit
            Left = 190
            Top = 49
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GroupBox7: TGroupBox
          Left = 17
          Top = 126
          Width = 328
          Height = 84
          Caption = 'Child'
          TabOrder = 1
          object Label13: TLabel
            Left = 11
            Top = 52
            Width = 113
            Height = 13
            Caption = 'Total Entrance Tickets: '
          end
          object Label14: TLabel
            Left = 11
            Top = 22
            Width = 131
            Height = 13
            Caption = 'Income - Entrance Tickets: '
          end
          object edtCEntIncome: TEdit
            Left = 190
            Top = 19
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object edtCEntranceT: TEdit
            Left = 190
            Top = 49
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
        end
        object GroupBox8: TGroupBox
          Left = 17
          Top = 231
          Width = 328
          Height = 84
          Caption = 'Toddler'
          TabOrder = 2
          object Label15: TLabel
            Left = 11
            Top = 52
            Width = 113
            Height = 13
            Caption = 'Total Entrance Tickets: '
          end
          object Label16: TLabel
            Left = 11
            Top = 22
            Width = 131
            Height = 13
            Caption = 'Income - Entrance Tickets: '
          end
          object edtTEntIncome: TEdit
            Left = 190
            Top = 19
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 0
          end
          object edtTEntranceT: TEdit
            Left = 190
            Top = 49
            Width = 99
            Height = 21
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
    end
    object tbsFeedback: TTabSheet
      Caption = 'Feedback'
      ImageIndex = 1
      OnShow = tbsFeedbackShow
      object GroupBox9: TGroupBox
        Left = 18
        Top = 0
        Width = 362
        Height = 220
        Caption = 'Ride Feedback'
        TabOrder = 0
        object dbgRideFeedback: TDBGrid
          Left = 12
          Top = 26
          Width = 318
          Height = 151
          DataSource = dmAdventureLand.dsrFeedback
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
        end
        object DBNavigator4: TDBNavigator
          Left = 12
          Top = 183
          Width = 316
          Height = 25
          DataSource = dmAdventureLand.dsrFeedback
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object GroupBox10: TGroupBox
        Left = 438
        Top = 36
        Width = 223
        Height = 118
        Caption = 'Park Feedback'
        TabOrder = 1
        object Label28: TLabel
          Left = 24
          Top = 33
          Width = 64
          Height = 13
          Caption = 'No. of Votes:'
        end
        object Label29: TLabel
          Left = 24
          Top = 65
          Width = 79
          Height = 13
          Caption = 'Average Rating:'
        end
        object edtVotes: TEdit
          Left = 109
          Top = 30
          Width = 76
          Height = 21
          TabOrder = 0
        end
        object edtAvrRating: TEdit
          Left = 109
          Top = 62
          Width = 76
          Height = 21
          TabOrder = 1
        end
      end
      object GroupBox11: TGroupBox
        Left = 18
        Top = 226
        Width = 703
        Height = 261
        Caption = 'Suggestions'
        TabOrder = 2
        object Label30: TLabel
          Left = 248
          Top = 29
          Width = 71
          Height = 13
          Caption = 'Suggestion ID:'
        end
        object Label31: TLabel
          Left = 248
          Top = 61
          Width = 57
          Height = 13
          Caption = 'Suggestion:'
        end
        object dbgSuggestion: TDBGrid
          Left = 12
          Top = 26
          Width = 230
          Height = 175
          Hint = 'Select a record to view the suggestion alongside'
          DataSource = dmAdventureLand.dsrSuggestion
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgSuggestionCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Suggestion ID'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Entrance Ticket ID'
              Width = 96
              Visible = True
            end>
        end
        object edtSID: TEdit
          Left = 333
          Top = 26
          Width = 76
          Height = 21
          Enabled = False
          TabOrder = 1
        end
        object DBNavigator1: TDBNavigator
          Left = 13
          Top = 215
          Width = 228
          Height = 25
          DataSource = dmAdventureLand.dsrSuggestion
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
        end
        object memSuggestion: TMemo
          Left = 333
          Top = 59
          Width = 294
          Height = 105
          ReadOnly = True
          TabOrder = 3
        end
      end
    end
    object tbsGraphs: TTabSheet
      Caption = 'Graphs'
      ImageIndex = 3
      OnShow = tbsGraphsShow
      object GroupBox12: TGroupBox
        Left = 14
        Top = 3
        Width = 760
        Height = 238
        Caption = 'Entrance Ticket Sales'
        TabOrder = 0
        object lblEcategory: TLabel
          Left = 217
          Top = 214
          Width = 59
          Height = 13
          Caption = 'lblEcategory'
        end
        object Chart1: TChart
          Left = 14
          Top = 23
          Width = 523
          Height = 185
          Title.Text.Strings = (
            'Entrance Ticket Sales')
          LeftAxis.Title.Caption = 'Sales '
          View3D = False
          TabOrder = 0
          PrintMargins = (
            15
            34
            15
            34)
          ColorPaletteIndex = 15
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            DataSource = ctsEMonth
            Gradient.Direction = gdTopBottom
            Shadow.Color = 8553090
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
          object Series2: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Callout.Length = 0
            Marks.Visible = False
            DataSource = ctsEEmployeeID
            Gradient.Direction = gdTopBottom
            XValues.Name = 'X'
            XValues.Order = loNone
            YValues.Name = 'Bar'
            YValues.Order = loAscending
          end
          object Series3: TBarSeries
            ColorEachPoint = True
            Marks.Arrow.Visible = True
            Marks.Callout.Brush.Color = clBlack
            Marks.Callout.Arrow.Visible = True
            Marks.Visible = False
            DataSource = ctsECategory
            Gradient.Direction = gdLeftRight
            Shadow.Color = 8487297
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
        object rgpEntranceSales: TRadioGroup
          Left = 560
          Top = 80
          Width = 185
          Height = 105
          Caption = 'Display by:'
          Items.Strings = (
            'Month'
            'Employee ID'
            'Category')
          TabOrder = 1
          OnClick = rgpEntranceSalesClick
        end
      end
      object GroupBox13: TGroupBox
        Left = 14
        Top = 236
        Width = 763
        Height = 251
        Caption = 'Ride Ticket Sales'
        TabOrder = 1
        object lblRcategory: TLabel
          Left = 216
          Top = 215
          Width = 60
          Height = 13
          Caption = 'lblRcategory'
        end
        object rgpRideSales: TRadioGroup
          Left = 560
          Top = 96
          Width = 185
          Height = 73
          Caption = 'Display by:'
          Items.Strings = (
            'Month'
            'Employee ID')
          TabOrder = 0
          OnClick = rgpRideSalesClick
        end
      end
      object Chart2: TChart
        Left = 28
        Top = 260
        Width = 523
        Height = 185
        Title.Text.Strings = (
          'Ride Ticket Sales')
        LeftAxis.Title.Caption = 'Sales'
        View3D = False
        TabOrder = 2
        ColorPaletteIndex = 7
        object Series4: TBarSeries
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = True
          DataSource = ctsRMonth
          Gradient.Direction = gdTopBottom
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
        object Series5: TBarSeries
          ColorEachPoint = True
          Marks.Arrow.Visible = True
          Marks.Callout.Brush.Color = clBlack
          Marks.Callout.Arrow.Visible = True
          Marks.Visible = True
          DataSource = ctsREmployeeID
          Gradient.Direction = gdLeftRight
          XValues.Name = 'X'
          XValues.Order = loAscending
          YValues.Name = 'Bar'
          YValues.Order = loNone
        end
      end
    end
    object tbsSinkingFund: TTabSheet
      Caption = 'Sinking Fund'
      ImageIndex = 4
      OnShow = tbsSinkingFundShow
      object grpSinkingFund: TGroupBox
        Left = 60
        Top = 34
        Width = 685
        Height = 375
        Caption = 
          'Calculate amount to save monthly to purchase new equipment (whic' +
          'h will replace existing)'
        TabOrder = 0
        object Label1: TLabel
          Left = 19
          Top = 67
          Width = 170
          Height = 13
          Caption = 'Depreciation on current equipment:'
        end
        object Label2: TLabel
          Left = 249
          Top = 67
          Width = 157
          Height = 13
          Caption = '% per annum (reducing balance)'
        end
        object Label37: TLabel
          Left = 463
          Top = 114
          Width = 89
          Height = 13
          Caption = 'to be purchased in'
        end
        object Label38: TLabel
          Left = 615
          Top = 112
          Width = 27
          Height = 13
          Caption = 'years'
        end
        object Label39: TLabel
          Left = 33
          Top = 139
          Width = 156
          Height = 13
          Caption = 'Inflation rate of new equipment:'
        end
        object Label40: TLabel
          Left = 249
          Top = 139
          Width = 65
          Height = 13
          Caption = '% per annum'
        end
        object Label41: TLabel
          Left = 41
          Top = 195
          Width = 141
          Height = 13
          Caption = 'Interest rate on sinking fund:'
        end
        object Label42: TLabel
          Left = 249
          Top = 195
          Width = 129
          Height = 13
          Caption = '% per annum compounded'
        end
        object lblDisplay: TLabel
          Left = 172
          Top = 326
          Width = 144
          Height = 17
          Caption = 'Display amount to save'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -14
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
        end
        object Label43: TLabel
          Left = 334
          Top = 40
          Width = 134
          Height = 13
          Caption = '(round off to nearest Rand)'
        end
        object Label44: TLabel
          Left = 322
          Top = 114
          Width = 134
          Height = 13
          Caption = '(round off to nearest Rand)'
        end
        object edtCurrentEquip: TLabeledEdit
          Left = 195
          Top = 37
          Width = 121
          Height = 21
          EditLabel.Width = 186
          EditLabel.Height = 13
          EditLabel.Caption = 'Current value of existing equipment: R'
          EditLabel.Color = clBtnFace
          EditLabel.ParentColor = False
          LabelPosition = lpLeft
          NumbersOnly = True
          TabOrder = 0
          TextHint = 'Enter Value'
        end
        object spnDepreciation: TSpinEdit
          Left = 195
          Top = 64
          Width = 48
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
        object spnYears: TSpinEdit
          Left = 558
          Top = 109
          Width = 43
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 2
          Value = 0
        end
        object edtNewEquip: TLabeledEdit
          Left = 195
          Top = 109
          Width = 121
          Height = 21
          EditLabel.Width = 146
          EditLabel.Height = 13
          EditLabel.Caption = 'Current value of equipment: R'
          EditLabel.Color = clBtnFace
          EditLabel.ParentColor = False
          LabelPosition = lpLeft
          NumbersOnly = True
          TabOrder = 3
          TextHint = 'Enter Value'
        end
        object spnInflation: TSpinEdit
          Left = 195
          Top = 136
          Width = 48
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 4
          Value = 0
        end
        object spnInterest: TSpinEdit
          Left = 195
          Top = 192
          Width = 48
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 5
          Value = 0
        end
        object btnCalculate: TButton
          Left = 260
          Top = 257
          Width = 113
          Height = 25
          Caption = 'Calculate'
          TabOrder = 6
          OnClick = btnCalculateClick
        end
        object cmbCompoundType: TComboBox
          Left = 387
          Top = 192
          Width = 173
          Height = 21
          TabOrder = 7
          Text = 'Period compounded'
          Items.Strings = (
            'Monthly'
            'Quarterly'
            'Semi-Annually'
            'Annually')
        end
      end
    end
  end
  object Time: TTimer
    OnTimer = TimeTimer
    Left = 134
    Top = 528
  end
  object ctsEEmployeeID: TDBCrossTabSource
    DataSet = dmAdventureLand.qryEntranceSales
    LabelField = 'Employee ID'
    Series = Series2
    ValueField = 'Total Sales'
    Left = 504
    Top = 8
  end
  object ctsECategory: TDBCrossTabSource
    DataSet = dmAdventureLand.qryEntranceSales
    LabelField = 'Category'
    Series = Series3
    ValueField = 'Total Sales'
    Left = 608
    Top = 8
  end
  object ctsEMonth: TDBCrossTabSource
    DataSet = dmAdventureLand.qryEntranceSales
    LabelField = 'SaleMonth'
    Series = Series1
    ValueField = 'Total Sales'
    Left = 424
    Top = 8
  end
  object ctsRMonth: TDBCrossTabSource
    DataSet = dmAdventureLand.qryRideSales
    HideSeries = False
    LabelField = 'SaleMonth'
    Series = Series4
    ValueField = 'Total Sales'
    Left = 488
    Top = 272
  end
  object ctsREmployeeID: TDBCrossTabSource
    DataSet = dmAdventureLand.qryRideSales
    HideSeries = False
    LabelField = 'Employee ID'
    Series = Series5
    ValueField = 'Total Sales'
    Left = 568
    Top = 280
  end
end
