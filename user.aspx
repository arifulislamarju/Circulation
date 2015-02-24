<%@ Page Title="Create User Account " Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="user.aspx.cs" Inherits="user" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>    
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript">

        function numberOnly() 
        {
            var key_code = window.event.keyCode;
            var oElement = window.event.srcElement;
            if (!window.event.shiftKey && !window.event.ctrlKey && !window.event.altKey) 
            {
                if ((key_code > 47 && key_code < 58) || (key_code > 95 && key_code < 106)) 
                {

                    if (key_code > 95)
                        key_code -= (95 - 47);
                    oElement.value = oElement.value;
                }
                else if (key_code == 8) 
                {
                    oElement.value = oElement.value;
                }
                else if (key_code != 9) 
                {
                    event.returnValue = false;
                    alert('Please input number only....');
                }
                
            }
        }



        function checkemail() 
        {

            var mailId = document.getElementById('<%= txtEmail.ClientID %>').value;

            var testresults;

            if (mailId != null && mailId != "") 
            {
                
                var str = document.getElementById('<%= txtEmail.ClientID %>').value;
                var filter = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
                if (filter.test(str))
                    testresults = true
                else 
                {
                    alert("Please input a valid email address!")
                    testresults = false
                }
                return (testresults)
            }
        }

    function checkbae() 
    {
        if (document.layers || document.getElementById || document.all)
            return checkemail()
        else
            return true
    }



    function checkPassword() 
    {

        var paswrd = document.getElementById('<%= txtPassword.ClientID %>').value;
        var RetypePaswrd = document.getElementById('<%= txtReTypePassword.ClientID %>').value;

        if (paswrd == RetypePaswrd) 
        {
            document.getElementById('<%= imgCorrect.ClientID %>').style.display = 'block';
            document.getElementById('<%= imgWropng.ClientID %>').style.display = 'none';
        }
        else 
        {
            document.getElementById('<%= imgWropng.ClientID %>').style.display = 'block';
            document.getElementById('<%= imgCorrect.ClientID %>').style.display = 'none';
        }

    }

    function checkEmptyfield() 
    {

        if (document.getElementById('<%= txtFullName.ClientID %>').value == '') 
        {
            alert('Please input user name...');
            document.getElementById('<%= txtFullName.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtDesignation.ClientID %>').value == '') 
        {
            alert('Please input user designation...');
            document.getElementById('<%= txtDesignation.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtMobile.ClientID %>').value == '') 
        {
            alert('Please input user mobile number...')
            document.getElementById('<%= txtMobile.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtEmail.ClientID %>').value == '') 
        {
            alert('Please input user email id...');
            document.getElementById('<%= txtEmail.ClientID %>').focus(); 
            return false;
        }
        else if (document.getElementById('<%= txtUserName.ClientID %>').value == '') 
        {
            alert('Please input user id...');
            document.getElementById('<%= txtFullName.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtPassword.ClientID %>').value == '') {
            alert('Please input password...');
            document.getElementById('<%= txtPassword.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtReTypePassword.ClientID %>').value == '') 
        {
            alert('Please input confirm password...');
            document.getElementById('<%= txtReTypePassword.ClientID %>').focus();
            return false;
        }
        
    }

    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">   
    
  <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:90px; top:20px; height:240px; width:725px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:227px; width:713px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Create User Account" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:27px;  width:712px; left:0px; color:#57677F;" />   
    </div>
        
        <asp:Label ID="lblName" CssClass="labelTextField" runat="server" Text="Name"  style="position:absolute; top:63px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtFullName" runat="server" CssClass="textBox" style="position:absolute; top:60px; left:120px;"  ></asp:TextBox>

        <asp:Label ID="lblDesignation" CssClass="labelTextField" runat="server" Text="Designation"  style="position:absolute; top:93px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtDesignation" runat="server" CssClass="textBox" style="position:absolute; top:90px; left:120px;"  ></asp:TextBox>

        <asp:Label ID="lblUserGroup" CssClass="labelTextField" runat="server" Text="Group"  style="position:absolute; top:123px; left:30px;"  ></asp:Label>
        <asp:DropDownList ID="ddlUserGroup" runat="server" CssClass="dropdownlist" style="position:absolute; top:120px; left:120px;"  ></asp:DropDownList>

        <asp:Label ID="lblMobile" CssClass="labelTextField" runat="server" Text="Mobile No."  style="position:absolute; top:153px; left:30px;"  ></asp:Label>
        <asp:TextBox ID="txtMobile" runat="server" CssClass="textBox" style="position:absolute; top:150px; left:120px;" onkeydown="javascript:numberOnly()"  ></asp:TextBox>

        <asp:Label ID="lblEmail" CssClass="labelTextField" runat="server" Text="Email"  style="position:absolute; top:63px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="textBox" style="position:absolute; top:60px; left:480px;" onBlur="javascript: checkemail();" ></asp:TextBox>
        
        <asp:Label ID="lblUserId" CssClass="labelTextField" runat="server" Text="User Name"  style="position:absolute; top:93px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server" CssClass="textBox" style="position:absolute; top:90px; left:480px;" onBlur="javascript: checkemail();" ></asp:TextBox>


        <asp:Label ID="lblPassword" CssClass="labelTextField" runat="server" Text="Password"  style="position:absolute; top:123px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtPassword" runat="server" CssClass="textBox" TextMode="Password" style="position:absolute; top:120px; left:480px;"  ></asp:TextBox>

        <asp:Label ID="lblReTypePassword" CssClass="labelTextField" runat="server" Text="Re-Type Password"  style="position:absolute; top:153px; left:360px;"  ></asp:Label>
        <asp:TextBox ID="txtReTypePassword" runat="server" CssClass="textBox" TextMode="Password" style="position:absolute; top:150px; left:480px;" onkeyup="javascript: checkPassword();"  ></asp:TextBox>

        <asp:Image ID="imgWropng" runat="server" ImageUrl="~/Images/xbutton.png" style="position:absolute; display:none; top:150px; left:690px;" />
        <asp:Image ID="imgCorrect" runat="server" ImageUrl="~/Images/correct.png" style="position:absolute; display:none; top:152px; left:690px;" />

        <asp:Button id="btnCreateUser" CssClass="Submitbutton" runat="server" 
            Text="Create User" OnClientClick="return checkEmptyfield();" 
            style="position:absolute; top:190px; height:30px; left:580px;" 
            onclick="btnCreateUser_Click" />

    </div>

    <div id="divRhtForm" class="divclsFrm" style="position:absolute; left:90px; top:290px; height:230px; width:725px;">
    

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:220px; width:715px; overflow:auto; "  >
        <asp:GridView ID="grdUserList" DataKeyNames="userId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:950px; text-align:center; left:5px; top:5px; bottom:0px;"
            onrowcreated="grdUserList_RowCreated" 
            onpageindexchanging="grdUserList_PageIndexChanging" 
            onrowdatabound="grdUserList_RowDataBound" 
            onrowdeleting="grdUserList_RowDeleting" 
            onselectedindexchanging="grdUserList_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="userId" SortExpression="userId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="10px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="fullName" SortExpression="fullName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="userDesignation" SortExpression="userDesignation"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="groupId" SortExpression="groupId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="70px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="userMobile" SortExpression="userMobile"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="userEmail" SortExpression="userEmail"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="userName" SortExpression="userName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="audUser" SortExpression="audUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="110px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("userId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    


    </div>

    </div>
    <asp:HiddenField ID="hdnUserId" runat="server" />

</asp:Content>

