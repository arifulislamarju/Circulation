<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RegularModify.aspx.cs" Inherits="RegularModify" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divTopForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:270px; width:710px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:257px; width:698px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Regular Modify Order" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:698px; left:-1px;" />   
    </div>

        <asp:Label ID="lblOrderDate"  runat="server" CssClass="labelTextField" Text="Order Date"  style="position:absolute; top:53px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtOrderDate" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtOrderDate_TextChanged" style="position:absolute; top:50px; left:130px; width:200px; " ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:338px; top:53px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:83px; left:30px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory"  runat="server" AutoPostBack="true"
            CssClass="dropdownlist" 
            
        style="position:absolute; top:80px; left:130px; width:227px;  text-align:center;" 
        onselectedindexchanged="ddlCategory_SelectedIndexChanged">
           
        </asp:DropDownList>

        <asp:Label ID="lblAgentName"  runat="server" CssClass="labelTextField" Text="Agent Name" style="position:absolute; top:113px; left:30px; " ></asp:Label>
        <asp:DropDownList ID="ddlAgentName" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                          style="position:absolute; top:110px; left:130px; width:230px; " onselectedindexchanged="ddlAgentName_SelectedIndexChanged" > </asp:DropDownList>

        <asp:Label ID="lblStation"  runat="server" CssClass="labelTextField" Text="Station" style="position:absolute; top:143px; left:30px;"   ></asp:Label>
        <asp:DropDownList ID="ddlStation" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                          style="position:absolute; top:140px; left:130px; width:230px; " onselectedindexchanged="ddlStation_SelectedIndexChanged" > </asp:DropDownList>              

        <asp:Label ID="lblQuantity"  runat="server" CssClass="labelTextField" Text="Quantity" style="position:absolute; top:173px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:170px; left:130px; width:225px; " > </asp:TextBox>

        <asp:Label ID="lblDaywiseChngQty"  runat="server" CssClass="labelTextField" Text="Day Wise Change Qty."  style="position:absolute; top:203px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtDaywiseChngQty" runat="server" CssClass="textBox" style="background-color:Yellow; position:absolute; top:200px; left:130px; width:225px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>    
        


        <asp:Label ID="lblBonusCopy"  runat="server" CssClass="labelTextField" Text="Bonus Copy" style="position:absolute; top:53px; left:400px;" ></asp:Label>
        <asp:TextBox ID="txtBonusCopy" runat="server" CssClass="textBox" style="background-color:Yellow; position:absolute; top:50px; left:525px; width:140px; " > </asp:TextBox>

        <asp:Label ID="lblComplementary"  runat="server" CssClass="labelTextField" Text="Complementary Copy"  style="position:absolute; top:83px; left:400px;"  ></asp:Label>
        <asp:TextBox ID="txtComplementary" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:80px; left:525px; width:140px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>

        <asp:Label ID="lblDaywiseDefQty"  runat="server" CssClass="labelTextField" Text="Day Wise Qty."  style="position:absolute; top:113px; left:400px;"  ></asp:Label>
        <asp:TextBox ID="txtDaywiseDefQty" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:110px; left:525px; width:140px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>    
        
        <asp:Label ID="lblSmsQuantity"  runat="server" CssClass="labelTextField" Text="Sms Quantity" style="position:absolute; top:143px; left:400px;"  ></asp:Label>
        <asp:TextBox ID="txtSmsQuantity" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:140px; left:525px; width:140px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>    
        
        <asp:Label ID="lblPacketType"  runat="server" CssClass="labelTextField" Text="Packet Type"  style="position:absolute; top:173px; left:400px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPacketType" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:525px; width:145px; " >
                <asp:ListItem Selected="True">--Select--</asp:ListItem>
                <asp:ListItem>Individual</asp:ListItem>
                <asp:ListItem>Combined</asp:ListItem>
                <asp:ListItem>OverPacked</asp:ListItem>
                <asp:ListItem>Special</asp:ListItem>

            </asp:DropDownList>    

        <asp:TextBox ID="txtoeId" runat="server" CssClass="textBox" style="visibility:hidden; position:absolute; top:200px; width:160px; left:70px;"  ></asp:TextBox>
            

     <div id="Calendar">

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server" TargetControlID="txtOrderDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        
     </div>


        <asp:Button id="btnUpdate" CssClass="Submitbutton" runat="server" Text="Update" style="position:absolute; top:215px; left:545px; height:30px;" onclick="btnUpdate_Click" />

</div>


</asp:Content>

