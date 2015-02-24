<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CategorySetup.aspx.cs" Inherits="CategorySetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:120px; top:30px; height:150px; width:625px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:137px; width:613px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Page Setup" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px;  width:612px; left:0px; color:#57677F;" />  

         <asp:Label ID="lblCatName"  runat="server" CssClass="labelTextField" Text="Category Name"  style="position:absolute; top:63px; left:140px;"  ></asp:Label>
         <asp:TextBox ID="txtCatName" runat="server" CssClass="textBox" style="position:absolute; top:60px; left:240px;" ></asp:TextBox>

          <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:100px; left:345px; height:30px;" onclick="btnSave_Click" />

    </div>

    </div>

    <div id="formGrid" class="divclsFrm" style="position:absolute; left:120px; top:210px; height:260px; width:625px;">

        <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:248px; width:613px; overflow:auto; "  >

            <asp:GridView ID="grdCatSetup" DataKeyNames="CatId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:600px; text-align: center; left: 5px; top:5px; bottom:0px;"
                onrowcreated="grdCatSetup_RowCreated" 
                onpageindexchanging="grdCatSetup_PageIndexChanging" 
                onrowdatabound="grdCatSetup_RowDataBound" 
                onrowdeleting="grdCatSetup_RowDeleting" 
                onselectedindexchanging="grdCatSetup_SelectedIndexChanging" >                  
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="CatId" SortExpression="CatId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="CatName" SortExpression="CatName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="180px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                                                
                        <asp:BoundField DataField="audUser" SortExpression="audUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="5px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="20px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("CatId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

        </div>

    </div>

    <asp:HiddenField ID="hdnCatId" runat="server" />

</asp:Content>

