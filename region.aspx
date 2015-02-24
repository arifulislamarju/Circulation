<%@ Page Title="Create Region" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="region.aspx.cs" Inherits="region" %>

 <asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <style type="text/css">

.regionInfo
{
    position:absolute; 
    margin-top:92px; 
    margin-left:6px; 
    border:0px solid red; 
    width:776px; 
    height:166px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;     
}


#divAuthority
{
    position:absolute; 
    margin-top:5px; 
    margin-left:6px; 
    border:0px solid black; 
    width:368px; 
    height:208px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;   
     
}
    </style>

     
    
    <script type="text/javascript">

        function ValidDiv() 
        {
            if (document.getElementById('<%= txtDivision.ClientID %>').value == '') {
                alert('Please Input Division...');
                document.getElementById('<%= txtDivision.ClientID %>').focus();
                return false;
            }
        }

        function ValidDist() {
            if (document.getElementById('<%= txtDistrict.ClientID %>').value == '') {
                alert('Please Input District...');
                document.getElementById('<%= txtDistrict.ClientID %>').focus();
                return false;
            }
        }

        function ValidPS() {
            if (document.getElementById('<%= txtPS.ClientID %>').value == '') {
                alert('Please Input Police Station...');
                document.getElementById('<%= txtPS.ClientID %>').focus();
                return false;
            }
        }

        function ValidPO() {
            if (document.getElementById('<%= txtPO.ClientID %>').value == '') {
                alert('Please Input Post Office...');
                document.getElementById('<%= txtPO.ClientID %>').focus();
                return false;
            }
        }

        function ValidSta() {
            if (document.getElementById('<%= txtStation.ClientID %>').value == '') {
                alert('Please Input Station...');
                document.getElementById('<%= txtStation.ClientID %>').focus();
                return false;
            }

            else if (document.getElementById('<%= txtDefaultCopy.ClientID %>').value == '') {
                alert('Please Input Default Copy...');
                document.getElementById('<%= txtDefaultCopy.ClientID %>').focus();
                return false;
            }
        }

        function showDiv() 
        {             
                document.getElementById('Division').style.display = 'block';
                document.getElementById('District').style.display = 'none';
                document.getElementById('PoliceStation').style.display = 'none';
                document.getElementById('PostOffice').style.display = 'none';
                document.getElementById('Station').style.display = 'none';
                document.getElementById('divUnion').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'block';
                document.getElementById('grdFrmDistrict').style.display = 'none';
                document.getElementById('grdFrmPS').style.display = 'none';
                document.getElementById('grdFrmPO').style.display = 'none';
                document.getElementById('grdFrmStation').style.display = 'none';
                document.getElementById('divGrdUnion').style.display = 'none';

        }

        function showDist() 
        {
                document.getElementById('District').style.display = 'block';
                document.getElementById('Division').style.display = 'none';
                document.getElementById('PoliceStation').style.display = 'none';
                document.getElementById('PostOffice').style.display = 'none';
                document.getElementById('Station').style.display = 'none';
                document.getElementById('divUnion').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'none';
                document.getElementById('grdFrmDistrict').style.display = 'block';
                document.getElementById('grdFrmPS').style.display = 'none';
                document.getElementById('grdFrmPO').style.display = 'none';
                document.getElementById('grdFrmStation').style.display = 'none';
                document.getElementById('divGrdUnion').style.display = 'none';
        }

        function showPS() 
        {
                document.getElementById('PoliceStation').style.display = 'block';
                document.getElementById('District').style.display = 'none';
                document.getElementById('Division').style.display = 'none';
                document.getElementById('PostOffice').style.display = 'none';
                document.getElementById('Station').style.display = 'none';
                document.getElementById('divUnion').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'none';
                document.getElementById('grdFrmDistrict').style.display = 'none';
                document.getElementById('grdFrmPS').style.display = 'block';
                document.getElementById('grdFrmPO').style.display = 'none';
                document.getElementById('grdFrmStation').style.display = 'none';
                document.getElementById('divGrdUnion').style.display = 'none';
        }

        function showPO() 
        {
                document.getElementById('PostOffice').style.display = 'block';
                document.getElementById('Division').style.display = 'none';
                document.getElementById('District').style.display = 'none';
                document.getElementById('PoliceStation').style.display = 'none';
                document.getElementById('Station').style.display = 'none';
                document.getElementById('divUnion').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'none';
                document.getElementById('grdFrmDistrict').style.display = 'none';
                document.getElementById('grdFrmPS').style.display = 'none';
                document.getElementById('grdFrmPO').style.display = 'block';
                document.getElementById('grdFrmStation').style.display = 'none';
                document.getElementById('divGrdUnion').style.display = 'none';
 
        }

        function showSta() 
        {
                document.getElementById('Station').style.display = 'block';
                document.getElementById('Division').style.display = 'none';
                document.getElementById('District').style.display = 'none';
                document.getElementById('PoliceStation').style.display = 'none';
                document.getElementById('PostOffice').style.display = 'none';
                document.getElementById('divUnion').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'none';
                document.getElementById('grdFrmDistrict').style.display = 'none';
                document.getElementById('grdFrmPS').style.display = 'none';
                document.getElementById('grdFrmPO').style.display = 'none';
                document.getElementById('grdFrmStation').style.display = 'block';
                document.getElementById('divGrdUnion').style.display = 'none';
            }

            function showUnion() 
            {

               
                document.getElementById('divUnion').style.display = 'block';
                document.getElementById('Station').style.display = 'none';
                document.getElementById('Division').style.display = 'none';
                document.getElementById('District').style.display = 'none';
                document.getElementById('PoliceStation').style.display = 'none';
                document.getElementById('PostOffice').style.display = 'none';

                document.getElementById('grdFrmDivision').style.display = 'none';
                document.getElementById('grdFrmDistrict').style.display = 'none'; 
                document.getElementById('grdFrmPS').style.display = 'none';
                document.getElementById('grdFrmPO').style.display = 'none';
                document.getElementById('grdFrmStation').style.display = 'none';
                document.getElementById('divGrdUnion').style.display = 'block';
            }


    </script>




