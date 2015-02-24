<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="vehicle.aspx.cs" Inherits="vehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


<script type="text/javascript">

    function checkEmptyfield() 
    {

        if (document.getElementById('<%= txtVehicleCode.ClientID %>').value == '') 
        {
            alert('Please Input Vehicle Code...');
            document.getElementById('<%= txtVehicleCode.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtVehicleNameBan.ClientID %>').value == '') {
            alert('Please Input Vehicle Name (Bangla)...');
            document.getElementById('<%= txtVehicleNameBan.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtVehicleName.ClientID %>').value == '') 
        {
            alert('Please Input Vehicle Name...');
            document.getElementById('<%= txtVehicleName.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtRegNo.ClientID %>').value == '') 
        {
            alert('Please Input Registration No...')
            document.getElementById('<%= txtRegNo.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtCapacity.ClientID %>').value == '') {
            alert('Please Input Capacity No...')
            document.getElementById('<%= txtCapacity.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtRatePerTrip.ClientID %>').value == '') {
            alert('Please Input Rate Per Trip...')
            document.getElementById('<%= txtRatePerTrip.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtOwnerName.ClientID %>').value == '') 
        {
            alert('Please Input Owner Name...');
            document.getElementById('<%= txtOwnerName.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtDriverName.ClientID %>').value == '') 
        {
            alert('Please Input Driver Name...');
            document.getElementById('<%= txtDriverName.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtLicense.ClientID %>').value == '') 
        {
            alert('Please Input License No...');
            document.getElementById('<%= txtLicense.ClientID %>').focus();
            return false;
        }

    }


    </script>


    <style type="text/css">    
   

    
    </style> 



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div id="divLeftForm" class="divclsFrm" style="position:absolute; left:100px; top:20px; height:250px; width:720px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:237px; width:708px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Vehicle Info." style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:708px; left:-1px;" />   
    </div>

        <asp:Label ID="lblVehicleCode"  runat="server" CssClass="labelTextField" Text="Transporter Code"  style="position:absolute; top:53px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtVehicleCode" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:165px;"  ></asp:TextBox>

        <asp:Label ID="lblVehicleNameBan"  runat="server" CssClass="labelTextField" Text="Transporter Name(Bang.)"  style="position:absolute; top:83px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtVehicleNameBan" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:165px; font-family:Prothoma;"  ></asp:TextBox>

        <asp:Label ID="lblVehicleName"  runat="server" CssClass="labelTextField" Text="Transporter Name"  style="position:absolute; top:113px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtVehicleName" runat="server" CssClass="textBox" style="position:absolute; top:110px; left:165px;"  ></asp:TextBox>

        <asp:Label ID="lblRegNo"  runat="server" CssClass="labelTextField" Text="Registration No."  style="position:absolute; top:143px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRegNo" runat="server" CssClass="textBox" style="position:absolute; top:140px; left:165px;"  ></asp:TextBox>

        <asp:Label ID="lblCapacity"  runat="server" CssClass="labelTextField" Text="Capacity"  style="position:absolute; top:173px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtCapacity" runat="server" CssClass="textBox" style="position:absolute; top:170px; left:165px;"  ></asp:TextBox>

        <asp:Label ID="lblRatePerTrip"  runat="server" CssClass="labelTextField" Text="Rate Per Trip"  style="position:absolute; top:203px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRatePerTrip" runat="server" CssClass="textBox" style="position:absolute; top:200px; left:165px;"  ></asp:TextBox>

        <asp:Label ID="lblOwnerName"  runat="server" CssClass="labelTextField" Text="Owner Name"  style="position:absolute; top:53px; left:390px;"  ></asp:Label>
        <asp:TextBox ID="txtOwnerName" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:480px;"  ></asp:TextBox>

        <asp:Label ID="lblDriverName"  runat="server" CssClass="labelTextField" Text="Driver Name"  style="position:absolute; top:83px; left:390px;"  ></asp:Label>
        <asp:TextBox ID="txtDriverName" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:480px;"  ></asp:TextBox>

        <asp:Label ID="lblLicense"  runat="server" CssClass="labelTextField" Text="License No."  style="position:absolute; top:113px; left:390px;"  ></asp:Label>
        <asp:TextBox ID="txtLicense" runat="server" CssClass="textBox" style="position:absolute; top:110px; left:480px;"  ></asp:TextBox>

        <asp:Label ID="lblRouteName" CssClass="labelTextField" runat="server" Text="Route"  style="position:absolute; top:143px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlRouteName" runat="server" CssClass="dropdownlist" AutoPostBack="True"
                  style="position:absolute; top:140px; left:480px;" onselectedindexchanged="ddlRouteName_SelectedIndexChanged" >   </asp:DropDownList>
        
        <asp:Label ID="lblSubRouteName" CssClass="labelTextField" runat="server" Text="Sub-Route"  style="position:absolute; top:173px; left:390px;"  ></asp:Label>
        <asp:DropDownList ID="ddlSubRouteName" runat="server" CssClass="dropdownlist" 
                  style="position:absolute; top:170px; left:480px;" >   </asp:DropDownList>
 

        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:205px; left:580px; height:30px;" OnClientClick="return checkEmptyfield();" onclick="btnSave_click"  />


</div>



<div id="divRhtForm" class="divclsFrm" style="position:absolute; left:100px; top:290px; height:230px; width:720px;">


    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:710px; overflow:auto; "  >
        <asp:GridView ID="grdVehicle" DataKeyNames="vehicleId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:1400px; text-align: center; left:5px; top:5px; bottom:0px;"
                    onrowcreated="grdVehicle_RowCreated" 
            onpageindexchanging="grdVehicle_PageIndexChanging" 
            onrowdatabound="grdVehicle_RowDataBound" 
            onrowdeleting="grdVehicle_RowDeleting" 
            onselectedindexchanging="grdVehicle_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
               <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="vehicleId" SortExpression="vehicleId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="20px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="vehicleCode" SortExpression="vehicleCode"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  
                        
                        <asp:BoundField DataField="vehicleNameBan" SortExpression="vehicleNameBan"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" ItemStyle-Font-Names="Prothoma" ItemStyle-Font-Size="Small"
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="vehicleName" SortExpression="vehicleName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                   
                       
                        <asp:BoundField DataField="regNo" SortExpression="regNo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="capacity" SortExpression="capacity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="120px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="ratePerTrip" SortExpression="ratePerTrip"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/> 

                        <asp:BoundField DataField="ownerName" SortExpression="ownerName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="180px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="driverName" SortExpression="driverName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="licenseNo" SortExpression="licenseNo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="route" SortExpression="route"
                        ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="subRoute" SortExpression="subRoute"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="150px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="100px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="140px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("vehicleId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    


    </div>

    </div>

    <asp:HiddenField ID="hdnVehicleId" runat="server" />


</asp:Content>

