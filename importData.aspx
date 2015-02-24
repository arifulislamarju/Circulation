<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="importData.aspx.cs" Inherits="importData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="divTopForm" style="position:absolute; left:220px; top:110px; height:180px; width:430px; border:2px solid gray; ">

    <div id="divFormHeader" style="position:absolute; left:5px; top:5px; height:168px; width:418px; border:1px solid #ADB1AF; border-radius:7px; background-color:#ADB1AF; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Import Excel Data" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; border-bottom: solid GrayText 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:418px; left:-1px;" />   
    </div>

        <asp:Label ID="lblFileImport"  runat="server" CssClass="labelTextField" Text="Import Excel File"  style="position:absolute; top:60px; left:40px;" > </asp:Label>       
        <asp:FileUpload ID="xlsFile" runat="server" CssClass="textBox" style="position:absolute; top:57px; left:150px;" />

        <asp:Label ID="lblDbTable"  runat="server" CssClass="labelTextField" Text="Database Table"  style="position:absolute; top:93px; left:40px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDbTable" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                   style="position:absolute; top:90px; left:150px; width:160px;" > </asp:DropDownList>

        <asp:Label ID="lblMessages" runat="server" Text=""></asp:Label>
        
        <asp:Button id="btnImport" CssClass="Submitbutton" runat="server"  text="Import" style="position:absolute; top:130px; left:160px; height:30px;" onclick="btnImport_Click" />


</div>




</asp:Content>

