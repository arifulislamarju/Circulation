<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransportSchedule.aspx.cs" Inherits="TransportSchedule" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    
    <script type="text/javascript">

            $.noConflict();
            $('#<%=txtTransDate.ClientID %>').datepicker({ format: 'dd-mm-yyyy' });

        });
      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="divTopForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:370px; width:710px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:357px; width:698px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Transport Maintenance" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:698px; left:-1px;" />   
    </div>

        <asp:Label ID="lblTransId"  runat="server" CssClass="labelTextField" Text="Transaction Id"  style="position:absolute; top:53px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtTransId" runat="server" CssClass="textBox" style="position:absolute; text-align:center; top:50px; left:185px; width:60px;" > </asp:TextBox>
        
        <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" 
                   style="position:absolute; left:157px; top:50px" onclick="btnPrevious_Click" />

        <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" 
                   style=" position:absolute; top:50px; left:252px;" onclick="btnNext_Click" />

        <asp:ImageButton ID="btnNew" runat="server" ImageUrl="~/Images/New.JPG" 
                   style=" position:absolute; top:52px; left:309px; width:22px; " onclick="btnNew_Click" />

        <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" 
                   style="position:absolute; left:130px; top:50px" onclick="btnFirst_Click" />

        <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" 
                   style=" position:absolute; top:50px; left:279px;" onclick="btnLast_Click" />

        <asp:Label ID="lblTransDate"  runat="server" CssClass="labelTextField" Text="Transaction Date"  style="position:absolute; top:83px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox" style="position:absolute; top:80px; width:180px; left:130px;" > </asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:317px; top:84px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblRouteName"  runat="server" CssClass="labelTextField" Text="Route Name"  style="position:absolute; top:113px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlRouteName" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                   style="position:absolute; top:110px; left:130px; "  onselectedindexchanged="ddlRouteName_SelectedIndexChanged" > </asp:DropDownList>        

        <asp:Label ID="lblSubRoute"  runat="server" CssClass="labelTextField" Text="Sub-Route Name"  style="position:absolute; top:143px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlSubRouteName" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                      style="position:absolute; top:140px; left:130px;" onselectedindexchanged="ddlSubRouteName_SelectedIndexChanged"> </asp:DropDownList>

        <asp:Label ID="lblSortingOrder"  runat="server" CssClass="labelTextField" Text="Sorting Order"  style="position:absolute; top:173px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style="position:absolute; top:170px; left:130px;"  ></asp:TextBox>

        <asp:Label ID="lblVehicleName"  runat="server" CssClass="labelTextField" Text="Vehicle Name"  style="position:absolute; top:203px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlVehicleName" runat="server" CssClass="dropdownlist" AutoPostBack="True" 
                      style="position:absolute; top:200px; left:130px; " onselectedindexchanged="ddlVehicleName_SelectedIndexChanged" > </asp:DropDownList>
        
        <asp:Label ID="lblOwnerName"  runat="server" CssClass="labelTextField" Text="Owner Name"  style="position:absolute; top:233px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtOwnerName" runat="server" CssClass="textBox" style="position:absolute; top:230px; left:130px;" > </asp:TextBox>

        <asp:Label ID="lblDriverName"  runat="server" CssClass="labelTextField" Text="Driver Name"  style="position:absolute; top:263px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtDriverName" runat="server" CssClass="textBox" style="position:absolute; top:260px; left:130px;" > </asp:TextBox>

        <asp:Label ID="lblLicense"  runat="server" CssClass="labelTextField" Text="License No."  style="position:absolute; top:293px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtLicense" runat="server" CssClass="textBox" style="position:absolute; top:290px; left:130px;" > </asp:TextBox>

        <asp:Label ID="lblDeparture"  runat="server" CssClass="labelTextField" Text="Departure Time"  style="position:absolute; top:323px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDeparture" runat="server" CssClass="dropdownlist" AutoPostBack="True" style="position:absolute; top:320px; left:130px; " ></asp:DropDownList>



        <asp:Label ID="lblArrive"  runat="server" CssClass="labelTextField" Text="Arrival Time"  style="position:absolute; top:83px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlArrival" runat="server" CssClass="dropdownlist" AutoPostBack="True" style="position:absolute; top:80px; left:470px; " ></asp:DropDownList>

        <asp:Label ID="lblCapacity"  runat="server" CssClass="labelTextField" Text="Capacity"  style="position:absolute; top:113px; left:370px;"  ></asp:Label>
        <asp:TextBox ID="txtCapacity" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:110px; left:470px; "  ></asp:TextBox>

        <asp:Label ID="lblActualCopy"  runat="server" CssClass="labelTextField" Text="Actual Copy"  style="position:absolute; top:143px; left:370px;"  ></asp:Label>
        <asp:TextBox ID="txtActualCopy" runat="server" CssClass="textBox" style="position:absolute; top:140px; left:470px;"  ></asp:TextBox>


        <asp:Label ID="lblActDeparture"  runat="server" CssClass="labelTextField" Text="Act. Departure"  style="position:absolute; top:173px; left:370px;"  ></asp:Label>

        <asp:DropDownList ID="ddlDpHr" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:470px; width:45px; " ></asp:DropDownList>     
        <asp:DropDownList ID="ddlDpMin" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:530px; width:45px; " ></asp:DropDownList>
        
        <asp:DropDownList ID="ddlDpAMPM" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:590px; width:50px; " >
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
        </asp:DropDownList>


        <asp:Label ID="lblActArrive"  runat="server" CssClass="labelTextField" Text="Act. Arrival"  style="position:absolute; top:203px; left:370px;"  ></asp:Label>
        
        <asp:DropDownList ID="ddlArHr" runat="server" CssClass="dropdownlist" style="position:absolute; top:200px; left:470px; width:45px;" ></asp:DropDownList>       
        <asp:DropDownList ID="ddlArMin" runat="server" CssClass="dropdownlist" style="position:absolute; top:200px; left:530px; width:45px; " ></asp:DropDownList>
        
        <asp:DropDownList ID="ddlArAMPM" runat="server" CssClass="dropdownlist" style="position:absolute; top:200px; left:590px; width:50px;" >
        <asp:ListItem>AM</asp:ListItem>
        <asp:ListItem>PM</asp:ListItem>
        </asp:DropDownList>      


        <asp:Label ID="lblPaperName"  runat="server" CssClass="labelTextField" Text="Paper Name"  style="position:absolute; top:233px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPaperName" runat="server" CssClass="dropdownlist" AutoPostBack="True" style="position:absolute; top:230px; left:470px; " ></asp:DropDownList>


        <asp:Label ID="lblPionName"  runat="server" CssClass="labelTextField" Text="Pion Name"  style="position:absolute; top:263px; left:370px;"  ></asp:Label>
        <asp:TextBox ID="txtPionName" runat="server" CssClass="textBox" style="position:absolute; top:260px; left:470px;"  ></asp:TextBox>
        
        <asp:Label ID="lblReasonDelay"  runat="server" CssClass="labelTextField" Text="Reason of Delay"  style="position:absolute; top:293px; left:370px;"  ></asp:Label>
        <asp:TextBox ID="txtReasonDelay" runat="server" CssClass="textBox" style="position:absolute; top:290px; left:470px;"  ></asp:TextBox>


        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server"  style="position:absolute; top:325px; left:570px; height:30px;"  onclick="btnSave_click" />



</div>

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarTransectionDate" runat="server" TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>


</asp:Content>

