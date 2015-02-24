<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AgentSalesQuantity.aspx.cs" Inherits="AgentSalesQuantity" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">

    function numberOnly() 
    {
        var key_code = window.event.keyCode;
        var oElement = window.event.srcElement;
        if (!window.event.shiftKey && !window.event.ctrlKey && !window.event.altKey) {
            if ((key_code > 47 && key_code < 58) || (key_code > 95 && key_code < 106)) {

                if (key_code > 95)
                    key_code -= (95 - 47);
                oElement.value = oElement.value;
            }
            else if (key_code == 8) {
                oElement.value = oElement.value;
            }
            else if (key_code != 9) {
                event.returnValue = false;
                alert('Please input number only....');
            }

        }
    }


    function showOrderFinderDiv() 
    {
        document.getElementById('divOrderNoFinder').style.display = 'block';
        document.getElementById('divTopForm').style.display = 'none';
    }

    function showFinderDiv() 
    {
        document.getElementById('divFinder').style.display = 'block';
        document.getElementById('divTopForm').style.display = 'none';
    }

    function BackMainDiv() 
    {
        document.getElementById('divOrderNoFinder').style.display = 'none';
        document.getElementById('divFinder').style.display = 'none';
        document.getElementById('divTopForm').style.display = 'block';

        document.getElementById('<%= txtFilter.ClientID  %>').value = "";
        document.getElementById('<%= txtFilterOrder.ClientID  %>').value = "";
    }

    </script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divTopForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:290px; width:710px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:277px; width:698px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Agent Sales Quantity Summary" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:698px; left:-1px;" />   
    </div>

        <asp:Label ID="lblOrderNumber" CssClass="labelTextField" runat="server" Text="Order Number"  style="position:absolute; top:53px; left:20px;"></asp:Label>
        <asp:TextBox ID="txtOrderNumber" runat="server" CssClass="textBox" Text="**** New ****"  style="position:absolute; width:90px; top:50px; left:180px; text-align:center;"  ></asp:TextBox>
        
        <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" style="position:absolute; width:20px; top:53px; left:130px;" onclick="btnFirst_Click"  />
        <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" style="position:absolute; width:20px; top:53px; left:155px;" onclick="btnPrevious_Click" />

        <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" style="position:absolute; width:20px; top:53px; left:280px;" onclick="btnNext_Click" />
        <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" style="position:absolute; width:20px; top:53px; left:305px;" onclick="btnLast_Click" />

        <asp:ImageButton ID="btnNew" runat="server" ImageUrl="~/Images/New.JPG" style="position:absolute; width:20px; top:53px; left:330px;" onclick="btnNew_Click" />
        <asp:ImageButton ID="imgOrderFinder" runat="server" ToolTip="Order No.Finder" onclientclick="javascript:showOrderFinderDiv();" Style="position: absolute; left:355px; top:53px; width: 20px; height: 20px;" 
                   ImageUrl="~/Images/Finder.jpg" onclick="imgOrderFinder_Click" />

        <asp:Label ID="lblAgentId"  runat="server" CssClass="labelTextField" Text="Agent Id" style="position:absolute; top:83px; left:20px;" ></asp:Label>
        <asp:TextBox ID="txtAgentId" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtAgentId_TextChanged" style="position:absolute; text-align:center; top:80px; left:130px; width:175px; " > </asp:TextBox>
        <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Find Agent" onclientclick="javascript:showFinderDiv();" Style="position: absolute; left:315px; top:82px; width:20px; height:20px;" 
                         ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />
        

        <asp:Label ID="lblAgentName"  runat="server" CssClass="labelTextField" Text="Agent Name" style="position:absolute; top:113px; left:20px;"    ></asp:Label>
        <asp:TextBox ID="txtAgentName" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:110px; left:130px; " > </asp:TextBox>

        <asp:Label ID="lblRegularCopy"  runat="server" CssClass="labelTextField" Text="Regular Quantity" style="position:absolute; top:143px; left:20px;"   ></asp:Label>
        <asp:TextBox ID="txtRegularCopy" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:140px; left:130px;" > </asp:TextBox>       

        <asp:Label ID="lblFloatCopy"  runat="server" CssClass="labelTextField" Text="Floating Quantity" style="position:absolute; top:173px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtFloatCopy" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:170px; left:130px; " > </asp:TextBox>

        <asp:Label ID="lblCorporateCopy"  runat="server" CssClass="labelTextField" Text="Corporate Quantity" style="position:absolute; top:203px; left:20px;" ></asp:Label>
        <asp:TextBox ID="txtCorporateCopy" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:200px; left:130px; " > </asp:TextBox>



        <asp:Label ID="lblOrderDate"  runat="server" CssClass="labelTextField" Text="Order Date"  style="position:absolute; top:83px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtOrderDate" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:475px; width:175px; " ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:660px; top:84px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblActRegularCopy"  runat="server" CssClass="labelTextField" Text="Actual Regular Qty."  style="position:absolute; top:113px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtActRegularCopy" runat="server" CssClass="textBox" style="position:absolute; top:110px; left:475px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>

        <asp:Label ID="lblActFloatCopy"  runat="server" CssClass="labelTextField" Text="Actual Floating Qty."  style="position:absolute; top:143px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtActFloatCopy" runat="server" CssClass="textBox" style="position:absolute; top:140px; left:475px;" onkeydown="javascript:numberOnly()" ></asp:TextBox>

        <asp:Label ID="lblActCorporateCopy"  runat="server" CssClass="labelTextField" Text="Actual Corporate Qty."  style="position:absolute; top:173px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtActCorporateCopy" runat="server" CssClass="textBox" style="position:absolute; top:170px; left:475px; " onkeydown="javascript:numberOnly()" ></asp:TextBox>    
           

     <div id="Calendar">

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server" TargetControlID="txtOrderDate" PopupButtonID="imgCalendar" Format="dd-MM-yyyy"> </cc1:CalendarExtender>

        
     </div>


        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:240px; left:510px; height:30px;" onclick="btnSave_Click" />

</div>




    <div id="divOrderNoFinder" class="divclsFrm" style="display:none; position:absolute; ">
      
      <div id="divOrderNoFrm" class="divclsInput"  runat="server" style="width: 548px; position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnNoBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:35px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews1" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            
            <asp:Label ID="lblFindby1" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            
            <asp:DropDownList ID="ddlCustomer1" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Order No</asp:ListItem>
                <asp:ListItem>Agent Name</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="ddlSelectType1" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblFilterOrder" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            
            <asp:TextBox ID="txtFilterOrder" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" OnTextChanged="txtFilterOrder_TextChanged"
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        
        <asp:Panel ID="Panel2" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 894px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdOrderNo" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True" 
                OnPageIndexChanging="grdOrderNo_PageIndexChanging"
                OnSelectedIndexChanged="grdOrderNo_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdOrderNo_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID1" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript1"></asp:Literal>
      
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
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />
                             

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
      
      </div>


    </div>






</asp:Content>

