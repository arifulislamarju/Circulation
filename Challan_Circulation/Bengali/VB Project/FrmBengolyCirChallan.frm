VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form FrmBengolyCirChallan 
   Caption         =   " ALODAT - Circulation Challan Statement in Bengoly"
   ClientHeight    =   5010
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   7620
   BeginProperty Font 
      Name            =   "SutonnyEMJ"
      Size            =   8.25
      Charset         =   0
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "FrmBengolyCirChallan.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   5010
   ScaleWidth      =   7620
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame FrameReportsPreviewCriteriaRange 
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   &H00FF0000&
      Height          =   3570
      Left            =   30
      TabIndex        =   5
      Top             =   810
      Width           =   7350
      Begin VB.Frame Frame1 
         Caption         =   "No Of Pages"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1275
         Left            =   330
         TabIndex        =   66
         Top             =   2250
         Width           =   6615
         Begin VB.CheckBox Check1 
            Caption         =   "Show Second Supplement"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   405
            Left            =   1560
            TabIndex        =   71
            Top             =   780
            Width           =   3015
         End
         Begin VB.ComboBox cmbNews 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            ItemData        =   "FrmBengolyCirChallan.frx":08CA
            Left            =   1590
            List            =   "FrmBengolyCirChallan.frx":08CC
            Style           =   2  'Dropdown List
            TabIndex        =   68
            Top             =   390
            Width           =   1905
         End
         Begin VB.ComboBox cmbSupplement 
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   700
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   315
            ItemData        =   "FrmBengolyCirChallan.frx":08CE
            Left            =   4530
            List            =   "FrmBengolyCirChallan.frx":08D0
            Style           =   2  'Dropdown List
            TabIndex        =   67
            Top             =   390
            Width           =   1905
         End
         Begin VB.Label Label10 
            Caption         =   "News"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   150
            TabIndex        =   70
            Top             =   390
            Width           =   1110
         End
         Begin VB.Label Label11 
            Caption         =   "Supplement"
            BeginProperty Font 
               Name            =   "Tahoma"
               Size            =   8.25
               Charset         =   0
               Weight          =   400
               Underline       =   0   'False
               Italic          =   0   'False
               Strikethrough   =   0   'False
            EndProperty
            Height          =   240
            Left            =   3540
            TabIndex        =   69
            Top             =   390
            Width           =   1110
         End
      End
      Begin VB.TextBox TbAreaFrom 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   1950
         TabIndex        =   64
         Top             =   1380
         Width           =   1875
      End
      Begin VB.TextBox TbCustTypeTo 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   4890
         TabIndex        =   58
         Text            =   "ZZ"
         Top             =   1020
         Width           =   1875
      End
      Begin VB.TextBox TbTransportTo 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   4890
         TabIndex        =   57
         Text            =   "ZZ"
         Top             =   1860
         Width           =   1875
      End
      Begin VB.TextBox TbAreaTo 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   4890
         TabIndex        =   56
         Text            =   "ZZ"
         Top             =   1440
         Width           =   1875
      End
      Begin VB.TextBox TxtAreaFrom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   13
         Top             =   3750
         Width           =   1860
      End
      Begin VB.TextBox TxtAreaTo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   4020
         TabIndex        =   12
         Text            =   "ZZ"
         Top             =   4230
         Width           =   1860
      End
      Begin VB.TextBox TbTransportFrom 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   1950
         TabIndex        =   11
         Top             =   1800
         Width           =   1875
      End
      Begin VB.TextBox TxtTransportFrom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   720
         TabIndex        =   10
         Top             =   4050
         Width           =   1860
      End
      Begin VB.TextBox TxtTransportTo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   3900
         TabIndex        =   9
         Text            =   "ZZ"
         Top             =   4140
         Width           =   1860
      End
      Begin VB.TextBox TxtCustTo 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   3960
         TabIndex        =   8
         Text            =   "ZZ"
         Top             =   4110
         Width           =   1860
      End
      Begin VB.TextBox TxtCustFrom 
         Appearance      =   0  'Flat
         BackColor       =   &H00FFFFC0&
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   765
         TabIndex        =   7
         Top             =   4020
         Width           =   1860
      End
      Begin VB.TextBox TbCustTypeFrom 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   345
         Left            =   1950
         TabIndex        =   6
         Top             =   960
         Width           =   1875
      End
      Begin MSComCtl2.DTPicker DTPFrom 
         Height          =   345
         Left            =   1950
         TabIndex        =   14
         ToolTipText     =   "From Trasaction Date"
         Top             =   510
         Width           =   1875
         _ExtentX        =   3307
         _ExtentY        =   609
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CalendarTitleBackColor=   -2147483635
         CalendarTitleForeColor=   -2147483634
         CustomFormat    =   "MMM-dd-yyyy"
         Format          =   157745155
         CurrentDate     =   38617
      End
      Begin MSComctlLib.Toolbar TlBarZoneFrom 
         Height          =   330
         Left            =   3240
         TabIndex        =   15
         ToolTipText     =   "From Zone"
         Top             =   4815
         Width           =   555
         _ExtentX        =   979
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarCategoryFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   16
         ToolTipText     =   "From Category"
         Top             =   675
         Width           =   555
         _ExtentX        =   979
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarCustomerTo 
         Height          =   330
         Left            =   5760
         TabIndex        =   17
         ToolTipText     =   "To Customer"
         Top             =   2745
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarCustFrom 
         Height          =   330
         Left            =   3900
         TabIndex        =   18
         ToolTipText     =   "To Invoice"
         Top             =   960
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarTransportFrom 
         Height          =   330
         Left            =   3900
         TabIndex        =   19
         ToolTipText     =   "To District"
         Top             =   1800
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarZoneTo 
         Height          =   330
         Left            =   5805
         TabIndex        =   20
         ToolTipText     =   "To Zone"
         Top             =   4815
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar Toolbar20 
         Height          =   330
         Left            =   12015
         TabIndex        =   21
         ToolTipText     =   "From Delivery Person"
         Top             =   675
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarSubZoneFrom 
         Height          =   330
         Left            =   3285
         TabIndex        =   22
         ToolTipText     =   "From Sub Zone"
         Top             =   5355
         Width           =   510
         _ExtentX        =   900
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMarketFrom 
         Height          =   330
         Left            =   3285
         TabIndex        =   23
         ToolTipText     =   "From Market"
         Top             =   5850
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarSubZoneTo 
         Height          =   330
         Left            =   5760
         TabIndex        =   24
         ToolTipText     =   "To Sub Zone"
         Top             =   5355
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMarketTo 
         Height          =   330
         Left            =   5760
         TabIndex        =   25
         ToolTipText     =   "To Market"
         Top             =   5850
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar Toolbar1 
         Height          =   330
         Left            =   9900
         TabIndex        =   26
         ToolTipText     =   "From Delivery Person"
         Top             =   675
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
         Begin MSComctlLib.Toolbar Toolbar2 
            Height          =   330
            Left            =   8595
            TabIndex        =   27
            ToolTipText     =   "From Delivery Person"
            Top             =   585
            Width           =   420
            _ExtentX        =   741
            _ExtentY        =   582
            ButtonWidth     =   609
            ButtonHeight    =   582
            Style           =   1
            ImageList       =   "ImageList1"
            _Version        =   393216
            BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
               NumButtons      =   1
               BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               EndProperty
            EndProperty
         End
      End
      Begin MSComctlLib.Toolbar TlBarSubCategoryFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   28
         ToolTipText     =   "From Sub Category"
         Top             =   1125
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar Toolbar4 
         Height          =   330
         Left            =   9900
         TabIndex        =   29
         ToolTipText     =   "From Delivery Person"
         Top             =   1665
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
         Begin MSComctlLib.Toolbar TlBarNSMTrFrom 
            Height          =   330
            Left            =   0
            TabIndex        =   30
            ToolTipText     =   "From NSM Territory Code"
            Top             =   0
            Width           =   420
            _ExtentX        =   741
            _ExtentY        =   582
            ButtonWidth     =   609
            ButtonHeight    =   582
            Style           =   1
            ImageList       =   "ImageList1"
            _Version        =   393216
            BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
               NumButtons      =   1
               BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
               EndProperty
            EndProperty
         End
      End
      Begin MSComctlLib.Toolbar TlBarRSMTrFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   31
         ToolTipText     =   "From RSM Territory Code"
         Top             =   2205
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarFMTrFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   32
         ToolTipText     =   "From FM Territory Code"
         Top             =   2700
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMSOTrFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   33
         ToolTipText     =   "From MSO Territory Code"
         Top             =   3195
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarNSMIdFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   34
         ToolTipText     =   "From NSM ID"
         Top             =   3735
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarRSMIdFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   35
         ToolTipText     =   "From RSM ID"
         Top             =   4275
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarFMIdFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   36
         ToolTipText     =   "From FM ID"
         Top             =   4815
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMSOIdFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   37
         ToolTipText     =   "From MSO ID"
         Top             =   5355
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarDelPersonIdFrom 
         Height          =   330
         Left            =   9900
         TabIndex        =   38
         ToolTipText     =   "From Delivery Person ID"
         Top             =   5895
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarSubCategoryTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   39
         ToolTipText     =   "To Sub Category"
         Top             =   1125
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarNSMTrTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   40
         ToolTipText     =   "To NSM Territory Code"
         Top             =   1665
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarRSMTrTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   41
         ToolTipText     =   "To RSM Territory Code"
         Top             =   2205
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarFMTrTo 
         Height          =   330
         Left            =   12420
         TabIndex        =   42
         ToolTipText     =   "From FM Territory Code"
         Top             =   2700
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMSOTrTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   43
         ToolTipText     =   "To MSO Territory Code"
         Top             =   3195
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarNSMIdTo 
         Height          =   330
         Left            =   12420
         TabIndex        =   44
         ToolTipText     =   "To NSM ID"
         Top             =   3735
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarRSMIdTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   45
         ToolTipText     =   "To RSM ID"
         Top             =   4275
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarFMIdTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   46
         ToolTipText     =   "To FM ID"
         Top             =   4815
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarMSOIdTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   47
         ToolTipText     =   "To MSO ID"
         Top             =   5355
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarDelPersonIdTo 
         Height          =   330
         Left            =   12375
         TabIndex        =   48
         ToolTipText     =   "To Delivery Person ID"
         Top             =   5895
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarCategoryTo 
         Height          =   330
         Left            =   12420
         TabIndex        =   49
         ToolTipText     =   "To Category"
         Top             =   675
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarAreaFrom 
         Height          =   330
         Left            =   3900
         TabIndex        =   50
         ToolTipText     =   "To Invoice"
         Top             =   1380
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComCtl2.DTPicker DTPTo 
         Height          =   345
         Left            =   4890
         TabIndex        =   59
         ToolTipText     =   "From Trasaction Date"
         Top             =   570
         Width           =   1875
         _ExtentX        =   3307
         _ExtentY        =   609
         _Version        =   393216
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         CalendarTitleBackColor=   -2147483635
         CalendarTitleForeColor=   -2147483634
         CustomFormat    =   "dd-MMM-yyyy"
         Format          =   157745155
         CurrentDate     =   38617
      End
      Begin MSComctlLib.Toolbar TlBarCustTo 
         Height          =   330
         Left            =   6450
         TabIndex        =   60
         ToolTipText     =   "To Invoice"
         Top             =   960
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarTransportTo 
         Height          =   330
         Left            =   6450
         TabIndex        =   61
         ToolTipText     =   "To District"
         Top             =   1800
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarAreaTo 
         Height          =   330
         Left            =   6450
         TabIndex        =   62
         ToolTipText     =   "To Invoice"
         Top             =   1380
         Width           =   420
         _ExtentX        =   741
         _ExtentY        =   582
         ButtonWidth     =   609
         ButtonHeight    =   582
         Style           =   1
         ImageList       =   "ImageList1"
         _Version        =   393216
         BeginProperty Buttons {66833FE8-8583-11D1-B16A-00C0F0283628} 
            NumButtons      =   1
            BeginProperty Button1 {66833FEA-8583-11D1-B16A-00C0F0283628} 
            EndProperty
         EndProperty
      End
      Begin VB.Label Label9 
         Caption         =   "Area"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   65
         Top             =   1380
         Width           =   1365
      End
      Begin VB.Label Label3 
         Caption         =   "Transport"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   55
         Top             =   1800
         Width           =   2055
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "From"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   1950
         TabIndex        =   54
         Top             =   180
         Width           =   1860
      End
      Begin VB.Label Label5 
         Caption         =   "Date"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   53
         Top             =   510
         Width           =   960
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "To"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   4290
         TabIndex        =   52
         Top             =   240
         Width           =   1860
      End
      Begin VB.Label Label21 
         Caption         =   "Customer Name"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   51
         Top             =   960
         Width           =   1365
      End
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "&Cancel"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   6150
      TabIndex        =   4
      Top             =   4440
      Width           =   1275
   End
   Begin VB.CommandButton CmdReportPreview 
      Caption         =   "&Preview"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   390
      Left            =   120
      TabIndex        =   0
      Top             =   4530
      Width           =   1275
   End
   Begin VB.Frame FrameReportsPreviewCriteria 
      Caption         =   "Reports Preview Criteria"
      BeginProperty Font 
         Name            =   "MS Sans Serif"
         Size            =   8.25
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   735
      Left            =   7980
      TabIndex        =   1
      Top             =   840
      Visible         =   0   'False
      Width           =   7725
      Begin VB.OptionButton Optrptwithparam 
         Caption         =   "With Parameter"
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Index           =   1
         Left            =   1035
         TabIndex        =   3
         Top             =   315
         Width           =   1950
      End
      Begin VB.OptionButton Optwithoutparam 
         Caption         =   "Without Parameter"
         Enabled         =   0   'False
         BeginProperty Font 
            Name            =   "MS Sans Serif"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   285
         Index           =   0
         Left            =   4920
         TabIndex        =   2
         Top             =   315
         Width           =   1770
      End
   End
   Begin MSComctlLib.ImageList ImageList1 
      Left            =   7335
      Top             =   8460
      _ExtentX        =   1005
      _ExtentY        =   1005
      BackColor       =   -2147483643
      ImageWidth      =   16
      ImageHeight     =   16
      MaskColor       =   12632256
      _Version        =   393216
      BeginProperty Images {2C247F25-8591-11D1-B16A-00C0F0283628} 
         NumListImages   =   3
         BeginProperty ListImage1 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmBengolyCirChallan.frx":08D2
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmBengolyCirChallan.frx":11AC
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmBengolyCirChallan.frx":1A86
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label Label8 
      Caption         =   "       ‰`wbK mvKz©‡jkb Pvjvb"
      BeginProperty Font 
         Name            =   "DhanshirhiMJ"
         Size            =   18
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   495
      Left            =   1590
      TabIndex        =   63
      Top             =   180
      Width           =   3645
   End
   Begin VB.Line Line1 
      X1              =   0
      X2              =   14220
      Y1              =   0
      Y2              =   0
   End
   Begin VB.Menu mnfile 
      Caption         =   "&File"
      Begin VB.Menu mnabout 
         Caption         =   "&About"
      End
      Begin VB.Menu mnexit 
         Caption         =   "&Exit"
      End
   End
