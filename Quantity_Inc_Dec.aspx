<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Quantity_Inc_Dec.aspx.cs" Inherits="Quantity_Inc_Dec" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>

    <script type="text/javascript">

        

    </script>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divTopForm" class="divclsFrm" style="position:absolute; left:180px; top:30px; height:400px; width:540px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:388px; width:528px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Modify Order" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:528px; left:-1px;" />   
    </div>
        
        <label class="labelTextField" style="height: 20px; width: 40px; position: absolute; margin-left: 30px; margin-top: 45px;">Quantity</label>
        <asp:DropDownList ID="ddlChngQuantity" CssClass="dropdownlist" runat="server" style="height: 23px; width:150px; position: absolute; margin-left: 120px; margin-top: 42px;">
        
        <asp:ListItem>Select</asp:ListItem>
        <asp:ListItem>Increase</asp:ListItem>
        <asp:ListItem>Decrease</asp:ListItem>
        
        </asp:DropDownList>
        <label class="labelTextField" style="height: 20px; width: 40px; position: absolute; margin-left: 30px; margin-top: 73px;">Quantity</label>
        <asp:TextBox ID="txtChngQuantity" runat="server" CssClass="textBox" style="position:absolute; top:70px; left:120px; width:150px; text-align:center; " > </asp:TextBox>

        <label class="labelTextField" style="height: 20px; width: 40px; position: absolute; margin-left: 30px; margin-top: 103px;">Reason</label>
        <asp:TextBox ID="txtReason" runat="server" CssClass="textBox" style="position:absolute; top:100px; left:120px; width:150px; text-align:center; " > </asp:TextBox>


        <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:45px; left:300px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory"  runat="server" 
            CssClass="dropdownlist" 
            
        style="position:absolute; top:42px; left:365px; width:130px;  text-align:center;" >
            
        </asp:DropDownList>

        <input runat="server" type="radio" id="IDrdoQuantity" name="rdoQuantity" value="Date"  style="height: 20px; width: 20px; position: absolute; margin-left: 365px; margin-top:82px;" />
        <label class="labelTextField" style="height: 20px; width: 80px; position: absolute; margin-left: 390px; margin-top: 85px;">Fixed Quantity</label>

        <input runat="server" type="radio" id="IDrdoQuantityPer" name="rdoQuantity" value="Previous Date" style="height: 20px; width: 20px; position: absolute; margin-left:365px; margin-top:107px;" />
        <label class="labelTextField" style="height: 20px; width: 90px; position: absolute; margin-left:390px; margin-top:110px;">Percentage (%)</label>


        

        <hr style="position:absolute; top:125px; border-bottom: solid WhiteText 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:528px; left:5px;" />   

        <asp:Label ID="lblTransDate"  runat="server" CssClass="labelTextField" Text="Transac. Date"  style="position:absolute; top:143px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox" style="position:absolute; top:140px; left:120px; width:150px; "  ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:277px; top:144px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblFrmRoute"  runat="server" CssClass="labelTextField" Text="From Route" Enabled="false"  style="position:absolute; top:173px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmRoute" runat="server" CssClass="dropdownlist" AutoPostBack="True" Enabled="false"
                   style="position:absolute; top:170px; left:120px; width:150px; " > </asp:DropDownList>        
         
        <asp:Label ID="lblToRoute"  runat="server" CssClass="labelTextField" Text="To Route"  Enabled="false" style="position:absolute; top:173px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToRoute" runat="server" CssClass="dropdownlist" AutoPostBack="True" Enabled="false"
                   style="position:absolute; top:170px; left:370px; width:150px;" > </asp:DropDownList>        

        <asp:Label ID="lblFrmSubRoute"  runat="server" CssClass="labelTextField" Text="From Sub-Route"  style="position:absolute; top:203px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmSubRoute" runat="server" CssClass="dropdownlist" 
                      style="position:absolute; top:200px; left:120px; width:150px;" > </asp:DropDownList>

        <asp:Label ID="lblToSubRoute"  runat="server" CssClass="labelTextField" Text="To Sub-Route"  style="position:absolute; top:203px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToSubRoute" runat="server" CssClass="dropdownlist" 
                      style="position:absolute; top:200px; left:370px; width:150px;" > </asp:DropDownList>

        <asp:Label ID="lblFrmDivision"  runat="server" CssClass="labelTextField" Text="From Division" Enabled="false"  style="position:absolute; top:233px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmDivision" runat="server"  Enabled="false"
        CssClass="dropdownlist" AutoPostBack="True"
                   style="position:absolute; top:230px; left:120px; width:150px; " 
        onselectedindexchanged="ddlFrmDivision_SelectedIndexChanged" > </asp:DropDownList> 

        <asp:Label ID="lblToDivision"  runat="server" CssClass="labelTextField" Text="To Division" Enabled="false"  style="position:absolute; top:233px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToDivision" runat="server" CssClass="dropdownlist" AutoPostBack="True" Enabled="false"
                   style="position:absolute; top:230px; left:370px; width:150px; " 
        onselectedindexchanged="ddlToDivision_SelectedIndexChanged" > </asp:DropDownList>
     
        <asp:Label ID="lblFrmDistrict"  runat="server" CssClass="labelTextField" Text="From District" Enabled="false"  style="position:absolute; top:263px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmDistrict" runat="server"  Enabled="false"
        CssClass="dropdownlist" AutoPostBack="True"
                   style="position:absolute; top:260px; left:120px; width:150px; " 
        onselectedindexchanged="ddlFrmDistrict_SelectedIndexChanged" > </asp:DropDownList> 

        <asp:Label ID="lblToDistrict"  runat="server" CssClass="labelTextField" Text="To District"  Enabled="false" style="position:absolute; top:263px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToDistrict" runat="server" CssClass="dropdownlist" AutoPostBack="True" Enabled="false"
                   style="position:absolute; top:260px; left:370px; width:150px; " 
        onselectedindexchanged="ddlToDistrict_SelectedIndexChanged" > </asp:DropDownList>
        
        <asp:Label ID="lblFrmPS"  runat="server" CssClass="labelTextField" Text="From Police Sta." Enabled="false"  style="position:absolute; top:293px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmPS" runat="server" CssClass="dropdownlist" Enabled="false"
                   style="position:absolute; top:290px; left:120px; width:150px; " > </asp:DropDownList> 
        
        <asp:Label ID="lblToPS"  runat="server" CssClass="labelTextField" Text="To Police Sta." Enabled="false"  style="position:absolute; top:293px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToPS" runat="server" CssClass="dropdownlist"  Enabled="false"
                   style="position:absolute; top:290px; left:370px; width:150px; " > </asp:DropDownList> 
        
        <asp:Label ID="lblFrmAgent"  runat="server" CssClass="labelTextField" Text="From Agent"  Enabled="false" style="position:absolute; top:323px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmAgent" runat="server" CssClass="dropdownlist" Enabled="false"
                   style="position:absolute; top:320px; left:120px; width:150px; " > </asp:DropDownList> 

        <asp:Label ID="lblToAgent"  runat="server" CssClass="labelTextField" Text="to Agent" Enabled="false"  style="position:absolute; top:323px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToAgent" runat="server" CssClass="dropdownlist" Enabled="false"
                   style="position:absolute; top:320px; left:370px; width:150px; " > </asp:DropDownList>
        
        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server"  text="Process" style="position:absolute; top:355px; left:220px; height:30px;" onclick="btnSave_Click" />


</div>


<asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarOrderdate" runat="server" TargetControlID="txtTransDate"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendar">
    </cc1:CalendarExtender>

</asp:Content>

