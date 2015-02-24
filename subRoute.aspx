<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="subRoute.aspx.cs" Inherits="subRoute" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


   <script type="text/javascript">

       function checkEmptyfield() 
       {

           if (document.getElementById('<%= txtSubRouteCode.ClientID %>').value == '') 
           {
               alert('Please Input Route Code...');
               document.getElementById('<%= txtSubRouteCode.ClientID %>').focus();
               return false;
           }
           else if (document.getElementById('<%= txtSubRouteNameBan.ClientID %>').value == '') 
           {
               alert('Please Input Sub-Route Name(Bangla)...');
               document.getElementById('<%= txtSubRouteNameBan.ClientID %>').focus();
               return false;
           }
           else if (document.getElementById('<%= txtSubRouteName.ClientID %>').value == '') {
               alert('Please Input Sub-Route Name...');
               document.getElementById('<%= txtSubRouteName.ClientID %>').focus();
               return false;
           }

       }


    </script>


    <style type="text/css">    
   
    
    </style> 


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


<div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:20px; height:250px; width:720px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:237px; width:708px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Sub-Route" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; color:#57677F; width:708px; left:-1px;" />   
    </div>

        <asp:Label ID="lblSubRouteCode"  runat="server" CssClass="labelTextField" Text="Sub-Route Code"  style="position:absolute; top:53px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtSubRouteCode" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:165px; width:165px;"  ></asp:TextBox>
        <asp:Button id="btnGo" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:50px; left:337px; height:22px; width:32px; " onclick="btnGo_click" />


        <asp:Label ID="lblSubRouteNameBan"  runat="server" CssClass="labelTextField" Text="Sub-Route Name(Bang.)"  style="position:absolute; top:83px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtSubRouteNameBan" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:165px; font-family:Prothoma;"  ></asp:TextBox>

        <asp:Label ID="lblSubRouteName"  runat="server" CssClass="labelTextField" Text="Sub-Route Name"  style="position:absolute; top:113px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtSubRouteName" runat="server" CssClass="textBox" style="position:absolute; top:110px; left:165px; " ></asp:TextBox>

        <asp:Label ID="lblRouteName" CssClass="labelTextField" runat="server" Text="Route Name"  style="position:absolute; top:143px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlRouteName" runat="server" CssClass="dropdownlist" 
                     style="position:absolute; top:140px; left:165px;" >   </asp:DropDownList>
        
        <asp:Label ID="lblPress" CssClass="labelTextField" runat="server" Text="Press"  style="position:absolute; top:173px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPress" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:165px; "  >           
                <asp:ListItem>Bogra</asp:ListItem>
                <asp:ListItem>Chittagong</asp:ListItem>
                <asp:ListItem>Dhaka</asp:ListItem>
            </asp:DropDownList>

        <asp:Label ID="lblSortingOrder"  runat="server" CssClass="labelTextField" Text="Sorting Order"  style="position:absolute; top:203px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style="position:absolute; top:200px; left:165px;"  ></asp:TextBox>




        <asp:Label ID="lblStartPoint"  runat="server" CssClass="labelTextField" Text="Start Point"  style="position:absolute; top:53px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlStartPoint" runat="server"  CssClass="dropdownlist" style="position:absolute; top:50px; left:480px;" > </asp:DropDownList>

        <asp:Label ID="lblEndPoint"  runat="server" CssClass="labelTextField" Text="End Point"  style="position:absolute; top:83px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlEndPoint" runat="server"  CssClass="dropdownlist" style="position:absolute; top:80px; left:480px;"> </asp:DropDownList>

        <asp:Label ID="lblDepartTime"  runat="server" CssClass="labelTextField" Text="Departure Time"  style="position:absolute; top:113px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDepartTimeHH" runat="server" CssClass="dropdownlist" style="position:absolute; top:110px; left:480px; width:50px; "  >           
            </asp:DropDownList>
        <asp:Label ID="lblDepartTime1"  runat="server" CssClass="labelTextField" Text=":"  style="position:absolute; font-size:25px; top:107px; left:538px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDepartTimeMM" runat="server" CssClass="dropdownlist" style="position:absolute; top:110px; left:550px; width:50px; "  >           
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDepartAmPm" runat="server" CssClass="dropdownlist" style="position:absolute; top:110px; left:620px; width:50px; "  >           
                <asp:ListItem>AM</asp:ListItem>
                <asp:ListItem>PM</asp:ListItem>
            </asp:DropDownList>
        

        <asp:Label ID="lblArrivTime"  runat="server" CssClass="labelTextField" Text="Arrival Time"  style="position:absolute; top:143px; left:390px;"  ></asp:Label>
       <asp:DropDownList ID="ddlArrivTimeHH" runat="server" CssClass="dropdownlist" style="position:absolute; top:140px; left:480px; width:50px; "  >           
            </asp:DropDownList>
        <asp:Label ID="lblArrivTime1"  runat="server" CssClass="labelTextField" Text=":"  style="position:absolute; font-size:25px; top:137px; left:538px;"  ></asp:Label>
        <asp:DropDownList ID="ddlArrivTimeMM" runat="server" CssClass="dropdownlist" style="position:absolute; top:140px; left:550px; width:50px; "  >           
            </asp:DropDownList>
            <asp:DropDownList ID="ddlArrivAmPm" runat="server" CssClass="dropdownlist" style="position:absolute; top:140px; left:620px; width:50px; "  >           
                <asp:ListItem>AM</asp:ListItem>
                <asp:ListItem>PM</asp:ListItem>
            </asp:DropDownList>
        
        <asp:Label ID="lblAgentLocation" CssClass="labelTextField" runat="server" Text="Location"  style="position:absolute; top:173px; left:390px;"  ></asp:Label>
            <asp:DropDownList ID="ddlAgentLocation" runat="server" CssClass="dropdownlist" style="position:absolute; top:170px; left:480px;"  >
                              <asp:ListItem>City</asp:ListItem>
                              <asp:ListItem>Outside City</asp:ListItem>
                              <asp:ListItem>Administration</asp:ListItem>
            </asp:DropDownList>


        

        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:205px; left:580px; height:30px;" OnClientClick="return checkEmptyfield();" onclick="btnSave_click"  />


