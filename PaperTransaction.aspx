<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaperTransaction.aspx.cs" Inherits="PaperTransaction" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">

    function Validate() 
    {
        if (document.getElementById("<%=txtTransactionId.ClientID %>").value == "") 
        {
            alert("Enter An Amount In Deposit Field");
            document.getElementById("<%=txtTransactionId.ClientID %>").focus();
            return false;
        }

        else if (document.getElementById("<%=txtDate.ClientID %>").value == "") 
        {
            alert("Enter Date In Date Field");
            document.getElementById("<%=txtDate.ClientID %>").focus();
            return false;
        }
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:40px; height:195px; width:700px; ">
    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:183px; width:688px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Competitor Sales" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:21px; color:#57677F; width:688px; left:-1px;" />   
    </div>

<asp:Label ID="autoIdLabel" CssClass="labelTextField" Visible="false" runat="server" Text="Transaction Id" style=" position:absolute; top:53px; left:160px"></asp:Label>
<asp:TextBox ID="txtTransactionId" CssClass="textBox" runat="server" Visible="false" 
         style=" position:absolute; left:260px; top:50px; width:150px;"  > </asp:TextBox>

<%--<asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Grd_Previous.png" 
         style=" border:1px solid gray; border-radius:15px; position:absolute; left:430px; top:50px" onclick="btnPrevious_Click" />

<asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Grd_Next.png" 
         style=" position:absolute; top:50px; left:460px; border:1px solid Gray; border-radius:15px" onclick="btnNext_Click" />--%>

<asp:Label ID="dateLabel" CssClass="labelTextField" runat="server" Text="Transaction Date" style=" position:absolute; top:53px; left:160px"></asp:Label>
<asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:418px; top:54px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

<asp:Label ID="lblStation" CssClass="labelTextField" runat="server" Text="Station" style=" position:absolute; top:93px; left:160px"></asp:Label>
<asp:DropDownList ID="ddlStation" runat="server" CssClass="dropdownlist" AutoPostBack="true"
         style="position:absolute; top:90px; width:150px; left:260px;" 
         onselectedindexchanged="ddlStation_SelectedIndexChanged" ></asp:DropDownList>

<asp:Button ID="btnSave" CssClass="Submitbutton"  runat="server" Text="Save" style="position:absolute; left:200px; height:30px; width:80px; top:140px;" onclick="btnSave_Click"  />

<asp:Button ID="btnUpdate" CssClass="Submitbutton" runat="server" Text="Update" Enabled="false" style="position:absolute; top:140px; height:30px; width:80px; left:300px;" onclick="btnUpdate_Click"/>

<asp:Button ID="btnCancel" CssClass="Submitbutton" runat="server" Text="Cancel" style="position:absolute; top:140px; left:400px; height:30px; width:80px ;" />

<asp:Label ID="msgLabel" runat="server" style=" position:absolute; top:130px; left:254px; font-family:MS Sans Serif; color:Green"></asp:Label> 


 </div>


<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:250px; height:270px; width:700px;">
<div id="grdFrm" class="divclsFrm" style="position:absolute; background-color:#C3C5E5; left:5px; top:5px; height:260px; width:690px; overflow:auto; "  >
 
 <asp:GridView ID="gridView" runat="server" Style="position: absolute; top:3px;
                left:15px; height:auto; width:655px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="190"
                onrowcreated="gridView_RowCreated" onrowdatabound="gridView_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 
        
        <Columns>
            
            <asp:BoundField DataField="PAPERNAME" SortExpression="PAPERNAME"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
            <asp:BoundField DataField="PAPERTYPE" SortExpression="PAPERTYPE"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

            <asp:TemplateField HeaderText="" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPaperQuantity" runat="server" Style="width:100px; background-color:Yellow;">
                                </asp:TextBox>
                            </ItemTemplate>
            </asp:TemplateField> 

            <asp:TemplateField HeaderText="" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:TextBox ID="txtReturnQuantity" runat="server" Style="width:100px; background-color:Yellow;">
                                </asp:TextBox>
                            </ItemTemplate>
            </asp:TemplateField> 



        </Columns>


</asp:GridView>

</div>

</div>

<div>
<asp:ScriptManager ID="ScriptManager1" runat="server"> </asp:ScriptManager>
        
        <asp:TextBox ID="txtDate" CssClass="textBox" runat="server" ontextchanged="txtDate_TextChanged" AutoPostBack="true" style=" position:absolute; left:360px; top:90px; width:150px; "></asp:TextBox>
        
        <cc1:CalendarExtender ID="calendarFromDate" runat="server" TargetControlID="txtDate" PopupButtonID="imgCalendar"
         Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

</div>

</asp:Content>


