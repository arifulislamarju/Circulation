<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="copyOrder.aspx.cs" Inherits="copyOrder" %>

 <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %> 

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <script src="Scripts/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="Scripts/jquery-migrate-1.2.1.js" type="text/javascript"></script>
    <script src="Scripts/loading.js" type="text/javascript"></script>
    <style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>

    <script type="text/javascript">


        function CalenderShowHide(id) 
        {          
            

            if (id.id == "ctl00_ContentPlaceHolder1_IDrdoDate") 
            {
                $("#<%=txtDate.ClientID %>").css("visibility", "visible");
            }

            else 
            {
               
                $("#<%=txtDate.ClientID %>").css("visibility", "hidden");
            }

        }


 //     function ShowProgress() {
 //         setTimeout(function () {
 //             var modal = $('<div />');
 //             modal.addClass("modal");
 //             $('body').append(modal);
 //             var loading = $(".loading");
 //             loading.show();
 //             var top = Math.max($(window).height() / 2 - loading[0].offsetHeight / 2, 0);
 //             var left = Math.max($(window).width() / 2 - loading[0].offsetWidth / 2, 0);
 //             loading.css({ top: top, left: left });
 //         }, 200);
 //     }
 //     $('form').live("submit", function () {
 //         ShowProgress();
 //     });

    </script>


</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="loading" align="center">
    Order Coping..... Please wait.<br />
    <br />
    <img src="Images/loader.gif" alt="" />
</div>

<div id="divTopForm" class="divclsFrm" style="position:absolute; left:100px; top:30px; height:260px; width:700px;">

    <div id="divFormHeader" class="divclsInput" style="position:absolute; left:5px; top:5px; height:248px; width:688px;">
        <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" Text="Copy Order" style="position:absolute; left:5px; top:5px;" ></asp:Label> 
        <hr style="position:absolute; top:22px; color:#57677F; width:688px; left:-1px;" />   
    </div>
       
       <asp:Label ID="lblTransDate"  runat="server" CssClass="labelTextField" Text="Transaction Date"  style="position:absolute; top:53px; left:50px;"  ></asp:Label>
       <asp:TextBox ID="txtTransDate" runat="server" CssClass="textBox" style="position:absolute; top:50px; left:150px; width:150px; "  ></asp:TextBox>
       <asp:Image ID="imgCalendar" runat="server" ToolTip="Select Date" Style="position: absolute; left:307px; top:54px; width:20px; height:20px;" ImageUrl="~/Images/Calendar.jpg" />

       <asp:Label ID="lblCategory" CssClass="labelTextField" runat="server" Text="Category"  style="position:absolute; top:93px; left:50px; "  ></asp:Label>
        <asp:DropDownList ID="ddlCategory"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:90px; left:150px; width:150px; text-align:center;">
           
        </asp:DropDownList>


       <input runat="server" type="radio" id="IDrdoDate" name="rdoDate" value="Date" onclick="CalenderShowHide(this);" style="height: 20px; width: 20px; position: absolute; margin-left:350px; margin-top:54px;" />
             <label class="labelTextField" style="height: 20px; width: 80px; position: absolute; margin-left:370px; margin-top:57px;">Specific Date</label>
       
       <input runat="server" type="radio" id="IDrdoPrvDate" name="rdoDate" value="Previous Date" onclick="CalenderShowHide(this);" style="height: 20px; width: 20px; position: absolute; margin-left:350px; margin-top:78px;" />
             <label class="labelTextField" style="height: 20px; width: 120px; position: absolute; margin-left:370px; margin-top:81px;">Previous Date</label>
       
       <input runat="server" type="radio" id="IDrdoSamDate" name="rdoDate" value="Same Day" onclick="CalenderShowHide(this);" style="height: 20px; width: 20px; position: absolute; margin-left:350px; margin-top: 102px;" />
             <label class="labelTextField" style="height: 20px; width: 170px; position: absolute; margin-left:370px; margin-top:105px;">Same Day (Previous Week)</label> 
        

        <hr style="position:absolute; top:120px; border-bottom: solid WhiteText 1px;-moz-box-shadow: 0px 1px 0px #3a3a3a; width:688px; left:5px;" />   

        <asp:Label ID="lblFrmRoute"  runat="server" CssClass="labelTextField" Text="From Route"  style="position:absolute; top:143px; left:50px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmRoute" runat="server" CssClass="dropdownlist" 
                   style="position:absolute; top:140px; left:150px; width:150px; " > </asp:DropDownList>        

         
        <asp:Label ID="lblToRoute"  runat="server" CssClass="labelTextField" Text="To Route"  style="position:absolute; top:143px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToRoute" runat="server" CssClass="dropdownlist" 
                   style="position:absolute; top:140px; left:450px; width:150px;" > </asp:DropDownList>        

        <asp:Label ID="lblFrmSubRoute"  runat="server" CssClass="labelTextField" Text="From Sub-Route"  style="position:absolute; top:173px; left:50px;"  ></asp:Label>
        <asp:DropDownList ID="ddlFrmSubRoute" runat="server" CssClass="dropdownlist" 
                      style="position:absolute; top:170px; left:150px; width:150px;" > </asp:DropDownList>

        <asp:Label ID="lblToSubRoute"  runat="server" CssClass="labelTextField" Text="To Sub-Route"  style="position:absolute; top:173px; left:370px;"  ></asp:Label>
        <asp:DropDownList ID="ddlToSubRoute" runat="server" CssClass="dropdownlist"  
                      style="position:absolute; top:170px; left:450px; width:150px;" > </asp:DropDownList>


     <div id="Calendar">
        
        <asp:TextBox ID="txtDate" runat="server" CssClass="textBox" style="position:absolute; visibility:hidden; text-align:center; top:50px; left:450px; width:150px;" > </asp:TextBox>    

        <asp:ScriptManager ID="calendarScriptManager" runat="server"></asp:ScriptManager> 

        <cc1:CalendarExtender ID="calendarDate" runat="server" TargetControlID="txtDate" PopupButtonID="txtDate" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        <cc1:CalendarExtender ID="calendarTransectionDate" runat="server" TargetControlID="txtTransDate" PopupButtonID="imgCalendar" Format="dd-MMM-yyyy"> </cc1:CalendarExtender>

        
     </div>
     
        <asp:Button id="btnSave" CssClass="Submitbutton" runat="server"  text="Process" style="position:absolute; top:210px; left:290px; height:30px;" onclick="btnSave_Click" />
        <asp:Label ID="lblConfirm" runat="server" Text="" style="position:absolute; top:210px; left:430px; height:30px; font-size:15px; font-family:Tahoma; color:Green;"></asp:Label>

