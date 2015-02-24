<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContractDeed.aspx.cs" Inherits="ContractDeed" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>

<script type="text/javascript">
  

    function showFinderAgntDiv() 
    {
        document.getElementById('divCustFinder').style.display = 'block';
        document.getElementById('divTopForm').style.display = 'none';
        document.getElementById('divRhtForm').style.display = 'none';
    }

    function showFinderBankDiv() 
    {
        document.getElementById('divBankFinder').style.display = 'block';
        document.getElementById('divTopForm').style.display = 'none';
        document.getElementById('divRhtForm').style.display = 'none';
    }

    function BackMainDiv() 
    {
        document.getElementById('divCustFinder').style.display = 'none';
        document.getElementById('divBankFinder').style.display = 'none';
        document.getElementById('divRhtForm').style.display = 'block';

        document.getElementById('<%= txtFilter.ClientID %>').value = "";
    }

</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div id="divTopForm" class="divclsFrm" style="display:block; position:absolute; left:100px; top:40px; height:225px; width:700px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:213px; width:688px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Agent Deed" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:21px; color:#57677F; width:688px; left:-1px;" />   
    </div>

        <asp:Label ID="lblId" CssClass="labelTextField" runat="server" Text="Agent Id" style="position:absolute; top:53px; left:25px;"></asp:Label>
        <asp:TextBox ID="txtId" CssClass="textBox" runat="server" AutoPostBack="true" OnTextChanged="txtId_TextChanged" style="position:absolute; left:120px; top:50px;"></asp:TextBox>
        <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Find Agent" onclientclick="javascript:showFinderAgntDiv();" Style="position: absolute; left:325px; top:53px; width:20px; height:20px;" 
                         ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />
        

        <asp:Label ID="lblName" CssClass="labelTextField" runat="server" Text="Agent Name" style="position:absolute;  top:83px; left:25px;"></asp:Label>
        <asp:TextBox ID="txtName" CssClass="textBox" runat="server" AutoPostBack="true" EnableViewState="False" style=" position:absolute; left:120px; top:80px;"></asp:TextBox>
        
        <asp:Label ID="lblIssuDate" CssClass="labelTextField" runat="server" Text="Issue Date" style=" position:absolute; left:25px; top:113px;"></asp:Label>
         <asp:Image ID="imgCalendarIssuDate" runat="server" ToolTip="Select Date" Style="position: absolute; left:328px; top:115px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblDeedType" CssClass="labelTextField" runat="server" Text="Deed Type"  style="position:absolute; top:143px; left:25px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDeedType" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:140px; left:120px;" >
            
                <asp:ListItem>New</asp:ListItem>
                <asp:ListItem>Renew</asp:ListItem>
                <asp:ListItem>Settlement</asp:ListItem>

            </asp:DropDownList>

        <asp:Label ID="lblExpDate" CssClass="labelTextField" runat="server" Text="Expire Date" style=" position:absolute; left:370px; top:53px;"></asp:Label>
        <asp:Image ID="imgCalendarExpDate" runat="server" ToolTip="Select Date" Style="position: absolute; left:665px; top:54px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblBank" CssClass="labelTextField" runat="server" Text="Bank" style="position:absolute; top:83px; left:370px;"></asp:Label>
        <asp:TextBox ID="txtBank" CssClass="textBox" runat="server" style="position:absolute; left:460px; top:80px;"></asp:TextBox>
        <asp:Image ID="imgBankFinder" runat="server" ToolTip="Find Customer" onclick="javascript:showFinderBankDiv();" Style="position: absolute; left:665px; top:83px; width:20px; height:20px;" ImageUrl="~/Images/Finder.jpg" />
        
        
        <asp:Label ID="lblDeposit" CssClass="labelTextField" runat="server" Text="Deposit Tk" style=" position:absolute; left:370px; top:113px;"></asp:Label>
        <asp:TextBox ID="txtDeposit" CssClass="textBox" runat="server" style=" position:absolute; left:460px; top:110px;"></asp:TextBox>

        <asp:Label ID="lblUpload" CssClass="labelTextField" runat="server" Text="Upload Image" style=" position:absolute; left:370px; top:143px;"></asp:Label>

        <asp:FileUpload ID="fileUpload"  CssClass="labelTextField" runat="server" style=" position:absolute; left:460px; top:140px; border:0px Solid Black" />

        <asp:Button ID="btnPost" runat="server" CssClass="Submitbutton" Text="Post" style=" position:absolute;  left:380px; height:30px; width:80px; top:180px; "
                onclick="btnPost_Click" OnClientClick=" return Validate()" />
       
        <asp:Button ID="btnSave" runat="server" CssClass="Submitbutton" Text="Save" style=" position:absolute;  left:480px; height:30px; width:80px; top:180px; "
                onclick="btnSave_Click" OnClientClick=" return Validate()" />
        
        <asp:Button ID="btnCancel" runat="server" CssClass="Submitbutton" Text="Clear" style=" position: absolute; left:580px; height:30px; top:180px; width:80px; " 
                onclick="btnCancel_Click" />

        <asp:Label ID="msgError" runat="server" style=" position:absolute; left:230px; top:220px; color:Red"></asp:Label>

    </div>




 <%--    <div id="divMidForm" style="position:absolute; left:100px; top:260px; height:250px; width:700px; border:2px solid gray; ">
    
    <div id="search">
        <asp:Panel ID="pnlSearch" runat="server" GroupingText="Id/Namewise Search" ForeColor="#006400" Font-Bold="true"
                   Height="85px" Width="690px" HorizontalAlign="Justify" style=" top:0px ;position:absolute ;left:0px; background-color:#ADB1AF; border-radius:8px; border:4px Solid #F0FFF0">
        
        <asp:Label ID="lblHawkerId" runat="server" Text="Hawker Id" Font-Bold="false" style=" position:absolute; top:20px; left:40px;" ></asp:Label>
        <asp:TextBox ID="txtHawkerId" runat="server" style=" position:absolute; top:20px ;left:130px; border:1px Solid Black"></asp:TextBox>
        <br />

        <asp:Label ID="lblHawkerName" runat="server" Text="Hawker Name" Font-Bold="false" style=" position:absolute; top:20px; left:350px;" > </asp:Label>
        <asp:TextBox ID="txtHawkerName" runat="server" style=" position:absolute; top:20px;left:470px; border:1px Solid Black"> </asp:TextBox> 

        <asp:Button ID="btnSearch" runat="server" Text="Search" onclick="btnSearch_Click" style=" position:absolute; left:260px; top:60px" />
        <asp:Button ID="btnExit" runat="server" Text="Cancel" style=" position:absolute; left:340px; top:60px" onclick="btnExit_Click" />

        </asp:Panel>

    </div>--%>


