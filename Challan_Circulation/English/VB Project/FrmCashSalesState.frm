VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "Mscomctl.ocx"
Object = "{86CF1D34-0C5F-11D2-A9FC-0000F8754DA1}#2.0#0"; "mscomct2.ocx"
Begin VB.Form FrmChallanEng 
   Caption         =   " ALODAT - Circulation Challan Statement"
   ClientHeight    =   4350
   ClientLeft      =   60
   ClientTop       =   630
   ClientWidth     =   8640
   Icon            =   "FrmCashSalesState.frx":0000
   LinkTopic       =   "Form2"
   MaxButton       =   0   'False
   ScaleHeight     =   4350
   ScaleWidth      =   8640
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
      Height          =   2970
      Left            =   30
      TabIndex        =   5
      Top             =   720
      Width           =   8520
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
         Height          =   330
         Left            =   5850
         TabIndex        =   69
         Text            =   "ZZ"
         Top             =   2040
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
         Height          =   330
         Left            =   2835
         TabIndex        =   68
         Top             =   2040
         Width           =   1860
      End
      Begin VB.TextBox Tbareato 
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
         TabIndex        =   61
         Text            =   "ZZ"
         Top             =   1650
         Width           =   1860
      End
      Begin VB.TextBox Tbareafrom 
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
         TabIndex        =   60
         Top             =   1650
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
         Left            =   540
         TabIndex        =   59
         Top             =   2580
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
         Left            =   4410
         TabIndex        =   58
         Text            =   "ZZ"
         Top             =   2610
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
         Left            =   4470
         TabIndex        =   9
         Text            =   "ZZ"
         Top             =   2430
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
         Left            =   660
         TabIndex        =   8
         Top             =   2400
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
         Top             =   1260
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
         Top             =   1260
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
         Format          =   61407235
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
         Format          =   61407235
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
      Begin MSComctlLib.Toolbar TlBarZoneFrom 
         Height          =   330
         Left            =   3240
         TabIndex        =   13
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
         TabIndex        =   14
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
         TabIndex        =   15
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
      Begin MSComctlLib.Toolbar TlBarCustTypeFrom 
         Height          =   330
         Left            =   4680
         TabIndex        =   16
         ToolTipText     =   "To Invoice"
         Top             =   1245
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
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarAdCatFrom 
         Height          =   330
         Left            =   4680
         TabIndex        =   17
         ToolTipText     =   "To District"
         Top             =   1650
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
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarZoneTo 
         Height          =   330
         Left            =   5805
         TabIndex        =   18
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
         TabIndex        =   19
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
         TabIndex        =   20
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
         TabIndex        =   21
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
         TabIndex        =   22
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
         TabIndex        =   23
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
         TabIndex        =   24
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
         TabIndex        =   25
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
         TabIndex        =   26
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
         TabIndex        =   27
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
         TabIndex        =   28
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
            TabIndex        =   29
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
         TabIndex        =   30
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
         TabIndex        =   31
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
            TabIndex        =   32
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
         TabIndex        =   33
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
         TabIndex        =   34
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
         TabIndex        =   35
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
         TabIndex        =   36
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
         TabIndex        =   37
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
         TabIndex        =   38
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
         TabIndex        =   39
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
         TabIndex        =   40
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
         TabIndex        =   41
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
         TabIndex        =   42
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
         TabIndex        =   43
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
         TabIndex        =   44
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
         TabIndex        =   45
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
         TabIndex        =   46
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
         TabIndex        =   47
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
         TabIndex        =   48
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
         TabIndex        =   49
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
         TabIndex        =   50
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
         TabIndex        =   51
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
         TabIndex        =   62
         ToolTipText     =   "To Invoice"
         Top             =   1245
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
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar TlBarAdCatto 
         Height          =   330
         Left            =   7695
         TabIndex        =   63
         ToolTipText     =   "To District"
         Top             =   1650
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
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar Toolbar3 
         Height          =   330
         Left            =   4680
         TabIndex        =   70
         ToolTipText     =   "To District"
         Top             =   2070
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
               ImageIndex      =   3
            EndProperty
         EndProperty
      End
      Begin MSComctlLib.Toolbar Toolbar5 
         Height          =   330
         Left            =   7695
         TabIndex        =   71
         ToolTipText     =   "To District"
         Top             =   2040
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
               ImageIndex      =   3
            EndProperty
         EndProperty
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
         Left            =   390
         TabIndex        =   67
         Top             =   2040
         Width           =   2055
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
         Left            =   390
         TabIndex        =   66
         Top             =   1650
         Width           =   1365
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
         Left            =   390
         TabIndex        =   65
         Top             =   1320
         Width           =   1365
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
         TabIndex        =   57
         Top             =   1695
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
         TabIndex        =   56
         Top             =   1290
         Width           =   105
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
         Left            =   2790
         TabIndex        =   55
         Top             =   450
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
         Left            =   390
         TabIndex        =   54
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
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   240
         Left            =   5850
         TabIndex        =   53
         Top             =   450
         Width           =   1860
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
         TabIndex        =   52
         Top             =   900
         Width           =   105
      End
   End
   Begin VB.CommandButton CmdCancel 
      Caption         =   "&Cancel"
      Height          =   390
      Left            =   7290
      TabIndex        =   1
      Top             =   3900
      Width           =   1275
   End
   Begin VB.CommandButton CmdReportPreview 
      Caption         =   "&Preview"
      Height          =   390
      Left            =   60
      TabIndex        =   0
      Top             =   3870
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
      Left            =   9180
      TabIndex        =   2
      Top             =   1020
      Visible         =   0   'False
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
      Left            =   5550
      Top             =   3840
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
            Picture         =   "FrmCashSalesState.frx":08CA
            Key             =   ""
         EndProperty
         BeginProperty ListImage2 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmCashSalesState.frx":11A4
            Key             =   ""
         EndProperty
         BeginProperty ListImage3 {2C247F27-8591-11D1-B16A-00C0F0283628} 
            Picture         =   "FrmCashSalesState.frx":1A7E
            Key             =   ""
         EndProperty
      EndProperty
   End
   Begin VB.Label Label4 
      Caption         =   "Challan Statement"
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
      TabIndex        =   64
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
Attribute VB_Name = "FrmChallanEng"
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
    
    Dim ChallanRecord As New CrystalReportChallan
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
    
    
'***********************************************************************************************************************
'                                      Preview the Report With Passing Parameter
'***********************************************************************************************************************

