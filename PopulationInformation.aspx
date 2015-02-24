<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PopulationInformation.aspx.cs" Inherits="FORM_PopulationInformation" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style type="text/css">
    
    #divCreate
{
    position:absolute; 
    margin-top:45px; 
    margin-left:26px; 
    border:0px solid black; 
    width:688px; 
    height:158px; 
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

    function checkEmptyfield() 
    {

        if (document.getElementById('<%= txtPopulation.ClientID %>').value == '') {
            alert('Please Input Population...');
            document.getElementById('<%= txtPopulation.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtLiterate.ClientID %>').value == '') {
            alert('Please Input Literacy Rate...');
            document.getElementById('<%= txtLiterate.ClientID %>').focus();
            return false;
        }
        else if (document.getElementById('<%= txtProthomAloUse.ClientID %>').value == '') {
            alert('Please Input PALO Use...');
            document.getElementById('<%= txtProthomAloUse.ClientID %>').focus();
            return false;
        }

    }


</script>


</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


 <div id="divTopForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:210px; width:700px; ">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:198px; width:688px; ">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" 
                 Text="Population Information" style="position:absolute; left:5px; top:5px; height: 19px;" ></asp:Label> 
        <hr style="position:absolute; top:27px; color:#57677F; width:688px; left:-1px;" />    

        <asp:Label ID="lblStation" CssClass="labelTextField" runat="server" Text="Station"  style="position:absolute; top:48px; left:20px;"  ></asp:Label>
        <asp:DropDownList ID="ddlStation" runat="server" CssClass="dropdownlist" 
            style="position:absolute; top:45px; left:130px;" ></asp:DropDownList>

        <asp:Label ID="lblPopulation" CssClass="labelTextField" runat="server" Text="Population"  style="position:absolute; top:48px; left:350px;"  ></asp:Label>
        <asp:TextBox ID="txtPopulation" runat="server" CssClass="textBox" style="position:absolute; top:45px; left:460px;"  > </asp:TextBox>

        <asp:Label ID="lblLiterate" CssClass="labelTextField" runat="server" Text="No. Of Literate"  style="position:absolute; top:83px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtLiterate" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:130px;"  > </asp:TextBox>

        <asp:Label ID="lblProthomAloUse" CssClass="labelTextField" runat="server" Text="Subscriber of PALO"  style="position:absolute; top:83px; left:350px;"  ></asp:Label>
        <asp:TextBox ID="txtProthomAloUse" runat="server" CssClass="textBox" style="position:absolute; top:80px; left:460px;"  > </asp:TextBox>

        <asp:Label ID="lblRegular" CssClass="labelTextField" runat="server" Text="Regular Subscriber"  style="position:absolute; top:118px; left:20px;"  ></asp:Label>
        <asp:TextBox ID="txtRegular" runat="server" CssClass="textBox" style="position:absolute; top:115px; left:130px;"  > </asp:TextBox>

         <asp:Label ID="lblfloating" CssClass="labelTextField" runat="server" Text="Floating Subscriber"  style="position:absolute; top:118px; left:350px;"  ></asp:Label>
        <asp:TextBox ID="txtFloating" runat="server" CssClass="textBox" style="position:absolute; top:115px; left:460px;"  > </asp:TextBox>


        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server" Text="Save" style="position:absolute; top:155px; left:560px; height:30px; "  OnClientClick="return checkEmptyfield();" onclick="btnSave_click"/>

    </div>

    </div>


    <div id="divBottomForm" class="divclsFrm" style="position:absolute; left:100px; top:260px; height:230px; width:700px; ">

    <asp:HiddenField ID="hdnPiId" runat="server" />

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:690px; overflow:auto; "  >
   
      <asp:GridView ID="grdPopulationInfo" DataKeyNames="piId" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; border-left:0px solid #ADB1AF;border-right:0px solid #ADB1AF;border-bottom:0px solid #ADB1AF; border-top:0px solid #ADB1AF;
                    height:auto;  width:800px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdPopulationInfo_RowCreated" 
            onpageindexchanging="grdPopulationInfo_PageIndexChanging" 
            onrowdatabound="grdPopulationInfo_RowDataBound" 
            onrowdeleting="grdPopulationInfo_RowDeleting" 
            onselectedindexchanging="grdPopulationInfo_SelectedIndexChanging" >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#DEDEE0" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#F7F7FC" forecolor="#000000"/>      
          
               <Columns>
               
                        <asp:BoundField DataField="piId" SortExpression="piId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="50px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="140px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                     
                       
                        <asp:BoundField DataField="population" SortExpression="population"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="literate" SortExpression="literate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="takepalo" SortExpression="takepalo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                         <asp:BoundField DataField="regularSubscriber" SortExpression="literate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="floatingSubscriber" SortExpression="takepalo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="110px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>                        
                       
                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="90px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="80px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="linkButtonEdit"  CommandName="Select" runat="server" Text="Edit" ></asp:LinkButton>&nbsp &nbsp;                                                 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("piId") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>

    </div>

  </div>


</asp:Content>

