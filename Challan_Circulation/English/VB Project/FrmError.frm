VERSION 5.00
Begin VB.Form FrmError 
   Caption         =   "  Error !!!"
   ClientHeight    =   2625
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6060
   Icon            =   "FrmError.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   2625
   ScaleWidth      =   6060
   StartUpPosition =   3  'Windows Default
   Begin VB.Frame Frame1 
      Caption         =   "Error"
      Height          =   1935
      Left            =   135
      TabIndex        =   3
      Top             =   135
      Width           =   5775
      Begin VB.Label Label1 
         Caption         =   "Description : Invalid Input. The Entry in the From Box cannot be greater that the entry in the to box"
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         Height          =   1455
         Left            =   240
         TabIndex        =   5
         Top             =   360
         Width           =   5295
      End
      Begin VB.Label Label2 
         Appearance      =   0  'Flat
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         BorderStyle     =   1  'Fixed Single
         BeginProperty Font 
            Name            =   "Arial"
            Size            =   9
            Charset         =   0
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ForeColor       =   &H80000008&
         Height          =   255
         Left            =   240
         TabIndex        =   4
         Top             =   1320
         Width           =   75
      End
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Print"
      Height          =   330
      Left            =   135
      TabIndex        =   2
      Top             =   2220
      Width           =   975
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Help"
      Height          =   330
      Left            =   1215
      TabIndex        =   1
      Top             =   2220
      Width           =   975
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Close"
      Height          =   330
      Left            =   4935
      TabIndex        =   0
      Top             =   2220
      Width           =   975
   End
   Begin VB.Timer Timer1 
      Enabled         =   0   'False
      Left            =   3555
      Top             =   2475
   End
End
Attribute VB_Name = "FrmError"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Command3_Click()
Unload Me
End Sub

Private Sub Form_Load()
 Timer1_Timer
End Sub

Private Sub Timer1_Timer()
Label2.Caption = "Source : " & Str(Time) & "  - Customer Wise Sales Statement"
'" & Str(Time) & "
End Sub

