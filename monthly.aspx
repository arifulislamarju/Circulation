﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="monthly.aspx.cs" Inherits="monthly" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


  <style type="text/css">
       
   #GM
   {
    position:absolute; 
    margin-top:90px; 
    margin-left:26px; 
    border:0px solid black; 
    width:360px; 
    height:255px; 
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
    margin-left:26px; 
    border:0px solid black; 
    width:360px; 
    height:255px; 
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
    margin-left:26px; 
    border:0px solid black; 
    width:360px; 
    height:255px; 
    background-color:#C3C5E5;
    behavior: url(PIE.htc);    
    border-radius: 15px;     
    -moz-border-radius-bottomleft: 15px;
   -moz-border-radius-bottomright: 15px;
   -webkit-border-bottom-left-radius: 15px;
   -webkit-border-bottom-right-radius: 15px;    
    }

    .Box
    {   
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    text-align: center;
    border:2px solid black;
    border-radius: 4px;
    border-color:#A3A3A3;
    height:17px;
    width:90px;
    behavior: url(PIE.htc);
    background-color:#C3C5E5;
    }
    
    
    .Boxtarget
    {   
    -webkit-border-radius: 15px;
    -moz-border-radius: 15px;
    text-align: center;
    border:2px solid black;
    border-radius: 4px;
    border-color:#A3A3A3;
    height:34px;
    width:90px;
    behavior: url(PIE.htc);
    background-color:#C3C5E5;
    }
    

  </style>



    <script type="text/javascript">


    function showGM() 
    {
        document.getElementById('GM').style.display = 'block';
        document.getElementById('Manager').style.display = 'none';
        document.getElementById('RM').style.display = 'none';
    }

    function showM() 
    {

        document.getElementById('GM').style.display = 'none';
        document.getElementById('Manager').style.display = 'block';
        document.getElementById('RM').style.display = 'none';

    }

    function showRM() 
    {
        document.getElementById('GM').style.display = 'none';
        document.getElementById('Manager').style.display = 'none';
        document.getElementById('RM').style.display = 'block';

    }



    </script>



</asp:Content>





