<%@ Page Title="Create User Group" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userGroup.aspx.cs" Inherits="userGroup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function checkEmptyfield() 
        {

            if (document.getElementById('<%= txtGroup.ClientID %>').value == '') 
            {
                alert('Please input group name...');
                document.getElementById('<%= txtGroup.ClientID %>').focus();
                return false;
            }
            else if (document.getElementById('<%= txtGroupDesc.ClientID %>').value == '') 
            {
                alert('Please input group description...');
                document.getElementById('<%= txtGroupDesc.ClientID %>').focus();
                return false;
            }
        }
    
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:185px; width:700px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:173px; width:688px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Create User Group" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; width:688px; left:-1px; color:#57677F;" />   
    </div>
        
        <asp:Label ID="lblGroupName" CssClass="labelTextField" runat="server" Text="Group Name"  style="position:absolute; top:53px; left:150px;"  ></asp:Label>
        <asp:TextBox ID="txtGroup" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:260px;"  ></asp:TextBox>

        <asp:Label ID="lblGroupDesc" CssClass="labelTextField" runat="server" Text="Group Description"  style="position:absolute; top:93px; left:150px;"  ></asp:Label>
        <asp:TextBox ID="txtGroupDesc" runat="server" CssClass="textBox" style="position:absolute; top:90px; left:260px;"  ></asp:TextBox>

        <asp:Button id="btnCreateUserGroup" CssClass="Submitbutton" runat="server" 
            Text="Create Group" OnClientClick="return checkEmptyfield();" 
            style="position:absolute; top:130px; height:30px; left:361px;" 
            onclick="btnCreateUserGroup_Click" />

    </div>

    <div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:240px; height:230px; width:700px;">

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:690px; overflow:auto; "  >
  
        <asp:GridView ID="grdGroupList" DataKeyNames="groupId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto;
                    height:auto;  width:680px; text-align:center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdGroupList_RowCreated" 
            onpageindexchanging="grdGroupList_PageIndexChanging" 
            onrowdatabound="grdGroupList_RowDataBound" 
            onrowdeleting="grdGroupList_RowDeleting" 
            onselectedindexchanging="grdGroupList_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>   
          
               <Columns>
               
                        <asp:BoundField DataField="groupId" SortExpression="groupId"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="groupName" SortExpression="groupName"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="groupDescription" SortExpression="groupDescription"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="200px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="audUser" SortExpression="audUser"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="90px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("groupId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    


    </div>

    </div>
    
    <asp:HiddenField ID="hdnGroupId" runat="server" />

</asp:Content>

