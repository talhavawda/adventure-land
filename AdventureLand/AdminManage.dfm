object frmAdminManage: TfrmAdminManage
  Left = 0
  Top = 0
  Caption = 'Management'
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
    Left = 0
    Top = 521
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
      Width = 33
      Height = 13
      Caption = 'Admin:'
    end
    object btnBack: TBitBtn
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
      OnClick = btnBackClick
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
  object pgcManage: TPageControl
    Left = 0
    Top = 0
    Width = 784
    Height = 521
    ActivePage = tbsTickets
    Style = tsFlatButtons
    TabOrder = 1
    object tbsAdmin: TTabSheet
      Caption = 'Admin'
      OnShow = tbsAdminShow
      object rgpAdmin: TGroupBox
        Left = 3
        Top = 16
        Width = 770
        Height = 467
        Caption = 'Admin'
        TabOrder = 0
        object dbnAdmin: TDBNavigator
          Left = 69
          Top = 167
          Width = 635
          Height = 25
          DataSource = dmAdventureLand.dsrAdmin
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object rgpASearch: TGroupBox
          Left = 472
          Top = 240
          Width = 286
          Height = 224
          Caption = 'Search'
          TabOrder = 1
          object rgpAFilter: TRadioGroup
            Left = 16
            Top = 59
            Width = 145
            Height = 154
            Caption = 'Filter by'
            Items.Strings = (
              'Admin ID'
              'ID Number'
              'Username'
              'First Name(s)'
              'Surname')
            TabOrder = 0
          end
          object edtAsearch: TEdit
            Left = 16
            Top = 24
            Width = 145
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Search Value'
          end
          object btnAsearch: TBitBtn
            Left = 183
            Top = 111
            Width = 84
            Height = 25
            Caption = 'Search'
            DoubleBuffered = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1
              E7A65D00A65D00D7B98DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFAF3EAA65D00BE7807C78209A75F02FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F0E4B56C00C989
              1ED49729B56C00E5CEA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFAF4EABE7908D29630E1AC4BBE7908DEC08AFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFEFCFEFDFCFEFCF9FFFFFFFDF9F1C27C09DFAA4CEDC06BC27C
              09E5CB99FFFFFFFFFFFFFFFFFFFFFFFFF1E5D0D5B285BA833EB47B32B67E34CF
              AB7BCD8B18CD8B18F3C979CD8B18E7CD99FFFFFFFFFFFFFFFFFFFFFFFFEFE1CB
              AE6F19C49049F2DBB2F8E7C4F2DDB3D4AB6CA7650FB97714CB8714E5C78AFFFF
              FFFFFFFFFFFFFFFFFFFFF3E7D7B2741DEDD3A8FFF1D3FFF1D3FFF1D3FFF1D3FF
              EFCEF0D8AEAA660CCB8714FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2C8A1C59042
              FFF5DEFFF4DBF3CD86F2CC83F2CC84FFF4DBFFF4DBC59042D2AD76FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC9F5BF7E5C8FEF3DDF5D8A0F5D69CF5D79FF5D79EF5
              D599FEF3DDF7E5C8C08730FEFCF7FFFFFFFFFFFFFFFFFFFFFFFFCA9949FEF3D9
              FEF4E0F7DFB2F7E0B4F7E0B3F7E0B4F7DFB0FCF3E4FDF3DAC3882DFBEED6FFFF
              FFFFFFFFFFFFFFFFFFFFD2A561EFDEC1FFFDF7FAEACCF9E8C7FAE9C8F9E8C8FA
              E8C7FEF6E8EDDBBDC78F35FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFE2C69BCA933B
              FFFFFFFFFCF6FDF3E1FCF2DEFCF2DFFEF8EDFFFFFFCA933BDDB77BFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF4E9D9CD963AF1E4CDFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF4E9D5C17E0DF1E3CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6D4
              D0973CD19D49F9F3E8FFFAEFFBF7F0DCB373C6841AF8EFDCFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9D8EAD2A7D8AA57CB8C20D4A048DE
              BB7BF2E5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = btnAsearchClick
          end
          object btnAclear: TButton
            Left = 183
            Top = 159
            Width = 84
            Height = 25
            Caption = 'Clear Search'
            TabOrder = 3
            OnClick = btnAclearClick
          end
        end
        object rgpADetails: TGroupBox
          Left = 15
          Top = 275
          Width = 451
          Height = 189
          Caption = 'Admin Details'
          TabOrder = 2
          object Label3: TLabel
            Left = 16
            Top = 24
            Width = 43
            Height = 13
            Caption = 'Admin ID'
          end
          object Label4: TLabel
            Left = 248
            Top = 24
            Width = 51
            Height = 13
            Caption = 'ID Number'
          end
          object Label5: TLabel
            Left = 248
            Top = 56
            Width = 46
            Height = 13
            Caption = 'Password'
          end
          object Label6: TLabel
            Left = 16
            Top = 88
            Width = 64
            Height = 13
            Caption = 'First Name(s)'
          end
          object Label7: TLabel
            Left = 248
            Top = 88
            Width = 42
            Height = 13
            Caption = 'Surname'
          end
          object Label11: TLabel
            Left = 248
            Top = 120
            Width = 66
            Height = 13
            Caption = 'Email Address'
          end
          object Label12: TLabel
            Left = 16
            Top = 56
            Width = 48
            Height = 13
            Caption = 'Username'
          end
          object Label10: TLabel
            Left = 16
            Top = 120
            Width = 57
            Height = 13
            Caption = 'Cell Number'
          end
          object edtAdminID: TEdit
            Left = 86
            Top = 22
            Width = 121
            Height = 21
            AutoSize = False
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = edtAdminIDChange
          end
          object edtAusername: TEdit
            Left = 86
            Top = 53
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Username'
          end
          object edtAname: TEdit
            Left = 86
            Top = 84
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 2
            TextHint = 'Enter First Name(s)'
          end
          object edtAEmail: TEdit
            Left = 318
            Top = 115
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 3
            TextHint = 'Enter Email Address'
          end
          object edtAsurname: TEdit
            Left = 318
            Top = 84
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 4
            TextHint = 'Enter Surname'
          end
          object edtApassword: TEdit
            Left = 318
            Top = 53
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 5
            TextHint = 'Enter Password'
          end
          object edtAcell: TMaskEdit
            Left = 86
            Top = 115
            Width = 121
            Height = 21
            EditMask = '0000000000;1;_'
            MaxLength = 10
            TabOrder = 6
            Text = '          '
            TextHint = 'Enter Cell number'
            OnChange = edtAcellChange
          end
          object edtAId: TMaskEdit
            Left = 318
            Top = 22
            Width = 121
            Height = 21
            EditMask = '0000000000000;1;_'
            MaxLength = 13
            TabOrder = 7
            Text = '             '
            TextHint = 'Enter ID number'
            OnChange = edtAIdChange
          end
        end
        object dbgAdmin: TDBGrid
          Left = 18
          Top = 24
          Width = 740
          Height = 137
          Hint = 'Click on  a record to be displayed in the fields below'
          DataSource = dmAdventureLand.dsrAdmin
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgAdminCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Admin ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Username'
              Width = 84
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Password'
              Width = 83
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'First Name(s)'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Surname'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID Number'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Cell Number'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Email Address'
              Width = 117
              Visible = True
            end>
        end
        object rgpAOption: TRadioGroup
          Left = 162
          Top = 198
          Width = 167
          Height = 71
          Hint = 'Select to Add, Update or Delete an admin'
          Caption = 'Select your option'
          Items.Strings = (
            'ADD an Admin'
            'UPDATE this Admin'#39's Details'
            'DELETE this Admin')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = rgpAOptionClick
        end
      end
    end
    object tbsEmployees: TTabSheet
      Caption = 'Employees'
      ImageIndex = 1
      OnShow = tbsEmployeesShow
      object rgpEmployee: TGroupBox
        Left = 3
        Top = 16
        Width = 770
        Height = 467
        Caption = 'Employees'
        TabOrder = 0
        object dbnEmployee: TDBNavigator
          Left = 69
          Top = 167
          Width = 635
          Height = 25
          DataSource = dmAdventureLand.dsrEmployee
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
        end
        object rgpESearch: TGroupBox
          Left = 472
          Top = 240
          Width = 286
          Height = 224
          Caption = 'Search'
          TabOrder = 1
          object rgpEFilter: TRadioGroup
            Left = 16
            Top = 59
            Width = 145
            Height = 154
            Caption = 'Filter by'
            Items.Strings = (
              'Employee ID'
              'ID Number'
              'Username'
              'First Name(s)'
              'Surname')
            TabOrder = 0
          end
          object edtEsearch: TEdit
            Left = 16
            Top = 24
            Width = 145
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Search Value'
          end
          object btnEsearch: TBitBtn
            Left = 183
            Top = 111
            Width = 84
            Height = 25
            Caption = 'Search'
            DoubleBuffered = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1
              E7A65D00A65D00D7B98DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFAF3EAA65D00BE7807C78209A75F02FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F0E4B56C00C989
              1ED49729B56C00E5CEA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFAF4EABE7908D29630E1AC4BBE7908DEC08AFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFEFCFEFDFCFEFCF9FFFFFFFDF9F1C27C09DFAA4CEDC06BC27C
              09E5CB99FFFFFFFFFFFFFFFFFFFFFFFFF1E5D0D5B285BA833EB47B32B67E34CF
              AB7BCD8B18CD8B18F3C979CD8B18E7CD99FFFFFFFFFFFFFFFFFFFFFFFFEFE1CB
              AE6F19C49049F2DBB2F8E7C4F2DDB3D4AB6CA7650FB97714CB8714E5C78AFFFF
              FFFFFFFFFFFFFFFFFFFFF3E7D7B2741DEDD3A8FFF1D3FFF1D3FFF1D3FFF1D3FF
              EFCEF0D8AEAA660CCB8714FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2C8A1C59042
              FFF5DEFFF4DBF3CD86F2CC83F2CC84FFF4DBFFF4DBC59042D2AD76FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC9F5BF7E5C8FEF3DDF5D8A0F5D69CF5D79FF5D79EF5
              D599FEF3DDF7E5C8C08730FEFCF7FFFFFFFFFFFFFFFFFFFFFFFFCA9949FEF3D9
              FEF4E0F7DFB2F7E0B4F7E0B3F7E0B4F7DFB0FCF3E4FDF3DAC3882DFBEED6FFFF
              FFFFFFFFFFFFFFFFFFFFD2A561EFDEC1FFFDF7FAEACCF9E8C7FAE9C8F9E8C8FA
              E8C7FEF6E8EDDBBDC78F35FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFE2C69BCA933B
              FFFFFFFFFCF6FDF3E1FCF2DEFCF2DFFEF8EDFFFFFFCA933BDDB77BFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF4E9D9CD963AF1E4CDFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF4E9D5C17E0DF1E3CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6D4
              D0973CD19D49F9F3E8FFFAEFFBF7F0DCB373C6841AF8EFDCFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9D8EAD2A7D8AA57CB8C20D4A048DE
              BB7BF2E5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = btnEsearchClick
          end
          object btnEclear: TButton
            Left = 183
            Top = 159
            Width = 84
            Height = 25
            Caption = 'Clear Search'
            TabOrder = 3
            OnClick = btnEclearClick
          end
        end
        object rgpEDetails: TGroupBox
          Left = 15
          Top = 275
          Width = 451
          Height = 189
          Caption = 'Employee Details'
          TabOrder = 2
          object Label13: TLabel
            Left = 16
            Top = 24
            Width = 60
            Height = 13
            Caption = 'Employee ID'
          end
          object Label14: TLabel
            Left = 248
            Top = 24
            Width = 51
            Height = 13
            Caption = 'ID Number'
          end
          object Label15: TLabel
            Left = 248
            Top = 56
            Width = 46
            Height = 13
            Caption = 'Password'
          end
          object Label16: TLabel
            Left = 16
            Top = 88
            Width = 64
            Height = 13
            Caption = 'First Name(s)'
          end
          object Label17: TLabel
            Left = 248
            Top = 88
            Width = 42
            Height = 13
            Caption = 'Surname'
          end
          object Label20: TLabel
            Left = 16
            Top = 120
            Width = 57
            Height = 13
            Caption = 'Cell Number'
          end
          object Label21: TLabel
            Left = 248
            Top = 120
            Width = 66
            Height = 13
            Caption = 'Email Address'
          end
          object Label22: TLabel
            Left = 16
            Top = 56
            Width = 48
            Height = 13
            Caption = 'Username'
          end
          object edtEmployeeID: TEdit
            Left = 86
            Top = 22
            Width = 121
            Height = 21
            AutoSize = False
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = edtEmployeeIDChange
          end
          object edtEusername: TEdit
            Left = 86
            Top = 53
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Username'
          end
          object edtEname: TEdit
            Left = 86
            Top = 84
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 2
            TextHint = 'Enter First Name(s)'
          end
          object edtEemail: TEdit
            Left = 318
            Top = 115
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 3
            TextHint = 'Enter Email Address'
          end
          object edtEsurname: TEdit
            Left = 318
            Top = 84
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 4
            TextHint = 'Enter Surname'
          end
          object edtEpassword: TEdit
            Left = 318
            Top = 53
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 5
            TextHint = 'Enter Password'
          end
          object edtEcell: TMaskEdit
            Left = 86
            Top = 115
            Width = 121
            Height = 21
            Hint = 'Enter cellphone number'
            EditMask = '0000000000;1;_'
            MaxLength = 10
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Text = '          '
            OnChange = edtEcellChange
          end
          object edtEId: TMaskEdit
            Left = 318
            Top = 22
            Width = 121
            Height = 21
            Hint = 'Enter ID number'
            EditMask = '0000000000000;1;_'
            MaxLength = 13
            ParentShowHint = False
            ShowHint = True
            TabOrder = 7
            Text = '             '
            OnChange = edtEIdChange
          end
        end
        object rgpEOption: TRadioGroup
          Left = 162
          Top = 198
          Width = 190
          Height = 71
          Hint = 'Select to Add, Update or Delete an employee'
          Caption = 'Select your option'
          Items.Strings = (
            'ADD an Employee'
            'UPDATE this Employee'#39's Details'
            'DELETE this Employee')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = rgpEOptionClick
        end
      end
      object dbgEmployee: TDBGrid
        Left = 18
        Top = 40
        Width = 740
        Height = 137
        Hint = 'Click on a record to be displayed in the fields below'
        DataSource = dmAdventureLand.dsrEmployee
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnCellClick = dbgEmployeeCellClick
        Columns = <
          item
            Expanded = False
            FieldName = 'Employee ID'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Username'
            Width = 84
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Password'
            Width = 83
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'First Name(s)'
            Width = 89
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Surname'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ID Number'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Cell Number'
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Email Address'
            Width = 117
            Visible = True
          end>
      end
    end
    object tbsRides: TTabSheet
      Caption = 'Rides'
      ImageIndex = 2
      OnShow = tbsRidesShow
      object rgpRide: TGroupBox
        Left = 3
        Top = 16
        Width = 770
        Height = 467
        Caption = 'Rides'
        TabOrder = 0
        object rgpRDetails: TGroupBox
          Left = 15
          Top = 223
          Width = 506
          Height = 241
          Caption = 'Ride Details'
          TabOrder = 0
          object Label23: TLabel
            Left = 16
            Top = 32
            Width = 35
            Height = 13
            Caption = 'Ride ID'
          end
          object Label24: TLabel
            Left = 16
            Top = 64
            Width = 51
            Height = 13
            Caption = 'Ride Name'
          end
          object Label25: TLabel
            Left = 16
            Top = 96
            Width = 45
            Height = 13
            Caption = 'Category'
          end
          object Label26: TLabel
            Left = 16
            Top = 128
            Width = 78
            Height = 13
            Caption = 'Adrenaline Rush'
          end
          object Label27: TLabel
            Left = 16
            Top = 160
            Width = 46
            Height = 13
            Caption = 'Ride Cost'
          end
          object Label28: TLabel
            Left = 248
            Top = 32
            Width = 53
            Height = 13
            Caption = 'Description'
          end
          object edtRideID: TEdit
            Left = 102
            Top = 30
            Width = 121
            Height = 21
            AutoSize = False
            Enabled = False
            ReadOnly = True
            TabOrder = 0
            OnChange = edtRideIDChange
          end
          object edtRname: TEdit
            Left = 102
            Top = 61
            Width = 121
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Ride Name'
          end
          object cmbCategory: TComboBox
            Left = 102
            Top = 93
            Width = 121
            Height = 21
            TabOrder = 2
            Text = 'Category'
            Items.Strings = (
              'Toddler'
              'Child'
              'Adult'
              'Family')
          end
          object memDescription: TMemo
            Left = 315
            Top = 29
            Width = 185
            Height = 209
            Hint = 'Add / Update Ride Description'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
          end
          object spnRideCost: TSpinEdit
            Left = 102
            Top = 157
            Width = 121
            Height = 22
            MaxValue = 99
            MinValue = 0
            TabOrder = 4
            Value = 0
            OnChange = spnRideCostChange
          end
          object spnAdrenalineRush: TSpinEdit
            Left = 102
            Top = 125
            Width = 121
            Height = 22
            MaxValue = 10
            MinValue = 0
            TabOrder = 5
            Value = 0
            OnChange = spnAdrenalineRushChange
          end
        end
        object rgpRSearch: TGroupBox
          Left = 527
          Top = 223
          Width = 240
          Height = 216
          Caption = 'Search'
          TabOrder = 1
          object rgpRFilter: TRadioGroup
            Left = 3
            Top = 51
            Width = 134
            Height = 154
            Caption = 'Filter by'
            Items.Strings = (
              'Ride ID'
              'Ride Name'
              'Category'
              'Adrenaline Rush'
              'Ride Cost')
            TabOrder = 0
          end
          object edtRsearch: TEdit
            Left = 3
            Top = 24
            Width = 134
            Height = 21
            AutoSize = False
            TabOrder = 1
            TextHint = 'Enter Search Value'
          end
          object btnRsearch: TBitBtn
            Left = 154
            Top = 111
            Width = 71
            Height = 25
            Caption = 'Search'
            DoubleBuffered = True
            Glyph.Data = {
              36030000424D3603000000000000360000002800000010000000100000000100
              1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8F1
              E7A65D00A65D00D7B98DFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFAF3EAA65D00BE7807C78209A75F02FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9F0E4B56C00C989
              1ED49729B56C00E5CEA8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFAF4EABE7908D29630E1AC4BBE7908DEC08AFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFEFCFEFDFCFEFCF9FFFFFFFDF9F1C27C09DFAA4CEDC06BC27C
              09E5CB99FFFFFFFFFFFFFFFFFFFFFFFFF1E5D0D5B285BA833EB47B32B67E34CF
              AB7BCD8B18CD8B18F3C979CD8B18E7CD99FFFFFFFFFFFFFFFFFFFFFFFFEFE1CB
              AE6F19C49049F2DBB2F8E7C4F2DDB3D4AB6CA7650FB97714CB8714E5C78AFFFF
              FFFFFFFFFFFFFFFFFFFFF3E7D7B2741DEDD3A8FFF1D3FFF1D3FFF1D3FFF1D3FF
              EFCEF0D8AEAA660CCB8714FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE2C8A1C59042
              FFF5DEFFF4DBF3CD86F2CC83F2CC84FFF4DBFFF4DBC59042D2AD76FFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFCC9F5BF7E5C8FEF3DDF5D8A0F5D69CF5D79FF5D79EF5
              D599FEF3DDF7E5C8C08730FEFCF7FFFFFFFFFFFFFFFFFFFFFFFFCA9949FEF3D9
              FEF4E0F7DFB2F7E0B4F7E0B3F7E0B4F7DFB0FCF3E4FDF3DAC3882DFBEED6FFFF
              FFFFFFFFFFFFFFFFFFFFD2A561EFDEC1FFFDF7FAEACCF9E8C7FAE9C8F9E8C8FA
              E8C7FEF6E8EDDBBDC78F35FFFEFCFFFFFFFFFFFFFFFFFFFFFFFFE2C69BCA933B
              FFFFFFFFFCF6FDF3E1FCF2DEFCF2DFFEF8EDFFFFFFCA933BDDB77BFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFF4E9D9CD963AF1E4CDFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFF4E9D5C17E0DF1E3CDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E6D4
              D0973CD19D49F9F3E8FFFAEFFBF7F0DCB373C6841AF8EFDCFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF4E9D8EAD2A7D8AA57CB8C20D4A048DE
              BB7BF2E5CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
            ParentDoubleBuffered = False
            TabOrder = 2
            OnClick = btnRsearchClick
          end
          object btnRclear: TButton
            Left = 154
            Top = 158
            Width = 71
            Height = 25
            Caption = 'Clear Search'
            TabOrder = 3
            OnClick = btnRclearClick
          end
        end
        object dbgRide: TDBGrid
          Left = 219
          Top = 24
          Width = 462
          Height = 153
          Hint = 'Click on a record to be displayed in the fields below'
          DataSource = dmAdventureLand.dsrRide
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Tahoma'
          TitleFont.Style = []
          OnCellClick = dbgRideCellClick
          Columns = <
            item
              Expanded = False
              FieldName = 'Ride ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ride Name'
              Width = 126
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Category'
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Adrenaline Rush'
              Width = 89
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Ride Cost'
              Visible = True
            end>
        end
        object rgpROption: TRadioGroup
          Left = 19
          Top = 70
          Width = 167
          Height = 71
          Hint = 'Select to Add, Update or Delete a ride'
          Caption = 'Select your option'
          Items.Strings = (
            'ADD a Ride'
            'UPDATE this Ride'#39's Details'
            'DELETE this Ride')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = rgpROptionClick
        end
        object btnFirst: TBitBtn
          Left = 250
          Top = 183
          Width = 75
          Height = 25
          Hint = 'Go to first record'
          Caption = 'First'
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
          TabOrder = 4
          OnClick = btnFirstClick
        end
        object btnPrevious: TBitBtn
          Left = 331
          Top = 183
          Width = 75
          Height = 25
          Hint = 'Go to previous record'
          Caption = 'Previous'
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E7D4FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE0C295AF
            6900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFDEC096AB6500AF6900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFE1C7A3A76100BA7400AF
            6900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFDBBE96A45F00BD7807C68209AF6900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFDEC4A3A15C00C17F11CC8B17CC8A17AF
            6900B36D00B77100BB7500BE7700C17A00C37C00BE7700C37C00FFFFFFD8BB96
            9F5A00C6861ED29527D29528D29528D29427D29428D29527D29428D29527D294
            28D29528D29427C37C00D7B9939F5A00CB8F2CD9A03AD99F39D99F39D9A039D9
            9F3AD99F3AD99F3AD99F39D99F39D9A039D99F39D9A039C37C00CFAC7B9F5A00
            CB8F2CE0AB4BE0AB4BE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB
            4BE0AB4CE0AB4CC37C00FFFFFFCCA6739F5A00DEA848E7B65DE7B65DE7B65DE7
            B65EE7B65EE7B65DE7B65EE6B65DE7B65EE7B65EE7B65DC37C00FFFFFFFFFFFE
            D1AD7AA15C00E3B054EDC06EEDC06EAF6900B36D00B77100BB7500BE7800C17A
            00C37C00C37C00C37C00FFFFFFFFFFFFFFFFFFD2AF7BA45F00E7B75EF3C97CAF
            6900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFED3B079A76100EABB65AE6A00FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD6B27BAB6500AF
            6900FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFECFA45FAF6900FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEF0
            E2C9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnPreviousClick
        end
        object btnNext: TBitBtn
          Left = 409
          Top = 183
          Width = 75
          Height = 25
          Hint = 'Go to next record'
          Caption = 'Next'
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF3E7D4FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAF6900E0C295FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6900AB6500DEC096FFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAF6900BA7400A76100E1C7A3FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6900C68209BD7807A45F00DBBE
            96FFFFFFFFFFFFFFFFFFC37C00BE7700C37C00C17A00BE7700BB7500B77100B3
            6D00AF6900CC8A17CC8B17C17F11A15C00DEC4A3FFFFFFFFFFFFC37C00D29427
            D29528D29428D29527D29428D29527D29428D29427D29528D29528D29527C686
            1E9F5A00D8BB96FFFFFFC37C00D9A039D99F39D9A039D99F39D99F39D99F3AD9
            9F3AD99F3AD9A039D99F39D99F39D9A03ACB8F2C9F5A00D7B993C37C00E0AB4C
            E0AB4CE0AB4BE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB4CE0AB4BE0AB
            4BCB8F2C9F5A00CFAC7BC37C00E7B65DE7B65EE7B65EE6B65DE7B65EE7B65DE7
            B65EE7B65EE7B65DE7B65DE7B65DDEA8489F5A00CCA673FFFFFFC37C00C37C00
            C37C00C17A00BE7800BB7500B77100B36D00AF6900EDC06EEDC06EE3B054A15C
            00D1AD7AFFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAF6900F3C97CE7B75EA45F00D2AF7BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAE6A00EABB65A76100D3B079FFFF
            FEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFAF6900AB6500D6B27BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFAF6900CFA45FFFFFFEFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFF0E2C9FFFFFEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnNextClick
        end
        object btnLast: TBitBtn
          Left = 490
          Top = 183
          Width = 75
          Height = 25
          Hint = 'Go to last record'
          Caption = 'Last'
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFD1B3A6883D1A883E19883D1A883E19D1B3A6FFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A68B40188B40188B40188C4117C5
            A08EFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            8F44168F44168E45178F44178F4516FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF924815B8710AC68006B8710A924814FF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            974C13C8840EC8850EC8850E964D13D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFD1B3A6FFFFFFFFFFFFFFFFFF9B5111CC8B18CC8B18CC8B17BD79189B
            5111D1B3A6FFFFFFFFFFFFFFFFFFFFFFFFD1B3A69B5111FFFFFFFFFFFFFFFFFF
            A0560FC07F21D19122D19123D09122C07F21A0570FD1B3A6FFFFFFFFFFFFD1B3
            A6A0560F9F570FFFFFFFFFFFFFFFFFFFD1B3A6A55C0DC4842AD5992ED5992ED5
            992EC4852AA55B0DD1B3A6D1B3A6A45B0DC4852AA55C0DFFFFFFFFFFFFFFFFFF
            FFFFFFD1B3A6A9610BC88A33D9A13BDAA03AD9A03BC78B33A9610BAA610BC78B
            34DAA13AA9600BFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A6AE6509CB913DDE
            A846DEA847DFA846DEA847CB913DDFA847DEA846AE6509FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFD1B3A6B26B07CF9646E2AF53E2AF52E3AF52E2AF52E2AF
            52E3AF52B36A07FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A6B7
            6F05E6B65DE6B65DE6B65DE7B75DE7B65DE6B65DB66F05FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFD1B3A6BB7304D4A156EABC67EABC67EBBD67EABC
            67EBBC67BA7304FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD1B3A6BE7602D7
            A45CEDC16FEEC16FEDC16FEEC16FEEC16FEDC16FBE7602FFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFD1B3A6C17901D8A761F0C575F0C575F0C575F0C575F0C575F0C5
            75F0C575C07A01FFFFFFFFFFFFFFFFFFFFFFFFD1B3A6C37C00C37C00C37C00C3
            7C00C37C00C37C00C37C00C37C00C37C00C37C00C37C00FFFFFF}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnLastClick
        end
        object btnRefresh: TBitBtn
          Left = 571
          Top = 183
          Width = 75
          Height = 25
          Hint = 'Refresh table'
          Caption = 'Refresh'
          DoubleBuffered = True
          Glyph.Data = {
            36030000424D3603000000000000360000002800000010000000100000000100
            1800000000000003000000000000000000000000000000000000FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDCC2C07900FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFEDDCC2C07900C3800EC07900C07900C07900C07900C07900C07900C079
            00D4AC71FFFFFFFFFFFFFFFFFFFFFFFFEDDCC2BC7500CB8C21D4972CD4972CD4
            972CD4972CD4972CD4972CD4972CCB8C21BC7500BC7500EDDCC2FFFFFFEDDCC2
            B67000D49A38DFAA49DFAA49DFAA49DFA949E0A949DFAA49DFAA49DFA949E0A9
            49D49A38B67000B67000FFFFFFFFFFFFEDDCC2B06A00DBA74BE9BA63E9BA63E9
            BA63E9BA63E9BA63E9BA63E9BA63DBA74BB06900AF6900B06900FFFFFFFFFFFF
            FFFFFFEDDCC2A96300E1AF59A96300A96300A96400A96300A96300A86300A963
            00A86300A96400A96400FFFFFFEDDCC29F5A00FFFFFFEDDCC2A35E00FFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFEDDCC2A35E00A35E00EDDCC2EDDCC2A35E00
            A35E00EDDCC2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFA35E00EDDCC2FFFF
            FF9F5A00EDDCC2FFFFFFA96400A96400A86300A96300A86300A96300A96300A9
            6400A96300A96300C3800EA96300EDDCC2FFFFFFFFFFFFFFFFFFB06900AF6900
            B06900CB8D21D4972CD4972CD4972CD4972CD3972CD3972CD4972CCB8D21B06A
            00EDDCC2FFFFFFFFFFFFB67000B67000D49A38E0A949DFA949DFAA49DFAA49E0
            A949DFA949DFAA49DFAA49DFAA49D49A38B67000EDDCC2FFFFFFEDDCC2BC7500
            BC7500DCA74BE9B963E9BA63EABA63EABA63E9BA63E9BA63E9BA63DBA74BBC75
            00EDDCC2FFFFFFFFFFFFFFFFFFFFFFFFD4AC71C07900C07900C07900C07900C0
            7900C07900C07900E1AF59C07900EDDCC2FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC07900EDDCC2FFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          ParentDoubleBuffered = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnRefreshClick
        end
      end
    end
    object tbsTickets: TTabSheet
      Caption = 'Tickets'
      ImageIndex = 3
      OnShow = tbsTicketsShow
      object GroupBox10: TGroupBox
        Left = 219
        Top = 64
        Width = 334
        Height = 321
        Caption = 'Ticket Prices'
        TabOrder = 0
        object GroupBox11: TGroupBox
          Left = 16
          Top = 24
          Width = 297
          Height = 137
          Caption = 'Entrance Ticket Prices'
          TabOrder = 0
          object Label30: TLabel
            Left = 24
            Top = 32
            Width = 29
            Height = 13
            Caption = 'Adult:'
          end
          object Label31: TLabel
            Left = 24
            Top = 67
            Width = 27
            Height = 13
            Caption = 'Child:'
          end
          object Label32: TLabel
            Left = 24
            Top = 102
            Width = 40
            Height = 13
            Caption = 'Toddler:'
          end
          object Label33: TLabel
            Left = 99
            Top = 32
            Width = 7
            Height = 13
            Caption = 'R'
          end
          object Label34: TLabel
            Left = 99
            Top = 67
            Width = 7
            Height = 13
            Caption = 'R'
          end
          object Label35: TLabel
            Left = 99
            Top = 102
            Width = 7
            Height = 13
            Caption = 'R'
          end
          object spnToddler: TSpinEdit
            Left = 112
            Top = 99
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 0
            Value = 0
          end
          object spnChild: TSpinEdit
            Left = 112
            Top = 64
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
          object spnAdult: TSpinEdit
            Left = 112
            Top = 29
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 2
            Value = 0
          end
          object btnUpdTicket: TButton
            Left = 184
            Top = 64
            Width = 89
            Height = 25
            Caption = 'Update Prices'
            TabOrder = 3
            OnClick = btnUpdTicketClick
          end
        end
        object GroupBox12: TGroupBox
          Left = 16
          Top = 191
          Width = 297
          Height = 106
          Caption = 'Ride Ticket Price'
          TabOrder = 1
          object Label36: TLabel
            Left = 11
            Top = 54
            Width = 82
            Height = 13
            Caption = 'Ride Ticket Price:'
          end
          object Label37: TLabel
            Left = 99
            Top = 54
            Width = 7
            Height = 13
            Caption = 'R'
          end
          object btnUpdRide: TButton
            Left = 184
            Top = 48
            Width = 89
            Height = 25
            Caption = 'Update Price'
            TabOrder = 0
            OnClick = btnUpdRideClick
          end
          object spnRide: TSpinEdit
            Left = 112
            Top = 51
            Width = 49
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
    end
    object tbsPark: TTabSheet
      Caption = 'Park'
      ImageIndex = 4
      OnShow = tbsParkShow
      object grpParkInfo: TGroupBox
        Left = 418
        Top = 95
        Width = 285
        Height = 273
        Caption = 'Park Times'
        TabOrder = 0
        object btnUpdTimes: TButton
          Left = 96
          Top = 234
          Width = 99
          Height = 25
          Caption = 'Update Park Times'
          TabOrder = 0
          OnClick = btnUpdTimesClick
        end
        object memTimes: TMemo
          Left = 15
          Top = 29
          Width = 258
          Height = 199
          Hint = 'Update Park Times'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
      object GroupBox13: TGroupBox
        Left = 44
        Top = 95
        Width = 285
        Height = 273
        Caption = 'Park Information'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        object btnUpdInfo: TButton
          Left = 80
          Top = 235
          Width = 91
          Height = 25
          Caption = 'Update Park Info'
          TabOrder = 0
          OnClick = btnUpdInfoClick
        end
        object memInfo: TMemo
          Left = 16
          Top = 29
          Width = 233
          Height = 200
          Hint = 'Update Park Information'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
      end
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 112
    Top = 520
  end
end
