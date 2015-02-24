<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CTPSchedule.aspx.cs" Inherits="CTPSchedule" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
    
    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:120px; top:20px; height:440px; width:625px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:427px; width:613px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="CTP Management" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px;  width:612px; left:0px; color:#57677F;" /> 
        

        <asp:Label ID="lbltransDate"  runat="server" CssClass="labelTextField" Text="Transaction Date"  style="position:absolute; top:53px; left:10px;"  ></asp:Label>
        <asp:TextBox ID="txttransDate" runat="server" CssClass="textBox" AutoPostBack="true" OnTextChanged="transDate_TextChanged" style="position:absolute; top:50px; left:120px; width:120px; " ></asp:TextBox>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:248px; top:53px; width:23px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <asp:Label ID="lblPress" CssClass="labelTextField" runat="server" Text="Press"  style="position:absolute; top:53px; left:290px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPress" runat="server" CssClass="dropdownlist" AutoPostBack="true"
            style="position:absolute; top:50px; left:340px; " 
            ontextchanged="ddlPress_TextChanged" >           
                
                <asp:ListItem>Dhaka</asp:ListItem>
                <asp:ListItem>Bogra</asp:ListItem>
                <asp:ListItem>Chittagong</asp:ListItem>
                
         </asp:DropDownList>

         <asp:GridView ID="grdCtpSchedule" runat="server" Style="position: absolute; border: 0px solid #ADB1AF; top:85px;
                left:5px; height:auto; width:604px; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; "

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" 
            GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" 
            RowStyle-HorizontalAlign="Left" PageSize="190"
                onrowcreated="grdCtpSchedule_RowCreated" 
            onrowdatabound="grdCtpSchedule_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        <asp:BoundField DataField="pageId" SortExpression="pageId"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="40px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        

                        <asp:BoundField DataField="pageName" SortExpression="pageName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="deFaultTime" SortExpression="deFaultTime"
                        ItemStyle-HorizontalAlign="Right" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                       <asp:TemplateField HeaderText="Start Time" ItemStyle-Width="130px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:TextBox ID="ddlStartH" runat="server" onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>
                               <asp:TextBox ID="ddlStartM" runat="server" onkeypress="return isNumberKey(event)" Style="width:50px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Time Format" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTimeformat" runat="server" Style="width:40px; font-size:11px; background-color:Yellow;">

                                    <asp:ListItem>AM</asp:listitem>
                                    <asp:listitem>PM</asp:listitem>

                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Delay Reason" ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlReason" runat="server" Style="width:130px; font-size:11px; ">
                                </asp:DropDownList>
                               

                            </ItemTemplate>
                        </asp:TemplateField>

                            
                 </Columns>
                    
            </asp:GridView>



            <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:390px; left:270px; height:30px; width:75px;" 
            onclick="btnSave_Click"/> 
          
    </div>
</div>



        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarOrderDate" runat="server" TargetControlID="txttransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        

</asp:Content>

