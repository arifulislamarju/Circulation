<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="reasonOfUnsold.aspx.cs" Inherits="reasonOfUnsold" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function checkEmptyfield() 
        {
            if (document.getElementById('<%= txtReason.ClientID %>').value == '') 
            {
                alert('Please Input Your Reason...');
                document.getElementById('<%= txtReason.ClientID %>').focus();
                return false;
            }

        }


    </script>


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divMainForm" class="divclsFrm" style="position:absolute; left:60px; top:40px; height:150px; width:800px;">

   <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:138px; width:790px;">
       <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Reason Of Unsold" style="position:absolute; left:5px; top:10px; font-size:18px; right: 283px;" ></asp:Label> 
       <hr style="position:absolute; top:30px; color:#57677F; width:788px; left:0px;" /> 
        

        <asp:Label ID="lblReasonType" CssClass="labelTextField" runat="server" Text="Reason Type"  style="position:absolute; top:63px; left:40px; "  ></asp:Label>
        <asp:DropDownList ID="ddlReasonType" AutoPostBack="false" runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:120px;  text-align:center;"  >
        
            <asp:ListItem Selected="True">--Select--</asp:ListItem>
            <asp:ListItem>Return</asp:ListItem>
            <asp:ListItem>CTP</asp:ListItem>
            <asp:ListItem>Vehicle</asp:ListItem>

        </asp:DropDownList>

         <asp:Label ID="lblName"  runat="server" CssClass="labelTextField" Text="Return Reason"  style="position:absolute; top:63px; left:400px;"  ></asp:Label>
         <asp:TextBox ID="txtReason" runat="server" CssClass="textBox" style="position:absolute; top:60px; left:520px;" ></asp:TextBox>

          <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:100px; left:350px; height:30px;" OnClientClick="return checkEmptyfield();" onclick="btnSave_click" />


 </div>
</div>

    <div id="formGrid" class="divclsFrm" style="position:absolute; left:60px; top:210px; height:260px; width:800px;">
    
    <asp:HiddenField ID="hdnReasonId" runat="server" />

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:248px; width:788px; overflow:auto; "  >
        <asp:GridView ID="grdReason" DataKeyNames="reasonId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:780px; text-align: center; left: 5px; top:5px; bottom:0px;"
                onrowcreated="grdReason_RowCreated" 
                onpageindexchanging="grdReason_PageIndexChanging" 
                onrowdatabound="grdReason_RowDataBound" 
                onrowdeleting="grdReason_RowDeleting" 
                onselectedindexchanging="grdReason_SelectedIndexChanging" >                  
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="reasonId" SortExpression="reasonId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="reasonType" SortExpression="reasonType"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="180px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     

                        <asp:BoundField DataField="reasonDetails" SortExpression="reasonDetails"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="180px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="5px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="20px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("reasonId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

      
</div>




</asp:Content>