<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:290px; height:230px; width:700px;">
    

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:688px; overflow:auto; "  >
         <asp:GridView ID="gridView" runat="server"  AutoGenerateColumns="False" RowStyle-HorizontalAlign="Center" 
                            AlternatingRowStyle-HorizontalAlign="Center" AllowPaging="True"
                            RowStyle-VerticalAlign="top"                     
        
                Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;" 
                onselectedindexchanged="gridView_SelectedIndexChanged" >
         
             <FooterStyle ForeColor="Black" BackColor="#CCCCCC" />
         
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="30px" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
        <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>    
        
        <Columns>
        <asp:BoundField DataField="HawkerName" HeaderText="Agent Name" />
        <asp:BoundField DataField="IssueDate" HeaderText="Issue Date" DataFormatString="{0:dd-MMM-yyyy}" ControlStyle-ForeColor="Black" >
        <ControlStyle ForeColor="Black"></ControlStyle>
            </asp:BoundField>
        <asp:BoundField DataField="deedType" HeaderText="Deed Type" />
        <asp:BoundField DataField="ExpDate" HeaderText="Expire Date" DataFormatString="{0:dd-MMM-yyyy}" />
        <asp:BoundField DataField="bank" HeaderText="Bank" />
        <asp:BoundField DataField="DepositTk" HeaderText="Deposit Amount" />
        <asp:BoundField DataField="auditUser" HeaderText="Audit User" />
        <asp:BoundField DataField="createDate" HeaderText="Create Date" DataFormatString="{0:dd-MMM-yyyy}" />
        <asp:CommandField ShowSelectButton="true" SelectText="Edit" 
                HeaderText="Update Info" HeaderStyle-HorizontalAlign="Center" 
                ItemStyle-ForeColor="Blue" >
        <HeaderStyle HorizontalAlign="Center"></HeaderStyle>

        <ItemStyle ForeColor="Blue"></ItemStyle>
            </asp:CommandField>
        </Columns>
                 
              <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
             <SortedAscendingCellStyle BackColor="#F1F1F1" />
             <SortedAscendingHeaderStyle BackColor="#808080" />
             <SortedDescendingCellStyle BackColor="#CAC9C9" />
             <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>

    </div>

    </div>

<div id="calendarDiv">

<asp:TextBox ID="txtIssuDate" CssClass="textBox" runat="server"  style=" position:absolute; left:222px; top:152px; "></asp:TextBox>
<asp:TextBox ID="txtExpDate" CssClass="textBox" runat="server" style=" position:absolute; left:560px; top:90px; "></asp:TextBox>


</div>




<div id="divCustFinder" class="divclsFrm" style="display:none; position:absolute; ">
      
      <div id="divFrm"  class="divclsInput" runat="server" style="width: 548px; position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:30px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            <asp:Label ID="lblFindby" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            <asp:DropDownList ID="ddlCustomer" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Agent Name</asp:ListItem>
                <asp:ListItem>Agent ID</asp:ListItem>
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

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
      
      </div>


    </div>


<div id="divBankFinder" style="display:none; position:absolute; ">
      
      <div id="divFrmBank"  runat="server" style="width: 548px; background-color: Lavender; border: groove 1px gray;
        position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack1" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:30px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews1" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            <asp:Label ID="lblFindby1" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            <asp:DropDownList ID="ddlCustomer1" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Bank Name</asp:ListItem>
                <asp:ListItem>Bank ID</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlSelectType1" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblFilter1" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            <asp:TextBox ID="txtFilter1" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" 
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 894px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdBank" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True"
                OnPageIndexChanging="grdBank_PageIndexChanging"
                OnSelectedIndexChanged="grdBank_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdBank_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle ForeColor="Black" Height="15px" Font-Size="11px" />

                <%--<Columns>

                <asp:TemplateField>
                <ItemTemplate>
                <asp:HyperLink ID="hp" Text="pass value" NavigateUrl="~/OrderCapture.aspx" runat="server"></asp:HyperLink>

                </ItemTemplate>
                
                </asp:TemplateField>
                

                </Columns>--%>

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID1" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript1"></asp:Literal>
      
      </div>


    </div>

    <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager>
<cc1:CalendarExtender ID="calendarIssueDate" runat="server" TargetControlID="txtIssuDate" PopupButtonID="imgCalendarIssuDate"
         Format="dd-MMM-yyyy">
      </cc1:CalendarExtender>

<cc1:CalendarExtender ID="calendarExpireDate" runat="server" TargetControlID="txtExpDate" PopupButtonID="imgCalendarExpDate"
         Format="dd-MMM-yyyy">
      </cc1:CalendarExtender>

</asp:Content>

