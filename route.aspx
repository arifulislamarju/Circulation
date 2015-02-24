<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="route.aspx.cs" Inherits="route" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">

        function checkEmptyfield() 
        {

            if (document.getElementById('<%= txtRouteCode.ClientID %>').value == '') 
            {
                alert('Please Input Route Code...');
                document.getElementById('<%= txtRouteCode.ClientID %>').focus();
                return false;
            }
            else if (document.getElementById('<%= txtRouteNameBan.ClientID %>').value == '') 
            {
                alert('Please Input Route Name (Bangla)...');
                document.getElementById('<%= txtRouteNameBan.ClientID %>').focus();
                return false;
            }
            else if (document.getElementById('<%= txtRouteName.ClientID %>').value == '') {
                alert('Please Input Route Name...');
                document.getElementById('<%= txtRouteName.ClientID %>').focus();
                return false;
            }

        }

       

//        function showFinderDiv() 
//        {
//            document.getElementById('divFinder').style.display = 'block';
//            document.getElementById('divLeftForm').style.display = 'none';
//        }

//        function BackMainDiv() 
//        {
//            document.getElementById('divFinder').style.display = 'none';
//            document.getElementById('divLeftForm').style.display = 'block';
//        }

    </script>


    <style type="text/css">    
   
    
    </style> 


</asp:Content>




<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:20px; height:245px; width:720px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:233px; width:708px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Route" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; color:#57677F; width:708px; left:-1px;" />   
    </div>

        <asp:Label ID="lblRouteCode"  runat="server" CssClass="labelTextField" Text="Route Code"  style="position:absolute; top:63px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRouteCode" runat="server" CssClass="textBox" style="position:absolute; top:60px; width:170px; left:140px;"  ></asp:TextBox>
        <%--<asp:Image ID="imgCustomerFinder" runat="server" ToolTip="Find Customer" onclick="javascript:showFinderDiv();" Style="position: absolute; left:318px; top:62px; width:20px; height:20px;" ImageUrl="~/Images/Finder.jpg" />--%>

        <asp:Button id="btnGo" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:62px; left:317px; height:22px; width:32px; " onclick="btnGo_click" />

        <asp:Label ID="lblRouteNameBan"  runat="server" CssClass="labelTextField" Text="Route Name (Bang.)"  style="position:absolute; top:93px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRouteNameBan" runat="server" CssClass="textBox" style="position:absolute; top:90px; left:140px; font-family:Prothoma;"  ></asp:TextBox>

        <asp:Label ID="lblRouteName"  runat="server" CssClass="labelTextField" Text="Route Name"  style="position:absolute; top:123px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRouteName" runat="server" CssClass="textBox" style="position:absolute; top:120px; left:140px; " ></asp:TextBox>

        <asp:Label ID="lblStartPoint"  runat="server" CssClass="labelTextField" Text="Start Point"  style="position:absolute; top:153px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlStartPoint" runat="server"  CssClass="dropdownlist" style="position:absolute; top:150px; left:140px;" > </asp:DropDownList>

        <asp:Label ID="lblEndPoint"  runat="server" CssClass="labelTextField" Text="End Point"  style="position:absolute; top:183px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlEndPoint" runat="server"  CssClass="dropdownlist" style="position:absolute; top:180px; left:140px;"> </asp:DropDownList>



        <asp:Label ID="lblSortingOrder"  runat="server" CssClass="labelTextField" Text="Sorting Order"  style="position:absolute; top:63px; left:390px;"  ></asp:Label>
        <asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style="position:absolute; top:60px; left:480px;"  ></asp:TextBox>

        <asp:Label ID="lblDistance"  runat="server" CssClass="labelTextField" Text="Distance (Km)"  style="position:absolute; top:93px; left:390px;"  ></asp:Label>
        <asp:TextBox ID="txtDistance" runat="server" CssClass="textBox" style="position:absolute; top:90px; left:480px;"  ></asp:TextBox>


        <asp:Label ID="lblDepartTime"  runat="server" CssClass="labelTextField" Text="Departure Time"  style="position:absolute; top:128px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDepartTimeHH" runat="server"  CssClass="dropdownlist" style="position:absolute; top:125px; left:480px; width:50px; "  >           
            </asp:DropDownList>
        <asp:Label ID="lblDepartTime1"  runat="server" CssClass="labelTextField" Text=":"  style="position:absolute; font-size:25px; top:122px; left:538px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDepartTimeMM" runat="server"  CssClass="dropdownlist" style="position:absolute; top:125px; left:550px; width:50px; "  >           
            </asp:DropDownList>
            <asp:DropDownList ID="ddlDepartAmPm" runat="server"  CssClass="dropdownlist" style="position:absolute; top:125px; left:620px; width:50px; "  >           
                <asp:ListItem>AM</asp:ListItem>
                <asp:ListItem>PM</asp:ListItem>
            </asp:DropDownList>
        

        <asp:Label ID="lblArrivTime"  runat="server" CssClass="labelTextField" Text="Arrival Time"  style="position:absolute; top:163px; left:390px;"  ></asp:Label>
       <asp:DropDownList ID="ddlArrivTimeHH" runat="server"  CssClass="dropdownlist" style="position:absolute; top:160px; left:480px; width:50px; "  >           
            </asp:DropDownList>
        <asp:Label ID="lblArrivTime1"  runat="server" CssClass="labelTextField" Text=":"  style="position:absolute; font-size:25px; top:157px; left:538px;"  ></asp:Label>
        <asp:DropDownList ID="ddlArrivTimeMM" runat="server"  CssClass="dropdownlist" style="position:absolute; top:160px; left:550px; width:50px; "  >           
            </asp:DropDownList>
            <asp:DropDownList ID="ddlArrivAmPm" runat="server"  CssClass="dropdownlist" style="position:absolute; top:160px; left:620px; width:50px; "  >           
                <asp:ListItem>AM</asp:ListItem>
                <asp:ListItem>PM</asp:ListItem>
            </asp:DropDownList>

        

        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:200px; left:560px; height:30px;" OnClientClick="return checkEmptyfield();" onclick="btnSave_click"  />