</asp:Content>



 <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  
 <div id="divMainForm" class="divclsFrm" style="position:absolute; left:60px; top:20px; height:280px; width:790px; ">

 <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:268px; width:778px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Geography" style="position:absolute; left:5px; top:10px; font-size:18px; right: 283px;" ></asp:Label> 
            <hr style="position:absolute; top:30px; color:#57677F; width:777px; left:0px;" />   
            
        <div id="divhyperlink" style="position:absolute; height:40px; width:779px; left:0px; top:40px; border-bottom:0px solid #3a3a3a;">           
            
            <a href="#" class="hyperlink"  onclick="javascript:showDiv();" style="position:absolute;left:0px; top:8px; width:80px; ">Division</a>
            <a href="#" class="hyperlink"  onclick="javascript:showDist()" style="position:absolute;left:100px; top:8px; width:80px;">District</a>
            <a href="#" class="hyperlink"  onclick="javascript:showPS();" style="position:absolute;left:200px; top:8px; width:180px;">Police Station/Upazila</a>
            <a href="#" class="hyperlink"  onclick="javascript:showPO()" style="position:absolute;left:400px; top:8px; width:100px;">Post Office</a>
            <a href="#" class="hyperlink"  onclick="javascript:showUnion()" style="position:absolute;left:525px; top:8px; width:70px;">Union</a>
            <a href="#" class="hyperlink"  onclick="javascript:showSta();" style="position:absolute;left:610px; top:8px; width:70px;">Station</a>

         </div>

         

