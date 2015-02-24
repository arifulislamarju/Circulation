<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TransportManagement.aspx.cs" Inherits="TransportManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function isNumberKey(evt) {
            var charCode = (evt.which) ? evt.which : event.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {

                alert('Input Number Only...');
                return false;
            }


            return true;
        }

    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divTopForm" class="divclsFrm" style="position:absolute; left:70px; top:30px; height:130px; width:810px;">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:117px; width:798px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Transport Maintenance" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
            <hr style="position:absolute; top:22px; color:#57677F; width:798px; left:-1px;" />   
        </div>

        <asp:Label ID="lblTransId"  runat="server" CssClass="labelTextField" Text="Transaction Id"  style="position:absolute; top:53px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtTransId" runat="server" CssClass="textBox" style="position:absolute; text-align:center; top:50px; left:185px; width:60px;" > </asp:TextBox>
        
        <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" 
                   style="position:absolute; left:157px; top:50px" onclick="btnPrevious_Click" />

        <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" 
                   style=" position:absolute; top:50px; left:252px;" onclick="btnNext_Click" />

        <%--<asp:ImageButton ID="btnNew" runat="server" ImageUrl="~/Images/New.JPG" 
                   style=" position:absolute; top:52px; left:309px; width:22px; " onclick="btnNew_Click" />--%>

        <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" 
                   style="position:absolute; left:130px; top:50px" onclick="btnFirst_Click" />

        <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" 
                   style=" position:absolute; top:50px; left:279px;" onclick="btnLast_Click" />

        <asp:Label ID="lblTransDate"  runat="server" CssClass="labelTextField" Text="Transaction Date"  style="position:absolute; top:83px; left:20px;"  ></asp:Label>
        <%--<asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox" style="position:absolute; top:80px; width:180px; left:130px;" > </asp:TextBox>--%>
        <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:317px; top:84px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

        <%--<asp:Label ID="lblPress" CssClass="labelTextField" runat="server" Text="Press"  style="position:absolute; top:53px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPress" runat="server" CssClass="dropdownlist" AutoPostBack="true"
            style="position:absolute; top:50px; left:470px; " 
            onselectedindexchanged="ddlPress_SelectedIndexChanged"  >           
                
                <asp:ListItem>Dhaka</asp:ListItem>
                <asp:ListItem>Bogra</asp:ListItem>
                <asp:ListItem>Chittagong</asp:ListItem>
                
            </asp:DropDownList>--%>

        <asp:Label ID="lblStationName"  runat="server" CssClass="labelTextField" Text="Station Name"  style="position:absolute; top:83px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlStationName" runat="server" CssClass="dropdownlist"  
            style="position:absolute; top:80px; left:470px; " AutoPostBack="True" 
            onselectedindexchanged="ddlStationName_SelectedIndexChanged" ></asp:DropDownList>


    </div>

    <div id="divRhtForm" class="divclsFrm" style="position:absolute; left:70px; top:170px; height:370px; width:810px; border:1px solid gray;">
        
        <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox"  AutoPostBack="true"
            style="position:absolute; top:-58px; width:180px; left:130px;" 
            ontextchanged="txtTransDate_TextChanged" > </asp:TextBox>

        <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:318px; width:798px; overflow:auto; "   >

              <asp:GridView ID="grdOrder" runat="server" Style="position: absolute; top:3px;
                left:5px; height:auto; width:770px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="190"
                onrowcreated="grdOrder_RowCreated" onrowdatabound="grdOrder_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 

                 <Columns>
                        
                        
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>                                               
                                                                                          
                            </ItemTemplate>
                        </asp:TemplateField>

                        
                        <asp:BoundField DataField="PAPERNAME" SortExpression="PAPERNAME"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="250px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                        
                       

                        <asp:TemplateField HeaderText="Departure Time" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:TextBox ID="txtDepartureTimeH" runat="server"  onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>

                                <asp:TextBox ID="txtDepartureTimeM" runat="server" onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>

                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Time Format" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTimeDepformat" runat="server" Style="width:70px; font-size:11px; background-color:Yellow;">
                                                                    
                                    <asp:listitem>AM</asp:listitem>
                                    <asp:ListItem>PM</asp:listitem>

                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Arrival Time" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <asp:TextBox ID="txtArrivalTimeH" runat="server"  onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>
                               <asp:TextBox ID="txtArrivalTimeM" runat="server"  onkeypress="return isNumberKey(event)" Style="width:40px; font-size:11px; background-color:Yellow;">
                                </asp:TextBox>

                            </ItemTemplate>
                        </asp:TemplateField>

                       <asp:TemplateField HeaderText="Time Format" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlTimeArrformat" runat="server" Style="width:70px; font-size:11px; background-color:Yellow;">

                                    <asp:ListItem>AM</asp:listitem>
                                    <asp:listitem>PM</asp:listitem>

                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Reason Of Delay" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlReason" runat="server" Style="width:100px; font-size:11px; ">
                                </asp:DropDownList>                               
                            </ItemTemplate>
                        </asp:TemplateField>
                          
                            
                 </Columns>
                    
            </asp:GridView>

        

        </div>

            <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" 
            style="position:absolute; top:335px; left:330px; height:30px;" 
            onclick="btnSave_Click"  /> 

    </div>

    <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarTransectionDate" runat="server" TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>


</asp:Content>

