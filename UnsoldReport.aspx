<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UnsoldReport.aspx.cs" Inherits="UnsoldReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        
        function showFinderDiv() 
        {
            document.getElementById('divFinder').style.display = 'block';
            document.getElementById('divLeftForm').style.display = 'none';

            document.getElementById('<%= txtFilter.ClientID %>').value = "";

        }

        function BackMainDiv() 
        {
            document.getElementById('divFinder').style.display = 'none';
            document.getElementById('divLeftForm').style.display = 'block';
            
        }

    </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:170px; top:90px; height:310px; width:500px;">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:298px; width:488px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Daily Unsold" style="position:absolute; left:5px; top:5px; height: 19px;" ></asp:Label> 
            <hr style="position:absolute; top:27px; color:#57677F; width:488px; left:-1px;" />  
            
            <asp:Label ID="lblReturnDate" CssClass="labelTextField" runat="server" Text="Return Date From"  style="position:absolute; top:53px; left:60px;"></asp:Label>
            <asp:TextBox ID="txtReturnDateFrom" runat="server" CssClass="textBox"  style="position:absolute;   top:50px; left:190px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendarReturnDateFrom" runat="server" ToolTip="Select Date" Style="position: absolute; left:397px; top:52px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

            <asp:Label ID="lblReturnDateTo" CssClass="labelTextField" runat="server" Text="Return Date To"  style="position:absolute; top:88px; left:60px;"></asp:Label>
            <asp:TextBox ID="txtReturnDateTo" runat="server" CssClass="textBox"  style="position:absolute;   top:85px; left:190px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendarReturnTo" runat="server" ToolTip="Select Date" Style="position: absolute; left:397px; top:87px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />


            <asp:Label ID="lblCustomaerName" CssClass="labelTextField" runat="server" Text="Customer Name"  style="position:absolute; top:123px; left:60px; "  ></asp:Label>
            <asp:TextBox ID="txtCustomaerName" runat="server" CssClass="textBox"  style="position:absolute;  top:120px; left:190px; text-align:center;"></asp:TextBox>
            <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Find Agent" onclientclick="javascript:showFinderDiv();" Style="position: absolute; left:397px; top:121px; width:20px; height:20px;" ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />


            <asp:Label ID="lblRmname" CssClass="labelTextField" runat="server" Text="RM Name"  style="position:absolute; top:158px; left:60px; "  ></asp:Label>
            <asp:DropDownList ID="ddlRmname"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:155px; left:190px;  text-align:center;">
                
            </asp:DropDownList>


            <asp:Label ID="lblReport" CssClass="labelTextField" runat="server" Text="Report Name"  style="position:absolute; top:188px; left:60px; "  ></asp:Label>
            <asp:DropDownList ID="ddlReportName"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:185px; left:190px;  text-align:center;">
                <asp:ListItem>Serial Report</asp:ListItem>
                <asp:ListItem>Executive Wise</asp:ListItem>
                <asp:ListItem>Executive Summary</asp:ListItem>
                
            </asp:DropDownList>

            <asp:Label ID="lblExportType" CssClass="labelTextField" runat="server" Text="Export To"  style="position:absolute; top:220px; left:60px; "  ></asp:Label>
            <asp:DropDownList ID="ddlExportType"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:217px; left:190px;  text-align:center;">
                <asp:ListItem>Pdf</asp:ListItem>
                <asp:ListItem>Excel</asp:ListItem>
                <asp:ListItem>RichText</asp:ListItem>
            </asp:DropDownList>

        <hr style="position:absolute; top:243px; color:#57677F; width:488px; left:-1px;" /> 

        <asp:Button id="btnPreview" CssClass="Submitbutton" runat="server"  text="Preview" 
                style="position:absolute; top:260px; left:294px; height:30px;" 
                onclick="btnPreview_Click"/>

                
        </div>

   </div>


   <div id="divFinder" class="divclsFrm" style="display:none; position:absolute; ">
      
      <div id="divFrm" runat="server" class="divclsInput" style="width: 548px; position: absolute; height: 484px; width: 900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:35px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            
            <asp:Label ID="lblFindby" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            
            <asp:DropDownList ID="ddlCustomer" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Customer Name</asp:ListItem>
                <asp:ListItem>Customer ID</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="ddlSelectType" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblFilter" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            
            <asp:TextBox ID="txtFilter" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" OnTextChanged="txtFilter_TextChanged"
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        
        <asp:Panel ID="Panel1" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 894px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdCustomer" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True" 
                OnPageIndexChanging="grdCustomer_PageIndexChanging"
                OnSelectedIndexChanged="grdCustomer_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdCustomer_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />
                             

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
      
      </div>


    </div>


   <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarDateFrom" runat="server" TargetControlID="txtReturnDateFrom"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendarReturnDateFrom">
    </cc1:CalendarExtender>
   <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtReturnDateTo"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendarReturnTo">
    </cc1:CalendarExtender>

</asp:Content>

