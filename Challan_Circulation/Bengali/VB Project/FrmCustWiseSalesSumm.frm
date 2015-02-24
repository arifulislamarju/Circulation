VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCT2.OCX"
Begin VB.Form FrmCashSalesState 
   Caption         =   " ALODAT - Advertisement Cash Sales Statement"
   ClientHeight    =   6390
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   9270
   Icon            =   "FrmCustWiseSalesSumm.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   6390
   ScaleWidth      =   9270
   StartUpPosition =   2  'CenterScreen
   Begin VB.Frame FrameReportsPreviewCriteriaRange 
      Caption         =   "Reports Preview Range"
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
      Height          =   3930
      Left            =   360
      TabIndex        =   5
      Top             =   1575
      Width           =   8520
      Begin VB.TextBox Text4 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   5850
         TabIndex        =   65
         Text            =   "ZZ"
         Top             =   2790
         Width           =   1860
      End
      Begin VB.TextBox Text3 
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   330
         Left            =   2835
         TabIndex        =   64
         Top             =   2790
         Width           =   1860
      End
      Begin VB.TextBox TxtAdCatFrom 
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
         Left            =   2835
         TabIndex        =   63
         Top             =   2565
         Width           =   1860
      End
      Begin VB.TextBox TxtAdCatTo 
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
         Left            =   5850
         TabIndex        =   62
         Text            =   "ZZ"
         Top             =   2565
         Width           =   1860
      End
      Begin VB.TextBox TxtCustTypeTo 
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
         Left            =   5850
         TabIndex        =   9
         Text            =   "ZZ"
         Top             =   1530
         Width           =   1860
      End
      Begin VB.TextBox TxtCustTypeFrom 
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
         Left            =   2835
         TabIndex        =   8
         Top             =   1530
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
         Height          =   330
         Left            =   2835
         TabIndex        =   7
         Top             =   1755
         Width           =   1860
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
         Height          =   330
         Left            =   5850
         TabIndex        =   6
         Text            =   "ZZ"
         Top             =   1755
         Width           =   1860
      End
      Begin MSComCtl2.DTPicker DTPFrom 
         Height          =   330
         Left            =   2835
         TabIndex        =   10
         ToolTipText     =   "From Trasaction Date"
         Top             =   855
         Width           =   1860
         _ExtentX        =   3281
         _ExtentY        =   582
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
         Format          =   53805059
         CurrentDate     =   38617
      End
      Begin MSComCtl2.DTPicker DTPTo 
         Height          =   330
         Left            =   5850
         TabIndex        =   11
         ToolTipText     =   "From Trasaction Date"
         Top             =   855
         Width           =   1860
         _ExtentX        =   3281
         _ExtentY        =   582
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
         Format          =   53805059
         CurrentDate     =   38617
      End
      Begin MSComctlLib.Toolbar TlBarItemFrom 
         Height          =   330
         Left            =   3285
         TabIndex        =   12
         ToolTipText     =   "From Item"
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
      Begin MSComctlLib.Toolbar TlBarDistrictFrom 
         Height          =   330
         Left            =   3780
         TabIndex        =   13
         ToolTipText     =   "From District"
         Top             =   1170
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
      Begin MSComctlLib.Toolbar TlBarZoneFrom 
         Height          =   330
         Left            =   3240
         TabIndex        =   14
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
         TabIndex        =   15
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
      Begin MSComctlLib.Toolbar TlBarItemTo 
         Height          =   330
         Left            =   5805
         TabIndex        =   16
         ToolTipText     =   "To Item"
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
      Begin MSComctlLib.Toolbar TlBarCustTypeFrom 
         Height          =   330
         Left            =   4680
         TabIndex        =   18
         ToolTipText     =   "To Invoice"
         Top             =   1755
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
      Begin MSComctlLib.Toolbar TlBarAdCatFrom 
         Height          =   330
         Left            =   4680
         TabIndex        =   19
         ToolTipText     =   "To District"
         Top             =   2790
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
      Begin MSComctlLib.Toolbar Toolbar22 
         Height          =   330
         Left            =   5760
         TabIndex        =   22
         ToolTipText     =   "From Delivery Person"
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
      Begin MSComctlLib.Toolbar TlBarPrdGrpTo 
         Height          =   330
         Left            =   5760
         TabIndex        =   23
         ToolTipText     =   "To Product Group"
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
      Begin MSComctlLib.Toolbar TlBarBranchFrom 
         Height          =   330
         Left            =   3285
         TabIndex        =   24
         ToolTipText     =   "From Branch"
         Top             =   1125
         Width           =   375
         _ExtentX        =   661
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
      Begin MSComctlLib.Toolbar TlBarBranchTo 
         Height          =   330
         Left            =   5760
         TabIndex        =   25
         ToolTipText     =   "To Branch"
         Top             =   1125
         Width           =   375
         _ExtentX        =   661
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
         TabIndex        =   26
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
         TabIndex        =   27
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
         TabIndex        =   28
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
         TabIndex        =   29
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
         TabIndex        =   30
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
            TabIndex        =   31
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
         TabIndex        =   32
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
         TabIndex        =   33
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
            TabIndex        =   34
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
         TabIndex        =   35
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
         TabIndex        =   36
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
         TabIndex        =   37
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
         TabIndex        =   38
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
         TabIndex        =   39
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
         TabIndex        =   40
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
         TabIndex        =   41
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
         TabIndex        =   42
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
         TabIndex        =   43
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
         TabIndex        =   44
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
         TabIndex        =   45
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
         TabIndex        =   46
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
         TabIndex        =   47
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
         TabIndex        =   48
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
         TabIndex        =   49
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
         TabIndex        =   50
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
         TabIndex        =   51
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
         TabIndex        =   52
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
         TabIndex        =   53
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
      Begin MSComctlLib.Toolbar TlBarCustTypeTo 
         Height          =   330
         Left            =   7695
         TabIndex        =   66
         ToolTipText     =   "To Invoice"
         Top             =   1755
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
      Begin MSComctlLib.Toolbar TlBarAdCatto 
         Height          =   330
         Left            =   7695
         TabIndex        =   67
         ToolTipText     =   "To District"
         Top             =   2790
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
      Begin VB.Label Label7 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2610
         TabIndex        =   61
         Top             =   2745
         Width           =   105
      End
      Begin VB.Label Label6 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2610
         TabIndex        =   60
         Top             =   1800
         Width           =   105
      End
      Begin VB.Label Label3 
         Caption         =   "Advertisement Category"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   360
         TabIndex        =   59
         Top             =   2790
         Width           =   2175
      End
      Begin VB.Label Label1 
         Alignment       =   2  'Center
         Caption         =   "From"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2790
         TabIndex        =   58
         Top             =   450
         Width           =   1860
      End
      Begin VB.Label Label5 
         Caption         =   "Date"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   57
         Top             =   855
         Width           =   960
      End
      Begin VB.Label Label2 
         Alignment       =   2  'Center
         Caption         =   "To"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   5850
         TabIndex        =   56
         Top             =   450
         Width           =   1860
      End
      Begin VB.Label Label21 
         Caption         =   "Customer Type"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   450
         TabIndex        =   55
         Top             =   1800
         Width           =   1365
      End
      Begin VB.Label Label25 
         Caption         =   ":"
         BeginProperty Font 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   0
            Weight          =   700
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   2655
         TabIndex        =   54
         Top             =   900
         Width           =   105
      End
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "&Cancel"
      Height          =   330
      Left            =   7605
      TabIndex        =   1
      Top             =   5805
      Width           =   1275
   End
   Begin VB.CommandButton CmdReportPreview 
      Caption         =   "&Preview"
      Height          =   330
      Left            =   360
      TabIndex        =   0
      Top             =   5805
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
      Left            =   360
      TabIndex        =   2
      Top             =   630
      Width           =   8565
      Begin VB.OptionButton Optrptwithparam 
         Caption         =   "With Parameter"
         Height          =   240
         Index           =   1
         Left            =   1035
         TabIndex        =   4
         Top             =   315
         Width           =   1950
      End
      Begin VB.OptionButton Optwithoutparam 
         Caption         =   "Without Parameter"
         Height          =   285
         Index           =   0
         Left            =   5400
         TabIndex        =   3
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
            Picture         =   "FrmCustWiseSalesSumm.frx":08CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmCustWiseSalesSumm.frx":11A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmCustWiseSalesSumm.frx":1A7E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label Label4 
      Caption         =   "Cash Sales Statement"
      BeginProperty Font 
         Name            =   "Tahoma"
         Size            =   12
         Charset         =   0
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Height          =   375
      Left            =   3285
      TabIndex        =   68
      Top             =   180
      Width           =   2805
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
Attribute VB_Name = "FrmCashSalesState"
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
    
    Dim CashSalesRecord As New CrystalReportCashSales
    Dim Errorfrm As New FrmError
    Dim rs As New Recordset
    Dim II As Integer
    
    'Collect From & ToDate
     FromDate = Format(Year(DTPFrom.Value), "0000") & Format(Month(DTPFrom.Value), "00") & Format(Day(DTPFrom.Value), "00")
     ToDate = Format(Year(DTPTo.Value), "0000") & Format(Month(DTPTo.Value), "00") & Format(Day(DTPTo.Value), "00")
         
    If Trim(FromDate) > Trim(ToDate) Then
        Errorfrm.Show 1
        DTPFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtBranchFrom) > Trim(TxtBranchTo) Then
        Errorfrm.Show 1
        TxtBranchFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtPrdGrpFrom) > Trim(TxtPrdGrpTo) Then
        Errorfrm.Show 1
        TxtPrdGrpFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtItemFrom) > Trim(TxtItemTo) Then
        Errorfrm.Show 1
        TxtItemFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtCustomerFrom) > Trim(TxtCustomerTo) Then
        Errorfrm.Show 1
        TxtCustomerFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtInvoiceFrom) > Trim(TxtInvoiceTo) Then
        Errorfrm.Show 1
        TxtInvoiceFrom.SetFocus
        Exit Sub
    End If
    
    If Trim(TxtDistrictFrom) > Trim(TxtDistrictTo) Then
        Errorfrm.Show 1
        TxtDistrictFrom.SetFocus
        Exit Sub
    End If
     
         If Trim(TxtSubDistrictFrom) > Trim(TxtSubDistrictTo) Then
              Errorfrm.Show 1
              TxtSubDistrictFrom.SetFocus
              Exit Sub
          End If
          
        If Trim(TxtZoneFrom) > Trim(TxtZoneTo) Then
              Errorfrm.Show 1
              TxtZoneFrom.SetFocus
              Exit Sub
        End If
        
        If Trim(TxtSubZoneFrom) > Trim(TxtSubZoneTo) Then
              Errorfrm.Show 1
              TxtSubZoneFrom.SetFocus
              Exit Sub
        End If
        
        If Trim(TxtMarketFrom) > Trim(TxtMarketTo) Then
              Errorfrm.Show 1
              TxtMarketFrom.SetFocus
              Exit Sub
        End If
        
        If Trim(TxtCatgoryFrom) > Trim(TxtCatgoryTo) Then
              Errorfrm.Show 1
              TxtCatgoryFrom.SetFocus
              Exit Sub
        End If
      
      If Trim(TxtSubCatgoryFrom) > Trim(TxtSubCatgoryTo) Then
              Errorfrm.Show 1
              TxtSubCatgoryFrom.SetFocus
              Exit Sub
      End If
      
      If Trim(TxtNSMTrCodeFrom) > Trim(TxtNSMTrCodeTo) Then
              Errorfrm.Show 1
              TxtNSMTrCodeFrom.SetFocus
              Exit Sub
      End If
      
      If Trim(TxtRSMTrCodeFrom) > Trim(TxtRSMTrCodeTo) Then
              Errorfrm.Show 1
              TxtRSMTrCodeFrom.SetFocus
              Exit Sub
      End If
       
      If Trim(TxtFMTrCodeFrom) > Trim(TxtFMTrCodeTo) Then
              Errorfrm.Show 1
              TxtFMTrCodeFrom.SetFocus
              Exit Sub
      End If
       
      If Trim(TxtMSOTrCodeFrom) > Trim(TxtMSOTrCodeTo) Then
              Errorfrm.Show 1
              TxtMSOTrCodeFrom.SetFocus
              Exit Sub
      End If
      
      If Trim(TxtNSMIdFrom) > Trim(TxtNSMIdTo) Then
              Errorfrm.Show 1
              TxtNSMIdFrom.SetFocus
              Exit Sub
      End If
      
      If Trim(TxtRSMIdFrom) > Trim(TxtRSMIdTo) Then
              Errorfrm.Show 1
              TxtRSMIdFrom.SetFocus
              Exit Sub
      End If
       
      If Trim(TxtFMIdFrom) > Trim(TxtFMIdTo) Then
              Errorfrm.Show 1
              TxtFMIdFrom.SetFocus
              Exit Sub
      End If
       
      If Trim(TxtMSOIdFrom) > Trim(TxtMSOIdTo) Then
              Errorfrm.Show 1
              TxtMSOIdFrom.SetFocus
              Exit Sub
      End If
      
      If Trim(TxtDPIdFrom) > Trim(TxtDPIdTo) Then
              Errorfrm.Show 1
              TxtDPIdFrom.SetFocus
              Exit Sub
      End If
      


