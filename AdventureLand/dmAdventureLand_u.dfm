object dmAdventureLand: TdmAdventureLand
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 496
  Width = 599
  object conAdventureLand: TADOConnection
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 448
    Top = 16
  end
  object tblEmployee: TADOTable
    Connection = conAdventureLand
    TableName = 'Employee'
    Left = 40
    Top = 69
  end
  object tblRide: TADOTable
    Connection = conAdventureLand
    TableName = 'Ride'
    Left = 40
    Top = 124
  end
  object tblEntranceTransaction: TADOTable
    Connection = conAdventureLand
    TableName = 'Entrance Transaction'
    Left = 40
    Top = 179
  end
  object tblRideTicket: TADOTable
    Connection = conAdventureLand
    TableName = 'Ride Ticket'
    Left = 40
    Top = 289
  end
  object tblEntranceTicket: TADOTable
    Connection = conAdventureLand
    TableName = 'Entrance Ticket'
    Left = 40
    Top = 234
  end
  object tblSuggestion: TADOTable
    Connection = conAdventureLand
    TableName = 'Suggestion'
    Left = 40
    Top = 344
  end
  object tblFeedback: TADOTable
    Connection = conAdventureLand
    TableName = 'Feedback'
    Left = 40
    Top = 408
  end
  object dsrEmployee: TDataSource
    DataSet = tblEmployee
    Left = 136
    Top = 72
  end
  object dsrRide: TDataSource
    DataSet = tblRide
    Left = 136
    Top = 120
  end
  object dsrEntranceTransaction: TDataSource
    DataSet = tblEntranceTransaction
    Left = 136
    Top = 176
  end
  object dsrEntranceTicket: TDataSource
    DataSet = tblEntranceTicket
    Left = 136
    Top = 240
  end
  object dsrRideTicket: TDataSource
    DataSet = tblRideTicket
    Left = 136
    Top = 288
  end
  object dsrSuggestion: TDataSource
    DataSet = tblSuggestion
    Left = 136
    Top = 344
  end
  object dsrFeedback: TDataSource
    DataSet = tblFeedback
    Left = 136
    Top = 408
  end
  object tblAdmin: TADOTable
    Connection = conAdventureLand
    TableName = 'Admin'
    Left = 40
    Top = 29
  end
  object dsrAdmin: TDataSource
    DataSet = tblAdmin
    Left = 136
    Top = 32
  end
  object qryEntranceTransaction: TADOQuery
    Parameters = <>
    Left = 256
    Top = 176
  end
  object qryEntranceTicket: TADOQuery
    Parameters = <>
    Left = 256
    Top = 248
  end
  object qryRideTicket: TADOQuery
    Parameters = <>
    Left = 256
    Top = 312
  end
  object qryEntranceSales: TADOQuery
    Parameters = <>
    Left = 432
    Top = 232
  end
  object dsrEntranceSales: TDataSource
    Left = 432
    Top = 184
  end
  object dsrRideSales: TDataSource
    Left = 424
    Top = 312
  end
  object qryRideSales: TADOQuery
    Parameters = <>
    Left = 424
    Top = 360
  end
  object qryFeedback: TADOQuery
    Parameters = <>
    Left = 256
    Top = 408
  end
  object qryEmployee: TADOQuery
    Parameters = <>
    Left = 248
    Top = 80
  end
end
