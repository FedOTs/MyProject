object Form1: TForm1
  Left = 367
  Top = 198
  Width = 514
  Height = 593
  Caption = #1057#1087#1080#1089#1086#1082' '#1079#1072#1076#1072#1095
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  Menu = MainMenu1
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 505
    Height = 545
    ActivePage = TabSheet1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1047#1072#1076#1072#1095#1080
      object TreeView1: TTreeView
        Left = 0
        Top = 20
        Width = 497
        Height = 413
        Indent = 19
        PopupMenu = PopupMenu1
        TabOrder = 0
        OnCustomDrawItem = TreeView1CustomDrawItem
      end
      object Edit1: TEdit
        Left = 0
        Top = 0
        Width = 425
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object Button1: TButton
        Left = 424
        Top = 0
        Width = 73
        Height = 20
        Caption = #1044#1086#1073#1072#1074#1080#1090#1100
        TabOrder = 2
        Visible = False
        OnClick = Button1Click
      end
      object Memo1: TMemo
        Left = 0
        Top = 436
        Width = 505
        Height = 73
        TabOrder = 3
      end
      object Edit2: TEdit
        Left = 0
        Top = 496
        Width = 505
        Height = 21
        TabOrder = 4
        OnKeyPress = Edit2KeyPress
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1047#1072#1084#1077#1090#1082#1080
      ImageIndex = 1
      object re: TRichEdit
        Left = 0
        Top = 0
        Width = 497
        Height = 537
        ScrollBars = ssBoth
        TabOrder = 0
      end
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 136
    object N4: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1082#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      OnClick = N4Click
    end
    object N1: TMenuItem
      Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1042#1077#1088#1085#1091#1090#1100
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
      OnClick = N3Click
    end
    object N7: TMenuItem
      Caption = #1048#1079#1084#1077#1085#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
    end
  end
  object MainMenu1: TMainMenu
    Left = 144
    Top = 64
    object N5: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1076#1072#1095#1091
      ShortCut = 16462
      OnClick = N5Click
    end
  end
  object IdUDPClient1: TIdUDPClient
    Active = True
    BroadcastEnabled = True
    Host = '172.16.1.255'
    Port = 11245
    Left = 8
    Top = 56
  end
  object IdUDPServer1: TIdUDPServer
    Active = True
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 11245
    OnUDPRead = IdUDPServer1UDPRead
    Left = 40
    Top = 56
  end
end