</div>



<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:300px; height:230px; width:720px; border:1px solid gray;">


    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:710px; overflow:auto; "   >
        <asp:GridView ID="grdSubRoute" DataKeyNames="subRouteId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:1300px; text-align: center; left:5px; top:5px; bottom:0px;"
                    onrowcreated="grdSubRoute_RowCreated" 
            onpageindexchanging="grdSubRoute_PageIndexChanging" 
            onrowdatabound="grdSubRoute_RowDataBound" 
            onrowdeleting="grdSubRoute_RowDeleting" 
            onselectedindexchanging="grdSubRoute_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="subRouteId" SortExpression="subRouteId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="subRouteCode" SortExpression="subRouteCode"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                        
                        <asp:BoundField DataField="subRouteNameBan" SortExpression="subRouteNameBan"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" ItemStyle-Font-Names="Prothoma" ItemStyle-Font-Size="small"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                   
                       
                        <asp:BoundField DataField="subRouteName" SortExpression="subRouteName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                   
                       
                        <asp:BoundField DataField="routeName" SortExpression="routeName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="press" SortExpression="press"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="sortingOrder" SortExpression="sortingOrder"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="startPoint" SortExpression="startPoint"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="endPoint" SortExpression="endPoint"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="departTime" SortExpression="departTime"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                      
                        <asp:BoundField DataField="arrivTime" SortExpression="arrivTime"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="Location" SortExpression="Location"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="100px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("subRouteId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    


    </div>

    </div>

    <asp:HiddenField ID="hdnSubRouteId" runat="server" />


</asp:Content>