End
Attribute VB_Name = "FrmBengolyCirChallan"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
 Dim FromDate As Double
 Dim ToDate As Double

Private Sub cmdcancel_Click()
    End
End Sub

Private Sub CmdReportPreview_Click()
    
    Dim SQLString As String
    Dim OrderBy As String
    
    Dim ReportViewer As New FrmRptViewer
    
    Dim ChallanRecord As New CrystalReportChallanInBangla
    Dim Errorfrm As New FrmError
    Dim rs As New Recordset
    Dim II As Integer
    
    'Collect From & ToDate
'     FromDate = Format(Year(DTPFrom.Value), "0000") & Format(Month(DTPFrom.Value), "00") & Format(Day(DTPFrom.Value), "00")
'     ToDate = Format(Year(DTPTo.Value), "0000") & Format(Month(DTPTo.Value), "00") & Format(Day(DTPTo.Value), "00")
FromDate = Format(Year(DTPFrom.Value), "YYYY") & Format(Month(DTPFrom.Value), "MMM") & Format(Day(DTPFrom.Value), "dd")
     ToDate = Format(Year(DTPTo.Value), "0000") & Format(Month(DTPTo.Value), "00") & Format(Day(DTPTo.Value), "00")


'    FromDate = Format(Month(DTPFrom.Value), "MMM") & Format(Day(DTPFrom.Value), "DD") & Format(Year(DTPFrom.Value), "YYYY")
'     ToDate = Format(Month(DTPTo.Value), "MMM") & Format(Day(DTPTo.Value), "DD") & Format(Year(DTPTo.Value), "YYYY")


    If Trim(FromDate) > Trim(ToDate) Then
        Errorfrm.Show 1
        DTPFrom.SetFocus
        Exit Sub
    End If
    
    
