<%@ Page Language="C#" AutoEventWireup="true" CodeFile="findCustomer.aspx.cs" Inherits="findCustomer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Customer finder</title>

    

</head>
<body>
    <form id="form1" runat="server">
     <div id="divFrm"  runat="server" style="width: 548px; background-color: Lavender; border: groove 1px gray;
        position: absolute; height: 484px; width:1130px; top: 12px; left: 8px;">

            <asp:Panel ID="pnlAddNews" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 1124px; height: 84px; border: groove 1px gray;">
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
                height: 16px;" AutoPostBack="True" 
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel1" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 1124px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdCustomer" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both"
                AutoGenerateSelectButton="True" 
                OnPageIndexChanging="grdCustomer_PageIndexChanging"
                OnSelectedIndexChanged="grdCustomer_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdCustomer_RowDataBound">
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
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
    </div>
    </form>
</body>
</html>
