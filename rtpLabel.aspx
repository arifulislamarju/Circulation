<%@ Page Title="Label Print" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="rtpLabel.aspx.cs" Inherits="rtpLabel" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:70px; top:20px; height:490px; width:770px; ">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:478px; width:758px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Label Print" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
            <hr style="position:absolute; top:23px; color:#57677F; width:758px; left:-1px;" />   
        </div>    


       <asp:Label ID="lblfrmDate"  runat="server" CssClass="labelTextField" Text="From Date"  style="position:absolute; top:53px; left:80px;"  ></asp:Label>
       <asp:TextBox ID="txtfrmDate" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:150px; width:150px; "  ></asp:TextBox>
       <asp:Image ID="imgCalendarfrmDate" runat="server" ToolTip="From Date" Style="position: absolute; left:307px; top:54px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

       <asp:Label ID="lblTodate"  runat="server" CssClass="labelTextField" Text="To Date"  style="position:absolute; top:53px; left:380px;"  ></asp:Label>
       <asp:TextBox ID="txtTodate" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:440px; width:150px; "  ></asp:TextBox>
       <asp:Image ID="imgCalendartoDate" runat="server" ToolTip="Select Date" Style="position: absolute; left:600px; top:54px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />


       
       <div ID="divIndidual" runat="server" style=" top:100px ;height:100px; Width:690px; position:absolute ;left:40px; border:1px Solid #F0FFF0">
        
        <asp:Label ID="lblIndividual" CssClass="labelHeader" runat="server" Text="Individual"  style="position:absolute; Width:74px; background-color:#C3C5E5; left:30px; top:-10px;" ></asp:Label> 


        <asp:Label ID="lblNewsReg"  runat="server" CssClass="labelTextField" Text="News Regular"  style="position:absolute; top:23px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtNewsReg" runat="server" CssClass="textBox" Text="100" style="position:absolute; width:150px; top:20px; left:140px; "  ></asp:TextBox>

        <asp:Label ID="lblNewsMax"  runat="server" CssClass="labelTextField" Text="News Maximum"  style="position:absolute; top:63px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtNewsMax" runat="server" CssClass="textBox" Text="140" style="position:absolute; width:150px; top:60px; left:140px; "  ></asp:TextBox>


        <asp:Label ID="lblSuppReg"  runat="server" CssClass="labelTextField" Text="Supplement Regular"  style="position:absolute; top:23px; left:340px;"  ></asp:Label>
        <asp:TextBox ID="txtSuppReg" runat="server" CssClass="textBox" Text="500" style="position:absolute; top:20px; width:150px; left:490px; "  ></asp:TextBox>

        <asp:Label ID="lblSuppMax"  runat="server" CssClass="labelTextField" Text="Supplement Maximum"  style="position:absolute; top:63px; left:340px;"  ></asp:Label>
        <asp:TextBox ID="txtSupplementMax" runat="server" CssClass="textBox" Text="715" style="position:absolute; width:150px; top:60px; left:490px; "  ></asp:TextBox>


       </div>

        <div ID="divCombined" runat="server" style=" top:240px ;height:60px; Width:690px; position:absolute ;left:40px; border:1px Solid #F0FFF0">
        
            <asp:Label ID="lblCombined" CssClass="labelHeader" runat="server" Text="Combined"  style="position:absolute; Width:74px; background-color:#C3C5E5; left:30px; top:-10px;" ></asp:Label> 
            
            <asp:Label ID="lblRegSize"  runat="server" CssClass="labelTextField" Text="Regular Size"  style="position:absolute; top:23px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtRegSize" runat="server" CssClass="textBox" Text="100" style="position:absolute; width:150px; top:20px; left:140px; "  ></asp:TextBox>

            <asp:Label ID="lblMaxSize"  runat="server" CssClass="labelTextField" Text="Maximum Size"  style="position:absolute; top:23px; left:340px;"  ></asp:Label>
            <asp:TextBox ID="txtMaxSize" runat="server" CssClass="textBox" Text="120" style="position:absolute; width:150px; top:20px; left:490px; "  ></asp:TextBox>

        </div>

        <div ID="divAction" runat="server" style=" top:320px ;height:100px; Width:690px; position:absolute ;left:40px; border:1px Solid #F0FFF0">
        
            <asp:Label ID="lblArea"  runat="server" CssClass="labelTextField" Text="Area"  style="position:absolute; top:23px; left:20px;"  ></asp:Label>
            <asp:DropDownList ID="ddlArea" runat="server" CssClass="dropdownlist" style="position:absolute; width:150px; top:20px; left:140px; "></asp:DropDownList>


            <asp:Label ID="lblPress" CssClass="labelTextField" runat="server" Text="Press"  style="position:absolute; top:63px; left:20px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPress" runat="server" CssClass="dropdownlist" style="position:absolute; width:150px; top:60px; left:140px; "  >           
                <asp:ListItem>Dhaka</asp:ListItem>                
                <asp:ListItem>Chittagong</asp:ListItem>
                <asp:ListItem>Bogra</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblCategory"  runat="server" CssClass="labelTextField" Text="Category"  style="position:absolute; top:23px; left:340px;"  ></asp:Label>
             <asp:DropDownList ID="ddlCategory" runat="server" CssClass="dropdownlist" 
                style="position:absolute; top:20px; left:490px; width:150px; text-align:center;" >
        
                    <asp:ListItem Selected="True">--Select--</asp:ListItem>
                    <asp:ListItem>Daily Newspaper</asp:ListItem>
                    <asp:ListItem>Kishor Alo</asp:ListItem>
                    <asp:ListItem>Eid Magazine</asp:ListItem>

            </asp:DropDownList>


        </div>

       <asp:Button id="btnpreviewLabel" CssClass="Submitbutton" runat="server" Text="Preview" 
            style="position:absolute; top:430px; left:580px; height:30px;" 
            onclick="btnpreviewLabel_Click"  />  


  </div>

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarFrmDate" runat="server" TargetControlID="txtfrmDate" PopupButtonID="imgCalendarfrmDate" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        <cc1:CalendarExtender ID="calendarToDate" runat="server" TargetControlID="txtTodate" PopupButtonID="imgCalendartoDate" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        

</asp:Content>