'***********************************************************************************************************************
'                                      Preview the Report With Passing Parameter
'***********************************************************************************************************************

'MAKE SQL STRING
 
            If Optrptwithparam(1).Value = True Then
            
         'DATE   - ...............................................................................
               'SQLString = "SELECT *,CAST(orderDate AS int) FROM Daily_Order WHERE orderDate BETWEEN " & FromDate & " AND " & ToDate & "" 'and ITEM = '41-1002' "
                SQLString = "SELECT * FROM Daily_Order " ' WHERE orderDate BETWEEN " & FromDate & " AND " & ToDate & "" 'and ITEM = '41-1002' "
              
    If Len(Trim(TbCustTypeFrom)) > 0 Then
          If UCase(Mid(Trim(TbCustTypeTo), 1, 1)) = "Z" Then
              SQLString = SQLString & " And customerId  >= '" & Trim(TbCustTypeFrom) & "'"
          Else
              SQLString = SQLString & " And customerId Between '" & Trim(TbCustTypeFrom) & "' and '" & Trim(TbCustTypeTo) & "'"
          End If
    End If
         
         'Agency Area - ............................................................................
                If Len(Trim(TbAreaFrom)) > 0 Then
                      If UCase(Mid(Trim(TbAreaTo), 1, 1)) = "Z" Then
                         SQLString = SQLString & "And stationId  >= '" & Trim(TbAreaFrom) & "'"
                       Else
                       SQLString = SQLString & "And stationId Between '" & Trim(TbAreaFrom) & "' and '" & Trim(TbAreaTo) & "'"
                       End If
            End If
               
               
         'Transport - ............................................................................
                If Len(Trim(TbTransportFrom)) > 0 Then
                      If UCase(Mid(Trim(TbTransportTo), 1, 1)) = "Z" Then
                         SQLString = SQLString & "And vehicleCode  >= '" & Trim(TbTransportFrom) & "'"
                       Else
                       SQLString = SQLString & "And vehicleCode Between '" & Trim(TbTransportFrom) & "' and '" & Trim(TbTransportTo) & "'"
                       End If
            End If
         
                    
                    
                    ElseIf Optwithoutparam(0).Value = True Then
                    
                     SQLString = "SELECT * FROM Daily_Order"
                       Else
                     MsgBox "Report Not Found", vbInformation, "Report Preview"
             Exit Sub
