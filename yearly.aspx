<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="yearly.aspx.cs" Inherits="yearly" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">



      <style type="text/css">
  
    
    .yearlyInfo
{
    position:absolute; 
    margin-top:92px; 
    margin-left:6px; 
    border:0px solid red; 
    width:778px; 
    height:390px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;     
}
    
    
.divAuthority
{
    position:absolute; 
    margin-top:85px; 
    margin-left:6px; 
    border:0px solid black; 
    width:458px; 
    height:188px; 
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

    .hidden-div
{
    display: none;
}

    </style>



    <script type="text/javascript">


            function showGM() {
                document.getElementById('GM').style.display = 'block';
                document.getElementById('Manager').style.display = 'none';
                document.getElementById('RM').style.display = 'none';

                document.getElementById('grdGeneralManager').style.display = 'block';
                document.getElementById('divGrdManager').style.display = 'none';
                document.getElementById('grdRegionalManager').style.display = 'none';

            }

            function showM() {

                document.getElementById('GM').style.display = 'none';
                document.getElementById('Manager').style.display = 'block';
                document.getElementById('RM').style.display = 'none';

                document.getElementById('grdGeneralManager').style.display = 'none';
                document.getElementById('divGrdManager').style.display = 'block';
                document.getElementById('grdRegionalManager').style.display = 'none';

            }

            function showRM() {
                document.getElementById('GM').style.display = 'none';
                document.getElementById('Manager').style.display = 'none';
                document.getElementById('RM').style.display = 'block';

                document.getElementById('grdGeneralManager').style.display = 'none';
                document.getElementById('divGrdManager').style.display = 'none';
                document.getElementById('grdRegionalManager').style.display = 'block';

            }



    </script>


</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


  
 <div id="divMainForm" class="divclsFrm" style="position:absolute; left:60px; top:40px; height:490px; width:790px;">

 <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:478px; width:778px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="YEARLY TARGET" style="position:absolute; left:5px; top:10px; font-size:18px; right: 283px;" ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:776px; left:0px;" />   
            
            

 <div id="divhyperlink" style="position:absolute; height:40px; width:778px; left:0px; top:40px; border-bottom:1px solid #3a3a3a;">     
            
            <a href="#" class="hyperlink"  onclick="javascript:showGM();" style="position:absolute;left:0px; top:8px; width:130px; ">General Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showM()" style="position:absolute;left:150px; top:8px; width:80px;">Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showRM();" style="position:absolute;left:250px; top:8px; width:80px;">RM/SE</a>

          </div>

</div>


    <div id="GM"  class="yearlyInfo" style="display:block;" >
        <asp:Image ID="arrow1" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:60px; top:-21px;" />
           
            <asp:Label ID="lblYearGM" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:13px; left:190px;"  ></asp:Label>
            <asp:DropDownList ID="ddlYearGM" runat="server" CssClass="dropdownlist" onselectedindexchanged="ddlYearGM_SelectedIndexChanged" AutoPostBack="true" 
                     style="position:absolute; top:10px; left:340px;" >   </asp:DropDownList>

            <asp:Label ID="lblGM" CssClass="labelTextField" runat="server" Text="General Manager"  style="position:absolute; top:43px; left:190px;"  ></asp:Label>
            <asp:DropDownList ID="ddlGM" runat="server" CssClass="dropdownlist" 
                     style="position:absolute; top:40px; left:340px;" >  </asp:DropDownList>
            
            <asp:Label ID="lblTargetGM"  runat="server" CssClass="labelTextField" Text="Target Copy"  style="position:absolute; top:73px; left:190px;"  ></asp:Label>
            <asp:TextBox ID="txtTargetGM" runat="server" CssClass="textBox" style="position:absolute; top:70px; left:340px;"  ></asp:TextBox>
            
            <asp:Label ID="lblGMPrevAchv"  runat="server" CssClass="labelTextField" Text="Previous Year Achievement"  style="position:absolute; top:104px; left:190px;"  ></asp:Label>
            <asp:Label ID="lblGMPrevAchv1" runat="server" style="position:absolute; font-weight: bold; left:345px; top:102px;" ></asp:Label>

            <asp:Label ID="lblGMCurntAchv"  runat="server" CssClass="labelTextField" Text="Current Year Achievement"  style="position:absolute; top:134px; left:190px;"  ></asp:Label>
            <asp:Label ID="lblGMCurntAchv1" runat="server" style="position:absolute; font-weight: bold; left:345px; top:132px;" ></asp:Label>

            <asp:Button id="btnSaveGM" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:165px; left:440px; height:30px;" onclientclick="return showGM();" onclick="btnSaveGM_click" />


     </div>


     <div id="Manager" class="yearlyInfo" style="display:none;" >
         <asp:Image ID="arrow2" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:190px; top:-21px;" />
           
            <asp:Label ID="lblYearManager" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:13px; left:210px;"  ></asp:Label>
            <asp:DropDownList ID="ddlYearManager" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlYearManager_SelectedIndexChanged"
                 style="position:absolute; top:10px; left:330px;" >   </asp:DropDownList>
            
            <asp:Label ID="lblGMforManager" CssClass="labelTextField" runat="server" Text="General Manager"  style="position:absolute; top:43px; left:210px;"  ></asp:Label>
            <asp:DropDownList ID="ddlGMforManager" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlGMforManager_SelectedIndexChanged"
                     style="position:absolute; top:40px; left:330px;" >   </asp:DropDownList>         
            
            <asp:Label ID="lblManPrevAchv"  runat="server" CssClass="labelTextField" Text="Target Of GM"  style="position:absolute; top:74px; left:210px;"  ></asp:Label>
            <asp:Label ID="lblManPrevAchv1" runat="server" style="position:absolute; font-weight: bold; left:333px; top:72px;" ></asp:Label>

            <div class="hidden-div">
               <asp:TextBox ID="txtTargetManager" runat="server" CssClass="textBox" style="position:absolute; top:200px; left:340px;"  ></asp:TextBox>            
            </div>

            <asp:Button id="btnSaveManager" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:350px; left:590px; height:30px;" onclientclick="return showM();" onclick="btnSaveManager_click"  />

     </div>



     <div id="RM"  class="yearlyInfo" style="display:none;" >
    <asp:Image ID="arrow3" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:280px; top:-21px;" />
           
            <asp:Label ID="lblYearRM" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:13px; left:210px;"  ></asp:Label>
            <asp:DropDownList ID="ddlYearRM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlYearRM_SelectedIndexChanged"
                 style="position:absolute; top:10px; left:330px;" >   </asp:DropDownList>

            <asp:Label ID="lblManagerForRM" CssClass="labelTextField" runat="server" Text="Manager"  style="position:absolute; top:43px; left:210px;"  ></asp:Label>
            <asp:DropDownList ID="ddlManagerForRM" runat="server" CssClass="dropdownlist"  AutoPostBack="True" onselectedindexchanged="ddlManagerForRM_SelectedIndexChanged"
                     style="position:absolute; top:40px; left:330px;" >   </asp:DropDownList>
            
            <asp:Label ID="lblRmPrevAchv"  runat="server" CssClass="labelTextField" Text="Target Of Manager"  style="position:absolute; top:74px; left:210px;"  ></asp:Label>
            <asp:Label ID="lblRmPrevAchv1" runat="server" style="position:absolute; font-weight: bold; left:333px; top:72px;" ></asp:Label>

            <asp:Button id="btnSaveRM" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:350px; left:590px; height:30px;"  onclick="btnSaveRM_click" />

     </div>


   
    <div id="grdGeneralManager" class="divclsFrm"  style="display:block; position:absolute; left:40px; top:300px; height:170px; width:700px;"  >

    <asp:HiddenField ID="hdngmId" runat="server" />

    <div id="grdFrmGM"  class="divclsInput" style="position:absolute; left:2px; top:5px; height:160px; width:695px; overflow:auto; "  >
        <asp:GridView ID="grdGM" DataKeyNames="yrGmId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:690px; text-align: center; left:4px; top:4px; bottom:0px;"
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
               
                        <asp:BoundField DataField="yrGmId" SortExpression="yrGmId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="yearGM" SortExpression="yearGM"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="yrGmName" SortExpression="yrGmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                                                 
                        <asp:BoundField DataField="targetCopy" SortExpression="targetCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       

                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">                           
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("yrGmId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>



        
     <div id="divGrdManager" class="divclsFrm" style="display:none; position:absolute; left:40px; top:200px; height:230px; width:700px;"  >

    <asp:HiddenField ID="hdnManagerId" runat="server" />
    <asp:HiddenField ID="hdnTargetCopy" runat="server" />

    <div id="grdFrmManager" class="divclsInput" style="position:absolute; left:2px; top:5px; height:220px; width:695px; overflow:auto; "  >
        <asp:GridView ID="grdManager" DataKeyNames="yrGmId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:690px; text-align: center; left:4px; top:4px; bottom:0px;"
            onrowcreated="grdManager_RowCreated" 
            onpageindexchanging="grdManager_PageIndexChanging" 
            onrowdatabound="grdManager_RowDataBound" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
               
                <Columns>
               
                        <asp:BoundField DataField="yrGmId" SortExpression="yrGmId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="yearGM" SortExpression="yearGM"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="yrGmName" SortExpression="yrGmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="managerName" SortExpression="managerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-Height="25px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:TemplateField ItemStyle-Width="40px" ItemStyle-Height="25px" >                          
                            <ItemTemplate> 
                                <asp:TextBox ID="txtTargetCopy" runat="server" style="position:absolute; text-align:center; width:100px;"  ></asp:TextBox> 
                            </ItemTemplate>
                        </asp:TemplateField> 
                              

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                       
               
               </Columns>
               
            </asp:GridView>    

            </div>

            </div>



    <div id="grdRegionalManager" class="divclsFrm"  style="display:none; position:absolute; left:40px; top:200px; height:230px; width:700px;" >

    <asp:HiddenField ID="hdnRmId" runat="server" />

    <div id="grdFrmRM" class="divclsInput"  style="position:absolute; left:2px; top:5px; height:220px; width:695px; overflow:auto; "  >
        <asp:GridView ID="grdRM" DataKeyNames="yrManId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:690px; text-align: center; left:4px; top:4px; bottom:0px;"
            onrowcreated="grdRM_RowCreated" 
            onpageindexchanging="grdRM_PageIndexChanging" 
            onrowdatabound="grdRM_RowDataBound" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
               <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="yrManId" SortExpression="yrManId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                             
                        
                        <asp:BoundField DataField="yearMan" SortExpression="yearMan"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="yrManagerName" SortExpression="yrManagerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="rmName" SortExpression="rmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-Height="25px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:TemplateField ItemStyle-Width="40px" ItemStyle-Height="25px" >                          
                            <ItemTemplate> 
                                <asp:TextBox ID="txtTargetCopyRM" runat="server" style="position:absolute; text-align:center; width:100px;"  ></asp:TextBox> 
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
               
               </Columns>
            </asp:GridView>    

            </div>

            </div>


    </div>





</asp:Content>

