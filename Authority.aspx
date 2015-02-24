<%@ Page Title="Create Authority" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Authority.aspx.cs" Inherits="Authority" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<link href="StyleSheet.css" rel="stylesheet" type="text/css" />

      <style type="text/css">

#GM
   {
    position:absolute; 
    margin-top:90px; 
    margin-left:6px; 
    border:0px solid black; 
    width:688px; 
    height:148px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px; 
   
    }
    
    
 #Manager
  {
    position:absolute; 
    margin-top:90px; 
    margin-left:6px; 
    border:0px solid black; 
    width:688px; 
    height:148px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px; 
   
    }
    
    
        #RM
{
    position:absolute; 
    margin-top:90px; 
    margin-left:6px; 
    border:0px solid black; 
    width:688px; 
    height:148px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px; 
   
    }
    
    .divclsInput
    {
      border:1px solid #ADB1AF; 
      border-radius:7px;
      background-color:#C3C5E5;
    }
    
.divAuthority
{
    position:absolute; 
    margin-top:45px; 
    margin-left:6px; 
    border:0px solid black; 
    width:458px; 
    height:400px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;   
     
}

#hyperlink
    {
    /*color: #A70303;*/
    color:#dadada;    
    display: block;
    padding: 2px 0;
    padding-left: 19px; /*link text is indented 19px*/
    text-decoration: none;
    font-weight: bold;
    border-right: 1px solid #dadada;
    font-size: 16px;
    }

    </style>

     
    
    <script type="text/javascript">


        function showGM() 
        {
            document.getElementById('GM').style.display = 'block';
            document.getElementById('Manager').style.display = 'none';
            document.getElementById('RM').style.display = 'none';

            document.getElementById('grdGeneralManager').style.display = 'block';
            document.getElementById('divGrdManager').style.display = 'none';
            document.getElementById('grdRegionalManager').style.display = 'none';
               
        }

        function showM() 
        {

            document.getElementById('GM').style.display = 'none';
            document.getElementById('Manager').style.display = 'block'; 
            document.getElementById('RM').style.display = 'none';

            document.getElementById('grdGeneralManager').style.display = 'none';
            document.getElementById('divGrdManager').style.display = 'block';
            document.getElementById('grdRegionalManager').style.display = 'none';

        }

        function showRM() 
        {                
                document.getElementById('GM').style.display = 'none';
                document.getElementById('Manager').style.display = 'none';
                document.getElementById('RM').style.display = 'block';

                document.getElementById('grdGeneralManager').style.display = 'none';
                document.getElementById('divGrdManager').style.display = 'none';
                document.getElementById('grdRegionalManager').style.display = 'block';

        }


        function checkEmptyfieldGM() 
        {

            if (document.getElementById('<%= txtGM.ClientID %>').value == '') {
                alert('Please Input General manager Name...');
                document.getElementById('<%= txtGM.ClientID %>').focus();
                return false;
            }
        }

        function checkEmptyfieldM() 
        {
            if (document.getElementById('<%= txtManager.ClientID %>').value == '') {
                alert('Please Input Manager Name...');
                document.getElementById('<%= txtManager.ClientID %>').focus();
                return false;
            }
        }

        function checkEmptyfieldRM() 
        {
            if (document.getElementById('<%= txtRM.ClientID %>').value == '') 
            {
                alert('Please Input Regional Manager Name...');
                document.getElementById('<%= txtRM.ClientID %>').focus();
                return false;
            }

        }


    </script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

 <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:245px; width:700px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:233px; width:688px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Employee Hierarchy" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; color:#57677F; width:688px; left:-1px;" />   
    </div>
            
        
        <div id="divhyperlink" style="position:absolute; height:40px; width:689px; left:5px; top:40px; border-bottom:0px solid #3a3a3a;">           
            
            <a href="#" class="hyperlink"  onclick="javascript:showGM();" style="position:absolute;left:100px; top:8px; width:140px; ">General Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showM()" style="position:absolute;left:260px; top:8px; width:80px;">Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showRM();" style="position:absolute;left:360px; top:8px; width:80px;">RM/SE</a>
        
        <hr style="position:absolute; top:33px; color:#57677F; width:688px; left:0px;" />  

        </div>


       <div id="GM"  style="display:block;" >
        <asp:Image ID="arrow1" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:160px; top:-24px;" />
           
            <asp:Label ID="lblName1"  runat="server" CssClass="labelTextField" Text="General Manager"  style="position:absolute; top:23px; left:150px;"  ></asp:Label>
            <asp:TextBox ID="txtGM" runat="server" CssClass="textBox" style="position:absolute; top:20px; left:260px;"  ></asp:TextBox>

            <asp:Button id="btnSaveGM" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:60px; left:361px; height:30px;"  OnClientClick="return checkEmptyfieldGM();" onclick="btnSaveGM_click" />

        </div>

        <div id="Manager"  style="display:none;" >
            <asp:Image ID="arrow2" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:300px; top:-24px;" />
    

            <asp:Label ID="lblName2"  runat="server" CssClass="labelTextField" Text="Manager"  style="position:absolute; top:13px; left:150px;"  ></asp:Label>
            <asp:TextBox ID="txtManager" runat="server" CssClass="textBox" style="position:absolute; top:10px; left:260px;"  ></asp:TextBox>

            <asp:Label ID="lblGM" CssClass="labelTextField" runat="server" Text="General Manager"  style="position:absolute; top:53px; left:150px;"  ></asp:Label>
            <asp:DropDownList ID="ddlGM" runat="server" CssClass="dropdownlist" 
                   style="position:absolute; top:50px; left:260px;" >   </asp:DropDownList>   
           

            <asp:Button id="btnSaveManager" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:90px; left:361px; height:30px;" OnClientClick="return checkEmptyfieldM();" onclick="btnSaveManager_click" />

       </div>

       <div id="RM" style="display:none;" >
        <asp:Image ID="arrow3" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:390px; top:-24px;" />

            <asp:Label ID="lblName3"  runat="server" CssClass="labelTextField" Text="RM / SE"  style="position:absolute; top:13px; left:150px;"  ></asp:Label>
            <asp:TextBox ID="txtRM" runat="server" CssClass="textBox" style="position:absolute; top:10px; left:260px;"  ></asp:TextBox>

            <asp:Label ID="lblGM1" CssClass="labelTextField" runat="server" Text="General Manager"  style="position:absolute; top:43px; left:150px;"  ></asp:Label>
            <asp:DropDownList ID="ddlGMForRM" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
                 style="position:absolute; top:40px; left:260px;" onselectedindexchanged="ddlGMForRM_SelectedIndexChanged" >   </asp:DropDownList>     
            
            <asp:Label ID="lblManager" CssClass="labelTextField" runat="server" Text="Manager"  style="position:absolute; top:73px; left:150px;"  ></asp:Label>
            <asp:DropDownList ID="ddlManager" runat="server" CssClass="dropdownlist" 
                 style="position:absolute; top:70px; left:260px;" >   </asp:DropDownList>   

            <asp:Button id="btnSaveRM" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:110px; left:361px; height:30px;" OnClientClick="return checkEmptyfieldRM();" onclick="btnSaveRM_click" />
            
    </div>