End If
If Check1.Value = 0 Then
'ChallanRecord.Field12.Suppress = True
'ChallanRecord.Field16.Suppress = True
'ChallanRecord.Field26.Suppress = True
'ChallanRecord.Field27.Suppress = True
End If
 
  SQLString = SQLString
  Set rs = Nothing
  Set rs = Get_RS(SQLString)
  
    
    ChallanRecord.DiscardSavedData
    ChallanRecord.Database.SetDataSource rs
              
'    ChallanRecord.ParameterFields.GetItemByName("News").AddCurrentValue (Trim(cmbNews.Text))
'
'    ChallanRecord.ParameterFields.GetItemByName("Suppliment").AddCurrentValue (Trim(cmbSupplement.Text))
'
'
   Set ReportViewer.Report = ChallanRecord

 ReportViewer.Show 1
End Sub

Private Sub Form_Load()

With cmbNews
    .AddItem ("20")
    .AddItem ("24")
    .AddItem ("16")
 End With
 
 With cmbSupplement
    .AddItem ("4")
    .AddItem ("6")
    .AddItem ("8")
    .AddItem ("12")
End With

cmbNews.ListIndex = 0
cmbSupplement.ListIndex = 0

          Optrptwithparam(1).Value = True
            
            DTPFrom.Value = Date
            DTPTo.Value = Date
            
            '//CUSTOMER
            TlBarCustFrom.Buttons(1).Image = 3
            TlBarCustTo.Buttons(1).Image = 3
            
            '//AREA
            TlBarAreaFrom.Buttons(1).Image = 3
            TlBarAreaTo.Buttons(1).Image = 3
            
            '//TRANSPORT
            TlBarTransportFrom.Buttons(1).Image = 3
            TlBarTransportTo.Buttons(1).Image = 3
            
            

