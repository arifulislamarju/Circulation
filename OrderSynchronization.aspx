<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderSynchronization.aspx.cs" Inherits="OrderSynchronization" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="display:block; position:absolute; left:100px; top:20px; height:520px; width:740px; ">

            <div id="divFormHeader" class="divclsInput" style="position:absolute; left:6px; top:5px; height:510px; width:728px; border:0px solid gray; ">
                <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Order Synchronization" style="position:absolute; left:5px; top:10px; " ></asp:Label> 
                <hr style="position:absolute; top:30px; color:#57677F; width:726px; left:0px;" />   
        

            <asp:Label ID="lblOrderDateFrom"  runat="server" CssClass="labelTextField" Text="Order Date From"  style="position:absolute; top:53px; left:15px;"  ></asp:Label>
            <asp:TextBox ID="txtOrderDateFrom" runat="server" CssClass="textBox"  style="position:absolute; top:50px; left:115px; width:120px; " ></asp:TextBox>
            <asp:Image ID="imgCalendarFrom" runat="server" ToolTip="Select Date" Style="position: absolute; left:241px; top:53px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

            <asp:Label ID="lblOrderDateTo"  runat="server" CssClass="labelTextField" Text="Order Date To"  style="position:absolute; top:53px; left:290px;"  ></asp:Label>
            <asp:TextBox ID="txtOrderDateTo" runat="server" CssClass="textBox"  style="position:absolute; top:50px; left:370px; width:120px; " ></asp:TextBox>
            <asp:Image ID="imgCalenderTo" runat="server" ToolTip="Select Date" Style="position: absolute; left:495px; top:53px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />


            <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:53px; left:540px; "  ></asp:Label>
            <asp:DropDownList ID="ddlCategory"  runat="server"  CssClass="dropdownlist"           
            style="position:absolute; top:50px; left:595px; width:120px; text-align:center;" >
                
            </asp:DropDownList>

             <asp:Label ID="lblSalesType" CssClass="labelTextField" runat="server" Text="Sales Type"  style="position:absolute; top:90px; left:15px; "  ></asp:Label>
            <asp:DropDownList ID="ddlSalesType" runat="server" CssClass="dropdownlist"  style="position:absolute; width:120px;  top:85px; left:117px; text-align:center;"  >
        
            <asp:ListItem Selected="True">All</asp:ListItem>
            <asp:ListItem Value="0">Cash</asp:ListItem>
            <asp:ListItem Value="1">Credit</asp:ListItem>
            
            </asp:DropDownList>

            <asp:Button id="btnDisplay" CssClass="Submitbutton" runat="server" Text="Preview" 
            style="position:absolute; top:85px; left:280px; height:28px; Width:80px;"  onclick="btnDisplay_Click" />    
            
            <asp:Button id="btnPost"  CssClass="Submitbutton" runat="server" Text="Post" 
            style="position:absolute; top:85px; left:380px; height:28px; Width:80px;" onclick="btnPost_Click" /> 
            
            <asp:Button id="btnReverse"  CssClass="Submitbutton" runat="server" Text="Reverse" 
            style="position:absolute; top:85px; left:480px; height:28px; Width:80px;" onclick="btnReverse_Click" />  
            
               

            <hr style="position:absolute; top:110px; color:#57677F; width:726px; left:0px;" />   

            <div id="divInput"  style="position:absolute; height:340px; width:726px; top:120px; left:0px; overflow:auto; border:0px red solid;">
            
            <asp:GridView ID="grdOrder" runat="server" Style="position: absolute; top:3px;
                left:5px; height:auto; width:700px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"
                
                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" onrowcreated="grdOrder_RowCreated" >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>

                <Columns>
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="220px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="quantity" SortExpression="quantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="complementaryCopy" SortExpression="complementaryCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="bonusCopy" SortExpression="bonusCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                         <asp:BoundField DataField="daywiseChngQuantity" SortExpression="daywiseChngQuantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                         <asp:BoundField DataField="daywiseDefQuanttity" SortExpression="daywiseDefQuanttity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                </Columns>

            </asp:GridView>
            
            </div>

            <hr style="position:absolute; top:455px; color:#57677F; width:726px; left:0px;" />

             <asp:Label ID="lblTotalOrder"  runat="server" Text=""  style="position:absolute; font-family:Verdana; color:Black; font-size:11px; top:465px; left:15px; "  ></asp:Label>
             <asp:Label ID="lblQuantity"  runat="server" Text=""  style="position:absolute; font-family:Verdana; color:Black; font-size:11px; top:485px; left:15px; "  ></asp:Label>
             

         </div>

    </div>

   <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDateFrom" runat="server" TargetControlID="txtOrderDateFrom" PopupButtonID="imgCalendarFrom" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>
        
        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtOrderDateTo" PopupButtonID="imgCalenderTo" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>


</asp:Content>

