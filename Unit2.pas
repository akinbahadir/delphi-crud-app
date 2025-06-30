unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.Buttons, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    FDConnection1: TFDConnection;
    EditTitle: TEdit;
    EditAuthor: TEdit;
    EditPrice: TEdit;
    ButtonAdd: TButton;
    ButtonUpdate: TButton;
    ButtonDelete: TButton;
    ButtonRead: TButton;
    DBGrid1: TDBGrid;
    FDQuery1: TFDQuery;
    DataSource1: TDataSource;
    procedure ButtonAddClick(Sender: TObject);
    procedure ButtonUpdateClick(Sender: TObject);
    procedure ButtonReadClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  SelectedBookId: Integer;

implementation

{$R *.dfm}

procedure TForm2.ButtonAddClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'INSERT INTO books (title, author, price) VALUES (:title, :author, :price)';
  FDQuery1.ParamByName('title').AsString := EditTitle.Text;
  FDQuery1.ParamByName('author').AsString := EditAuthor.Text;
  FDQuery1.ParamByName('price').AsInteger := StrToIntDef(EditPrice.Text, 0);
  FDQuery1.ExecSQL;
  ButtonReadClick(nil);
end;

procedure TForm2.ButtonDeleteClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'DELETE FROM books WHERE book_id = :book_id';
  FDQuery1.ParamByName('book_id').AsInteger := SelectedBookId;
  FDQuery1.ExecSQL;
  ButtonReadClick(nil);


end;

procedure TForm2.ButtonReadClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT * FROM books';
  FDQuery1.Open;

end;

procedure TForm2.ButtonUpdateClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'UPDATE books SET title = :title, author = :author, price = :price WHERE book_id = :book_id';
  FDQuery1.ParamByName('title').AsString := EditTitle.Text;
  FDQuery1.ParamByName('author').AsString := EditAuthor.Text;
  FDQuery1.ParamByName('price').AsInteger := StrToIntDef(EditPrice.Text, 0);
  FDQuery1.ParamByName('book_id').AsInteger := SelectedBookId;
  FDQuery1.ExecSQL;
   ButtonReadClick(nil);
end;

procedure TForm2.DBGrid1CellClick(Column: TColumn);

var
  i: Integer;

begin
  SelectedBookId := FDQuery1.FieldByName('book_id').AsInteger;
  EditTitle.Text := FDQuery1.FieldByName('title').AsString;
  EditAuthor.Text := FDQuery1.FieldByName('author').AsString;
  EditPrice.Text := FDQuery1.FieldByName('price').AsString;

  for i := 0 to DBGrid1.Columns.Count - 1 do
    DBGrid1.Columns[i].Width := Trunc(DBGrid1.ClientWidth / DBGrid1.Columns.Count) - 5;

end;

procedure TForm2.FormCreate(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT * FROM books';
  FDQuery1.Open;
end;

end.
