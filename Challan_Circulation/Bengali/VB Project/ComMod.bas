Attribute VB_Name = "ComMod"

'Global & Public Declaration

Global MYcon As New ADODB.connection
Global com As String

Global rs As New ADODB.Recordset
Global rs1 As New ADODB.Recordset

Public cnt As Integer
Public concnt As Integer

Public Mainflg As Boolean

Public Function connection() As String
     Set MainComm1 = New ADODB.Command
     Set R1 = New ADODB.Recordset
     '[10.168.2.221].DSR.dbo.DSR_ACCPAC_INTEGATION
     
 
     If MYcon.State = 1 Then MYcon.Close
'MYcon = "Provider=SQLOLEDB;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=[192.168.10.75].ALOCIR"
MYcon = "Provider=SQLOLEDB;Integrated Security=SSPI;Persist Security Info=False;Initial Catalog=ALOCIR"

     connection = MYcon
' connection = "DSN=ERP"
                
                
                
'Dim f As New FrmCashSalesState
'f.Show 1
         
 
 
 
 'If Mycon.State = 1 Then
 'Dim f As New Form2
 'f.Show 1
 'End If
 'MsgBox "Database Connection not found"
         
End Function

'Fillup Combo / ListBox
Public Sub Get_Info(cmb As Control, strSQL)
Dim rs As New Recordset
With rs
    .ActiveConnection = connection
    .CursorLocation = adUseClient
    .CursorType = adOpenForwardOnly
    .Open strSQL
    If Not .EOF Then
        cmb.Clear
        Do Until .EOF
            cmb.AddItem Trim(rs(0))
            .MoveNext
        Loop
    End If
End With
If cmb.ListCount > 0 Then
    cmb.ListIndex = 0
End If
End Sub
Public Function Get_RS(strSQL) As Recordset
Dim rs As New Recordset
 
With rs
    .ActiveConnection = connection
    .CursorLocation = adUseClient
    .CursorType = adOpenForwardOnly
    .Open strSQL
    Set Get_RS = rs
End With
    
End Function

'Public Function Get_RS1(strSQL1) As Recordset
'
'Dim rs1 As New Recordset
'
'With rs1
'    .ActiveConnection = connection
'    .CursorLocation = adUseClient
'    .CursorType = adOpenForwardOnly
'    .Open strSQL1
'     Set Get_RS1 = rs1
'End With
'
'End Function
Public Sub All_Clear(f As Form)
Dim i As Integer
For i = 0 To f.Count - 1
    If TypeOf f.Controls(i) Is TextBox Then
       f.Controls(i) = ""
    ElseIf TypeOf f.Controls(i) Is Image Then
        f.Controls(i) = LoadPicture("")
    ElseIf TypeOf f.Controls(i) Is ComboBox Then
        f.Controls(i) = ""
'    ElseIf TypeOf f.Controls(i) Is DTPicker Then
'        f.Controls(i) = ""
    End If
Next
End Sub



