object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object EditTitle: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 0
    Text = 'Title'
  end
  object EditAuthor: TEdit
    Left = 178
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 1
    Text = 'Author'
  end
  object EditPrice: TEdit
    Left = 336
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 2
    Text = 'Price'
  end
  object ButtonAdd: TButton
    Left = 24
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Create'
    TabOrder = 3
    OnClick = ButtonAddClick
  end
  object ButtonUpdate: TButton
    Left = 264
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Update'
    TabOrder = 4
    OnClick = ButtonUpdateClick
  end
  object ButtonDelete: TButton
    Left = 382
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Delete'
    TabOrder = 5
    OnClick = ButtonDeleteClick
  end
  object ButtonRead: TButton
    Left = 144
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Read'
    TabOrder = 6
    OnClick = ButtonReadClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 176
    Width = 489
    Height = 233
    DataSource = DataSource1
    TabOrder = 7
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Server=localhost'
      'Database=mybooks'
      'User_Name=root'
      'Password=password'
      'DriverID=MySQL')
    Left = 544
    Top = 40
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * FROM books;')
    Left = 544
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 544
    Top = 192
  end
end
