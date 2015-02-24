VERSION 5.00
Object = "{CDE57A40-8B86-11D0-B3C6-00A0C90AEA82}#1.0#0"; "MSDATGRD.OCX"
Begin VB.Form FrmCustomerTypeFinder 
   Caption         =   "Finder - Customer Category"
   ClientHeight    =   8595
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   8790
   Icon            =   "FrmCustomerTypeFinder.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   8595
   ScaleWidth      =   8790
   StartUpPosition =   2  'CenterScreen
   Begin VB.TextBox tbfilter 
      Height          =   315
      Left            =   1440
      TabIndex        =   11
      Top             =   1125
      Width           =   2760
   End
   Begin VB.ComboBox Combo1 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   10
      Top             =   615
      Width           =   2775
   End
   Begin VB.ComboBox combofindby 
      Height          =   315
      Left            =   1440
      Style           =   2  'Dropdown List
      TabIndex        =   9
      Top             =   135
      Width           =   2775
   End
   Begin VB.CheckBox chkautocheck 
      Caption         =   "Auto Search "
      Height          =   195
      Left            =   4320
      TabIndex        =   5
      Top             =   705
      Width           =   1215
   End
   Begin VB.CommandButton cmdsetcriteria 
      Caption         =   "Set Criteria "
      Height          =   375
      Left            =   5385
      TabIndex        =   4
      Top             =   225
      Width           =   975
   End
   Begin VB.CommandButton cmdfindnow 
      Caption         =   "Find now"
      Height          =   375
      Left            =   4305
      TabIndex        =   3
      Top             =   225
      Width           =   975
   End
   Begin VB.CommandButton cmdcancel 
      Caption         =   "&Cancel"
      Height          =   330
      Left            =   7395
      TabIndex        =   2
      ToolTipText     =   "Cancel"
      Top             =   8685
      Width           =   1095
   End
   Begin VB.CommandButton cmdselect 
      Caption         =   "&Select"
      Height          =   330
      Left            =   6075
      TabIndex        =   1
      ToolTipText     =   "Select"
      Top             =   8685
      Width           =   1215
   End
   Begin VB.CommandButton cmdhelp 
      Caption         =   "&Help"
      Height          =   330
      Left            =   270
      TabIndex        =   0
      ToolTipText     =   "Help"
      Top             =   8640
      Width           =   1095
   End
   Begin MSDataGridLib.DataGrid DataGrid1 
      Height          =   6720
      Left            =   270
      TabIndex        =   6
      Top             =   1710
      Width           =   8250
      _ExtentX        =   14552
      _ExtentY        =   11853
      _Version        =   393216
      AllowUpdate     =   0   'False
      ForeColor       =   -2147483630
      HeadLines       =   1
      RowHeight       =   15
      RowDividerStyle =   6
      BeginProperty HeadFont {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   0
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ColumnCount     =   2
      BeginProperty Column00 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      BeginProperty Column01 
         DataField       =   ""
         Caption         =   ""
         BeginProperty DataFormat {6D835690-900B-11D0-9484-00A0C91110ED} 
            Type            =   0
            Format          =   ""
            HaveTrueFalseNull=   0
            FirstDayOfWeek  =   0
            FirstWeekOfYear =   0
            LCID            =   1033
            SubFormatType   =   0
         EndProperty
      EndProperty
      SplitCount      =   1
      BeginProperty Split0 
         SizeMode        =   1
         BeginProperty Column00 
         EndProperty
         BeginProperty Column01 
         EndProperty
      EndProperty
   End
   Begin VB.Label lblfilter 
      Caption         =   "Filter :"
      Height          =   255
      Left            =   465
      TabIndex        =   8
      Top             =   1185
      Width           =   495
   End
   Begin VB.Label Label1 
      Caption         =   "Find By......"
      Height          =   255
      Left            =   465
      TabIndex        =   7
      Top             =   225
      Width           =   855
   End
End
Attribute VB_Name = "FrmCustomerTypeFinder"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private Sub chkautocheck_Click()

If chkautocheck.Value = vbNull Then
   cmdfindnow.Enabled = True
   End If

End Sub

Private Sub cmdcancel_Click()

        Unload Me

End Sub

Private Sub cmdhelp_Click()

        Dim msg, Style, Title, help, Ctxt, Response, MyString
        msg = "Help will be Available After Implementation of this Interface !!!"   ' Define message.
        Style = vbOKOnly + vbExclamation + vbDefaultButton3         ' Define buttons.
        Title = "Help File Demonstration!!!!!!!!!!!!!!!"   ' Define title.
        help = "DEMO.HLP"   ' Define Help file.
        Ctxt = 1000   ' Define topic
              ' context.
              ' Display message.
        Response = MsgBox(msg, Style, Title, help, Ctxt)
        If Response = vbOKOnly Then    ' User chose Ok.
           MyString = "Ok"   ' Perform some action.
        'Else   ' User chose No.
         '  MyString = "Cancel"   ' Perform some action.
        End If
End Sub

Private Sub cmdselect_Click()
  If cnt = 1 Then  '1
            FrmBengolyCirChallan.TbCustTypeFrom.Text = Trim(DataGrid1.Columns(0).Text)
        End If
        If cnt = 1 Then  '2
            FrmBengolyCirChallan.TxtCustFrom.Text = Trim(DataGrid1.Columns(1).Text)
        End If


        If cnt = 2 Then  '1
            FrmBengolyCirChallan.TbCustTypeTo.Text = Trim(DataGrid1.Columns(0).Text)
        End If
        If cnt = 2 Then  '2
            FrmBengolyCirChallan.TxtCustTo.Text = Trim(DataGrid1.Columns(1).Text)
        End If


  Unload Me
End Sub

Private Sub combofindby_Click()

   '===================Code for Show All records=====================

            If combofindby.Text = "Show all Records" Then

                    Combo1.Visible = False
                    lblfilter.Visible = False
                    tbfilter.Visible = False

            Else

   '==================Code for Other Value in Combo=================

            Combo1.Visible = True
            lblfilter.Visible = True
            tbfilter.Visible = True
            End If
End Sub

Private Sub DataGrid1_DblClick()

      If cnt = 1 Then  '1
            FrmBengolyCirChallan.TbCustTypeFrom.Text = Trim(DataGrid1.Columns(0).Text)
        End If
        If cnt = 1 Then  '2
            FrmBengolyCirChallan.TxtCustFrom.Text = Trim(DataGrid1.Columns(1).Text)
        End If


        If cnt = 2 Then  '1
            FrmBengolyCirChallan.TbCustTypeTo.Text = Trim(DataGrid1.Columns(0).Text)
        End If
        If cnt = 2 Then  '2
            FrmBengolyCirChallan.TxtCustTo.Text = Trim(DataGrid1.Columns(1).Text)
        End If


  Unload Me
End Sub

Private Sub Form_Load()
Dim rs As New ADODB.Recordset

'Me.WindowState = 0

 chkautocheck.Value = vbChecked
 cmdfindnow.Enabled = False


      '====================[Activating COMBO FINDBY]=========================
       With combofindby
                  .AddItem ("Show all Records")
                  .AddItem ("Customer Category ID")
                  .AddItem ("Customer Category Name")
       End With

     '=====================[Activating COMBO1]===============================
                With Combo1
                  .AddItem ("Starts With")
                  .AddItem ("Contents")
                End With

   '===========[Data Retrieving from DataBase At DataGrid1]=========
               'View "F02_BranchFinder"

  Set rs = Get_RS("SELECT * FROM F01_CustomerCatFinder")
  Set DataGrid1.DataSource = rs

End Sub
Private Sub Form_Resize()
''If MinHeight > FrmFinder.Height Then
''       FrmBranchFinder.Height = MinHeight
''        Exit Sub
''    ElseIf MinWidth > FrmFinder.Width Then
''        frmFinderLoc.Width = MinWidth
''        Exit Sub
''    End If
'
'    ' resize the flexgrid to fit nicely on the screen
'    'DataGrid1.Width = FrmBranchFinder.ScaleWidth
'    'DataGrid1.Height = FrmBranchFinder.ScaleHeight / 2
''
''    resize the happy columns to look pretty (40% for each text column, 20% for Track)
'    DataGrid1.Columns(0).Width = 0.36 * DataGrid1.Width
'    DataGrid1.Columns(1).Width = DataGrid1.Columns(0).Width * 1.4
''    DataGrid1.ColWidth(2) = DataGrid1.Width - (DataGrid1.ColWidth(0) * 2) - 60
'
''    reposition  and resize the frames on the screen to fit nicely (there was no
''    science here, just did it by trial and error)
'     cmdselect.Top = (FrmBranchFinder.ScaleHeight / 1.5) + 1200
'     cmdcancel.Top = (FrmBranchFinder.ScaleHeight / 1.5) + 1200
'     cmdhelp.Top = (FrmBranchFinder.ScaleHeight / 1.5) + 1200
''    cmdselect.Height = (frmFinderLoc.ScaleHeight / 5) - 150
''    cmdselect.Width = (frmFinderLoc.ScaleWidth * 0.64)
''    fraRemoveEntry.Height = (Form1.ScaleHeight / 2) - 150
''    fraRemoveEntry.Top = (Form1.ScaleHeight / 2) + 100
''    fraRemoveEntry.Width = (Form1.ScaleWidth * 0.36) - 100
''    fraRemoveEntry.Left = fraAddEntry.Width + 100
'
'     cmdselect.Left = FrmBranchFinder.ScaleWidth - 3000
'     cmdcancel.Left = FrmBranchFinder.ScaleWidth - 1600
End Sub
Private Sub tbfilter_Change()


Dim Index As Integer
Dim rs As New ADODB.Recordset

    With rs
        .ActiveConnection = connection
        .CursorLocation = adUseClient

               '[Filtering the Data from DataBase]

  '*******************************************************************
  '      '[FOR Starts With]
  '*******************************************************************
        ' [Query For CustomerCat ID]

 If combofindby.Text = "Customer Category ID" And Combo1.Text = "Starts With" Then

        .Open "select * from DBO.F01_CustomerCatFinder" _
            & " where [CustomerCat ID] like '" & Trim(tbfilter) & "%" & "' "

         ' [Query For CustomerCat Name]

ElseIf combofindby.Text = "Customer Category Name" And Combo1.Text = "Starts With" Then
        .Open "select * from DBO.F01_CustomerCatFinder" _
            & " WHERE [CustomerCat Name] like '" & Trim(tbfilter) & "%" & "' "


  '******************************************************************
  '            '[CASE FOR Contents]
  '******************************************************************

  ' [Query For CustomerCat ID]

 ElseIf combofindby.Text = "Customer Category ID" And Combo1.Text = "Contents" Then

        .Open "select * from DBO.F01_CustomerCatFinder" _
            & " where [CustomerCat ID] like '%" & Trim(tbfilter) & "%" & "' "

         ' [Query For CustomerCat Name]

ElseIf combofindby.Text = "Customer Category Name" And Combo1.Text = "Contents" Then
        .Open "select * from DBO.F01_CustomerCatFinder" _
            & " WHERE [CustomerCat Name] like '%" & Trim(tbfilter) & "%" & "' "

End If

''******** Data Grid *********
    Set DataGrid1.DataSource = rs
End With
End Sub