'***********************************************************************************************************************
'                                      Preview the Report With Passing Parameter
'***********************************************************************************************************************

'MAKE SQL STRING
 
            If Optrptwithparam(1).Value = True Then
            
         'DATE   - ...............................................................................
               SQLString = "SELECT * FROM SalesStatementCash WHERE PublicationDate BETWEEN " & FromDate & " AND " & ToDate & " "
               
         'BRANCH   - ............................................................................
                If Len(Trim(TxtBranchFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtBranchTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And BRANCHID  >= '" & Trim(TxtBranchFrom) & "'"
                       Else
                       SQLString = SQLString & "And BRANCHID Between '" & Trim(TxtBranchFrom) & "' and '" & Trim(TxtBranchTo) & "'"
                       End If
            End If
               
               
         'PRODUCT GROUP   - ...................................................................................
                If Len(Trim(TxtPrdGrpFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtPrdGrpTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And PRODUCTID  >= '" & Trim(TxtPrdGrpFrom) & "'"
                       Else
                       SQLString = SQLString & "And PRODUCTID Between '" & Trim(TxtPrdGrpFrom) & "' and '" & Trim(TxtPrdGrpTo) & "'"
                       End If
            End If
            
         'ITEM           - .................................................................................
                If Len(Trim(TxtItemFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtItemTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And Item_No  >= '" & Trim(TxtItemFrom) & "'"
                       Else
                       SQLString = SQLString & "And Item_No Between '" & Trim(TxtItemFrom) & "' and '" & Trim(TxtItemTo) & "'"
                       End If
            End If
            
         'CUSTOMER    - .....................................................................................
                If Len(Trim(TxtCustomerFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtCustomerTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And Customer_ID >= '" & Trim(TxtCustomerFrom) & "'"
                       Else
                          SQLString = SQLString & "And Customer_ID Between '" & Trim(TxtCustomerFrom) & "' and '" & Trim(TxtCustomerTo) & "'"
                       End If
                End If
                        
         'INVOICE   - ..........................................................................................
                If Len(Trim(TxtInvoiceFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtInvoiceTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And InvoiceNo_Inv  >= '" & Trim(TxtInvoiceFrom) & "'"
                       Else
                       SQLString = SQLString & "And InvoiceNo_Inv Between '" & Trim(TxtInvoiceFrom) & "' and '" & Trim(TxtInvoiceTo) & "'"
                       End If
                End If
                
                
         'DISTRICT   - .......................................................................................
                If Len(Trim(TxtDistrictFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtDistrictTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And DISTID  >= '" & Trim(TxtDistrictFrom) & "'"
                       Else
                       SQLString = SQLString & "And DISTID Between '" & Trim(TxtDistrictFrom) & "' and '" & Trim(TxtDistrictTo) & "'"
                       End If
                End If
                
         'SUB DISTRICT   - .......................................................................................
                If Len(Trim(TxtSubDistrictFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtSubDistrictTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And SUBDISTID  >= '" & Trim(TxtSubDistrictFrom) & "'"
                       Else
                       SQLString = SQLString & "And SUBDISTID Between '" & Trim(TxtSubDistrictFrom) & "' and '" & Trim(TxtSubDistrictTo) & "'"
                       End If
                End If
                
         'ZONE  - .......................................................................................
                If Len(Trim(TxtZoneFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtZoneTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And ZONEID  >= '" & Trim(TxtZoneFrom) & "'"
                       Else
                       SQLString = SQLString & "And ZONEID Between '" & Trim(TxtZoneFrom) & "' and '" & Trim(TxtZoneTo) & "'"
                       End If
                End If
                
         'SUB ZONE  - .......................................................................................
                If Len(Trim(TxtSubZoneFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtSubZoneTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And SUBZONEID  >= '" & Trim(TxtSubZoneFrom) & "'"
                       Else
                       SQLString = SQLString & "And SUBZONEID Between '" & Trim(TxtSubZoneFrom) & "' and '" & Trim(TxtSubZoneTo) & "'"
                       End If
                End If
                
         'MARKET  - .......................................................................................
                If Len(Trim(TxtMarketFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtMarketTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And MARKETID  >= '" & Trim(TxtMarketFrom) & "'"
                       Else
                       SQLString = SQLString & "And MARKETID Between '" & Trim(TxtMarketFrom) & "' and '" & Trim(TxtMarketTo) & "'"
                       End If
                End If
            
            
        'CATEGORY  - ..........................................................................................
                If Len(Trim(TxtCatgoryFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtCatgoryTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And CATID  >= '" & Trim(TxtCatgoryFrom) & "'"
                       Else
                       SQLString = SQLString & "And CATID Between '" & Trim(TxtCatgoryFrom) & "' and '" & Trim(TxtCatgoryTo) & "'"
                       End If
                End If
                
                
        'SUB CATEGORY  - .......................................................................................
                If Len(Trim(TxtSubCatgoryFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtSubCatgoryTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And SUBCATID  >= '" & Trim(TxtSubCatgoryFrom) & "'"
                       Else
                       SQLString = SQLString & "And SUBCATID Between '" & Trim(TxtSubCatgoryFrom) & "' and '" & Trim(TxtSubCatgoryTo) & "'"
                       End If
                End If
               
        'NSM TERRITORY CODE  - .......................................................................................
                If Len(Trim(TxtNSMTrCodeFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtNSMTrCodeTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And NSMTR  >= '" & Trim(TxtNSMTrCodeFrom) & "'"
                       Else
                       SQLString = SQLString & "And NSMTR Between '" & Trim(TxtNSMTrCodeFrom) & "' and '" & Trim(TxtNSMTrCodeTo) & "'"
                       End If
                End If
                  
        'RSM TERRITORY CODE  - .......................................................................................
                If Len(Trim(TxtRSMTrCodeFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtRSMTrCodeTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And RSMTR  >= '" & Trim(TxtRSMTrCodeFrom) & "'"
                       Else
                       SQLString = SQLString & "And RSMTR Between '" & Trim(TxtRSMTrCodeFrom) & "' and '" & Trim(TxtRSMTrCodeTo) & "'"
                       End If
                End If
                
        'FM TERRITORY CODE  - .......................................................................................
                If Len(Trim(TxtFMTrCodeFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtFMTrCodeTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And FMTR  >= '" & Trim(TxtFMTrCodeFrom) & "'"
                       Else
                       SQLString = SQLString & "And FMTR Between '" & Trim(TxtFMTrCodeFrom) & "' and '" & Trim(TxtFMTrCodeTo) & "'"
                       End If
                End If
            
        'MSO TERRITORY CODE  - .......................................................................................
                If Len(Trim(TxtMSOTrCodeFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtMSOTrCodeTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And MSOTR  >= '" & Trim(TxtMSOTrCodeFrom) & "'"
                       Else
                       SQLString = SQLString & "And MSOTR Between '" & Trim(TxtMSOTrCodeFrom) & "' and '" & Trim(TxtMSOTrCodeTo) & "'"
                       End If
                End If
                
                
                
         'NSM EMP ID  - .......................................................................................
                If Len(Trim(TxtNSMIdFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtNSMIdTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And NSMID  >= '" & Trim(TxtNSMIdFrom) & "'"
                       Else
                       SQLString = SQLString & "And NSMID Between '" & Trim(TxtNSMIdFrom) & "' and '" & Trim(TxtNSMIdTo) & "'"
                       End If
                End If
                  
        'RSM EMP ID  - .......................................................................................
                If Len(Trim(TxtRSMIdFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtRSMIdTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And RSMID  >= '" & Trim(TxtRSMIdFrom) & "'"
                       Else
                       SQLString = SQLString & "And RSMID Between '" & Trim(TxtRSMIdFrom) & "' and '" & Trim(TxtRSMIdTo) & "'"
                       End If
                End If
                
        'FM EMP ID  - .......................................................................................
                If Len(Trim(TxtFMIdFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtFMIdTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And FMID  >= '" & Trim(TxtFMIdFrom) & "'"
                       Else
                       SQLString = SQLString & "And FMID Between '" & Trim(TxtFMIdFrom) & "' and '" & Trim(TxtFMIdTo) & "'"
                       End If
                End If
            
        'MSO EMP ID  - .......................................................................................
                If Len(Trim(TxtMSOIdFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtMSOIdTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And SALESPER1  >= '" & Trim(TxtMSOIdFrom) & "'"
                       Else
                       SQLString = SQLString & "And SALESPER1 Between '" & Trim(TxtMSOIdFrom) & "' and '" & Trim(TxtMSOIdTo) & "'"
                       End If
                End If
                
         'DELIVERY PERSON EMP ID  - .......................................................................................
                If Len(Trim(TxtDPIdFrom)) > 0 Then
                       If UCase(Mid(Trim(TxtDPIdTo), 1, 1)) = "Z" Then
                          SQLString = SQLString & "And DPID  >= '" & Trim(TxtDPIdFrom) & "'"
                       Else
                       SQLString = SQLString & "And DPID Between '" & Trim(TxtDPIdFrom) & "' and '" & Trim(TxtDPIdTo) & "'"
                       End If
                End If
                
            
             
             ElseIf Optwithoutparam(0).Value = True Then
                    
                     SQLString = "SELECT * FROM Customer_Wise_Sales"
                       Else
                     MsgBox "Report Not Found", vbInformation, "Report Preview"
             Exit Sub
End If
 
  SQLString = SQLString
  Set rs = Nothing
  Set rs = Get_RS(SQLString)
  
 
    CashSalesRecord.DiscardSavedData
    CashSalesRecord.Database.SetDataSource rs
      
              CashSalesRecord.RptDateFrom.SetText Format(DTPFrom, "dd-mmm-yyyy")
              CashSalesRecord.RptDateTo.SetText Format(DTPTo, "dd-mmm-yyyy")
              
''              CashSalesRecord.RptBranchFrom.SetText Trim(TxtBranchNameFrom.Text)
''              CashSalesRecord.RptBranchTo.SetText Trim(TxtBranchNameTo.Text)
              
'              CustWiseSalesRecord.RptProductFrom.SetText Trim(TxtProductGrpNameFrom.Text)
'              CustWiseSalesRecord.RptProductTo.SetText Trim(TxtProductGrpNameTo.Text)
'
'              CustWiseSalesRecord.RptItemFrom.SetText Trim(TxtItemNameFrom.Text)
'              CustWiseSalesRecord.RptItemTo.SetText Trim(TxtItemNameTo.Text)
'
'              CustWiseSalesRecord.RptCustomerFrom.SetText Trim(TxtCustomerNameFrom.Text)
'              CustWiseSalesRecord.RptCustomerTo.SetText Trim(TxtCustomerNameTo.Text)
'
'              CustWiseSalesRecord.RptInvoiceFrom.SetText Trim(TxtInvoiceNameFrom.Text)
'              CustWiseSalesRecord.RptInvoiceTo.SetText Trim(TxtInvoiceNameTo.Text)
'
'              CustWiseSalesRecord.RptDistrictFrom.SetText Trim(TxtDistrictNameFrom.Text)
'              CustWiseSalesRecord.RptDistrictTo.SetText Trim(TxtDistrictNameTo.Text)
'
'              CustWiseSalesRecord.RptSubDistrictFrom.SetText Trim(TxtSubDistrictNameFrom.Text)
'              CustWiseSalesRecord.RptSubDistrictTo.SetText Trim(TxtSubDistrictNameTo.Text)
'
'              CustWiseSalesRecord.RptZoneFrom.SetText Trim(TxtZoneNameFrom.Text)
'              CustWiseSalesRecord.RptZoneTo.SetText Trim(TxtZoneNameTo.Text)
'
'              CustWiseSalesRecord.RptSubZoneFrom.SetText Trim(TxtSubZoneNameFrom.Text)
'              CustWiseSalesRecord.RptSubZoneTo.SetText Trim(TxtSubZoneNameTo.Text)
'
'              CustWiseSalesRecord.RptMarketFrom.SetText Trim(TxtMarketNameFrom.Text)
'              CustWiseSalesRecord.RptMarketTo.SetText Trim(TxtMarketNameTo.Text)
'
'              CustWiseSalesRecord.RptCategoryFrom.SetText Trim(TxtCategoryNameFrom.Text)
'              CustWiseSalesRecord.RptCategoryTo.SetText Trim(TxtCategoryNameTo.Text)
'
'              CustWiseSalesRecord.RptSubCategoryFrom.SetText Trim(TxtSubCategoryNameFrom.Text)
'              CustWiseSalesRecord.RptSubCategoryTo.SetText Trim(TxtSubCategoryNameTo.Text)
'
'              CustWiseSalesRecord.RptNSMTrCodeFrom.SetText Trim(TxtNSMTrCodeFrom.Text)
'              CustWiseSalesRecord.RptNSMTrCodeTo.SetText Trim(TxtNSMTrCodeTo.Text)
'
'
'              CustWiseSalesRecord.RptRSMTrCodeFrom.SetText Trim(TxtRSMTrCodeFrom.Text)
'              CustWiseSalesRecord.RptRSMTrCodeTo.SetText Trim(TxtRSMTrCodeTo.Text)
'
'
'              CustWiseSalesRecord.RptFMTrCodeFrom.SetText Trim(TxtFMTrCodeFrom.Text)
'              CustWiseSalesRecord.RptFMTrCodeTo.SetText Trim(TxtFMTrCodeTo.Text)
'
'              CustWiseSalesRecord.RptMSOTrCodeFrom.SetText Trim(TxtMSOTrCodeFrom.Text)
'              CustWiseSalesRecord.RptMSOTrCodeTo.SetText Trim(TxtMSOTrCodeTo.Text)
'
'
'              CustWiseSalesRecord.RptNSMIdFrom.SetText Trim(TxtNSMNameFrom.Text)
'              CustWiseSalesRecord.RptNSMIdTo.SetText Trim(TxtNSMNameTo.Text)
'
'
'              CustWiseSalesRecord.RptRSMIdFrom.SetText Trim(TxtRSMNameFrom.Text)
'              CustWiseSalesRecord.RptRSMIdTo.SetText Trim(TxtRSMNameTo.Text)
'
'
'              CustWiseSalesRecord.RptFMIdFrom.SetText Trim(TxtFMNameFrom.Text)
'              CustWiseSalesRecord.RptFMIdTo.SetText Trim(TxtFMNameTo.Text)
'
'              CustWiseSalesRecord.RptMSOIdFrom.SetText Trim(TxtMSONameFrom.Text)
'              CustWiseSalesRecord.RptMSOIdTo.SetText Trim(TxtMSONameTo.Text)
'
'              CustWiseSalesRecord.RptDelPersonIdFrom.SetText Trim(TxtDelPersonNameFrom.Text)
'              CustWiseSalesRecord.RptDelPersonIdTo.SetText Trim(TxtDelPersonNameTo.Text)
              
                      
   Set ReportViewer.Report = CashSalesRecord

 ReportViewer.Show 1
End Sub

Private Sub Form_Load()

          Optrptwithparam(1).Value = True
            
            DTPFrom.Value = Date
            DTPTo.Value = Date
            
            '//CUSTOMER TYPE
            TlBarCustTypeFrom.Buttons(1).Image = 3
            TlBarCustTypeTo.Buttons(1).Image = 3
            
            '//ADV. CATEGORY
             TlBarAdCatFrom.Buttons(1).Image = 3
            TlBarAdCatto.Buttons(1).Image = 3
''''
''''            '//ITEM
''''            TlBarItemFrom.Buttons(1).Image = 3
''''            TlBarItemTo.Buttons(1).Image = 3
''''
''''            '//CUSTOMER
''''            TlBarCustomerFrom.Buttons(1).Image = 3
''''            TlBarCustomerTo.Buttons(1).Image = 3
''''
''''            '//INVOICE
''''            TlBarInvoiceFrom.Buttons(1).Image = 3
''''            TlBarInvoiceTo.Buttons(1).Image = 3
''''
''''            '//DISTRICT
''''            TlBarDistrictFrom.Buttons(1).Image = 3
''''            TlBarDistrictTo.Buttons(1).Image = 3
''''
''''            '//SUB DISTRICT
''''            TlBarSubDistrictFrom.Buttons(1).Image = 3
''''            TlBarSubDistrictTo.Buttons(1).Image = 3
''''
''''            '//ZONE
''''            TlBarZoneFrom.Buttons(1).Image = 3
''''            TlBarZoneTo.Buttons(1).Image = 3
''''
''''            '//SUB ONE
''''            TlBarSubZoneFrom.Buttons(1).Image = 3
''''            TlBarSubZoneTo.Buttons(1).Image = 3
''''
''''            '//MARKET
''''            TlBarMarketFrom.Buttons(1).Image = 3
''''            TlBarMarketTo.Buttons(1).Image = 3
''''
''''            '//CATEGORY
''''            TlBarCategoryFrom.Buttons(1).Image = 3
''''            TlBarCategoryTo.Buttons(1).Image = 3
''''
''''            '//SUB CATEGORY
''''            TlBarSubCategoryFrom.Buttons(1).Image = 3
''''            TlBarSubCategoryTo.Buttons(1).Image = 3
''''
''''            '//NSM TR CODE
''''            TlBarNSMTrFrom.Buttons(1).Image = 3
''''            TlBarNSMTrTo.Buttons(1).Image = 3
''''
''''            '//RSM TR CODE
''''            TlBarRSMTrFrom.Buttons(1).Image = 3
''''            TlBarRSMTrTo.Buttons(1).Image = 3
''''
''''            '//FM TR CODE
''''            TlBarFMTrFrom.Buttons(1).Image = 3
''''            TlBarFMTrTo.Buttons(1).Image = 3
''''
''''            '//MSO TR CODE
''''            TlBarMSOTrFrom.Buttons(1).Image = 3
''''            TlBarMSOTrTo.Buttons(1).Image = 3
''''
''''            '//NSM ID
''''            TlBarNSMIdFrom.Buttons(1).Image = 3
''''            TlBarNSMIdTo.Buttons(1).Image = 3
''''
''''            '//RSM ID
''''            TlBarRSMIdFrom.Buttons(1).Image = 3
''''            TlBarRSMIdTo.Buttons(1).Image = 3
''''
''''            '//FM ID
''''            TlBarFMIdFrom.Buttons(1).Image = 3
''''            TlBarFMIdTo.Buttons(1).Image = 3
''''
''''            '//MSO ID
''''            TlBarMSOIdFrom.Buttons(1).Image = 3
''''            TlBarMSOIdTo.Buttons(1).Image = 3
''''
''''            '//DELIVERY ID
''''            TlBarDelPersonIdFrom.Buttons(1).Image = 3
''''            TlBarDelPersonIdTo.Buttons(1).Image = 3
''''
           
  TxtCustTypeFrom.Visible = False
  TxtCustTypeTo.Visible = False
  
  TxtAdCatFrom.Visible = False
  TxtAdCatTo.Visible = False
  
'''           TxtProductGrpNameFrom.Visible = False
'''           TxtProductGrpNameTo.Visible = False
'''
'''           TxtItemNameFrom.Visible = False
'''           TxtItemNameTo.Visible = False
'''
'''           TxtCustomerNameFrom.Visible = False
'''           TxtCustomerNameTo.Visible = False
'''
'''           TxtInvoiceNameFrom.Visible = False
'''           TxtInvoiceNameTo.Visible = False
'''
'''           TxtDistrictNameFrom.Visible = False
'''           TxtDistrictNameTo.Visible = False
'''
'''           TxtSubDistrictNameFrom.Visible = False
'''           TxtSubDistrictNameTo.Visible = False
'''
'''           TxtZoneNameFrom.Visible = False
'''           TxtZoneNameTo.Visible = False
'''
'''           TxtSubZoneNameFrom.Visible = False
'''           TxtSubZoneNameTo.Visible = False
'''
'''           TxtMarketNameFrom.Visible = False
'''           TxtMarketNameTo.Visible = False
'''
'''           TxtCategoryNameFrom.Visible = False
'''           TxtCategoryNameTo.Visible = False
'''
'''           TxtSubCategoryNameFrom.Visible = False
'''           TxtSubCategoryNameTo.Visible = False
'''
'''           TxtNSMNameFrom.Visible = False
'''           TxtNSMNameTo.Visible = False
'''
'''           TxtRSMNameFrom.Visible = False
'''           TxtRSMNameTo.Visible = False
'''
'''           TxtFMNameFrom.Visible = False
'''           TxtFMNameTo.Visible = False
'''
'''           TxtMSONameFrom.Visible = False
'''           TxtMSONameTo.Visible = False
'''
'''           TxtDelPersonNameFrom.Visible = False
'''           TxtDelPersonNameTo.Visible = False
'''
'''
           

End Sub

Private Sub Label56_Click()
End Sub

Private Sub mnabout_Click()
    FrmAbout.Show
End Sub

Private Sub mnexit_Click()
End
End Sub

''Private Sub TlBarBranchFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 1
''         FrmBranchFinder.Show
''
''         FrmBranchFinder.DataGrid1.Columns(0).Width = 2000
''         FrmBranchFinder.DataGrid1.Columns(1).Width = 4300
''
''End Sub
''
''Private Sub TlBarBranchTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''         If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 2
''         FrmBranchFinder.Show
''
''         FrmBranchFinder.DataGrid1.Columns(0).Width = 2000
''         FrmBranchFinder.DataGrid1.Columns(1).Width = 4300
''End Sub
''
''Private Sub TlBarCategoryFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''      If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 21
''       FrmCategoryFinder.Show
''
''       FrmCategoryFinder.DataGrid1.Columns(0).Width = 2000
''       FrmCategoryFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarCategoryTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 22
''       FrmCategoryFinder.Show
''
''       FrmCategoryFinder.DataGrid1.Columns(0).Width = 2000
''       FrmCategoryFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarCustomerFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''          If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 7
''           FrmCustomerFinder.Show
''
''           FrmCustomerFinder.DataGrid1.Columns(0).Width = 2000
''           FrmCustomerFinder.DataGrid1.Columns(1).Width = 4200
''
''End Sub
''
''Private Sub TlBarCustomerTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''           If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 8
''           FrmCustomerFinder.Show
''
''           FrmCustomerFinder.DataGrid1.Columns(0).Width = 2000
''           FrmCustomerFinder.DataGrid1.Columns(1).Width = 4200
''
''End Sub
''
''Private Sub TlBarCustTypeFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''
''End Sub
''
''Private Sub TlBarDelPersonIdFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
'''          If Optrptwithparam(1).Value = False Then
'''
'''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
'''
'''              Exit Sub
'''          End If
'''
'''           cnt = 41
'''           FrmDelPersonIdFinder.Show
'''
'''           FrmDelPersonIdFinder.DataGrid1.Columns(0).Width = 2000
'''           FrmDelPersonIdFinder.DataGrid1.Columns(1).Width = 4000
''
''
''
''
''
''
''End Sub
''
''Private Sub TlBarDelPersonIdTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''          If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 42
''           FrmDelPersonIdFinder.Show
''
''           FrmDelPersonIdFinder.DataGrid1.Columns(0).Width = 2000
''           FrmDelPersonIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarDistrictFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''          If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 11
''           FrmDistrictFinder.Show
''
''           FrmDistrictFinder.DataGrid1.Columns(0).Width = 2000
''           FrmDistrictFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarDistrictTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''            If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 12
''           FrmDistrictFinder.Show
''
''           FrmDistrictFinder.DataGrid1.Columns(0).Width = 2000
''           FrmDistrictFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarFMIdFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 37
''         FrmFMIdFinder.Show
''
''         FrmFMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmFMIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarFMIdTo_ButtonClick(ByVal Button As MSComctlLib.Button)
'' If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 38
''         FrmFMIdFinder.Show
''
''         FrmFMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmFMIdFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarFMTrFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 29
''         FrmFMTrcodeFinder.Show
''
''         FrmFMTrcodeFinder.DataGrid1.Columns(0).Width = 2000
''         FrmFMTrcodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarFMTrTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 30
''         FrmFMTrcodeFinder.Show
''
''         FrmFMTrcodeFinder.DataGrid1.Columns(0).Width = 2000
''         FrmFMTrcodeFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarInvoiceFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 9
''         FrmInvoiceFinder.Show
''
''         FrmInvoiceFinder.DataGrid1.Columns(0).Width = 2000
''         FrmInvoiceFinder.DataGrid1.Columns(1).Width = 4200
''
''End Sub
''
''Private Sub TlBarInvoiceTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 10
''         FrmInvoiceFinder.Show
''
''         FrmInvoiceFinder.DataGrid1.Columns(0).Width = 2000
''         FrmInvoiceFinder.DataGrid1.Columns(1).Width = 4200
''
''End Sub
''
''Private Sub TlBarItemFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 5
''         FrmItemFinder.Show
''
''         FrmItemFinder.DataGrid1.Columns(0).Width = 2000
''         FrmItemFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarItemTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 6
''         FrmItemFinder.Show
''
''         FrmItemFinder.DataGrid1.Columns(0).Width = 2000
''         FrmItemFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarMarketFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 19
''         FrmMarketFinder.Show
''
''         FrmMarketFinder.DataGrid1.Columns(0).Width = 2000
''         FrmMarketFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarMarketTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''           If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 20
''         FrmMarketFinder.Show
''
''         FrmMarketFinder.DataGrid1.Columns(0).Width = 2000
''         FrmMarketFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarMSOIdFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 39
''         FrmMSOIdFinder.Show
''
''         FrmMSOIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmMSOIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarMSOIdTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 40
''         FrmMSOIdFinder.Show
''
''         FrmMSOIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmMSOIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarMSOTrFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''      If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 31
''       FrmMSOTrCodeFinder.Show
''
''       FrmMSOTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''       FrmMSOTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarMSOTrTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''         If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 32
''       FrmMSOTrCodeFinder.Show
''
''       FrmMSOTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''       FrmMSOTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarNSMIdFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 33
''         FrmNSMIdFinder.Show
''
''         FrmNSMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmNSMIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarNSMIdTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 34
''         FrmNSMIdFinder.Show
''
''         FrmNSMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmNSMIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarNSMTrFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 25
''         FrmNSMTrCodeFinder.Show
''
''         FrmNSMTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''         FrmNSMTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarNSMTrTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 26
''         FrmNSMTrCodeFinder.Show
''
''         FrmNSMTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''         FrmNSMTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarPrdGrpFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 3
''         FrmProductGroupFinder.Show
''
''         FrmProductGroupFinder.DataGrid1.Columns(0).Width = 2000
''         FrmProductGroupFinder.DataGrid1.Columns(1).Width = 4300
''
''End Sub
''
''Private Sub TlBarPrdGrpTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''
'' If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
'' End If
''
''         cnt = 4
''         FrmProductGroupFinder.Show
''
''         FrmProductGroupFinder.DataGrid1.Columns(0).Width = 2000
''         FrmProductGroupFinder.DataGrid1.Columns(1).Width = 4300
''
''End Sub
''
''Private Sub TlBarRSMIdFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 35
''         FrmRSMIdFinder.Show
''
''         FrmRSMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmRSMIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarRSMIdTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 36
''         FrmRSMIdFinder.Show
''
''         FrmRSMIdFinder.DataGrid1.Columns(0).Width = 2000
''         FrmRSMIdFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarRSMTrFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''          If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 27
''           FrmRSMTrCodeFinder.Show
''
''           FrmRSMTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''           FrmRSMTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarRSMTrTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''                 ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''              Exit Sub
''          End If
''
''           cnt = 28
''           FrmRSMTrCodeFinder.Show
''
''           FrmRSMTrCodeFinder.DataGrid1.Columns(0).Width = 2000
''           FrmRSMTrCodeFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarSubCategoryFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 23
''         FrmSubCategoryFinder.Show
''
''         FrmSubCategoryFinder.DataGrid1.Columns(0).Width = 2000
''         FrmSubCategoryFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarSubCategoryTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 24
''         FrmSubCategoryFinder.Show
''
''         FrmSubCategoryFinder.DataGrid1.Columns(0).Width = 2000
''         FrmSubCategoryFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarSubDistrictFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 13
''         FrmSubDistrictFinder.Show
''
''         FrmSubDistrictFinder.DataGrid1.Columns(0).Width = 2000
''         FrmSubDistrictFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarSubDistrictTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 14
''         FrmSubDistrictFinder.Show
''
''         FrmSubDistrictFinder.DataGrid1.Columns(0).Width = 2000
''         FrmSubDistrictFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarSubZoneFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''      If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 17
''       FrmSubZoneFinder.Show
''
''       FrmSubZoneFinder.DataGrid1.Columns(0).Width = 2000
''       FrmSubZoneFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarSubZoneTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''             ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''          Exit Sub
''      End If
''
''       cnt = 18
''       FrmSubZoneFinder.Show
''
''       FrmSubZoneFinder.DataGrid1.Columns(0).Width = 2000
''       FrmSubZoneFinder.DataGrid1.Columns(1).Width = 4000
''End Sub
''
''Private Sub TlBarZoneFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
''        If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 15
''         FrmZoneFinder.Show
''
''         FrmZoneFinder.DataGrid1.Columns(0).Width = 2000
''         FrmZoneFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub
''
''Private Sub TlBarZoneTo_ButtonClick(ByVal Button As MSComctlLib.Button)
''       If Optrptwithparam(1).Value = False Then
''
''               ss = MsgBox("Select the Report Preview Criteria", vbInformation, "Report Preview....")
''
''            Exit Sub
''        End If
''
''         cnt = 16
''         FrmZoneFinder.Show
''
''         FrmZoneFinder.DataGrid1.Columns(0).Width = 2000
''         FrmZoneFinder.DataGrid1.Columns(1).Width = 4000
''
''End Sub

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
         FrmCustomerTypeFinder.DataGrid1.Columns(1).Width = 4300
End Sub
