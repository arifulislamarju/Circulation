<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Change Password</title>

    <link href="Styles/StyleSheet.css" rel="stylesheet" type="text/css" />   

    <script type="text/javascript">

        function confirmMe() {
            alert('Password Changed Successfully.')
            window.close();
        }
    
     
    </script>

    <style type="text/css">
        #form1
        {
            width: 326px;
        }
    </style>

</head>
<body >
    <form id="form1" runat="server">
    <div id="dvChangePassword" runat="server" style="position: absolute; left: 20px;
        top: 20px; height: 173px; width: 304px; border: groove 1px gray;">
        <asp:Panel ID="pnlChangePassword" runat="server" Style="position: absolute; border: groove 1px gray;
            height: 127px; left: 2px; top: 2px; width: 298px;" BackColor="#ADB1AF">
            <asp:Label ID="lblUserName" runat="server" CssClass="labelTextField" Text="User Name" Style="left: 19px; top: 19px;
                position: absolute;"></asp:Label>
            <asp:Label ID="lblOldPassword" runat="server" CssClass="labelTextField" Text="Old Password" Style="left: 19px;
                top: 44px; position: absolute;"></asp:Label>
            <asp:Label ID="lblNewPassword" runat="server" CssClass="labelTextField" Text="New Password" Style="left: 19px;
                top: 69px; position: absolute;"></asp:Label>
            <asp:Label ID="lblVarifyPassword" runat="server" CssClass="labelTextField" Text="Verify Password" Style="left: 19px;
                top: 94px; position: absolute;">
            </asp:Label>
            <asp:TextBox ID="txtUserName" runat="server" CssClass="textBox" Style="left: 125px; top: 14px; position: absolute;
                color: Black; height: 17px; width: 150px; border: groove 1px gray; font-family: Verdana;
                font-size: 10px;" BackColor="#F2F2F2" Font-Bold="True" ForeColor="Black"></asp:TextBox>
            <asp:TextBox ID="txtOldPassword" runat="server" CssClass="textBox" Style="left: 125px; top: 39px; position: absolute;
                height: 17px; width: 150px; border: groove 1px gray; font-family: Verdana; font-size: 10px;
                color: Black" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtNewPassword" runat="server" CssClass="textBox" Style="left: 125px; top: 64px; position: absolute;
                height: 17px; width: 150px; border: groove 1px gray; font-family: Verdana; font-size: 10px;
                color: Black" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtVerifyPassword" runat="server" CssClass="textBox" Style="left: 125px; top: 89px;
                position: absolute; height: 18px; width: 150px; border: groove 1px gray; font-family: Verdana;
                font-size: 10px; color: Black" TextMode="Password"></asp:TextBox>
            <asp:Label ID="lblError" runat="server" Text="Insert Old Password." Visible="false"
                Style="position: absolute; left: 125px; color: Red; top: 111px; height: 12px;
                font-size: 9px; font-family: Verdana;"></asp:Label>
            <asp:CompareValidator ID="cvNewPassword" runat="server" Style="position: absolute;
                left: 125px; top: 111px; height: 12px; width: auto; font-family: Verdana; font-size: 9px;
                color: Red;" ControlToCompare="txtVerifyPassword" ControlToValidate="txtNewPassword"
                ErrorMessage="Re-Type Password."></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="rfv" runat="server" Text="Insert New Password." Style="position: absolute;
                left: 125px; top: 111px; height: 12px; width: auto; font-family: Verdana; font-size: 9px;
                color: Red;" ControlToValidate="txtNewPassword"></asp:RequiredFieldValidator>
        </asp:Panel>
        <asp:Panel ID="pnlButton" runat="server"  Style="height: 36px; width: 298px; left: 2px;
            top: 133px; position: absolute; border: groove 1px gray;" BackColor="#ADB1AF">
            <asp:Button ID="btnUpdatePassword" CssClass="Submitbutton" runat="server" Text="Update" Style="left: 136px; width:68px;
                top:8px; position: absolute;" OnClick="btnUpdatePassword_Click" />           
            <input type="button" id="btnClose" runat="server" class="Submitbutton" style="left: 211px; top: 8px; position: absolute;  width: 68px;"
                onclick="window.close()" value="Close" />
        </asp:Panel>
    </div>
    <asp:ObjectDataSource ID="odsChangePassword" runat="server" TypeName="DataManipulation">
    </asp:ObjectDataSource>
    </form>
</body>
</html>
