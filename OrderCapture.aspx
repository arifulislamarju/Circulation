<%@ Page Title="Order Capture" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="OrderCapture.aspx.cs" Inherits="OrderCapture" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function SelectCustomer(pageName) 
        {
            var strUrl = 'findCustomer.aspx?page=' + pageName;
            window.open(strUrl, 'mywindow', 'width=900,height=500,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no');
            return false;
        }


        function salesType() 
        {

            var salesType = document.getElementById('<%= ddlSalesType.ClientID %>').value;

            if (salesType == '0') 
            {

                document.getElementById('divCashSalesType').style.display = 'block';
                document.getElementById('divCreditSalesType').style.display = 'none';

                document.getElementById('<%= chkCorporate.ClientID %>').checked = false;
                document.getElementById('<%= chkLineWise.ClientID %>').checked = false;

                document.getElementById('<%= chkPostPaid.ClientID %>').checked = false;
                document.getElementById('<%= ChkPrepaid.ClientID %>').checked = false;

            }

            else if (salesType == '1')
            {

                document.getElementById('divCashSalesType').style.display = 'none';
                document.getElementById('divCreditSalesType').style.display = 'block';

                document.getElementById('<%= rbACashSales.ClientID %>').checked = false;

            }

            else 
            {

                document.getElementById('divCashSalesType').style.display = 'none';
                document.getElementById('divCreditSalesType').style.display = 'none';

                document.getElementById('<%= chkCorporate.ClientID %>').checked = false;
                document.getElementById('<%= chkLineWise.ClientID %>').checked = false;

                document.getElementById('<%= chkPostPaid.ClientID %>').checked = false;
                document.getElementById('<%= ChkPrepaid.ClientID %>').checked = false;

            }
            
        }

        function lineWiseSales() 
        {

            if (document.getElementById('<%= chkLineWise.ClientID %>').checked == true) 
            {
            
                document.getElementById('divCorporateType').style.display = 'none';
                document.getElementById('<%= chkCorporate.ClientID %>').checked = false;
                //document.getElementById('<%= chkLineWise.ClientID %>').checked = false;
            }

            else 
            {
                document.getElementById('divCorporateType').style.display = 'block';
                document.getElementById('<%= chkCorporate.ClientID %>').checked = true;

            }

        }

        function corporateSales()
        {
         if (document.getElementById('<%= chkCorporate.ClientID %>').checked == true) 
            {

                document.getElementById('divCorporateType').style.display = 'block';
                document.getElementById('<%= chkLineWise.ClientID %>').checked = false;

            }
            else 
            {
                document.getElementById('divCorporateType').style.display = 'none';
                document.getElementById('<%= chkLineWise.ClientID %>').checked = true;

            }

        }

        function corporateType() 
        {
            if (document.getElementById('<%= chkPostPaid.ClientID %>').checked == true) 
            {
                document.getElementById('divCorporateType').style.display = 'block';
                document.getElementById('<%= ChkPrepaid.ClientID %>').checked = false;
            }

            else
            {
                document.getElementById('divCorporateType').style.display = 'block';
                document.getElementById('<%= chkPostPaid.ClientID %>').checked = false;

            }
        }

        function showOrderFinderDiv() 
        {
            document.getElementById('divOrderNoFinder').style.display = 'block';
            document.getElementById('divLeftForm').style.display = 'none';
        }

        function showFinderDiv() 
        {
            document.getElementById('divFinder').style.display = 'block';
            document.getElementById('divLeftForm').style.display = 'none';
                       
        }

        function BackMainDiv() 
        {
            document.getElementById('divFinder').style.display = 'none';
            document.getElementById('divLeftForm').style.display = 'block';

            document.getElementById('<%= txtFilterOrder.ClientID %>').value = "";
            document.getElementById('<%= txtFilterOrderDate.ClientID %>').value = "";
            document.getElementById('<%= txtFilter.ClientID %>').value = "";

            
        }

        function showCalender() 
        
        {
            if (document.getElementById('<%= ddlOrderNo.ClientID %>').value = "1") 
            {

                document.getElementById('<%= fidByorderDate.ClientID %>').style.display = 'block';

            }
            else if (document.getElementById('<%= ddlOrderNo.ClientID %>').value = "0")
            {
                alert('csac');
                document.getElementById('<%= fidByorderDate.ClientID %>').style.display = 'none';
            }

            else if (document.getElementById('<%= ddlOrderNo.ClientID %>').value = "2") 
            {
                alert('csac');
                document.getElementById('<%= fidByorderDate.ClientID %>').style.display = 'none';
            }
        }


    </script>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="display:block; position:absolute; left:100px; top:20px; height:500px; width:700px; ">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:6px; top:5px; height:70px; width:688px; border:0px solid gray; ">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Order Entry" style="position:absolute; left:5px; top:10px; " ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:686px; left:0px;" />   
        </div>
    

    <div id="divHawkerInfo" class="divHawkerInfo" style="border:0px solid red; top:-40px; height:443px;">

        <asp:Label ID="lblOrderNumber" CssClass="labelTextField" runat="server" Text="Order Number"  style="position:absolute; top:8px; left:20px;"></asp:Label>
        <asp:TextBox ID="txtOrderNumber" runat="server" CssClass="textBox" Text="****** New ******"  style="position:absolute; width:150px; top:5px; left:160px; text-align:center;"  ></asp:TextBox>
        
        <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" style="position:absolute; width:20px; top:7px; left:110px;" onclick="btnFirst_Click" />
        <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" style="position:absolute; width:20px; top:7px; left:135px;" onclick="btnPrevious_Click" />

        <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" style="position:absolute; width:20px; top:7px; left:320px;" onclick="btnNext_Click" />
        <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" style="position:absolute; width:20px; top:7px; left:345px;" onclick="btnLast_Click" />

        <asp:ImageButton ID="imgNew" runat="server" ImageUrl="~/Images/New.JPG" style="position:absolute; width:20px; top:7px; left:370px;" onclick="imgNew_Click" />
        <asp:ImageButton ID="imgOrderFinder" runat="server" ToolTip="Order No.Finder" 
            onclientclick="javascript:showOrderFinderDiv();" 
            Style="position: absolute; left: 395px; top:7px; width: 20px; height: 20px;" 
            ImageUrl="~/Images/Finder.jpg" onclick="imgOrderFinder_Click"  />

        <asp:Label ID="lblOrderDate" CssClass="labelTextField" runat="server" Text="Order Date"  style="position:absolute; top:43px; left:20px;"></asp:Label>
        <asp:TextBox ID="txtOrderDate" runat="server" CssClass="textBox"  style="position:absolute;   top:40px; left:108px;"  ></asp:TextBox>
        
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left: 315px; top:42px; width: 20px; height: 20px;" ImageUrl="~/Images/Calendar.jpg" />


        <asp:Label ID="lblHawkerId" CssClass="labelTextField" runat="server" Text="Agent ID"  style="position:absolute; top:80px; left:20px; "  ></asp:Label>
        <asp:TextBox ID="txtHawkerId" runat="server" CssClass="textBox"  style="position:absolute;  top:75px; left:108px; text-align:center;" 
                  OnTextChanged="txtHawkerId_TextChanged"></asp:TextBox>
        <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Find Agent" onclientclick="javascript:showFinderDiv();" Style="position: absolute; left:315px; top:78px; width:20px; height:20px;" ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />
        
        <asp:Label ID="lblSubRoute" CssClass="labelTextField" runat="server" Text="Sub-Route"  style="position:absolute; top:113px; left:20px; "  ></asp:Label>
        <asp:DropDownList ID="ddlSubRoute" runat="server" CssClass="dropdownlist" style="position:absolute; top:110px; left:108px; text-align:center;"  ></asp:DropDownList>

        <asp:Label ID="lblVechile" CssClass="labelTextField" runat="server" Text="Vehicle"  style="position:absolute; top:148px; left:20px;"></asp:Label>
        <asp:DropDownList ID="ddlVechile" runat="server" CssClass="dropdownlist" style="position:absolute; top:145px; left:108px; text-align:center;"  ></asp:DropDownList>

        <asp:Label ID="lblEdition" CssClass="labelTextField" runat="server" Text="Edition"  style="position:absolute; top:183px; left:20px;"></asp:Label>
        
        <asp:DropDownList ID="ddlEdition" runat="server" CssClass="dropdownlist" style="position:absolute; top:180px; left:108px; text-align:center;"  >
            
            <asp:ListItem Selected="True">--Select--</asp:ListItem>
            <asp:ListItem>City Edition</asp:ListItem>
            <asp:ListItem>North Edition</asp:ListItem>
            <asp:ListItem>South Edition</asp:ListItem>

        </asp:DropDownList>

        <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:43px; left:360px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory" AutoPostBack="true" runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:40px; left:440px; width:100px; text-align:center;" 
            ontextchanged="ddlCategory_TextChanged"  >
        </asp:DropDownList>

            <asp:Label ID="lblRate" CssClass="labelTextField" runat="server" Text="Rate"  style="position:absolute; top:43px; left:545px; "  ></asp:Label>
            <asp:TextBox ID="txtRate" runat="server" CssClass="textBox"  style="position:absolute;  top:40px; left:578px; width:67px; text-align:center;" OnClick="javascript:forboden();" ></asp:TextBox>
       
            <asp:Label ID="lblSalesType" CssClass="labelTextField" runat="server" Text="Sales Type"  style="position:absolute; top:80px; left:360px; "  ></asp:Label>
            <asp:DropDownList ID="ddlSalesType" runat="server" CssClass="dropdownlist" onchange="Javascript:salesType();" style="position:absolute; top:75px; left:440px; text-align:center;"  >
        
            <asp:ListItem Selected="True">--Select--</asp:ListItem>
            <asp:ListItem Value="0">Cash</asp:ListItem>
            <asp:ListItem Value="1">Credit</asp:ListItem>
            
            </asp:DropDownList>

            <div id="divCreditSalesType" style="position:absolute; height:60px; display:none;  left:360px; top:110px; width:300px; border:solid #dadada 1px; -moz-box-shadow: 0px 1px 0px #3a3a3a; ">
            
                <asp:CheckBox ID="chkLineWise" CssClass="labelTextField" onclick="javascript:lineWiseSales();" runat="server" Text="Line Wise" style="position:absolute; top:5px;" />
                <asp:CheckBox ID="chkCorporate" CssClass="labelTextField" onclick="javascript:corporateSales();" runat="server" Text="Corporate" style="position:absolute;  top:5px; left:150px;" />
                
                <div id="divCorporateType"  style="position:absolute; height:25px; display:none; left:0px; top:30px; width:300px; border-top:solid #dadada 1px; -moz-box-shadow: 0px 1px 0px #3a3a3a; ">
                    
                    <asp:CheckBox ID="chkPostPaid" CssClass="labelTextField" onclick="javascript:corporateType();" runat="server" Text="Post Paid" style="position:absolute; top:0px;" />
                    <asp:CheckBox ID="ChkPrepaid" CssClass="labelTextField" onclick="javascript:corporateType();" runat="server" Text="Pre-Paid" style="position:absolute;  top:0px; left:150px;" />
                                      
                </div>
            

            </div>

            <div id="divCashSalesType" style="position:absolute; display:none; height:40px; left:360px; top:110px; width:300px; border:solid #dadada 1px; -moz-box-shadow: 0px 1px 0px #3a3a3a; ">
          
            <asp:RadioButtonList ID="rbACashSales" CssClass="labelTextField"  runat="server" Font-Size="12px" 
                        RepeatDirection="Horizontal"  CellPadding="8" 
                        style="position:absolute; width:300px; left:5px; top:0px; font-family: Verdana;">
                            <asp:ListItem Text="Floating Street" ></asp:ListItem>
                            <asp:ListItem Text="Floating Outlet"></asp:ListItem>
                    </asp:RadioButtonList>

            </div>
       



        <hr style="position:absolute; top:200px; border-bottom: solid #dadada 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:686px; left:0px;" />   

        <div id="divInput" class="divclsInput" style="position:absolute; height:180px; width:670px; top:210px; left:7px; overflow:auto;">

            <asp:GridView ID="grdOrder" runat="server" Style="position: absolute; top:3px;
                left:3px; height:auto; width:665px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="100"
                onrowcreated="grdOrder_RowCreated" onrowdatabound="grdOrder_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        <%--<asp:CommandField ItemStyle-Width="50px" ShowEditButton="True" ShowHeader="True" />--%>
                        <%--<asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>

                        <asp:BoundField DataField="stationId" SortExpression="stationId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                       
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Style="width:130px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Bonus Copy">
                            <ItemTemplate>
                                <asp:TextBox ID="txtBonus" runat="server" Style="width:130px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Complementary Copy">
                            <ItemTemplate>
                                <asp:TextBox ID="txtComplementary" runat="server" Style="width:140px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Packet Type">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPacket" runat="server" Style="width:130px">
                                    
                                    <asp:ListItem Selected="True">--Select--</asp:ListItem>
                                    <asp:ListItem>Individual</asp:ListItem>
                                    <asp:ListItem>Special</asp:ListItem>
                                    <asp:ListItem>Combined</asp:ListItem>
                                    <asp:ListItem>OverPacked</asp:ListItem>

                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                          
                            
                 </Columns>

                    
            </asp:GridView>
    
        </div>
    <hr style="position:absolute; top:390px; border-bottom: solid #dadada 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:686px; left:0px;" />
    
    <asp:Button id="btnSaveOrder" CssClass="Submitbutton" runat="server" Text="Save Order" 
            style="position:absolute; top:405px; left:245px; height:30px;" onclick="btnSaveOrder_Click"  /> 

    <asp:Button id="btnPost" CssClass="Submitbutton" Enabled="false" runat="server" Text="Post" 
            style="position:absolute; top:405px; left:355px; height:30px;" 
            onclick="btnPost_Click" />     

    </div>

 </div>
    
     <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarOrderdate" runat="server" TargetControlID="txtOrderDate"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendar">
    </cc1:CalendarExtender>

    <cc1:CalendarExtender ID="CalendarFindOrder" runat="server" TargetControlID="txtFilterOrder"  
        Format="dd-MMM-yyyy" PopupButtonID="fidByorderDate">
    </cc1:CalendarExtender>

    <cc1:CalendarExtender ID="CalendarFindOrderDate" runat="server" TargetControlID="txtFilterOrderDate"  
        Format="dd-MMM-yyyy" PopupButtonID="findorderDate">
    </cc1:CalendarExtender>


    <div id="divOrderNoFinder" class="divclsFrm" style="display:none; position:absolute; ">
      
      <div id="divOrderNoFrm" class="divclsInput"  runat="server" style="width: 548px; position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnNoBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:35px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews1" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            
            <asp:Label ID="lblFindby1" runat="server" Text="Find By" Style="position: absolute;
                top:13px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            
            <asp:DropDownList ID="ddlOrderNo" runat="server" onchange="javascript:showCalender();" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                
                <asp:ListItem Value="0">Agent Name</asp:ListItem>
                <asp:ListItem Value="1">Order Date</asp:ListItem>
                <asp:ListItem Value="2">Order Id</asp:ListItem>
                
                
            </asp:DropDownList>
            
            <asp:DropDownList ID="ddlSelectType1" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblFilter1" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter " ForeColor="Black"></asp:Label>

            <asp:Image ID="fidByorderDate" runat="server"  ToolTip="Select Date" Style="position: absolute; display:none; left: 270px; top:58px; width: 20px; height: 20px;" ImageUrl="~/Images/Calendar.jpg" />
        </asp:Panel>

        <asp:TextBox ID="txtFilterOrder" runat="server" Style="position: absolute; top: 60px;
                left: 123px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True"  OnTextChanged="txtFilterOrder_TextChanged"
                TabIndex="1"></asp:TextBox>
        
            <asp:Label ID="lblFilterDate" runat="server" Style="position: absolute; left:310px; top:16px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter Date " ForeColor="Black"></asp:Label>

            <asp:TextBox ID="txtFilterOrderDate" runat="server" Style="position: absolute; top:13px;
                left:390px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True"  OnTextChanged="txtFilterOrderDate_TextChanged"
                TabIndex="1"></asp:TextBox>

            <asp:Image ID="findorderDate" runat="server"  ToolTip="Select Date" Style="position: absolute; left:542px; top:13px; width: 20px; height: 20px;" ImageUrl="~/Images/Calendar.jpg" />

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



</asp:Content>

