<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="hawkerInfo.aspx.cs" Inherits="hawkerInfo" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

 <script type="text/javascript">

     function numberOnly() {
         var key_code = window.event.keyCode;
         var oElement = window.event.srcElement;
         if (!window.event.shiftKey && !window.event.ctrlKey && !window.event.altKey) {
             if ((key_code > 47 && key_code < 58) || (key_code > 95 && key_code < 106)) {

                 if (key_code > 95)
                     key_code -= (95 - 47);
                 oElement.value = oElement.value;
             }
             else if (key_code == 8) {
                 oElement.value = oElement.value;
             }
             else if (key_code != 9) {
                 event.returnValue = false;
                 alert('Please input number only....');
             }

         }
     }

     function salesPeriod() {

         var currentDate = new Date()
         var day = currentDate.getDate()
         var month = currentDate.getMonth() + 1
         var year = currentDate.getFullYear()

         var startDate = document.getElementById('<%= txtSalesPeriod.ClientID %>').value;
         var dateTo = (year + "/" + month + "/" + day)


         var firstDate = new Date(startDate);
         var secondDate = new Date(dateTo);

         var year = secondDate.getFullYear() - firstDate.getFullYear();

         if (secondDate.getMonth() == firstDate.getMonth() || secondDate.getDate() >= firstDate.getDate()) {

             var month1 = (secondDate.getMonth() - firstDate.getMonth());
         }
         else {

             var month1 = (secondDate.getMonth() - firstDate.getMonth()) - 1;
         }

         if (secondDate.getDate() == firstDate.getDate() || secondDate.getDate() > firstDate.getDate()) {

             var day1 = secondDate.getDate() - firstDate.getDate() + 1;
         }
         else {

             var day1 = secondDate.getDate() - firstDate.getDate() + 30;
         }


         document.getElementById('<%= txtSalesDuration.ClientID %>').value = year + "Y-" + month1 + "M-" + day1 + "D";
         document.getElementById('<%= txtSalesDuration.ClientID %>').focus();

     }

     function showPersonalInfo() 
     {
         document.getElementById('divHawkerInfo').style.display = 'block';
         document.getElementById('divFamilyInfo').style.display = 'none';
         document.getElementById('divOrderChng').style.display = 'none';
         document.getElementById('divDailyOrdrChng').style.display = 'none';
         document.getElementById('divSummery').style.display = 'none';
     }
     function showFamilyInfo() 
     {

         document.getElementById('divHawkerInfo').style.display = 'none';
         document.getElementById('divFamilyInfo').style.display = 'block';
         document.getElementById('divOrderChng').style.display = 'none';
         document.getElementById('divDailyOrdrChng').style.display = 'none';
         document.getElementById('divSummery').style.display = 'none';
     }
     function showOrderChng() 
     {
         document.getElementById('divHawkerInfo').style.display = 'none';
         document.getElementById('divFamilyInfo').style.display = 'none';
         document.getElementById('divOrderChng').style.display = 'block';
         document.getElementById('divDailyOrdrChng').style.display = 'none';
         document.getElementById('divSummery').style.display = 'none';
     }
     function showDailyOrderChange() 
     {
         document.getElementById('divHawkerInfo').style.display = 'none';
         document.getElementById('divFamilyInfo').style.display = 'none';
         document.getElementById('divOrderChng').style.display = 'none';
         document.getElementById('divDailyOrdrChng').style.display = 'block';
         document.getElementById('divSummery').style.display = 'none';
     }
     function showSummery() 
     {
         document.getElementById('divHawkerInfo').style.display = 'none';
         document.getElementById('divFamilyInfo').style.display = 'none';
         document.getElementById('divOrderChng').style.display = 'none';
         document.getElementById('divDailyOrdrChng').style.display = 'none';
         document.getElementById('divSummery').style.display = 'block';
     }

     function showFinderDiv() 
     {
         document.getElementById('divFinder').style.display = 'block';
         document.getElementById('divLeftForm').style.display = 'none';
     }

     function showFinderAgent() 
     {
         document.getElementById('divAgentFinder').style.display = 'block';
         document.getElementById('divLeftForm').style.display = 'none';
     }

     function BackMainDiv() 
     {
         document.getElementById('divFinder').style.display = 'none';
         document.getElementById('divAgentFinder').style.display = 'none';
         document.getElementById('divLeftForm').style.display = 'block';

         document.getElementById('<%= txtFilter.ClientID  %>').value = "";
         document.getElementById('<%= txtFilterAgent.ClientID  %>').value = "";
     }