</div>


 <div id="divBtmForm" class="divclsFrm" style="position:absolute; left:100px; top:310px; height:230px; width:700px; ">

    <div id="grdFrm" class="divclsInput" style="position:absolute; left:5px; top:5px; height:218px; width:688px; overflow:auto; "  >
        <asp:GridView ID="grdOrder" DataKeyNames="orderNo" runat="server"  AutoGenerateColumns="false" 
                    EnableViewState="true" RowStyle-HorizontalAlign="left" 
                    AlternatingRowStyle-HorizontalAlign="left" AllowPaging="True" PageSize="10"
                    RowStyle-VerticalAlign="top" ShowHeader="false" 
                    Style="border: 0px solid #ADB1AF; font-family: Verdana; font-size: 11px; color: Black;  position: absolute; overflow:auto; height:auto;  width:980px; text-align: center; left: 5px; top:5px; bottom:0px;"
            onrowcreated="grdOrder_RowCreated" 
            onrowdatabound="grdOrder_RowDataBound" 
            onrowdeleting="grdOrder_RowDeleting"  >                    
                
                <PagerSettings Mode="NextPreviousFirstLast"  FirstPageImageUrl="~/images/Grd_First.png"
                    LastPageImageUrl="~/images/Grd_Last.png" NextPageImageUrl="~/images/Grd_Next.png"
                    PreviousPageImageUrl="~/images/Grd_Previous.png" />
                
                <FooterStyle ForeColor="Black" Height="4px" Font-Size="11px" />
                <RowStyle backcolor="#F2F1EA" ForeColor="#000000" Height="15px" Font-Size="11px" />
                <alternatingrowstyle backcolor="#FCFBF4" forecolor="#000000"/>    
          
               <Columns>
               
                        <asp:BoundField DataField="orderNo" SortExpression="orderNo"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="orderDate" SortExpression="orderDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="vehicle" SortExpression="vehicle"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="subRoute" SortExpression="subRoute"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:BoundField DataField="customerId" SortExpression="customerId"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="catagory" SortExpression="catagory"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="rate" SortExpression="rate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="salesType" SortExpression="salesType"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>  

                        <asp:BoundField DataField="type" SortExpression="type"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="corporate" SortExpression="corporate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>
                        
                        <asp:BoundField DataField="stationName" SortExpression="stationName"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="60px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>     
                        
                        <asp:BoundField DataField="quantity" SortExpression="quantity"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>   
                        
                        <asp:BoundField DataField="bonusCopy" SortExpression="bonusCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="80px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>               
                       
                        <asp:BoundField DataField="complementaryCopy" SortExpression="complementaryCopy"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="packetType" SortExpression="packetType"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true"
                        ItemStyle-Width="30px" ItemStyle-Height="22px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="auditUser" SortExpression="auditUser"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-Wrap="true" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray"/>

                        <asp:BoundField DataField="createDate" SortExpression="createDate"
                        ItemStyle-HorizontalAlign="Left" ItemStyle-VerticalAlign="Middle" ReadOnly="true" 
                        ItemStyle-Width="40px" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" DataFormatString="{0:dd-MMM-yy}" ItemStyle-BorderColor="Gray"/>
                    
                       
                        <asp:TemplateField HeaderText=""  ItemStyle-Width="60px" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" ItemStyle-BorderStyle="Solid" ItemStyle-BorderWidth="1" ItemStyle-BorderColor="Gray">
                            
                            <ItemTemplate> 
                                <asp:LinkButton ID="LinkButtonDelete"  CommandArgument='<%# Eval("orderNo") %>' CommandName="Delete" runat="server" Text="Delete" ></asp:LinkButton>                                                            
                            </ItemTemplate>
                        </asp:TemplateField>
               
               </Columns>
            </asp:GridView>    

            </div>

 </div>




</asp:Content>