<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  <div id="divMainForm" class="divclsFrm" style="position:absolute; left:200px; top:20px; height:520px; width:520px; ">

     <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:508px; width:508px; ">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Monthly Target" style="position:absolute; left:5px; top:5px; font-size:18px; right: 283px;" ></asp:Label> 
            <hr style="position:absolute; top:25px; color:#57677F; width:506px; left:0px;" /> 

     </div>

      <div id="divhyperlink" style="position:absolute; height:40px; width:510px; left:5px; top:34px; border-bottom:1px solid #3a3a3a;">           
            
            <a href="#" class="hyperlink"  onclick="javascript:showGM();" style="position:absolute;left:0px; top:8px; width:130px; ">General Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showM()" style="position:absolute;left:150px; top:8px; width:80px;">Manager</a>
            <a href="#" class="hyperlink"  onclick="javascript:showRM();" style="position:absolute;left:250px; top:8px; width:80px;">RM/SE</a>

      </div>


   <div id="GM"  style="display:block;" >
      <asp:Image ID="arrow1" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:40px; top:-30px;" />

     <asp:Label ID="lblYearGM" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:3px; left:40px;"  ></asp:Label>
      <asp:DropDownList ID="ddlYearGM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlYearGM_SelectedIndexChanged"
           style="position:absolute; top:0px; left:150px;" >   </asp:DropDownList>
     
      <asp:Label ID="lblGM" CssClass="labelTextField" runat="server" Text="General Manager"  style="position:absolute; top:33px; left:40px;"  ></asp:Label>
      <asp:DropDownList ID="ddlGM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlGM_SelectedIndexChanged"
           style="position:absolute; top:30px; left:150px;" >   </asp:DropDownList>

      

   <div id="monthGM" style="position:absolute; width:90px; height:325px; margin-top:60px; margin-left:0px;">
     <asp:Label ID="lblGMMonth" runat="server" class="Boxtarget" Text="Month" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:Label ID="lblGMJan" runat="server" class="Box" Text="JAN" style="position:absolute; top:37px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMFeb" runat="server" class="Box" Text="FEB" style="position:absolute; top:59px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMMar" runat="server" class="Box" Text="MAR" style="position:absolute; top:81px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMApr" runat="server" class="Box" Text="APR" style="position:absolute; top:103px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMMay" runat="server" class="Box" Text="MAY" style="position:absolute; top:125px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMJun" runat="server" class="Box" Text="JUN" style="position:absolute; top:147px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMJul" runat="server" class="Box" Text="JUL" style="position:absolute; top:169px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMAug" runat="server" class="Box" Text="AUG" style="position:absolute; top:191px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMSep" runat="server" class="Box" Text="SEP" style="position:absolute; top:213px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMOct" runat="server" class="Box" Text="OCT" style="position:absolute; top:235px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMNov" runat="server" class="Box" Text="NOV" style="position:absolute; top:257px; height:19px; "> </asp:Label>
     <asp:Label ID="lblGMDec" runat="server" class="Box" Text="DEC" style="position:absolute; top:279px; height:19px; "> </asp:Label>

   </div>


   <div id="targetCopyGM" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 94px;">
     <asp:Label ID="lblGMTarget" runat="server" class="Boxtarget" Text="Target Copy" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtGmJan" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmFeb" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMar" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmApr" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMay" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJun" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJul" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAug" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmSep" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmOct" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmNov" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmDec" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="prvAchievemntGM" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 188px;">
     <asp:Label ID="lblGMprvAchv" runat="server" class="Boxtarget" Text="Previous Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtGmJanPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmFebPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMarPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAprPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMayPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJunPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJulPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAugPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmSepPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmOctPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmNovPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmDecPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="curntAchievemntGM" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:282px;">
     <asp:Label ID="lblGMCurntAchv" runat="server" class="Boxtarget" Text="Current Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtGmJanCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmFebCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMarCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAprCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMayCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJunCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJulCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAugCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmSepCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmOctCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmNovCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmDecCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="RemarksGM" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:376px;">
     <asp:Label ID="lblGMremarks" runat="server" class="Boxtarget" Text="Remarks" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtGmJanRemarks" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmFebRemarks" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMarRemarks" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAprRemarks" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmMayRemarks" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJunRemarks" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmJulRemarks" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmAugRemarks" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmSepRemarks" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmOctRemarks" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmNovRemarks" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtGmDecRemarks" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>

     <asp:Button id="btnSaveGM" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:380px; left:185px; height:30px;"  onclick="btnSaveGM_click" />

   </div>





   <div id="Manager"  style="display:none;" >
      <asp:Image ID="arrow2" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:170px; top:-30px;" />

      <asp:Label ID="lblYearManager" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:3px; left:70px;"  ></asp:Label>
      <asp:DropDownList ID="ddlYearManager" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlYearManager_SelectedIndexChanged"
           style="position:absolute; top:0px; left:140px;" >   </asp:DropDownList>
      
      <asp:Label ID="lblManager" CssClass="labelTextField" runat="server" Text="Manager"  style="position:absolute; top:33px; left:70px;"  ></asp:Label>
      <asp:DropDownList ID="ddlManager" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlManager_SelectedIndexChanged"
           style="position:absolute; top:30px; left:140px;" >   </asp:DropDownList>

      

  <div id="monthMan" style="position:absolute; width:90px; height:325px; margin-top:60px; margin-left:0px;">
     <asp:Label ID="lblManMonth" runat="server" class="Boxtarget" Text="Month" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:Label ID="lblManJan" runat="server" class="Box" Text="JAN" style="position:absolute; top:37px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManFeb" runat="server" class="Box" Text="FEB" style="position:absolute; top:59px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManMar" runat="server" class="Box" Text="MAR" style="position:absolute; top:81px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManApr" runat="server" class="Box" Text="APR" style="position:absolute; top:103px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManMay" runat="server" class="Box" Text="MAY" style="position:absolute; top:125px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManJun" runat="server" class="Box" Text="JUN" style="position:absolute; top:147px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManJul" runat="server" class="Box" Text="JUL" style="position:absolute; top:169px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManAug" runat="server" class="Box" Text="AUG" style="position:absolute; top:191px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManSep" runat="server" class="Box" Text="SEP" style="position:absolute; top:213px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManOct" runat="server" class="Box" Text="OCT" style="position:absolute; top:235px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManNov" runat="server" class="Box" Text="NOV" style="position:absolute; top:257px; height:19px; "> </asp:Label>
     <asp:Label ID="lblManDec" runat="server" class="Box" Text="DEC" style="position:absolute; top:279px; height:19px; "> </asp:Label>

   </div>


   <div id="targetCopyMan" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 94px;">
     <asp:Label ID="lblManTarget" runat="server" class="Boxtarget" Text="Target Copy" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtManJan" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtManFeb" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMar" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtManApr" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMay" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJun" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJul" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAug" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtManSep" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtManOct" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtManNov" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtManDec" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="prvAchievemntMan" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 188px;">
     <asp:Label ID="lblManprvAchv" runat="server" class="Boxtarget" Text="Previous Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtManJanPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtManFebPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMarPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAprPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMayPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJunPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJulPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAugPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtManSepPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtManOctPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtManNovPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtManDecPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="curntAchievemntMan" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:282px;">
     <asp:Label ID="lblManCurntAchv" runat="server" class="Boxtarget" Text="Current Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtManJanCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtManFebCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMarCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAprCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMayCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJunCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJulCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAugCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtManSepCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtManOctCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtManNovCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtManDecCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="RemarksMan" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:376px;">
     <asp:Label ID="lblManremarks" runat="server" class="Boxtarget" Text="Remarks" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtManJanRemarks" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtManFebRemarks" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMarRemarks" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAprRemarks" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtManMayRemarks" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJunRemarks" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtManJulRemarks" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtManAugRemarks" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtManSepRemarks" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtManOctRemarks" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtManNovRemarks" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtManDecRemarks" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>

     <asp:Button id="btnSaveManager" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:380px; left:185px; height:30px;"  onclick="btnSaveManager_click" />

   </div>




   <div id="RM"  style="display:none;" >
      <asp:Image ID="arrow3" runat="server" ImageUrl="~/Images/arrow.png" style="position:absolute; left:260px; top:-30px;" />

      <asp:Label ID="lblYearRM" CssClass="labelTextField" runat="server" Text="Year"  style="position:absolute; top:3px; left:50px;"  ></asp:Label>
      <asp:DropDownList ID="ddlYearRM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlYearRM_SelectedIndexChanged"
           style="position:absolute; top:0px; left:160px;" >   </asp:DropDownList>
     
      <asp:Label ID="lblRM" CssClass="labelTextField" runat="server" Text="Regional Manager"  style="position:absolute; top:33px; left:50px;"  ></asp:Label>
      <asp:DropDownList ID="ddlRM" runat="server" CssClass="dropdownlist" AutoPostBack="True" onselectedindexchanged="ddlRM_SelectedIndexChanged"
           style="position:absolute; top:30px; left:160px;" >   </asp:DropDownList>


   <div id="monthRm" style="position:absolute; width:90px; height:325px; margin-top:60px; margin-left:0px;">
     <asp:Label ID="lblRmMonth" runat="server" class="Boxtarget" Text="Month" style="position:absolute; font-weight:bold; top:auto;"> </asp:Label>
     <asp:Label ID="lblRmJan" runat="server" class="Box" Text="JAN" style="position:absolute; top:37px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmFeb" runat="server" class="Box" Text="FEB" style="position:absolute; top:59px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmMar" runat="server" class="Box" Text="MAR" style="position:absolute; top:81px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmApr" runat="server" class="Box" Text="APR" style="position:absolute; top:103px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmMay" runat="server" class="Box" Text="MAY" style="position:absolute; top:125px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmJun" runat="server" class="Box" Text="JUN" style="position:absolute; top:147px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmJul" runat="server" class="Box" Text="JUL" style="position:absolute; top:169px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmAug" runat="server" class="Box" Text="AUG" style="position:absolute; top:191px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmSep" runat="server" class="Box" Text="SEP" style="position:absolute; top:213px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmOct" runat="server" class="Box" Text="OCT" style="position:absolute; top:235px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmNov" runat="server" class="Box" Text="NOV" style="position:absolute; top:257px; height:19px; "> </asp:Label>
     <asp:Label ID="lblRmDec" runat="server" class="Box" Text="DEC" style="position:absolute; top:279px; height:19px; "> </asp:Label>

   </div>


   <div id="targetCopyRm" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 94px;">
     <asp:Label ID="lblRmTarget" runat="server" class="Boxtarget" Text="Target Copy" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtRmJan" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmFeb" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMar" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmApr" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMay" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJun" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJul" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAug" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmSep" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmOct" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmNov" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmDec" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="prvAchievemntRm" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left: 188px;">
     <asp:Label ID="lblRmprvAchv" runat="server" class="Boxtarget" Text="Previous Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtRmJanPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmFebPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMarPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAprPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMayPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJunPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJulPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAugPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmSepPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmOctPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmNovPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmDecPrv" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="curntAchievemntRm" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:282px;">
     <asp:Label ID="lblRmCurntAchv" runat="server" class="Boxtarget" Text="Current Year Achievement" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtRmJanCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmFebCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMarCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAprCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMayCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJunCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJulCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAugCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmSepCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmOctCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmNovCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmDecCurnt" runat="server" ReadOnly="true" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>


   <div id="RemarksRm" style="position:absolute; width:100px; height:325px; margin-top:60px; margin-left:376px;">
     <asp:Label ID="lblRmremarks" runat="server" class="Boxtarget" Text="Remarks" style="position:absolute; font-size:14px; font-weight:bold; top:auto;"> </asp:Label>
     <asp:TextBox ID="txtRmJanRemarks" runat="server" class="Box" style="position:absolute; top:37px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmFebRemarks" runat="server" class="Box" style="position:absolute; top:59px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMarRemarks" runat="server" class="Box" style="position:absolute; top:81px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAprRemarks" runat="server" class="Box" style="position:absolute; top:103px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmMayRemarks" runat="server" class="Box" style="position:absolute; top:125px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJunRemarks" runat="server" class="Box" style="position:absolute; top:147px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmJulRemarks" runat="server" class="Box" style="position:absolute; top:169px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmAugRemarks" runat="server" class="Box" style="position:absolute; top:191px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmSepRemarks" runat="server" class="Box" style="position:absolute; top:213px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmOctRemarks" runat="server" class="Box" style="position:absolute; top:235px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmNovRemarks" runat="server" class="Box" style="position:absolute; top:257px; "> </asp:TextBox>
     <asp:TextBox ID="txtRmDecRemarks" runat="server" class="Box" style="position:absolute; top:279px; "> </asp:TextBox>

   </div>

     <asp:Button id="btnSaveRM" CssClass="Submitbutton" runat="server" Text="Create" style="position:absolute; top:380px; left:185px; height:30px;"  onclick="btnSaveRM_click" />

   </div>



 </div>


</asp:Content>

