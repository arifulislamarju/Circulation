<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Distribution.aspx.cs" Inherits="Distribution" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
    
    #divCreate
{
    position:absolute; 
    margin-top:45px; 
    margin-left:6px; 
    border:0px solid black; 
    width:688px; 
    height:183px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;       
   
}


</style>




</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:235px; width:700px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:223px; width:688px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Sales Area" style="position:absolute; left:5px; top:5px; height: 19px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; color:#57677F; width:688px; left:-1px;" />      
    </div>

    <div id="divCreate">        

        <asp:Label ID="lblRM" CssClass="labelTextField" runat="server" Text="Regional Manager"  style="position:absolute; top:23px; left:150px;"  ></asp:Label>
        <asp:DropDownList ID="ddlRM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlRM_SelectedIndexChanged"
            style="position:absolute; top:20px; left:260px;" ></asp:DropDownList>
        <asp:DropDownList ID="ddlRMID" runat="server" style="position:absolute; visibility:hidden; width:100px; top:20px; left:500px;" ></asp:DropDownList>

        <asp:Label ID="lblCustomer" CssClass="labelTextField" runat="server" Text="Agent"  style="position:absolute; top:63px; left:150px;"  ></asp:Label>
        <asp:DropDownList ID="ddlCustomer" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlCustomer_SelectedIndexChanged"
            style="position:absolute; top:60px; left:260px;"  ></asp:DropDownList>
        <asp:DropDownList ID="ddlCusID" runat="server" style="position:absolute; visibility:hidden; width:100px; top:60px; left:500px;" ></asp:DropDownList>

        <asp:Label ID="lblStation" CssClass="labelTextField" runat="server" Text="Station"  style="position:absolute; top:103px; left:150px;"  ></asp:Label>
        <asp:DropDownList ID="ddlStation" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlStation_SelectedIndexChanged"
            style="position:absolute; top:100px; left:260px;"  ></asp:DropDownList>
        <asp:DropDownList ID="ddlStatID" runat="server" style="position:absolute; visibility:hidden; width:100px; top:100px; left:500px;" ></asp:DropDownList>

        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:140px; left:364px; height:30px; "  onclick="btnSave_click"/>


    </div>


    </div>



    <div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:290px; height:230px; width:700px;">

    <asp:HiddenField ID="hdndsId" runat="server" />

    <div id="grdFrm" class="divclsFrm" style="position:absolute; background-color:#C3C5E5; left:5px; top:5px; height:220px; width:690px; overflow:auto; "  >
        <asp:GridView ID="grdDistribution" DataKeyNames="dsId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="30"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana;  font-size: 11px; background-color:#C3C5E5; color: Black;  position: absolute; overflow:auto; height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdDistribution_RowCreated" 
            onpageindexchanging="grdDistribution_PageIndexChanging" 
            onrowdatabound="grdDistribution_RowDataBound" 
            onrowdeleting="grdDistribution_RowDeleting" 
            onselectedindexchanging="grdDistribution_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="dsId" SortExpression="dsId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="rmName" SortExpression="rmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="customerName" SortExpression="customerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("dsId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>

</asp:Content>

