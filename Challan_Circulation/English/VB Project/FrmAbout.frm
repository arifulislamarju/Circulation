VERSION 5.00
Begin VB.Form FrmAbout 
   Caption         =   "About Customer Wise Sales Statement"
   ClientHeight    =   4440
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   6120
   Icon            =   "FrmAbout.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4440
   ScaleWidth      =   6120
   StartUpPosition =   2  'CenterScreen
   Begin VB.CommandButton CmdOk 
      Caption         =   "&OK"
      Height          =   330
      Left            =   2385
      TabIndex        =   1
      Top             =   3960
      Width           =   1320
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   555
      Left            =   585
      Picture         =   "FrmAbout.frx":08CA
      ScaleHeight     =   555
      ScaleWidth      =   510
      TabIndex        =   0
      Top             =   135
      Width           =   510
   End
   Begin VB.Label Label1 
      Caption         =   $"FrmAbout.frx":1194
      Height          =   915
      Left            =   135
      TabIndex        =   7
      Top             =   2925
      Width           =   5820
   End
   Begin VB.Label Label2 
      Caption         =   "ACCPAC"
      Height          =   195
      Left            =   2700
      TabIndex        =   6
      Top             =   90
      Width           =   690
   End
   Begin VB.Label Label3 
      Caption         =   "(Order Entry)"
      Height          =   195
      Left            =   2565
      TabIndex        =   5
      Top             =   315
      Width           =   960
   End
   Begin VB.Label Label4 
      Caption         =   "Customer Wise Sales Statements"
      Height          =   240
      Left            =   1845
      TabIndex        =   4
      Top             =   585
      Width           =   2670
   End
   Begin VB.Label Label5 
      Caption         =   "Version 2.0"
      Height          =   240
      Left            =   2565
      TabIndex        =   3
      Top             =   1035
      Width           =   1005
   End
   Begin VB.Label Label6 
      Caption         =   "Copyright © 2002 - 2006 ERP Team - Transcom Ltd. All rights reserve."
      Height          =   240
      Left            =   135
      TabIndex        =   2
      Top             =   2250
      Width           =   5820
   End
   Begin VB.Line Line2 
      BorderStyle     =   6  'Inside Solid
      BorderWidth     =   2
      X1              =   135
      X2              =   5985
      Y1              =   2790
      Y2              =   2790
   End
End
Attribute VB_Name = "FrmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub CmdOk_Click()
FrmCustWiseSalesSumm.Show
End Sub
