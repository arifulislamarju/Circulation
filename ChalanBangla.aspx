<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChalanBangla.aspx.cs" Inherits="ChalanBangla" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <div id="divLeftForm" class="divclsFrm" 
         
         
         
         style="position:absolute; left:169px; top:89px; height:465px; width:588px;">

        <div id="divFormHeader" class="divclsInput" 
             style="position:absolute; left:1px; top:-3px; height:508px; width:587px;">
             <asp:Label ID="Label1" CssClass="labelTextField" runat="server" 
                Text="Category" 
                 style="position:absolute; top: 42px; left:8px; width: 70px;"  ></asp:Label>
             <asp:DropDownList ID="ddlLocation"  runat="server" CssClass="dropdownlist" 
                style="position:absolute; top:342px; left:100px;  text-align:center;">
                <asp:ListItem>All</asp:ListItem>
             </asp:DropDownList>
             <asp:DropDownList ID="ddlDateTo"  runat="server" CssClass="dropdownlist" 
                style="position:absolute; top:110px; left:380px;  text-align:center;">
                <asp:ListItem></asp:ListItem>
             </asp:DropDownList>

            <hr style="position:absolute; top:62px; color:#57677F; width:589px; left:0px;" />  
            <asp:Label ID="Label17" CssClass="labelTextField" runat="server" 
                Text="Details"  
                 style="position:absolute; color: blue; top:78px; left:7px; right: 541px;"></asp:Label>
            
            <asp:Label ID="lblDate" CssClass="labelTextField" runat="server" 
                Text="Date"  style="position:absolute; top:112px; left:8px;"></asp:Label>
            <asp:Label ID="lbldate2" CssClass="labelTextField" runat="server"
                Text="To"  style="position:absolute; top:87px; left:450px;"></asp:Label>
            <asp:Label ID="Label2" CssClass="labelTextField" runat="server"
                Text="From"  style="position:absolute; top:85px; left:150px;"></asp:Label>
            
                        
            <asp:TextBox ID="txtCustomerNameFrom" runat="server" CssClass="textBox"  
                style="position:absolute;   top:134px; left:100px; right: 322px;"  ></asp:TextBox>  
            <asp:Image ID="imgCalendarReturnDateFrom" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:547px; top:132px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" />
            <asp:TextBox ID="txtCustomerNameTo" runat="server" CssClass="textBox"  
                style="position:absolute;   top:134px; left:380px;"  ></asp:TextBox>  
            <asp:Image ID="Image2" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:267px; top:132px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" />    


            <asp:Label ID="lblDateTo" CssClass="labelTextField" runat="server" 
                Text="Customer Name"  style="position:absolute; top:134px; left:7px;"></asp:Label>
             
                <asp:Image ID="Image5" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:267px; top:178px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" /> 
            <asp:Image ID="imgCalendarReturnTo" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:267px; top:155px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" />
            <asp:TextBox ID="txtTransportFrom" runat="server" CssClass="textBox"  
                style="position:absolute;   top:175px; left:100px; right: 322px;"  ></asp:TextBox>
                <asp:TextBox ID="txtTransportTo" runat="server" CssClass="textBox"  
                style="position:absolute;   top:175px; left:380px; right: 42px;"  ></asp:TextBox>  


            <asp:Label ID="lblArea" CssClass="labelTextField" runat="server" 
                Text="Area"  style="position:absolute; top:155px; left:8px; "  ></asp:Label>
             <asp:TextBox ID="txtAreaFrom" runat="server" CssClass="textBox"  
                style="position:absolute;   top:155px; left:100px;"  ></asp:TextBox>  
            <asp:Image ID="Image1" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:547px; top:175px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" />
            <asp:TextBox ID="txtAreaTo" runat="server" CssClass="textBox"  
                style="position:absolute;   top:154px; left:380px;"  ></asp:TextBox>  
            <asp:Image ID="Image3" runat="server" ToolTip="Select Date" 
                Style="position: absolute; left:547px; top:154px; width:20px; height:20px;" 
                ImageUrl="~/Images/Finder.jpg" />
            
            <asp:Label ID="Label3" CssClass="labelTextField" runat="server" 
                Text="Transport"  style="position:absolute; top:178px; left:8px; "  ></asp:Label>
             <asp:DropDownList ID="ddlCategory"  runat="server" 
            CssClass="dropdownlist" 
            style="position:absolute; top:38px; left:99px;  text-align:center;">
                <asp:ListItem>Daily News Paper</asp:ListItem>
            </asp:DropDownList>
            
            <asp:RadioButton ID="RadioButtonChalan" runat="server" 
                Style="position:absolute; top:2px; left:438px" Text="Chalan"/>
            <asp:RadioButton ID="RadioButtonLabel" runat="server" 
                Style="position:absolute; top:22px; left:438px" Text="Label"/> 
            <asp:DropDownList ID="DropDownList2" runat="server"
            Style="position:absolute; top:42px; left:436px; height: 14px; width: 106px;">
                <asp:ListItem>Combine</asp:ListItem>
            </asp:DropDownList>            
                        
            
            <asp:Label ID="lblExportType" CssClass="labelTextField" runat="server" 
                Text="Supplement"  style="position:absolute; top:428px; left:10px; "  ></asp:Label>
            <asp:DropDownList ID="ddlSupplement"  runat="server" 
            CssClass="dropdownlist" 
            
                 style="position:absolute; top:425px; left:100px;  text-align:center; right: 329px;">
                <asp:ListItem>Holiday</asp:ListItem>
                <asp:ListItem></asp:ListItem>
                <asp:ListItem></asp:ListItem>
            </asp:DropDownList>
            
            <hr style="position:absolute; top:198px; color:#57677F; width:589px; left:0px;" />  
            
            <asp:Label ID="Label8" CssClass="labelTextField" runat="server" 
                Text="Regular"  style="position:absolute; top:214px; left:150px;"></asp:Label>
                <asp:Label ID="Label9" CssClass="labelTextField" runat="server" 
                Text="Maximum"  style="position:absolute; top:214px; left:450px;"></asp:Label>
                

            <asp:Label ID="Label18" CssClass="labelTextField" runat="server" 
                Text="Packet Size"  
                 style="position:absolute; color: blue; top:215px; left:10px;"></asp:Label>
            <asp:Label ID="Label4" CssClass="labelTextField" runat="server" 
                Text="Combine"  style="position:absolute; top:234px; left:10px;"></asp:Label>
                <asp:Label ID="Label5" CssClass="labelTextField" runat="server" 
                Text="Individual"  style="position:absolute; top:253px; left:10px;"></asp:Label>
                <asp:Label ID="Label6" CssClass="labelTextField" runat="server" 
                Text="Suplement-1"  style="position:absolute; top:273px; left:10px;"></asp:Label>
                <asp:Label ID="Label7" CssClass="labelTextField" runat="server" 
                Text="Suplement-2"  style="position:absolute; top:394px; left:300px;"></asp:Label>
                <asp:Label ID="Label21" CssClass="labelTextField" runat="server" 
                Text="Hide Zero"  style="position:absolute; top:427px; left:300px;"></asp:Label>
                <asp:CheckBox ID="CheckBox2" runat="server" Text=""
                 style="position:absolute;   top:425px; left:380px;" />
            <asp:TextBox ID="txtSupplement1Maximum" runat="server" CssClass="textBox"  
                style="position:absolute;   top:270px; left:380px;"  ></asp:TextBox>
                <asp:TextBox ID="txtSupplement1Regular" runat="server" CssClass="textBox"  
                style="position:absolute;   top:270px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtIndividualRegular" runat="server" CssClass="textBox"  
                style="position:absolute;   top:250px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtCombineRegular" runat="server" CssClass="textBox"  
                style="position:absolute;   top:230px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtIndividualMaximum" runat="server" CssClass="textBox"  
                style="position:absolute;   top:250px; left:380px;"  ></asp:TextBox>
                <asp:TextBox ID="txtExtraCTG" runat="server" CssClass="textBox"  
                style="position:absolute;   top:384px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtSupplement2Maximum" runat="server" CssClass="textBox"  
                style="position:absolute;   top:290px; left:380px;"  ></asp:TextBox>
                <asp:TextBox ID="txtCombineMaximum" runat="server" CssClass="textBox"  
                style="position:absolute;   top:230px; left:380px;"  ></asp:TextBox>
                <hr style="position:absolute; top:311px; color:#57677F; width:589px; left:0px;" />  
            


            <asp:DropDownList ID="ddlDateFrom"  runat="server" CssClass="dropdownlist" 
                style="position:absolute; top:110px; left:100px;  text-align:center;">
                <asp:ListItem></asp:ListItem>
             </asp:DropDownList>
                <asp:TextBox ID="txtSupplement2Regular" runat="server" CssClass="textBox"  
                style="position:absolute;   top:290px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtExtraBOG" runat="server" CssClass="textBox"  
                style="position:absolute;   top:404px; left:100px;"  ></asp:TextBox>
                <asp:TextBox ID="txtSupplement1" runat="server" CssClass="textBox"  
                style="position:absolute;   top:369px; left:380px;"  ></asp:TextBox>
                <asp:Label ID="Label10" CssClass="labelTextField" runat="server" 
                Text="Extra DHK"  style="position:absolute; top:366px; left:10px;"></asp:Label>
                
                <asp:Label ID="Label19" CssClass="labelTextField" runat="server" 
                Text="Location & Quantity"  
                 style="position:absolute; color: blue; top:325px; left:10px;"></asp:Label>
                <asp:Label ID="Label11" CssClass="labelTextField" runat="server" 
                Text="Location"  style="position:absolute; top:344px; left:10px;"></asp:Label>
                <asp:Label ID="Label12" CssClass="labelTextField" runat="server" 
                Text="Extra CTG"  style="position:absolute; top:386px; left:10px;"></asp:Label>
                <asp:Label ID="Label13" CssClass="labelTextField" runat="server" 
                Text="Extra BOG" style="position:absolute; top:406px; left:10px;  "></asp:Label>
                
                <asp:Label ID="Label20" CssClass="labelTextField" runat="server" 
                Text="No of Pages"  
                 style="position:absolute; color: blue; top:327px; left:300px;"></asp:Label>
                <asp:Label ID="Label14" CssClass="labelTextField" runat="server" 
                Text="News"  style="position:absolute; top:350px; left:300px;"></asp:Label>
                <asp:Label ID="Label15" CssClass="labelTextField" runat="server" 
                Text="Suplement-2"  style="position:absolute; top:293px; left:10px;"></asp:Label>
                 <asp:CheckBox ID="CheckBox1" runat="server" Text=""
                 style="position:absolute;   top:390px; left:380px;" />
                <asp:Label ID="Label16" CssClass="labelTextField" runat="server" 
                Text="Suplement-1"  style="position:absolute; top:371px; left:300px;"></asp:Label>
                <asp:TextBox ID="txtNews" runat="server" CssClass="textBox"  
                style="position:absolute;   top:345px; left:380px;"  ></asp:TextBox>
                <asp:TextBox ID="txtExtraDHK" runat="server" CssClass="textBox"  
                style="position:absolute;   top:364px; left:100px;"  ></asp:TextBox>
                
                <hr style="position:absolute; top:452px; color:#57677F; width:589px; left:0px;" /> 
            

            


        <hr style="position:absolute; top:463px; color:#57677F; width:584px; left:-1px;" /> 

        <asp:Button id="btnPreview" CssClass="Submitbutton" runat="server"  text="Preview" 
               onclick="btnPreview_Click" style="position:absolute; top:470px; left:10px; height:26px;" 
                 />
                 <asp:Button id="btnCancel" CssClass="Submitbutton" runat="server"  text="Cancel" 
               onclick="btnPreview_Click" style="position:absolute; top:470px; left:440px; height:26px;" 
                 />

                
            <asp:Label ID="lblHeader" CssClass="labelHeader" runat="server" 
                Text="Daily Circulation Chalan" 
                style="position:absolute; left:105px; top:5px; height: 19px;" ></asp:Label> 
            

                
            
            

                
        </div>

   </div>

</asp:Content>

