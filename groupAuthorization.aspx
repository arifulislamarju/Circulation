<%@ Page Title="Circulation :: Group Authorization" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="groupAuthorization.aspx.cs" Inherits="groupAuthorization" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="divLeftForm" class="divclsFrm" style="position:absolute; left:70px; top:20px; height:490px; width:770px; ">

        <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:478px; width:758px;">
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Group Permission" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
            <hr style="position:absolute; top:23px; color:#57677F; width:758px; left:-1px;" />   
        </div>       
   
        <div id="divUserGroupPermission">
            
            <asp:Label ID="lblUserGroup" CssClass="labelTextField" runat="server" Text="Group"  style="position:absolute; top:2px; left:40px;"  ></asp:Label>
            <asp:DropDownList ID="ddlUserGroup" runat="server" AutoPostBack="true" 
                CssClass="dropdownlist" 
                style="position:absolute; height:22px; top:0px; left:90px;" 
                onselectedindexchanged="ddlUserGroup_SelectedIndexChanged"  ></asp:DropDownList>

            <asp:Label ID="lblGroupDesc" CssClass="labelTextField" runat="server" Text="Group Description"  style="position:absolute; top:2px; left:350px;"  ></asp:Label>
            <asp:TextBox ID="txtGroupDesc" runat="server" CssClass="textBox" ReadOnly="true" style="position:absolute; top:-2px; left:470px;"  ></asp:TextBox>
            <hr style="position:absolute; top:20px; color:#57677F; width:758px; left:-2px;" />   

            <asp:Panel ID="pnlAssignGroup" runat="server" Style="top: 30px; left: 5px; position: absolute;
            height: 360px; width: 747px; overflow: hidden; font-family: Verdana; font-size: 15px;
            border: groove 0px Gray" BackColor="#C3C5E5" ForeColor="Black" EnableTheming="False">
            <table style="position: absolute; left: 4px; top: 0px;">
                <tr>
                    <td style="position: absolute; text-align: left;">
                        <asp:CheckBoxList runat="server" ID="chkFunctionList" CssClass="checkbox" Style="position: absolute;
                            left: 10px; top: 2px; font-size: 11px; font-family: Verdana; width: 690px; font-weight: bold;"
                            RepeatDirection="Vertical" RepeatColumns="3" BackColor="#C3C5E5" RepeatLayout="Table" OnLoad="chkFunctionList_Load" >
                        </asp:CheckBoxList>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    <hr style="position:absolute; top:380px; color:#57677F; width:758px; left:-2px;" />   
        <asp:Button ID="btnSave" runat="server" CssClass="Submitbutton" Text="Save" 
                style="position:absolute; top:400px; width:70px; height:30px; left:580px;" 
                onclick="btnSave_Click" />
        <asp:Button ID="btnReset" runat="server" CssClass="Submitbutton" Text="Reset" style="position:absolute; top:400px; height:30px; width:70px; left:670px;" />

        </div>

    </div>

</asp:Content>
