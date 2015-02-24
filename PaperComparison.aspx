<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PaperComparison.aspx.cs" Inherits="PaperComparison" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
   
    function Validate() 
    {
        if (document.getElementById("<%=txtId.ClientID %>").value == "") 
        {
            alert("Enter A ID");
            document.getElementById("<%=txtId.ClientID %>").focus();
            return false;
        }

        else if (document.getElementById("<%=txtName.ClientID %>").value == "") 
        {
            alert("Enter a Paper Name");
            document.getElementById("<%=txtName.ClientID %>").focus();
            return false;
        }
    }

</script>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:40px; height:195px; width:700px;">
    
    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:183px; width:688px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Competitor Name" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:21px; color:#57677F; width:688px; left:-1px;" />   
    </div>

        
<asp:Label ID="lblId" runat="server" CssClass="labelTextField" Text="Paper Id" style=" position:absolute; top:53px; left:60px"></asp:Label>
<asp:TextBox ID="txtId" runat="server" CssClass="textBox" style=" position:absolute; left:160px; top:50px; width:150px;"></asp:TextBox>

<asp:Label ID="lblName" runat="server" CssClass="labelTextField" Text="Paper Name" style=" position:absolute; top:83px; left:60px"></asp:Label>
<asp:TextBox ID="txtName" runat="server" CssClass="textBox" style=" position:absolute; left:160px; top:80px; width:150px; "></asp:TextBox>

<asp:Label ID="lblPaperType" runat="server" CssClass="labelTextField" Text="Paper Type" style=" position:absolute; top:53px; left:390px"></asp:Label>
<asp:DropDownList ID="ddlPaperType" CssClass="dropdownlist" runat="server" style="position:absolute; left:470px; top:50px; width:150px;">       
        <asp:ListItem>--Select--</asp:ListItem>
        <asp:ListItem>Local</asp:ListItem>
        <asp:ListItem>National</asp:ListItem>      
    </asp:DropDownList>


<asp:Label ID="lblPaperPrc" runat="server" CssClass="labelTextField" Text="Paper Price" style=" position:absolute; top:83px; left:390px"></asp:Label>
<asp:TextBox ID="txtPaperPrc" runat="server" CssClass="textBox" style=" position:absolute; left:470px; top:80px; width:150px; "></asp:TextBox>

<asp:Label ID="userTypeLabel" runat="server" CssClass="labelTextField" Text="User Type" style=" position:absolute; top:121px; left:60px"></asp:Label>

<asp:RadioButtonList ID="rdbtnActive" runat="server"  RepeatDirection="Horizontal" style=" position:absolute; top:115px; left:160px; border:1px Solid Silver; color:#2F5A45; width:164px">
      <asp:ListItem Text="Active" Selected="True" Value="0"></asp:ListItem>
      <asp:ListItem Text="Inactive" Value="1"></asp:ListItem>
</asp:RadioButtonList>

<asp:Label ID="lblSortingOrder" runat="server" CssClass="labelTextField" Text="Sort Order" style=" position:absolute; top:115px; left:390px"></asp:Label>
<asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style=" position:absolute; left:470px; top:112px; width:150px; "></asp:TextBox>

<%--<asp:RadioButton ID="rdbtnInActive" runat="server" Text="Inactive" style=" position:absolute; top:160px; left:280px; border:1px Solid Silver" />--%>

<asp:Button ID="btnSave" runat="server" CssClass="Submitbutton" Text="Save" 
       style="position:absolute; left:200px; height:30px; width:80px; top:150px;" 
        onclick="btnSave_Click"  />

<asp:Button ID="btnUpdate" runat="server" CssClass="Submitbutton" Text="Update" 
        style="position:absolute; top:150px; height:30px; width:80px; left:300px;" onclick="btnUpdate_Click" />

<asp:Button ID="btnCancel" runat="server" CssClass="Submitbutton" Text="Cancel" 
        style="position:absolute; top:150px; left:400px; height:30px; width:80px ;" onclick="btnCancel_Click" />

<asp:Label ID="msgLabel" runat="server" style=" position:absolute; top:150px; left:254px; font-family:MS Sans Serif; color:Green"></asp:Label>

</div>



<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:260px; height:250px; width:700px;">

   <div id="displayDiv" class="divclsInput" style="position:absolute; left:5px; top:5px; height:238px; width:690px; overflow:auto; " >

    <asp:GridView ID="gridView" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="PID" 
                Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;"  
        onselectedindexchanged="gridView_SelectedIndexChanged" BackColor="White" 
        BorderColor="White" BorderStyle="Ridge" BorderWidth="2px" CellSpacing="1" 
        GridLines="None" >

        <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
        <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
        <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    

       <Columns>

       <asp:BoundField DataField="PID" HeaderText="Paper ID" HeaderStyle-BackColor="#BAD0DD" ItemStyle-Width="60px"  />
       <asp:BoundField DataField="PAPERNAME" HeaderText="Name"  HeaderStyle-BackColor="#BAD0DD"  />
       <asp:BoundField DataField="PAPERTYPE" HeaderText="Paper Type"  HeaderStyle-BackColor="#BAD0DD"  />
       <asp:BoundField DataField="PAPERPRICE" HeaderText="Paper Price (Tk)"  HeaderStyle-BackColor="#BAD0DD"  />
       <asp:BoundField DataField="DATES" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}"  HeaderStyle-BackColor="#BAD0DD"  ItemStyle-Width="100px"  />
       <asp:BoundField DataField="AUDITOR" HeaderText="Created By" ItemStyle-Width="100px" HeaderStyle-BackColor="#BAD0DD"  />
       <asp:BoundField DataField="sortOrder" HeaderText="Sort Order" ItemStyle-Width="100px" HeaderStyle-BackColor="#BAD0DD"  />
       <%--<asp:BoundField DataField="USTATUS" HeaderText="Status"  HeaderStyle-BackColor="#BAD0DD"  />--%>

         <asp:CommandField ShowSelectButton="True" SelectText="Edit" HeaderText="Edit Group"  HeaderStyle-BackColor="#BAD0DD" 
                        HeaderStyle-HorizontalAlign="Left" ItemStyle-ForeColor="Blue" HeaderStyle-Width="50px" ItemStyle-Width="50px" >
                    <HeaderStyle HorizontalAlign="Center" Width="70px" />
            <ItemStyle ForeColor="Blue" Width="50px" />
         </asp:CommandField>
            
        </Columns>

        <%--<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />
        <PagerStyle BackColor="#C6C3C6" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#9471DE" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#594B9C" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#33276A" />--%>

    </asp:GridView>

</div>

</div>


</asp:Content>