</div>
<hr style="position:absolute; top:77px; color:#57677F; width:778px; left:5px;" />  


      <div id="Division" class="regionInfo" style="display:block;" >
        <asp:Image ID="arrow1" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:35px; top:-20px;" />
       
           <asp:Label ID="lblName1"  runat="server" CssClass="labelTextField" Text="Division"  style="position:absolute; top:23px; left:210px;" ></asp:Label>
            
           <asp:TextBox ID="txtDivision" runat="server" CssClass="textBox" style="position:absolute; top:20px; left:300px;" ></asp:TextBox>

            <asp:Button id="btnSaveDiv" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:60px; left:400px; height:30px;" onclientclick="return ValidDiv();" onclick="btnSaveDiv_click" />
         
       </div>
     


    <div id="District" class="regionInfo" style="display:none;" >
    <asp:Image ID="arrow2" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:135px; top:-20px;" />

            <asp:Label ID="lblName2"  runat="server" CssClass="labelTextField" Text="District"  style="position:absolute; top:13px; left:210px;"  ></asp:Label>
            <asp:TextBox ID="txtDistrict" runat="server" CssClass="textBox" style="position:absolute; top:10px; left:300px;"  ></asp:TextBox>

            <asp:Label ID="lblDivision" CssClass="labelTextField" runat="server" Text="Division"  style="position:absolute; top:53px; left:210px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDivisionForDist" runat="server" CssClass="dropdownlist" AutoPostBack="True"
            style="position:absolute; top:50px; left:300px;" onselectedindexchanged="ddlDivisionForDist_SelectedIndexChanged" > </asp:DropDownList>   
           

            <asp:Button id="btnSaveDist" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:90px; left:400px; height:30px;" onclientclick="return ValidDist();" onclick="btnSaveDist_click" />

    </div>
 

    <div id="PoliceStation" class="regionInfo" style="display:none;" >
    <asp:Image ID="arrow3" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:270px; top:-20px;" />

            <asp:Label ID="lblName3"  runat="server" CssClass="labelTextField" Text="Police Station"  style="position:absolute; top:23px; left:50px;"  ></asp:Label>
            <asp:TextBox ID="txtPS" runat="server" CssClass="textBox" style="position:absolute; top:20px; left:145px; width:165px; "  ></asp:TextBox>

            <asp:Label ID="lblDivision1" CssClass="labelTextField" runat="server" Text="Division"  style="position:absolute; top:63px; left:50px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDivisionForPS" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:145px;" onselectedindexchanged="ddlDivisionForPS_SelectedIndexChanged" >   </asp:DropDownList>     
            
            <asp:Label ID="lblDistrict" CssClass="labelTextField" runat="server" Text="District"  style="position:absolute; top:23px; left:430px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDistrictForPS" runat="server" CssClass="dropdownlist" AutoPostBack="True"
            style="position:absolute; top:20px; left:490px;" onselectedindexchanged="ddlDistrictForPS_SelectedIndexChanged" > </asp:DropDownList>   

            <asp:Button id="btnGoPS" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:22px; left:317px; height:22px; width:32px; " onclick="btnGoPS_click" />

            <asp:Button id="btnSavePS" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:60px; left:580px; height:30px;" onclientclick="return ValidPS();" onclick="btnSavePS_click" />


    </div>


    <div id="PostOffice" class="regionInfo" style="display:none;" >
    <asp:Image ID="arrow4" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:440px; top:-20px;" />


            <asp:Label ID="lblNamePO"  runat="server" CssClass="labelTextField" Text="Post Office"  style="position:absolute; top:13px; left:50px;"  ></asp:Label>
            <asp:TextBox ID="txtPO" runat="server" CssClass="textBox" style="position:absolute; top:10px; left:130px; width:165px; "  ></asp:TextBox>

            <asp:Label ID="lblPostCode"  runat="server" CssClass="labelTextField" Text="Post Code"  style="position:absolute; top:53px; left:50px;"  ></asp:Label>
            <asp:TextBox ID="txtPostCode" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:130px;"  ></asp:TextBox>

            <asp:Label ID="lblDivision2" CssClass="labelTextField" runat="server" Text="Division"  style="position:absolute; top:93px; left:50px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDivisionForPO" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:90px; left:130px;" onselectedindexchanged="ddlDivisionForPO_SelectedIndexChanged" >   </asp:DropDownList>     
            
            <asp:Label ID="lblDistrict1" CssClass="labelTextField" runat="server" Text="District"  style="position:absolute; top:13px; left:400px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDistrictForPO" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:10px; left:490px;" onselectedindexchanged="ddlDistrictForPO_SelectedIndexChanged" >   </asp:DropDownList>  
            
            <asp:Label ID="lblPS" CssClass="labelTextField" runat="server" Text="Police Station"  style="position:absolute; top:53px; left:400px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPSForPO" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:50px; left:490px;" onselectedindexchanged="ddlPSForPO_SelectedIndexChanged" > </asp:DropDownList> 

            <asp:Button id="btnGoPO" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:12px; left:302px; height:22px; width:32px; " onclick="btnGoPO_click" />

            <asp:Button id="btnSavePO" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:90px; left:575px; height:30px;" onclientclick="return ValidPO();" onclick="btnSavePO_click" />

    </div>

   

   <div id="divUnion" class="regionInfo" style="display:none;" >

        <asp:Image ID="arrowUnion" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:550px; top:-20px;" />

        <asp:Label ID="lblUnion"  runat="server" CssClass="labelTextField" Text="Union"  style="position:absolute; top:23px; left:60px;"  ></asp:Label>
        <asp:TextBox ID="txtUnion" runat="server" CssClass="textBox" style="position:absolute; top:20px; left:135px; width:165px; "  ></asp:TextBox>       

        <asp:Label ID="lblDivisionUnion" CssClass="labelTextField" runat="server" Text="Division"  style="position:absolute; top:63px; left:60px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDivisionUnion" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
        style="position:absolute; top:60px; left:135px;" onselectedindexchanged="ddlDivisionUnion_SelectedIndexChanged" >   </asp:DropDownList>     
            
        <asp:Label ID="lblDistrictUnion" CssClass="labelTextField" runat="server" Text="District"  style="position:absolute; top:103px; left:60px;"  ></asp:Label>
        <asp:DropDownList ID="ddlDistrictUnion" runat="server" CssClass="dropdownlist" AutoPostBack="true" 
        style="position:absolute; top:100px; left:135px;" onselectedindexchanged="ddlDistrictUnion_SelectedIndexChanged" ></asp:DropDownList>

        <asp:Label ID="lblPSUnion" CssClass="labelTextField" runat="server" Text="Police Station"  style="position:absolute; top:23px; left:400px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPSUnion" runat="server"  CssClass="dropdownlist" AutoPostBack="true" 
            style="position:absolute; top:20px; left:500px;" onselectedindexchanged="ddlPSUnion_SelectedIndexChanged" ></asp:DropDownList>

        <asp:Label ID="lblPOforUnion" CssClass="labelTextField" runat="server" Text="Post Office"  style="position:absolute; top:63px; left:400px;"  ></asp:Label>
        <asp:DropDownList ID="ddlPOForUnion" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:500px;" onselectedindexchanged="ddlPOForUnion_SelectedIndexChanged" > </asp:DropDownList>
        
        <asp:Button id="btnGoUnion" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:22px; left:307px; height:22px; width:32px; " onclick="btnGoUnion_click" />
    
        <asp:Button id="btnUnion" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:120px; left:600px; height:30px;" onclick="btnUnion_click"/> 


    </div>



    <div id="Station" class="regionInfo" style="display:none;" >
    <asp:Image ID="arrow5" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:640px; top:-20px;" />

            <asp:Label ID="lblStationBan"  runat="server" CssClass="labelTextField" Text="Station (Bangla)"  style="position:absolute; top:3px; left:30px;"  ></asp:Label>
            <asp:TextBox ID="txtStationBan" runat="server" CssClass="textBox" style="position:absolute; top:0px; left:140px; font-family:Prothoma;"  ></asp:TextBox>

            <asp:Label ID="lblStationEng"  runat="server" CssClass="labelTextField" Text="Station (English)"  style="position:absolute; top:33px; left:30px;"  ></asp:Label>
            <asp:TextBox ID="txtStation" runat="server" CssClass="textBox" style="position:absolute; top:30px; left:140px; width:165px; "  ></asp:TextBox>
            
            <asp:Label ID="lblDivision3" CssClass="labelTextField" runat="server" Text="Division"  style="position:absolute; top:63px; left:30px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDivisionForSta" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:140px;" onselectedindexchanged="ddlDivisionForSta_SelectedIndexChanged" >   </asp:DropDownList>     
            
            <asp:Label ID="lblDistrict2" CssClass="labelTextField" runat="server" Text="District"  style="position:absolute; top:93px; left:30px;"  ></asp:Label>
            <asp:DropDownList ID="ddlDistrictForSta" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:90px; left:140px;" onselectedindexchanged="ddlDistrictForSta_SelectedIndexChanged" >   </asp:DropDownList>  
            
            <asp:Label ID="lblPS1" CssClass="labelTextField" runat="server" Text="Police Station"  style="position:absolute; top:123px; left:30px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPSForSta" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:120px; left:140px;" onselectedindexchanged="ddlPSForSta_SelectedIndexChanged" >   </asp:DropDownList>

            <asp:Label ID="lblPO" CssClass="labelTextField" runat="server" Text="Post Office"  style="position:absolute; top:153px; left:30px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPOForSta" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
            style="position:absolute; top:150px; left:140px;" onselectedindexchanged="ddlPOForSta_SelectedIndexChanged" > </asp:DropDownList>

            <asp:Label ID="lblUnionStation" CssClass="labelTextField" runat="server" Text="Union" style="position:absolute; top:3px; left:400px;"  ></asp:Label>
            <asp:DropDownList ID="ddlUnionStation" runat="server" CssClass="dropdownlist" 
            style="position:absolute; top:0px; left:490px; " > </asp:DropDownList>

            <asp:Label ID="lblDefaultCopy"  runat="server" CssClass="labelTextField" Text="Default Copy"  style="position:absolute; top:33px; left:400px;"  ></asp:Label>
            <asp:TextBox ID="txtDefaultCopy" runat="server" CssClass="textBox" style="position:absolute; top:30px; left:490px;"  ></asp:TextBox>

            <asp:Label ID="lblPackType" CssClass="labelTextField" runat="server" Text="Pack Type"  style="position:absolute; top:63px; left:400px;"  ></asp:Label>
            <asp:DropDownList ID="ddlPackType" runat="server"  CssClass="dropdownlist" 
            style="position:absolute; top:60px; left:490px;" onselectedindexchanged="ddlPackType_SelectedIndexChanged" >
                
                <asp:ListItem Selected="True">--Select--</asp:ListItem>
                <asp:ListItem>Individual</asp:ListItem>
                <asp:ListItem>Combined</asp:ListItem>
                <asp:ListItem>Overpacked</asp:ListItem>
                <asp:ListItem>Special</asp:ListItem>

            </asp:DropDownList>

            <asp:Label ID="lblSubRouteName" CssClass="labelTextField" runat="server" Text="Sub-Route"  style="position:absolute; top:93px; left:400px;"  ></asp:Label>
            <asp:DropDownList ID="ddlSubRouteName" runat="server" AutoPostBack="True" CssClass="dropdownlist" 
                  style="position:absolute; top:90px; left:490px;" onselectedindexchanged="ddlSubRouteName_SelectedIndexChanged" >   </asp:DropDownList>
            
            <asp:Label ID="lblSortingOrder"  runat="server" CssClass="labelTextField" Text="Sorting Order"  style="position:absolute; top:123px; left:400px;"  ></asp:Label>
            <asp:TextBox ID="txtSortingOrder" runat="server" CssClass="textBox" style="position:absolute; top:120px; left:490px;"  ></asp:TextBox>

            <asp:Button id="btnGoStation" CssClass="Submitbutton" runat="server" Text="Go" style="position:absolute; top:32px; left:313px; height:22px; width:32px; " onclick="btnGoStation_click" />

            <asp:Button id="btnSaveStation" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:150px; left:590px; height:30px;" onclientclick="return ValidSta();" onclick="btnSaveStation_click" />


    </div>
    

