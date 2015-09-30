unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Menus, StdCtrls, IdUDPServer, IdBaseComponent,
  IdComponent, IdUDPBase, IdUDPClient,IdSocketHandle;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    MainMenu1: TMainMenu;
    Edit1: TEdit;
    Button1: TButton;
    N7: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    re: TRichEdit;
    IdUDPClient1: TIdUDPClient;
    IdUDPServer1: TIdUDPServer;
    Memo1: TMemo;
    Edit2: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Edit2KeyPress(Sender: TObject; var Key: Char);
    procedure IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    function GetKolSymbol(s:string;s1:string):integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  flag:boolean;
  function SrNodeTree(pTreeNode: TTreeNode; var sRuta: string): string;

implementation

{$R *.dfm}

function TForm1.GetKolSymbol(s:string;s1:string):integer;
var
i,k:integer;
begin
for i:=1 to length(s) do
 if s[i]=s1 then inc(k);
result:=k;
end;

function SrNodeTree(pTreeNode: TTreeNode; var sRuta: string): string;
begin 
  sRuta := pTreeNode.Text + ' > ' + sRuta; 
  if pTreeNode.Level = 0 then Result := sRuta 
  else  
    Result := SrNodeTree(pTreeNode.Parent, sRuta); 
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
treeview1.SaveToFile(ExtractFilepath(Application.ExeName)+'Spisok.txt');
re.Lines.SaveToFile('doc.rtf');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
Form1.Top:=screen.WorkAreaHeight-Form1.Height;
Form1.left:=screen.WorkAreaWidth-Form1.Width;
re.Lines.LoadFromFile('doc.rtf');
treeview1.Items.BeginUpdate;
treeview1.LoadFromFile(ExtractFilepath(Application.ExeName)+'Spisok.txt');
treeview1.Items.EndUpdate;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
TabSheet1.Show;
flag:=true;
Edit1.Visible:=true;
Button1.Visible:=true;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
if TreeView1.Selected.Text='*Выполненные' then
else
TreeView1.Items.Delete(TreeView1.Selected);
end;

procedure TForm1.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
IF Node.Text[1]='*' then Sender.Canvas.Font.Color:=clHotLight;
end;

procedure TForm1.N1Click(Sender: TObject);
Var
Child,Node:TTreeNode;
i:integer;
begin
 Node:=TreeView1.Selected;
 i:=TreeView1.Items.AddChild(TreeView1.Items.Item[0], TreeView1.Selected.Text+' : '+DateTimeToStr(now)).AbsoluteIndex;
 Child := Node.GetFirstChild;
 while Assigned(Child) do
 begin
   TreeView1.Items.AddChild(TreeView1.Items.Item[i], Child.Text);
   Child := Node.GetNextChild(Child)
 end;
if TreeView1.Selected.Text='*Выполненные' then
else
TreeView1.Items.Delete(TreeView1.Selected);
end;

procedure TForm1.N2Click(Sender: TObject);
Var
Child,Node:TTreeNode;
i:integer;
s:string;
begin
 Node:=TreeView1.Selected;
 s:=TreeView1.Selected.Text;
 if GetKolSymbol(s,':')>3 then
 delete(s,length(s)-21,21);
 i:=TreeView1.Items.Add(nil, s).AbsoluteIndex;
 Child := Node.GetFirstChild;
 while Assigned(Child) do
 begin
   TreeView1.Items.AddChild(TreeView1.Items.Item[i], Child.Text);
   Child := Node.GetNextChild(Child)
 end;
if TreeView1.Selected.Text='*Выполненные' then
else
TreeView1.Items.Delete(TreeView1.Selected);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
if flag=true then
TreeView1.Items.Add(nil,Edit1.Text+' : '+DateTimeToStr(now));
if flag=false then
TreeView1.Items.AddChild(TreeView1.Selected,Edit1.Text+' : '+DateTimeToStr(now));
Edit1.Visible:=false;
Button1.Visible:=false;
treeview1.SaveToFile(ExtractFilepath(Application.ExeName)+'Spisok.txt');
end;

procedure TForm1.N4Click(Sender: TObject);
begin
flag:=false;
Edit1.Visible:=true;
Button1.Visible:=true;
end;

procedure TForm1.FormKeyPress(Sender: TObject; var Key: Char);
begin
if Key = #27 then // VK_ESCAPE
begin
Edit1.Visible:=false;
Button1.Visible:=false;
end;
end;

procedure TForm1.Edit2KeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
begin
IdUDPClient1.Send(edit2.Text);
edit2.Text:='';
end;
end;

procedure TForm1.IdUDPServer1UDPRead(Sender: TObject; AData: TStream;
  ABinding: TIdSocketHandle);
var
  StringFormatedStream: TStringStream;
  s: String;
begin
 StringFormatedStream := TStringStream.Create('');
 
 StringFormatedStream.CopyFrom(AData, AData.Size);
 Memo1.Lines.Add(ABinding.PeerIP+' '+StringFormatedStream.DataString);
 ABinding.SendTo(ABinding.PeerIP, ABinding.PeerPort, s[1], Length(s));
 StringFormatedStream.Free;
end;

end.
