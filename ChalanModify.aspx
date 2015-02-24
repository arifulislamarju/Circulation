<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChalanModify.aspx.cs" Inherits="ChalanModify" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divLeftForm" class="divclsFrm" style="display:block; position:absolute; left:100px; top:20px; height:500px; width:700px; ">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:6px; top:5px; height:490px; width:688px; border:0px solid gray; ">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Chalan Modify" style="position:absolute; left:5px; top:10px; " ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:686px; left:0px;" />   
        </div>

        <asp:Label ID="lblOrderDate"  runat="server" CssClass="labelTextField" Text="Order Date"  style="position:absolute; top:53px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txtOrderDate" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="txtOrderDate_TextChanged" style="position:absolute; top:50px; left:80px; width:120px; " ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:208px; top:53px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:53px; left:240px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory"  runat="server" AutoPostBack="true"
            CssClass="dropdownlist" 
            
        style="position:absolute; top:50px; left:295px; width:130px;  text-align:center;" 
        onselectedindexchanged="ddlCategory_SelectedIndexChanged">
            
        </asp:DropDownList>


        <asp:Label ID="lblSubRoute"  runat="server" CssClass="labelTextField" Text="Sub-Route" style="position:absolute; top:53px; left:430px;" ></asp:Label>
        <asp:DropDownList ID="ddlSubRoute" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                          style="position:absolute; top:50px; left:500px; width:170px; " onselectedindexchanged="ddlSubRoute_SelectedIndexChanged" > </asp:DropDownList>

        <div id="divInput" class="divclsInput" style="position:absolute; height:350px; width:680px; top:90px; left:7px; overflow:auto;">

            <asp:GridView ID="grdOrder" runat="server" Style="position: absolute; top:3px;
                left:5px; height:auto; width:655px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="190"
                onrowcreated="grdOrder_RowCreated" onrowdatabound="grdOrder_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        <%--<asp:CommandField ItemStyle-Width="50px" ShowEditButton="True" ShowHeader="True" />--%>
                        <%--<asp:CommandField HeaderText="Edit" ShowEditButton="True" ShowHeader="True" />--%>

                        <asp:BoundField DataField="customerId" SortExpression="customerId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="hkrNameEng" SortExpression="hkrNameEng"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="160px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                        <asp:BoundField DataField="quantity" SortExpression="quantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="daywiseDefQuanttity" SortExpression="daywiseDefQuanttity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <%--<asp:TemplateField HeaderText="Quantity">
                            <ItemTemplate>
                                <asp:TextBox ID="txtQuantity" runat="server"  ReadOnly="true" Style="width:60px">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>--%>

                        <asp:TemplateField HeaderText="Modify Qty.">
                            <ItemTemplate>
                                <asp:TextBox ID="txtdaywiseChngQuantity" runat="server" Style="width:60px; background-color:Yellow;">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Bonus Copy">
                            <ItemTemplate>
                                <asp:TextBox ID="txtBonus" runat="server" Style="width:60px; background-color:Yellow;">
                                </asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Packet Type">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPacket" runat="server" Style="width:90px">
                                    
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


    <div id="Calendar">

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server" TargetControlID="txtOrderDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        
     </div>

    <asp:Button id="btnUpdate" CssClass="Submitbutton" runat="server" Text="Update" 
            style="position:absolute; top:455px; left:290px; height:30px;" onclick="btnUpdate_Click" />     

 </div>


</asp:Content>