</div>



<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:290px; height:230px; width:720px;">


    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:710px; overflow:auto; "  >
        <asp:GridView ID="grdRoute" DataKeyNames="routeId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:1100px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdRoute_RowCreated" 
            onpageindexchanging="grdRoute_PageIndexChanging" 
            onrowdatabound="grdRoute_RowDataBound" 
            onrowdeleting="grdRoute_RowDeleting" 
            onselectedindexchanging="grdRoute_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="routeId" SortExpression="routeId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="routeCode" SortExpression="routeCode"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="routeNameBan" SortExpression="routeNameBan"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" ItemStyle-Font-Names="Prothoma" ItemStyle-Font-Size="small"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="routeName" SortExpression="routeName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="sortingOrder" SortExpression="sortingOrder"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="startPoint" SortExpression="startPoint"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="endPoint" SortExpression="endPoint"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="distance" SortExpression="distance"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="departTime" SortExpression="departTime"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                      
                        <asp:BoundField DataField="arrivTime" SortExpression="arrivTime"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="100px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("routeId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    


    </div>

    </div>

    <asp:HiddenField ID="hdnRouteId" runat="server" />

     <div id="divFinder" style="display:none; position:absolute; ">
      
      <div id="divFrm"  runat="server" style="width: 548px; background-color: Lavender; border: groove 1px gray;
        position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:35px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            
            <asp:Label ID="lblFindby" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            
            <asp:DropDownList ID="ddlCustomer" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Route Name</asp:ListItem>
                <asp:ListItem>Route ID</asp:ListItem>
            </asp:DropDownList>
            
            <asp:DropDownList ID="ddlSelectType" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            
            <asp:Label ID="lblFilter" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            
            <asp:TextBox ID="txtFilter" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" OnTextChanged="txtFilter_TextChanged"
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        
        <asp:Panel ID="Panel1" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 894px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdRouteFndr" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True" 
                OnPageIndexChanging="grdRouteFndr_PageIndexChanging"
                OnSelectedIndexChanged="grdRouteFndr_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdRouteFndr_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle ForeColor="Black" Height="10px" Font-Size="11px" />
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />
                             

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
      
      </div>


    </div>


</asp:Content>