</div>


  <div id="divRightForm" class="divclsFrm" style="position:absolute; left:100px; top:290px; height:230px; width:700px;" >

  
    <div id="grdGeneralManager" style="display:block" >

    <asp:HiddenField ID="hdngmId" runat="server" />

    <div id="grdFrmGM"  class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:690px; overflow:auto; "  >
        <asp:GridView ID="grdGM" DataKeyNames="gmId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdGM_RowCreated" 
            onpageindexchanging="grdGM_PageIndexChanging" 
            onrowdatabound="grdGM_RowDataBound" 
            onrowdeleting="grdGM_RowDeleting" 
            onselectedindexchanging="grdGM_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="gmId" SortExpression="gmId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="20px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="gmName" SortExpression="gmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("gmId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>




     <div id="divGrdManager"  style="display:none;"  >

    <asp:HiddenField ID="hdnManagerId" runat="server" />

    <div id="grdFrmManager" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:690px; overflow:auto; "   >
        <asp:GridView ID="grdManager" DataKeyNames="managerId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdManager_RowCreated" 
            onpageindexchanging="grdManager_PageIndexChanging" 
            onrowdatabound="grdManager_RowDataBound" 
            onrowdeleting="grdManager_RowDeleting" 
            onselectedindexchanging="grdManager_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>   
          
               <Columns>
               
                        <asp:BoundField DataField="managerId" SortExpression="managerId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="gmName" SortExpression="gmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="managerName" SortExpression="managerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                 
                       

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("managerId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>






    <div id="grdRegionalManager" class="divclsInput" style="display:none;"  >

    <asp:HiddenField ID="hdnRmId" runat="server" />

    <div id="grdFrmRM" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:690px; overflow:auto; "  >
        <asp:GridView ID="grdRM" DataKeyNames="rmId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:680px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdRM_RowCreated" 
            onpageindexchanging="grdRM_PageIndexChanging" 
            onrowdatabound="grdRM_RowDataBound" 
            onrowdeleting="grdRM_RowDeleting" 
            onselectedindexchanging="grdRM_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>   
          
               <Columns>
               
                        <asp:BoundField DataField="rmId" SortExpression="rmId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="gmName" SortExpression="gmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="managerName" SortExpression="managerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="rmName" SortExpression="rmName"
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
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("rmId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>

      </div>

    

</asp:Content>

