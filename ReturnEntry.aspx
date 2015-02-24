<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReturnEntry.aspx.cs" Inherits="ReturnEntry" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function clickEnter(obj, event) 
        {
            var keyCode;
            if (event.keyCode > 0) {
                keyCode = event.keyCode;
            }
            else if (event.which > 0) {
                keyCode = event.which;
            }
            else {
                keycode = event.charCode;
            }
            if (keyCode == 13) 
            {
                document.getElementById(obj).focus();
                return false;
            }
            else 
            {
                return true;
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
            document.getElementById('divOrderNoFinder').style.display = 'none';
            document.getElementById('divFinder').style.display = 'none';
            document.getElementById('divLeftForm').style.display = 'block';

            document.getElementById('<%= txtFilterOrder.ClientID %>').value = "";

            document.getElementById('<%= txtFilter.ClientID %>').value = "";
        }


    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="display:block; position:absolute; left:100px; top:40px; height:448px; width:698px; ">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:436px; width:688px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Return Entry" style="position:absolute; left:5px; top:10px; " ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:686px; left:0px;" />   
        </div>
    

    <div id="divHawkerInfo" class="divHawkerInfo" style="border:0px solid red; top:-40px; height:390px;">

        <asp:Label ID="lblReturnNumber" CssClass="labelTextField" runat="server" Text="Return Number"  style="position:absolute; top:8px; left:20px;"></asp:Label>
        <asp:TextBox ID="txtReturnNumber" runat="server" CssClass="textBox" Text="****** New ******"  style="position:absolute; width:150px; top:5px; left:160px; text-align:center;"  ></asp:TextBox>
        
        <asp:ImageButton ID="imgOrderFinder" runat="server" ToolTip="Return No.Finder" onclientclick="javascript:showFinderDiv();" 
                   Style="position: absolute; left: 370px; top:7px; width: 20px; height: 20px;" ImageUrl="~/Images/Finder.jpg" onclick="imgOrderFinder_Click"/>

        <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" style="position:absolute; width:20px; top:7px; left:110px;" onclick="btnFirst_Click" />
        <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" style="position:absolute; width:20px; top:7px; left:135px;" onclick="btnPrevious_Click" />

        <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" style="position:absolute; width:20px; top:7px; left:320px;" onclick="btnNext_Click" />
        <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" style="position:absolute; width:20px; top:7px; left:345px;" onclick="btnLast_Click" />

        <%--<asp:ImageButton ID="imgNew" runat="server" ImageUrl="~/Images/New.JPG" style="position:absolute; width:20px; top:7px; left:370px;" onclick="imgNew_Click" />--%>

        <asp:Label ID="lblOrderNo" CssClass="labelTextField" runat="server" Text="Order No."  style="position:absolute; top:48px; left:20px; "  ></asp:Label>
        <asp:TextBox ID="txtOrderNo" runat="server" CssClass="textBox"  style="position:absolute;  top:43px; left:108px; text-align:center;" 
                  OnTextChanged="txtOrderNo_TextChanged"></asp:TextBox>
        <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Order Finder" onclientclick="javascript:showOrderFinderDiv();" 
                         Style="position: absolute; left:315px; top:46px; width:20px; height:20px;" ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />
        
        <asp:Label ID="lblCusName" CssClass="labelTextField" runat="server" Text="Customer Name:"  style="position:absolute; top:8px; left:400px; "  ></asp:Label>
        <asp:Label ID="lblCusNameDisplay" CssClass="labelTextField" runat="server" Text=""  style="position:absolute; color:Black; top:8px; left:500px; width:300px; "  ></asp:Label>

            <asp:Label ID="lblReturnDate" CssClass="labelTextField" runat="server" Text="Return Date"  style="position:absolute; top:45px; left:360px;"></asp:Label>
            <asp:TextBox ID="txtReturnDate" runat="server" CssClass="textBox"  style="position:absolute;   top:40px; left:440px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:648px; top:44px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />


        <hr style="position:absolute; top:90px; border-bottom: solid #dadada 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:686px; left:0px;" />   

        <div id="divInput" class="divclsInput" style="position:absolute; height:220px; width:670px; top:105px; left:7px; overflow:auto;">

            <asp:GridView ID="grdOrder" runat="server" Style="position: absolute; top:3px; text-align:center;
                left:3px; height:auto; width:665px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="false" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="200"
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
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="Quantity" SortExpression="Quantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  

                        <asp:BoundField DataField="BonusCopy" SortExpression="BonusCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                        <%--<asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server" Style="width:70px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Bonus Copy">
                            <ItemTemplate>
                                <asp:TextBox ID="txtBonus" runat="server" Style="width:80px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Regular Return">
                            <ItemTemplate>
                                <asp:TextBox ID="txtReturnCopy"   BackColor="Yellow" runat="server" Style="width:90px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Additional Return">
                            <ItemTemplate>
                                <asp:TextBox ID="txtAdditionalReturn" BackColor="Yellow" runat="server" Style="width:110px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Reason of Return">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlReason" runat="server" Style="width:170px">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                          
                            
                 </Columns>

                    
            </asp:GridView>
    
        </div>
    <hr style="position:absolute; top:325px; border-bottom: solid #dadada 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:686px; left:0px;" />
    
    <asp:Button id="btnSaveOrder" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:350px; left:245px; height:30px;" onclick="btnSaveOrder_Click"  /> 

    <asp:Button id="btnPost" CssClass="Submitbutton" Enabled="false" runat="server" Text="Post" 
            style="position:absolute; top:350px; left:355px; height:30px;" 
            onclick="btnPost_Click" />     

    </div>

 </div>
    
     <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarOrderdate" runat="server" TargetControlID="txtReturnDate"  
        Format="dd-MMM-yyyy" PopupButtonID="imgCalendar">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtFilterOrderDate"  
        Format="dd-MMM-yyyy" PopupButtonID="findorderDate">
    </cc1:CalendarExtender>



    <div id="divOrderNoFinder" class="divclsFrm" style="display:none; position:absolute; ">
      
      <div id="divOrderNoFrm" class="divclsInput"  runat="server" style="width: 548px; position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnNoBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:35px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews1" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            
            <asp:Label ID="lblFindby1" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            
            <asp:DropDownList ID="ddlCustomer1" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Customer Name</asp:ListItem>
                <asp:ListItem>Customer ID</asp:ListItem>
                <asp:ListItem>Order No</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="ddlSelectType1" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblFilter1" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            
            <asp:TextBox ID="txtFilterOrder" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" OnTextChanged="txtFilterOrder_TextChanged"
                TabIndex="1"></asp:TextBox>

        <asp:Label ID="lblFilterDate" runat="server" Style="position: absolute; left:310px; top:16px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter Date " ForeColor="Black"></asp:Label>

            

            <asp:Image ID="findorderDate" runat="server"  ToolTip="Select Date" Style="position: absolute; left:542px; top:13px; width: 20px; height: 20px;" ImageUrl="~/Images/Calendar.jpg" />


        </asp:Panel>
        <asp:TextBox ID="txtFilterOrderDate" runat="server" Style="position: absolute; top:13px;
                left:390px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True"  OnTextChanged="txtFilterOrderDate_TextChanged"
                TabIndex="1"></asp:TextBox>
        
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
                <asp:ListItem>Order No</asp:ListItem>
                <asp:ListItem>Return No</asp:ListItem>
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