</div>



    <div id="grdDivDivision" class="divclsFrm" style="position:absolute; display:block; left:60px; top:320px; height:230px; width:790px;">
    
    <asp:HiddenField ID="hdndivId" runat="server" />

    <div id="grdFrmDivision" class="divclsInput" style="display:block; position:absolute; left:4px; top:4px; height:220px; width:780px; overflow:auto; "  >
        <asp:GridView ID="grdDivision" DataKeyNames="divId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:770px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdDivision_RowCreated" 
            onpageindexchanging="grdDivision_PageIndexChanging" 
            onrowdatabound="grdDivision_RowDataBound" 
            onrowdeleting="grdDivision_RowDeleting" 
            onselectedindexchanging="grdDivision_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="divId" SortExpression="divId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="divName" SortExpression="divName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="50px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEditDiv"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDeleteDiv"  CommandArgument='<%# Eval("divId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

     </div>



    <%--<div id="grdDivDistrict" class="divclsFrm"  style="display:block; position:absolute; left:60px; top:310px; height:230px; width:790px;">--%>
    
    <asp:HiddenField ID="hdndistId" runat="server" />

    <div id="grdFrmDistrict" class="divclsInput" style="position:absolute; display:none; left:64px; top:324px; height:220px; width:780px; overflow:auto; "  >

        <asp:GridView ID="grdDistrict" DataKeyNames="distId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:770px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdDistrict_RowCreated" 
            onpageindexchanging="grdDistrict_PageIndexChanging" 
            onrowdatabound="grdDistrict_RowDataBound" 
            onrowdeleting="grdDistrict_RowDeleting" 
            onselectedindexchanging="grdDistrict_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="distId" SortExpression="distId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="divName" SortExpression="divName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>      
                        
                        <asp:BoundField DataField="distName" SortExpression="distName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                
                       
                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("distId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

      <%--</div>--%>



  <%--<div id="grdDivPS" class="divclsFrm"  style="display:block; position:absolute; left:60px; top:310px; height:230px; width:790px;">--%>
    
    <asp:HiddenField ID="hdnpsId" runat="server" />

    <div id="grdFrmPS" class="divclsInput" style="position:absolute; display:none; left:64px; top:324px; height:220px; width:780px; overflow:auto; "  >
        <asp:GridView ID="grdPS" DataKeyNames="psId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:770px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdPS_RowCreated" 
            onpageindexchanging="grdPS_PageIndexChanging" 
            onrowdatabound="grdPS_RowDataBound" 
            onrowdeleting="grdPS_RowDeleting" 
            onselectedindexchanging="grdPS_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="psId" SortExpression="psId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="divName" SortExpression="divName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>      
                        
                        <asp:BoundField DataField="distName" SortExpression="distName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>        
                        
                        <asp:BoundField DataField="psName" SortExpression="psName"
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
                                <asp:LinkButton ID="linkButtonEditPS"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDeletePS"  CommandArgument='<%# Eval("psId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

      <%--</div>--%>



 <%--<div id="grdDivPO" class="divclsFrm"  style="display:block; position:absolute; left:60px; top:310px; height:230px; width:790px;">--%>
    
    <asp:HiddenField ID="hdnpoId" runat="server" />

    <div id="grdFrmPO" class="divclsInput" style="position:absolute; display:none; left:64px; top:324px; height:220px; width:780px; overflow:auto; "  >
        
        <asp:GridView ID="grdPO" DataKeyNames="poId" runat="server"  AutoGenerateColumns="false"
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:800px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdPO_RowCreated" 
            onpageindexchanging="grdPO_PageIndexChanging" 
            onrowdatabound="grdPO_RowDataBound" 
            onrowdeleting="grdPO_RowDeleting" 
            onselectedindexchanging="grdPO_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="poId" SortExpression="poId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="divName" SortExpression="divName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>      
                        
                        <asp:BoundField DataField="distName" SortExpression="distName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>        
                        
                        <asp:BoundField DataField="psName" SortExpression="psName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="poName" SortExpression="poName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="poCode" SortExpression="poCode"
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
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("poId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

     <%-- </div>--%>



     <%--<div id="divFrmUnion" class="divclsFrm"  style="display:block; position:absolute; left:60px; top:310px; height:230px; width:790px;" >--%>

    <div id="divGrdUnion" class="divclsInput" style="display:none; position:absolute; left:64px; top:324px; height:220px; width:780px; overflow:auto; "  >            
                
            <asp:GridView ID="grdUnion" DataKeyNames="UnionId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:770px; text-align: center; left: 5px; top:5px; bottom:0px;"
                    onrowcreated="grdUnion_RowCreated" 
            onpageindexchanging="grdUnion_PageIndexChanging" 
            onrowdatabound="grdUnion_RowDataBound" 
            onrowdeleting="grdUnion_RowDeleting" 
            onselectedindexchanging="grdUnion_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="UnionId" SortExpression="UnionId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="division" SortExpression="division"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>        
                        
                        <asp:BoundField DataField="district" SortExpression="district"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="policestation" SortExpression="policestation"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                        
                        <asp:BoundField DataField="postOffice" SortExpression="postOffice"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="UnionName" SortExpression="UnionName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                 
                       
                        <asp:BoundField DataField="createUser" SortExpression="createUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("UnionId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    
            
            <asp:HiddenField ID="hdnUnion" runat="server" />

            </div>

     <%--</div>--%>



 <%--<div id="grdDivStation" class="divclsFrm"  style="display:block; position:absolute; left:60px; top:310px; height:230px; width:790px;" >--%>
    
    <asp:HiddenField ID="hdnStationId" runat="server" />

    <div id="grdFrmStation" class="divclsInput" style="position:absolute; display:none; left:64px; top:324px; height:220px; width:780px; overflow:auto; "  >
        <asp:GridView ID="grdStation" DataKeyNames="stationId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:1150px; text-align: center; left:5px; top:5px; bottom:0px;"
                    onrowcreated="grdStation_RowCreated" 
            onpageindexchanging="grdStation_PageIndexChanging" 
            onrowdatabound="grdStation_RowDataBound" 
            onrowdeleting="grdStation_RowDeleting" 
            onselectedindexchanging="grdStation_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="stationId" SortExpression="stationId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="divName" SortExpression="divName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>      
                        
                        <asp:BoundField DataField="distName" SortExpression="distName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>        
                        
                        <asp:BoundField DataField="psName" SortExpression="psName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="poName" SortExpression="poName"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="UnionName" SortExpression="UnionName"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="stationNameBan" SortExpression="stationNameBan"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" ItemStyle-Font-Names="Prothoma" ItemStyle-Font-Size="Medium"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="defaultCopy" SortExpression="defaultCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="packType" SortExpression="packType"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 
                        
                        <asp:BoundField DataField="subRouteName" SortExpression="subRouteName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                       
                        <asp:BoundField DataField="sortingOrder" SortExpression="sortingOrder"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                       
                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="30px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("stationId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

        </div>
  <%--</div>--%>

  

</asp:Content>