</script>


<style type="text/css">
     
.Box
{   
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    text-align: center;
    border:2px solid black;
    border-radius: 4px;
    border-color:#A3A3A3;
    height:25px;
    width:120px;
    behavior: url(PIE.htc);    
    font-size:14px;
    font-family: Helvetica, Arial, "Sans Serif";
    font-weight:normal;
    color:#2F5A45;
    background-color:#C3C5E5;
    
}

  </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:40px; height:450px; width:710px;">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:438px; width:698px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Agent Information" style="position:absolute; left:5px; top:10px;  font-size:18px; " ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:696px; left:0px;" />   
            
            

            <div id="divhyperlink" style="position:absolute; height:40px; width:698px; left:0px; top:40px; border-bottom:0px solid #3a3a3a;">           
            
            <a href="#" class="hyperlink"  onclick="javascript:showPersonalInfo();" style="position:absolute;left:0px; top:8px; width:110px;  ">Personal Info.</a>
            <a href="#" class="hyperlink"  onclick="javascript:showFamilyInfo();" style="position:absolute;left:130px; top:8px; width:110px; ">Family Info.</a>
            <a href="#" class="hyperlink"  onclick="javascript:showOrderChng();" style="position:absolute;left:260px; top:8px; width:95px; ">Drop point</a>
            <a href="#" class="hyperlink"  onclick="javascript:showDailyOrderChange();" style="position:absolute;left:370px; top:8px; width:150px; ">Daily Order Change</a>
            <a href="#" class="hyperlink"  onclick="javascript:showSummery();" style="position:absolute;left:535px; top:8px; width:130px; ">Agent Sales Info.</a>
            
            <hr style="position:absolute; top:33px; color:#57677F; width:696px; left:0px;" />   
          </div>
        
        </div>
        
        <div id="divHawkerInfo" class="divHawkerInfo" style="display:block; ">
        <asp:Image ID="arrow1" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:50px; top:-20px;" />
        
        
            <asp:Label ID="lblHawkerId" CssClass="labelTextField" runat="server" Text="Serial No."  style="position:absolute; top:10px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtHawkerId" runat="server" CssClass="textBox" Text="***New***" AutoPostBack="true" OnTextChanged="txtHawkerId_TextChanged" style="position:absolute; width:80px; top:5px; left:180px; text-align:center;"  ></asp:TextBox>
            <asp:ImageButton ID="imgAgentFinder" runat="server" ToolTip="Find Agent" onclientclick="javascript:showFinderAgent();" Style="position: absolute; left:343px; top:7px; width:20px; height:20px;" 
                             ImageUrl="~/Images/Finder.jpg" onclick="imgAgentFinder_Click" />

            <asp:ImageButton ID="btnFirst" runat="server" ImageUrl="~/Images/First.png" style="position:absolute; width:20px; top:7px; left:130px;" onclick="btnFirst_Click" />
            <asp:ImageButton ID="btnPrevious" runat="server" ImageUrl="~/Images/Previous.png" style="position:absolute; width:20px; top:7px; left:155px;" onclick="btnPrevious_Click" />

            <asp:ImageButton ID="btnNext" runat="server" ImageUrl="~/Images/Next.png" style="position:absolute; width:20px; top:7px; left:268px;" onclick="btnNext_Click" />
            <asp:ImageButton ID="btnLast" runat="server" ImageUrl="~/Images/Last.png" style="position:absolute; width:20px; top:7px; left:293px;" onclick="btnLast_Click" />

            <asp:ImageButton ID="btnNew" runat="server" ImageUrl="~/Images/New.JPG" style="position:absolute; width:20px; top:7px; left:318px;" onclick="btnNew_Click" />
          

            <asp:Label ID="lblCusType" CssClass="labelTextField" runat="server" Text="Agent Type"  style="position:absolute; top:43px; left:20px;"  ></asp:Label>
            <asp:DropDownList ID="ddlCusType" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlCusType_SelectedIndexChanged" style="position:absolute; top:40px; left:130px;"  >            
                <asp:ListItem>Agent</asp:ListItem>
                <asp:ListItem>Sub-Agent</asp:ListItem>
                <asp:ListItem>Hawker</asp:ListItem>
            </asp:DropDownList>

            <asp:Label ID="lblHkrName" CssClass="labelTextField" runat="server" Text="Name"  style="position:absolute; top:73px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtHkrName" runat="server" CssClass="textBox" style="position:absolute; font-family:Aparajita; top:70px; left:130px;"  ></asp:TextBox>
            
            <asp:Label ID="lblNameBangla" CssClass="labelTextField" runat="server" Text="Name(Bangla)"  style="position:absolute; top:103px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtHkrNameBangla" runat="server" CssClass="textBox" style="position:absolute; top:100px; left:130px; font-family:Prothoma;"  ></asp:TextBox>

            <asp:Label ID="lblHkrFatherName" CssClass="labelTextField" runat="server" Text="Father's Name"  style="position:absolute; top:133px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtHkrFatherName" runat="server" CssClass="textBox" style="position:absolute; top:130px; left:130px;"  ></asp:TextBox>
            
            <asp:Label ID="lblAgentName" CssClass="labelTextField" runat="server" Text="Agent Name"  style="position:absolute; top:163px; left:20px;"  ></asp:Label>
            <asp:DropDownList ID="ddlAgentName" runat="server" CssClass="dropdownlist" style="position:absolute; top:160px; left:130px;"  ></asp:DropDownList>
            
            <asp:Label ID="lblAgentArea" CssClass="labelTextField" runat="server" Text="Agent Area"  style="position:absolute; top:193px; left:20px;"  ></asp:Label>
            <asp:DropDownList ID="ddlAgentArea" runat="server" CssClass="dropdownlist" style="position:absolute; top:190px; left:130px;"  ></asp:DropDownList>          
            
            <asp:Label ID="lblMobile" CssClass="labelTextField" runat="server" Text="Mobile"  style="position:absolute; top:223px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtMobile" runat="server" CssClass="textBox" style="position:absolute; top:220px; left:130px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>
            
            <asp:Label ID="lblSortingOrder"  runat="server" CssClass="labelTextField" Text="Sorting Order"  style="position:absolute; top:253px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style="position:absolute; top:250px; left:130px;"  ></asp:TextBox>

            <asp:Label ID="lblMarriageDay" CssClass="labelTextField" runat="server" Text="Marrige Day"  style="position:absolute; top:283px; left:20px;"  ></asp:Label>
            <asp:TextBox ID="txtMarriageDay" runat="server" CssClass="textBox" style="position:absolute; top:280px; left:130px;"  ></asp:TextBox>




            <asp:Label ID="lblSalesPeriod" CssClass="labelTextField" runat="server" Text="Sales Duration"  style="position:absolute; top:47px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtSalesPeriod" runat="server" CssClass="textBox" style="position:absolute; top:40px; left:460px; width:92px;" onchange="javascript:salesPeriod();"  ></asp:TextBox>                       
            <asp:TextBox ID="txtSalesDuration" runat="server" ReadOnly="true" CssClass="textBox" style="position:absolute; top:40px; left:567px; width:92px; "  ></asp:TextBox>
            
            <asp:Label ID="lblFloatCopy" CssClass="labelTextField" runat="server" Text="Floating Quantity"  style="position:absolute; top:77px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtFloatCopy" runat="server" CssClass="textBox" style="position:absolute; top:70px; left:460px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>

            <asp:Label ID="lblRegularCopy" CssClass="labelTextField" runat="server" Text="Regular Quantity"  style="position:absolute; top:107px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtRegularCopy" runat="server" CssClass="textBox" style="position:absolute; top:100px; left:460px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>

            <asp:Label ID="lblCorporateCopy" CssClass="labelTextField" runat="server" Text="Corporate Quantity"  style="position:absolute; top:137px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtCorporateCopy" runat="server" CssClass="textBox" style="position:absolute; top:130px; left:460px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>

            <asp:Label ID="lblBillTo" CssClass="labelTextField" runat="server" Text="Billing Agent"  style="position:absolute; top:167px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtBillTo" runat="server" CssClass="textBox" style="position:absolute; top:160px; left:460px; Width:170px;" ></asp:TextBox>
            <asp:ImageButton ID="imgCustomerFinder" runat="server" ToolTip="Find Customer" onclientclick="javascript:showFinderDiv();" Style="position: absolute; left:640px; top:163px; width:20px; height:20px;" 
                             ImageUrl="~/Images/Finder.jpg" onclick="imgCustomerFinder_Click" />
        
            <asp:Label ID="lblImage" CssClass="labelTextField" runat="server" Text="Picture"  style="position:absolute; top:200px; left:355px;"  ></asp:Label>
            <asp:FileUpload ID="fileUploadImage" runat="server" CssClass="textBox"  style="position:absolute; top:190px; left:460px;"   />

            <asp:Label ID="lblSalesArea" CssClass="labelTextField" runat="server" Text="Sales Area"  style="position:absolute; top:227px; left:355px;"  ></asp:Label>
            <asp:DropDownList ID="ddlSalesArea" runat="server" CssClass="dropdownlist" style="position:absolute; top:220px; left:460px;"  ></asp:DropDownList>
            
            <asp:Label ID="lblBirthDay" CssClass="labelTextField" runat="server" Text="Birth Day"  style="position:absolute; top:257px; left:355px;"  ></asp:Label>
            <asp:TextBox ID="txtBirthDay" runat="server" CssClass="textBox" style="position:absolute; top:250px; left:460px;"  ></asp:TextBox>

            <asp:Label ID="lblStatus" CssClass="labelTextField" runat="server" Text="Status"  style="position:absolute; top:284px; left:355px;"  ></asp:Label>
            <asp:RadioButtonList ID="rbActiveInActive" CssClass="radioButton" runat="server"  
                RepeatDirection="Horizontal"  CellPadding="8" 
                style="position:absolute; width:270px; left:445px; top:270px; ">
                    <asp:ListItem Text="Active" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="InActive"></asp:ListItem>
            </asp:RadioButtonList>
           
            <asp:Button id="btnSaveHkrInfo" CssClass="Submitbutton" runat="server" Text="Save" 
                 OnClientClick="return checkEmptyfield();" style="position:absolute; height:30px; top:317px; left:560px;" onclick="btnSaveHkrInfo_Click" />

        </div>


        <div id="divFamilyInfo" class="divHawkerInfo" style="display:none; border:0px solid red;">
                
            <asp:Image ID="arrow2" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute;left:175px; top:-20px;" />

            <asp:Label ID="lblHkrIdFmlInfo" CssClass="labelTextField" runat="server" Text="Customer Id"  style="position:absolute; top:12px; left:30px;"  ></asp:Label>
            <asp:TextBox ID="txtHkrIdFmlInfo" runat="server" ReadOnly="true" CssClass="textBox"  style="position:absolute; text-align:center; top:5px; left:130px; text-align:center;"  ></asp:TextBox>

            <asp:Label ID="lblChildNmae" CssClass="labelTextField" runat="server" Text="Child Name"  style="position:absolute; top:12px; left:350px;"  ></asp:Label>
            <asp:TextBox ID="txtChldName" runat="server" CssClass="textBox"  style="position:absolute;  top:5px; left:430px; text-align:center;"  ></asp:TextBox>

            <asp:Label ID="lblEducation" CssClass="labelTextField" runat="server" Text="Eduaction"  style="position:absolute; top:47px; left:30px;"  ></asp:Label>
            <asp:TextBox ID="txtEducation" runat="server" CssClass="textBox"  style="position:absolute;  top:40px; left:130px; text-align:center;"  ></asp:TextBox>

            <asp:Label ID="lblCldBirthDay" CssClass="labelTextField" runat="server" Text="Birth Day"  style="position:absolute; top:47px; left:350px;"  ></asp:Label>
            <asp:TextBox ID="txtCldBirthDay" runat="server" CssClass="textBox"  style="position:absolute;  top:40px; left:430px; text-align:center;"  ></asp:TextBox>
            
            <asp:Button id="btnHkrFmlInfo" CssClass="Submitbutton" runat="server" 
                Text="Add" OnClientClick="return checkEmptyfield();" style="position:absolute; width:60px; top:75px; left:572px;" onclick="btnHkrFmlInfo_Click" />
            <hr style="position:absolute; top:100px; border-bottom: solid #dadada 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:686px; left:0px;" /> 

            <div id="divInput" style="position:absolute; height:205px; width:670px; border:1px solid gray; top:120px; left:7px; overflow:auto;">

            <asp:HiddenField ID="hdnAgntId" runat="server" />

            <asp:GridView ID="grdFamlInfo" DataKeyNames="hkrID" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:800px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdFamlInfo_RowCreated" 
            onpageindexchanging="grdFamlInfo_PageIndexChanging" 
            onrowdatabound="grdFamlInfo_RowDataBound" 
            onrowdeleting="grdFamlInfo_RowDeleting" 
            onselectedindexchanging="grdFamlInfo_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 
          
               <Columns>
               
                        <asp:BoundField DataField="hkrID" SortExpression="hkrID"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="childName" SortExpression="childName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="eduInfo" SortExpression="eduInfo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="birthDate" SortExpression="birthDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("hkrID") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>

            </div>


        </div>

        <div id="divOrderChng" class="divHawkerInfo" style="display:none; border:0px solid red;">
            
            <asp:Image ID="arrow3" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute;left:300px; top:-20px;" />

            <div id="grdFrmArea" style="position:absolute; left:5px; top:0px; height:335px; width:680px; border:0px solid red; border-radius: 10px; overflow:auto; "  >
        <asp:GridView ID="grdOrderArea" DataKeyNames="dsId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:670px; text-align: center; left: 5px; top:5px; bottom:0px;"
               onrowcreated="grdOrderArea_RowCreated"  
               onrowdatabound="grdOrderArea_RowDataBound"  >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>  
          
               <Columns>
               
                        <asp:BoundField DataField="dsId" SortExpression="dsId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="rmId" SortExpression="rmId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="rmName" SortExpression="rmName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>       
                        
                        <asp:BoundField DataField="statId" SortExpression="statId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:BoundField DataField="defaultCopy" SortExpression="defaultCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                       
               </Columns>
            </asp:GridView>    

        
        </div>

    </div>


 <div id="divDailyOrdrChng" class="divHawkerInfo" style="display:none; border:0px solid red;">
        <asp:Image ID="arrow4" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute;left:435px; top:-20px;" />

        <asp:TextBox ID="txtAgntId"  CssClass="textBox" runat="server" style="position:absolute; left:270px; top:6px; text-align:center; visibility:hidden; " ></asp:TextBox>
        
        <asp:Label ID="lblAgntName1" CssClass="labelTextField" runat="server" Text="Agent Name :" style="position:absolute; left:230px; top:5px;" ></asp:Label>
        <asp:Label ID="lblAgntName" runat="server" style="position:absolute; font-weight: bold; left:310px; top:2px;" ></asp:Label>

       <asp:Label ID="lblStation" CssClass="labelTextField" runat="server" Text="Station :" style="position:absolute; left:230px; top:33px;" ></asp:Label>
       <asp:DropDownList ID='ddlStation' CssClass="dropdownlist" AutoPostBack="true"  onselectedindexchanged="ddlStation_SelectedIndexChanged"
       runat="server" style="position:absolute; left:310px; top:30px; width:130px;" ></asp:DropDownList>
        
        <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:63px; left:230px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory"  runat="server" AutoPostBack="true" onselectedindexchanged="ddlCategory_SelectedIndexChanged"
            CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:310px; width:130px; text-align:center;">
            <asp:ListItem>Daily Newspaper</asp:ListItem>
            <asp:ListItem>Kishor Alo</asp:ListItem>
            <asp:ListItem>Eid Magazine</asp:ListItem>

        </asp:DropDownList>

        <%--onselectedindexchanged="ddlStation_SelectedIndexChanged"--%>

        <div id="day" style="position:absolute; width:110px; height:200px; margin-top:90px; margin-left:230px;">
             <asp:Label ID="lblDay" runat="server" class="Box" Text="Day" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
             <asp:Label ID="lblSat" runat="server" class="Box" Text="SAT" style="position:absolute; top:25px; "> </asp:Label>
             <asp:Label ID="lblSun" runat="server" class="Box" Text="SUN" style="position:absolute; top:50px; "> </asp:Label>
             <asp:Label ID="lblMon" runat="server" class="Box" Text="MON" style="position:absolute; top:75px; "> </asp:Label>
             <asp:Label ID="lblTues" runat="server" class="Box" Text="TUE" style="position:absolute; top:100px; "> </asp:Label>
             <asp:Label ID="lblWed" runat="server" class="Box" Text="WED" style="position:absolute; top:125px; "> </asp:Label>
             <asp:Label ID="lblThurs" runat="server" class="Box" Text="THU" style="position:absolute; top:150px; "> </asp:Label>
             <asp:Label ID="lblFri" runat="server" class="Box" Text="FRI" style="position:absolute; top:175px; "> </asp:Label>

        </div>


        <div id="quantityChange" style="position:absolute; width:110px; height:200px; margin-top:90px; margin-left:344px;">
             <asp:Label ID="lblPage" runat="server" class="Box" Text="Quantity Change" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
             <asp:TextBox ID="txtSatPage" runat="server" class="Box" style="position:absolute; top:25px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtSunPage" runat="server" class="Box" style="position:absolute; top:50px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtMonPage" runat="server" class="Box" style="position:absolute; top:75px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtTuesPage" runat="server" class="Box" style="position:absolute; top:100px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtWedPage" runat="server" class="Box" style="position:absolute; top:125px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtThursPage" runat="server" class="Box" style="position:absolute; top:150px; color:Black; "> </asp:TextBox>
             <asp:TextBox ID="txtFriPage" runat="server" class="Box" style="position:absolute; top:175px; color:Black; "> </asp:TextBox>

        </div>


 <asp:Button id="btnSaveOrderChange" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:310px; left:300px; height:30px;" onclick="btnSaveOrderChange_click" />

    </div>


    <div id="divSummery" class="divHawkerInfo" style="display:none; border:0px solid red;">

        <asp:Image ID="arrow6" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute;left:595px; top:-20px;" />

        <asp:Label ID="lblhkrNameSales" CssClass="labelTextField" runat="server" Text="Agent Name :" style="position:absolute; left:140px; top:5px;" ></asp:Label>
        <asp:Label ID="lblhkrNameSales1" runat="server" style="position:absolute; font-weight: bold; left:220px; top:2px;" ></asp:Label>


         <asp:GridView ID="gridView" runat="server" Style="position: absolute; top:30px;
                left:140px; height:auto; width:400px;font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;"

                AllowPaging="True" AutoGenerateColumns="false" CellSpacing="1" GridLines="Both" AllowSorting = "True" 
                AutoGenerateSelectButton="false" ShowHeader="false" RowStyle-HorizontalAlign="Left" PageSize="190"
                onrowcreated="gridView_RowCreated" onrowdatabound="gridView_RowDataBound"   >                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/> 
        
        <Columns>
            
            <asp:BoundField DataField="PAPERNAME" SortExpression="PAPERNAME"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="200px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
            
            <asp:TemplateField HeaderText="" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            <ItemTemplate>
                                <asp:TextBox ID="txtPaperQuantity" runat="server" Text="0" Style="width:200px; background-color:Yellow;">
                                </asp:TextBox>
                            </ItemTemplate>
            </asp:TemplateField> 

         </Columns>


    </asp:GridView>

    <asp:Button id="btnAgentSalesInfo" CssClass="Submitbutton" runat="server" Text="Save" 
     style="position:absolute; left:285px; height:30px; width:80px; top:315px;" onclick="btnAgentSalesInfo_Click" />

    
 </div>

  </div>
    <asp:ScriptManager ID="ScriptManager" runat="server">
    </asp:ScriptManager>
    <cc1:CalendarExtender ID="calendarBirthDay" runat="server" TargetControlID="txtBirthDay"  
        Format="dd-MMM-yy" PopupButtonID="txtBirthDay">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="calendarSalesPeriod" runat="server" TargetControlID="txtSalesPeriod"  
        Format="yyyy/MM/dd" PopupButtonID="txtSalesPeriod">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="calendarMarriageDay" runat="server" TargetControlID="txtMarriageDay"  
        Format="yyyy-MM-dd" PopupButtonID="txtMarriageDay">
    </cc1:CalendarExtender>
    <cc1:CalendarExtender ID="calendarCldBirthDay" runat="server" TargetControlID="txtCldBirthDay"  
        Format="dd-MMM-yyyy" PopupButtonID="txtCldBirthDay">
    </cc1:CalendarExtender>


    <div id="divFinder" style="display:none; position:absolute; ">
      
      <div id="divFrm"  runat="server" style="width: 548px; background-color: Lavender; border: groove 1px gray;
        position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:30px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            <asp:Label ID="lblFindby" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            <asp:DropDownList ID="ddlCustomer" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Agent Name</asp:ListItem>
                <asp:ListItem>Agent ID</asp:ListItem>
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


            <asp:GridView ID="grdCustomer" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True"
                OnPageIndexChanging="grdCustomer_PageIndexChanging"
                OnSelectedIndexChanged="grdCustomer_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdCustomer_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>  
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />

                <%--<Columns>

                <asp:TemplateField>
                <ItemTemplate>
                <asp:HyperLink ID="hp" Text="pass value" NavigateUrl="~/OrderCapture.aspx" runat="server"></asp:HyperLink>

                </ItemTemplate>
                
                </asp:TemplateField>
                

                </Columns>--%>

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript"></asp:Literal>
      
      </div> 