''''
           
  TxtCustFrom.Visible = False
  TxtCustTo.Visible = False
  
  TxtAreaFrom.Visible = False
  TxtAreaTo.Visible = False
  
  TxtTransportFrom.Visible = False
  TxtTransportTo.Visible = False
  

           

End Sub

Private Sub Label56_Click()
End Sub

Private Sub mnabout_Click()
    FrmAbout.Show
End Sub

Private Sub mnexit_Click()
End
End Sub
Private Sub TxtFrom_Change()

End Sub

Private Sub TlBarCustTypeFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
If Optrptwithparam(1).Value = False Then

               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")

            Exit Sub
        End If

         cnt = 1
         FrmCustomerTypeFinder.Show

         FrmCustomerTypeFinder.DataGrid1.Columns(0).Width = 2000
         FrmCustomerTypeFinder.DataGrid1.Columns(1).Width = 6000
End Sub

Private Sub TbAreaFrom_Change()
TbAreaTo.Text = TbAreaFrom.Text
End Sub

Private Sub TbCustTypeFrom_Change()
TbCustTypeTo.Text = TbCustTypeFrom.Text
End Sub

Private Sub TbTransportFrom_Change()
TbTransportTo.Text = TbTransportFrom.Text
End Sub


Private Sub TlBarAreaFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 1
FrmAreaFinder.Show

End Sub

Private Sub TlBarAreaTo_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 2
FrmAreaFinder.Show
End Sub

Private Sub TlBarCustFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
 cnt = 1
         FrmCustomerFinder.Show

         FrmCustomerFinder.DataGrid1.Columns(0).Width = 2000
         FrmCustomerFinder.DataGrid1.Columns(1).Width = 6000
End Sub

Private Sub TlBarCustTo_ButtonClick(ByVal Button As MSComctlLib.Button)
 cnt = 2
         FrmCustomerFinder.Show

         FrmCustomerFinder.DataGrid1.Columns(0).Width = 2000
         FrmCustomerFinder.DataGrid1.Columns(1).Width = 6000
End Sub

Private Sub TlBarTransportFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 1
FrmTransportFinder.Show

End Sub

Private Sub TlBarTransportTo_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 2
FrmTransportFinder.Show
End Sub
