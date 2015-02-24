<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rptTransportSchedule.aspx.cs" Inherits="rptTransportSchedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:170px; top:90px; height:280px; width:500px;">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:268px; width:488px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Transport Report" style="position:absolute; left:5px; top:5px; height: 19px;" ></asp:Label> 
            <hr style="position:absolute; top:27px; color:#57677F; width:488px; left:-1px;" />  
            
            <asp:Label ID="lblReturnDate" CssClass="labelTextField" runat="server" Text="Date From"  style="position:absolute; top:53px; left:60px;"></asp:Label>
            <asp:TextBox ID="txtDateFrom" runat="server" CssClass="textBox"  style="position:absolute;   top:50px; left:190px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendarReturnDateFrom" runat="server" ToolTip="Select Date" Style="position: absolute; left:397px; top:52px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

            <asp:Label ID="lblDateTo" CssClass="labelTextField" runat="server" Text="Date To"  style="position:absolute; top:88px; left:60px;"></asp:Label>
            <asp:TextBox ID="txtDateTo" runat="server" CssClass="textBox"  style="position:absolute;   top:85px; left:190px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendarReturnTo" runat="server" ToolTip="Select Date" Style="position: absolute; left:397px; top:87px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />


            <asp:Label ID="lblSubRoute" CssClass="labelTextField" runat="server" 
                Text="Sub Route"  style="position:absolute; top:122px; left:60px; "  ></asp:Label>
             <asp:DropDownList ID="ddlSubRoute"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:120px; left:190px;  text-align:center;">
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>     
                        

            <asp:Label ID="lblExportType" CssClass="labelTextField" runat="server" Text="Export To"  style="position:absolute; top:158px; left:60px; "  ></asp:Label>
            <asp:DropDownList ID="ddlExportType"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:155px; left:190px;  text-align:center;">
                <asp:ListItem>Pdf</asp:ListItem>
                <asp:ListItem>Excel</asp:ListItem>
                <asp:ListItem>RichText</asp:ListItem>
            </asp:DropDownList>

        <hr style="position:absolute; top:213px; color:#57677F; width:488px; left:-1px;" /> 

        <asp:Button id="btnPreview" CssClass="Submitbutton" runat="server"  text="Preview" 
               onclick="btnPreview_Click" style="position:absolute; top:230px; left:294px; height:30px;" 
                 />

                
        </div>

   </div>
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarDateFrom" runat="server" TargetControlID="txtDateFrom"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendarReturnDateFrom">
    </cc1:CalendarExtender>
   <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDateTo"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendarReturnTo">
    </cc1:CalendarExtender>

</asp:Content>

