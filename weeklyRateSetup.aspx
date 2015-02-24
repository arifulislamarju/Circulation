<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="weeklyRateSetup.aspx.cs" Inherits="weeklyRateSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <script type="text/javascript">

       
 </script>

 <style type="text/css">
      
      
.Box
{   
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    text-align: center;
    border:1px solid black;
    border-radius: 4px;
    border-color:#A3A3A3;
    height:25px;
    width:110px;
    behavior: url(PIE.htc);    
    font-size:14px;
    font-family: Helvetica, Arial, "Sans Serif";
    font-weight:normal;
    color:#2F5A45;
    
    
}



  </style>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="divMainForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:360px; width:700px;">

 <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:350px; width:690px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Weekly Rate Setup" style="position:absolute; left:5px; top:10px; font-size:18px; right: 283px;" ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:688px; left:0px;" /> 

            <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category" style="position:absolute;  left:160px; top:49px;" ></asp:Label>
            <asp:DropDownList ID="ddlCategory" AutoPostBack="true" CssClass="dropdownlist" 
                runat="server" style="position:absolute; left:220px; top:46px; " 
                onselectedindexchanged="ddlCategory_SelectedIndexChanged" >
            
            </asp:DropDownList>

            <%--<asp:TextBox ID="txtCategory"  CssClass="textBox" runat="server" style="position:absolute; left:100px; top:46px; display:none;" ></asp:TextBox>
            <asp:Button ID="btnNewCategory" runat="server" Text="New" style="position:absolute; left:330px; top:45px;" OnClientClick="showCategory();" />


            <input type="button" value="New" id="btnNewCategory"  style="position:absolute; left:450px; top:45px;" onclick="showCategory()" />--%>
            <hr style="position:absolute; top:66px; color:#57677F; width:688px; left:0px;" /> 

</div>

<div id="day" style="position:absolute; width:110px; height:200px; margin-top:90px; margin-left: 160px;">
     <asp:Label ID="lblDay" runat="server" class="Box" Text="Day" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:Label ID="lblSat" runat="server" class="Box" Text="SAT" style="position:absolute; top:25px; "> </asp:Label>
     <asp:Label ID="lblSun" runat="server" class="Box" Text="SUN" style="position:absolute; top:50px; "> </asp:Label>
     <asp:Label ID="lblMon" runat="server" class="Box" Text="MON" style="position:absolute; top:75px; "> </asp:Label>
     <asp:Label ID="lblTues" runat="server" class="Box" Text="TUE" style="position:absolute; top:100px; "> </asp:Label>
     <asp:Label ID="lblWed" runat="server" class="Box" Text="WED" style="position:absolute; top:125px; "> </asp:Label>
     <asp:Label ID="lblThurs" runat="server" class="Box" Text="THU" style="position:absolute; top:150px; "> </asp:Label>
     <asp:Label ID="lblFri" runat="server" class="Box" Text="FRI" style="position:absolute; top:175px; "> </asp:Label>

</div>


<div id="noOfPage" style="position:absolute; width:110px; height:200px; margin-top:90px; margin-left: 274px;">
     <asp:Label ID="lblPage" runat="server" class="Box" Text="No. Of Page" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtSatPage" runat="server" class="Box" style="position:absolute; top:25px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtSunPage" runat="server" class="Box" style="position:absolute; top:50px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtMonPage" runat="server" class="Box" style="position:absolute; top:75px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtTuesPage" runat="server" class="Box" style="position:absolute; top:100px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtWedPage" runat="server" class="Box" style="position:absolute; top:125px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtThursPage" runat="server" class="Box" style="position:absolute; top:150px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtFriPage" runat="server" class="Box" style="position:absolute; top:175px; color:Black; "> </asp:TextBox>

</div>


<div id="rate" style="position:absolute; width:110px; height:200px; margin-top:90px; margin-left: 388px;">
     <asp:Label ID="lblRate" runat="server" class="Box" Text="Rate (Tk)" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtSatRate" runat="server" class="Box" style="position:absolute; top:25px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtSunRate" runat="server" class="Box" style="position:absolute; top:50px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtMonRate" runat="server" class="Box" style="position:absolute; top:75px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtTuesRate" runat="server" class="Box" style="position:absolute; top:100px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtWedRate" runat="server" class="Box" style="position:absolute; top:125px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtThursRate" runat="server" class="Box" style="position:absolute; top:150px; color:Black; "> </asp:TextBox>
     <asp:TextBox ID="txtFriRate" runat="server" class="Box" style="position:absolute; top:175px; color:Black; "> </asp:TextBox>

</div>

 <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:310px; left:280px; height:30px;" onclick="btnSave_click" />

</div>


</asp:Content>