</div>



<div id="divAgentFinder" style="display:none; position:absolute; ">
      
      <div id="divAgentFrm"  runat="server" style="width: 548px; background-color: Lavender; border: groove 1px gray;
        position: absolute; height: 484px; width:900px; top: 12px; left: 8px;">

        <asp:ImageButton ID="btnBack1" runat="server" ImageUrl="~/Images/back.jpg" OnClientClick="javascript:BackMainDiv();" style="position:absolute; width:30px; top:500px; left:10px;"  />
        
            <asp:Panel ID="pnlAddNews1" runat="server" Style="position: absolute; top: 2px; left: 2px;
            width: 894px; height: 84px; border: groove 1px gray;">
            <asp:Label ID="lblFindby1" runat="server" Text="Find By" Style="position: absolute;
                top: 10px; left: 50px; width: 64px; font-family: Verdana; font-size: 11px; font-weight: bold;"></asp:Label>
            <asp:DropDownList ID="ddlAgent" runat="server" Style="position: absolute; top: 10px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Agent Name</asp:ListItem>
                <asp:ListItem>Agent ID</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="ddlSelectType1" runat="server" Style="position: absolute; top: 33px;
                left: 120px; width: 150px; font-family: Verdana; font-size: 11px; border: groove 1px gray;">
                <asp:ListItem>Contains</asp:ListItem>
                <asp:ListItem>Starts With</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="lblFilter1" runat="server" Style="position: absolute; left: 50px; top: 58px;
                font-family: Verdana; font-size: 11px; font-weight: bold;" Text="Filter  " ForeColor="Black"></asp:Label>
            
            <asp:TextBox ID="txtFilterAgent" runat="server" Style="position: absolute; top: 57px;
                left: 120px; width: 146px; font: bold 11px verdana; border: groove 1px gray;
                height: 16px;" AutoPostBack="True" OnTextChanged="txtFilterAgent_TextChanged"
                TabIndex="1"></asp:TextBox>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Style="position: absolute; top: 90px; left: 2px;
            width: 894px; height: 390px; border:1px solid gray; overflow: scroll;" BackColor="Lavender">


            <asp:GridView ID="grdAgent" runat="server" Style="position: absolute; top: 2px;
                left: 2px; height:320px; width: auto; border:1px solid gray; font-family: Verdana;"
                AllowPaging="True" AutoGenerateColumns="true" CellSpacing="1" GridLines="Both" AutoGenerateSelectButton="True"
                OnPageIndexChanging="grdAgent_PageIndexChanging"
                OnSelectedIndexChanged="grdAgent_SelectedIndexChanged" PageSize="15" 
                onrowdatabound="grdAgent_RowDataBound" >

                <PagerSettings FirstPageImageUrl="~/Images/Grd_First.png" LastPageImageUrl="~/Images/Grd_Last.png"
                    Mode="NextPreviousFirstLast" NextPageImageUrl="~/Images/Grd_Next.png" 
                    PreviousPageImageUrl="~/Images/Grd_Previous.png" />
                <FooterStyle ForeColor="Black" Height="8px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>  
                <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="White" Height="15px" />

            </asp:GridView>


        </asp:Panel>
    <asp:Label ID="lblCustomerID1" runat="server" Style="position: absolute; top: 16px;
            left: 356px; width: 107px;"></asp:Label>
    <asp:Literal runat="server" ID="ltScript1"></asp:Literal>
      
      </div> 

</div>


</asp:Content>





