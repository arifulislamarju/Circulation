<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CTPSetup.aspx.cs" Inherits="CTPSetup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script type="text/javascript">
    function isNumberKey(evt) 
    {
        var charCode = (evt.which) ? evt.which : event.keyCode
        if (charCode > 31 && (charCode < 48 || charCode > 57)) 
        {

            alert('Input Number Only...');
            return false;
        }
               

        return true;
    }

    </script>

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:120px; top:30px; height:500px; width:625px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:447px; width:613px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="CTP Setup" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px;  width:612px; left:0px; color:#57677F;" />   
    
        <asp:Label ID="lblPress" CssClass="labelTextField" runat="server" Text="Press"  style="position:absolute; top:43px; left:5px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPress" runat="server" CssClass="dropdownlist" AutoPostBack="true"
            style="position:absolute; top:40px; left:70px; " 
            onselectedindexchanged="ddlPress_SelectedIndexChanged" >           
                
                <asp:ListItem>Dhaka</asp:ListItem>
                <asp:ListItem>Bogra</asp:ListItem>
                <asp:ListItem>Chittagong</asp:ListItem>
                
         </asp:DropDownList>

        <asp:GridView ID="grdCtpSchedule" runat="server" Style="position: absolute; border: 0px solid #ADB1AF; top:80px;
                left:5px; height:100px; width:604px; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; "

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" 
            GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" 
            RowStyle-HorizontalAlign="Left" PageSize="190" onrowcreated="grdCtpSchedule_RowCreated" >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        <asp:BoundField DataField="pageId" SortExpression="pageId"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="40px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="pageName" SortExpression="pageName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="300px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                                                                  
                       
                       <asp:TemplateField HeaderText="Start Time" ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:TextBox ID="txtStartH" runat="server" onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>
                               <asp:TextBox ID="txtStartM" runat="server" onkeypress="return isNumberKey(event)" Style="width:50px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Time Format" ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTimeformat" runat="server" Style="width:40px; font-size:11px; background-color:Yellow;">

                                    <asp:ListItem>AM</asp:listitem>
                                    <asp:listitem>PM</asp:listitem>

                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>

                                                   
                 </Columns>
                    
            </asp:GridView>


            
         <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" OnClientClick="return fieldValid();"
            style="position:absolute; top:455px; left:250px; height:30px; width:75px;" 
            onclick="btnSave_Click"/> 
            
    </div>

   
    </div>

</asp:Content>