'MAKE SQL STRING
 
            If Optrptwithparam(1).Value = True Then
            
         'DATE   - ...............................................................................
               SQLString = "SELECT * FROM Challan WHERE ORDDATE BETWEEN " & FromDate & " AND " & ToDate & " "
               
         'CustomerCategory  - ............................................................................
                'If Len(Trim(TbCustTypeFrom)) > 0 Then
                 '      If UCase(Mid(Trim(TbCustTypeTo), 1, 1)) = "Z" Then
                 '         SQLString = SQLString & "And CustomerTypeValue  >= '" & Trim(TbCustTypeFrom) & "'"
                 '      Else
                  '     SQLString = SQLString & "And CustomerTypeValue Between '" & Trim(TbCustTypeFrom) & "' and '" & Trim(TbCustTypeTo) & "'"
                  '     End If
            'End If
               
               
         
                
            
             
             ElseIf Optwithoutparam(0).Value = True Then
                    
                     SQLString = "SELECT * FROM Challan"
                       Else
                     MsgBox "Report Not Found", vbInformation, "Report Preview"
             Exit Sub
End If
 
  SQLString = SQLString
  Set rs = Nothing
  Set rs = Get_RS(SQLString)
  
 
    ChallanRecord.DiscardSavedData
    ChallanRecord.Database.SetDataSource rs
      
              'ChallanRecord.RptDateFrom.SetText Format(DTPFrom, "dd-mmm-yyyy")
              'ChallanRecord.RptDateTo.SetText Format(DTPTo, "dd-mmm-yyyy")
              
''              CashSalesRecord.RptBranchFrom.SetText Trim(TxtBranchNameFrom.Text)
''              CashSalesRecord.RptBranchTo.SetText Trim(TxtBranchNameTo.Text)
              

                      
   Set ReportViewer.Report = ChallanRecord

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
           
  TxtCustTypeFrom.Visible = False
  TxtCustTypeTo.Visible = False
  
  TxtAdCatFrom.Visible = False
  TxtAdCatTo.Visible = False
  

           

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

Private Sub TlBarAdCatFrom_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 1
FrmAreaFinder.Show
End Sub

Private Sub TlBarAdCatto_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 2
FrmAreaFinder.Show
End Sub

Private Sub TlBarCustTypeFrom_ButtonClick(ByVal Button As MSComctlLib.Button)


         cnt = 1
         FrmCustomerFinder.Show

         
End Sub

Private Sub TlBarCustTypeTo_ButtonClick(ByVal Button As MSComctlLib.Button)
    cnt = 2
         FrmCustomerFinder.Show
End Sub

Private Sub Toolbar3_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 1
FrmTransportFinder.Show
End Sub

Private Sub Toolbar5_ButtonClick(ByVal Button As MSComctlLib.Button)
cnt = 2
FrmTransportFinder.Show
End Sub
