<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Summaryreport.aspx.cs" Inherits="Summaryreport" %>
<%--<%@ Page Language="C#" Inherits="ClassLibrary1.Summaryreport" AutoEventWireup="true" CodeFile="Summaryreport.aspx.cs" %>--%>

<%@ Register Assembly="System.Web.DataVisualization" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp"  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <title>Sales Summary Status</title>
    <style type="text/css">
                
        .FooterStyle { background-color: #a33; color: White; text-align: right; }
        
        .style1
        {
            width: 444px;
        }
        
        .style2
        {
            width: 663px;
        }
        
    </style>
</head>
<body>

    <form id="form1" runat="server" >
     <asp:LinkButton ID="lnkBack" runat="server" Font-Bold="false" Text="Back" PostBackUrl="~/Home.aspx" style="position:absolute; left:20px; top:0px; font-family:Verdana; " ></asp:LinkButton>
   
   <table border="0"; align="left" rules="none" dir="ltr" cellpadding="0" cellspacing="0"    
         
         style="border-left: thin none #0000FF; position:absolute; padding: 0px; top:10px; left:10px;  width: 1277px; border-right-style: none; border-top-style: none; border-bottom-style: none;">
   <tr>
    <td class="style1">  
             <asp:Chart ID="PressAvg" runat="server" BackColor="GradientActiveCaption"
                                            Height="260px" BorderDashStyle="Solid" 
                 BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
          Width="437px" BorderlineWidth="0" BackGradientStyle="TopBottom" 
             style="margin-top: 10px" Palette="None" PaletteCustomColors="Red; Green; Blue">
                                            <Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Right" Font="Trebuchet MS, 8.25pt"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Column">
                                                </asp:Legend>
                                            </Legends>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3" Text="Press Wise Daily Production (Average)" Name="Title1" 
                              ForeColor="26, 59, 105"></asp:Title>
                              <%--<asp:Title Name="Title2" Text="Value in Tk.">
                          </asp:Title>--%>
					</titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>
<%--                                            <Series>
                                                <asp:Series Name="Myseries" ChartType="Pie" BorderColor="180, 26, 59, 105" Color="220, 65, 140, 240">
                                                </asp:Series>
                                            </Series>--%>
                                            <series>
                                                <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" 
                                                    Legend="Default" Name="serReveneu"  
                                                    Font="Verdana, 8.25pt" LabelAngle="0" ChartType="Pie" 
                                                    LabelForeColor="White">
                                                </asp:Series>

                                                <%--<asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" 
                                                    Legend="Default" Name="Booked"  LabelAngle="0"
                                                      Font="Verdana, 10pt" ChartType="Pie">
                                                </asp:Series>--%>

                                                
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0">
                                                    
                                                    <AxisY LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 9pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 7.00pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="60.9740753" width="80" x="5.388535" y="15.6822968" />
                                                    <innerplotposition height="79.84224" width="81.52058" x="15.6928" y="4.77433" />

<Position Height="74.9740753" Y="25.0259247" Width="100"></Position>

<InnerPlotPosition Height="79.84224" X="5.6928" Y="4.77433" Width="79.3072"></InnerPlotPosition>

<Area3DStyle Rotation="0" isrightangleaxes="False"></Area3DStyle>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
</td>
<td>  
             <asp:Chart ID="dailyProductionDiv" runat="server" BackColor="GradientActiveCaption"
                                            Height="260px" BorderDashStyle="Solid" 
                 BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
          Width="875px" BorderlineWidth="0" BackGradientStyle="TopBottom" 
             style="margin-top: 10px" Palette="None" PaletteCustomColors="Red; Green">
                                            <Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Bottom" Font="Trebuchet MS, 8.25pt"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Row">
                                                </asp:Legend>
                                            </Legends>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3" Text="Division wise daily production (Average)" Name="Title1" 
                              ForeColor="26, 59, 105"></asp:Title>

                               
					</titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>

                                            <series>
                                                <asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" 
                                                    Legend="Default" Name="Quantity"  
                                                    Font="Verdana, 8.25pt" LabelAngle="90" Label="#VAL{0}">
                                                </asp:Series>

                                                <%--<asp:Series ChartArea="ChartArea1" IsValueShownAsLabel="True" 
                                                    Legend="Default" Name="Booked"  LabelAngle="90"
                                                      Font="Verdana, 10pt" Label="#VAL{0}">
                                                </asp:Series>--%>

                                                
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0">
                                                    
                                                    <AxisY LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 9pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 7.00pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="60.9740753" width="80" x="5.388535" y="15.6822968" />
                                                    <innerplotposition height="79.84224" width="81.52058" x="15.6928" y="4.77433" />

<Position Height="60.9740753" X="5.388535" Y="20.6822968" Width="80"></Position>

<InnerPlotPosition Height="79.84224" X="15.6928" Y="4.77433" Width="81.52058"></InnerPlotPosition>

<Area3DStyle Rotation="0" isrightangleaxes="False"></Area3DStyle>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
</td>
  <td colspan="2"> 
        
         &nbsp;</td>
  
       
     </tr>
</table>

<table border="0"; align="left" rules="none" dir="ltr" cellpadding="0" cellspacing="0"    
         
         
         style="border-left: thin none #0000FF; position:absolute; padding: 0px; top:270px; left:10px;  width: 1312px; border-right-style: none; border-top-style: none; border-bottom-style: none;">
   <tr>
   <td class="style2">  
             <asp:Chart ID="dailyProduction" runat="server" BackColor="GradientActiveCaption"
                                            Height="260px" BorderDashStyle="Solid" 
                 BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
          Width="667px" BorderlineWidth="0" BackGradientStyle="TopBottom" 
             style="margin-top: 10px" Palette="None" 
                 PaletteCustomColors="DarkRed; Green; Blue">
                                           <Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Bottom" Font="Trebuchet MS, 8.25pt"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Row">
                                                </asp:Legend>
                                            </Legends>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3"  Name="titleSales" 
                              ForeColor="26, 59, 105"></asp:Title>

                             <%-- <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3"  Name="titleSales" ForeColor="26, 59, 105"></asp:Title>--%>
                              
					</titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>
<%--                                            <Series>
                                                <asp:Series Name="Myseries" ChartType="Pie" BorderColor="180, 26, 59, 105" Color="220, 65, 140, 240">
                                                </asp:Series>
                                            </Series>--%>
                                            <series >
                                                <asp:Series ChartArea="ChartArea1" Legend="Default"
                                                    Name="Last Month"
                                                     YValuesPerPoint="10" LabelForeColor="255, 128, 0" ChartType="Line">
                                                    
                                                </asp:Series>
                                                <asp:Series ChartArea="ChartArea1" Legend="Default" 
                                                    Name="Current Month"  IsXValueIndexed="false" LabelForeColor="0, 0, 192" 
                                                    ChartType="Line"   >
                                                </asp:Series>
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0" 
                                                    AlignmentOrientation="Horizontal">
                                                    
                                                    <AxisY LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 9pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
<MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 7.00pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="60.9740753" width="80" x="5.388535" y="15.6822968" />
                                                    <innerplotposition height="79.84224" width="81.52058" x="15.6928" y="4.77433" />

<Position Height="60" Y="20.6822968" Width="100"></Position>

<InnerPlotPosition Height="79.84224" X="5.6928" Y="4.77433" Width="81.52058"></InnerPlotPosition>

<Area3DStyle Rotation="0" isrightangleaxes="False" WallWidth="10"></Area3DStyle>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>
</td>
    <td colspan="2">
              <asp:Chart ID="salesComparisontbl" runat="server" BackColor="ActiveCaption" 
                  Height="260px" Width="641px" 
                BorderDashStyle="Solid" BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
                                        BorderlineWidth="0" BackGradientStyle="TopBottom" 
                  style="margin-top: 10px; margin-left: 0px;" Palette="None" 
                  PaletteCustomColors="Red; Green">
                                            <Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Bottom" Font="Trebuchet MS, 8.25pt"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Row">
                                                </asp:Legend>
                                            </Legends>
                                            
                                                                  <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3"  Name="titleSales" ForeColor="26, 59, 105"></asp:Title>
					  </titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>

                                            <series >
                                                <asp:Series ChartArea="ChartArea1" Legend="Default"
                                                    Name="Last Month"
                                                     YValuesPerPoint="10" LabelForeColor="255, 128, 0" ChartType="Line">
                                                    
                                                </asp:Series>
                                                <asp:Series ChartArea="ChartArea1" Legend="Default" 
                                                    Name="Current Month"  IsXValueIndexed="false" LabelForeColor="0, 0, 192" 
                                                    ChartType="Line"   >
                                                </asp:Series>
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0">
                                                    <Area3DStyle Rotation="0" />
                                                    <AxisY LineColor="64, 64, 64, 64">
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle  Font="Trebuchet MS, 8.00pt, style=regular"/>
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle Font="Trebuchet MS, 8.00pt, style=regular" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                <Area3DStyle Rotation="0"></Area3DStyle>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>  
        
  </td>
 </tr>
 </table>


<table border="0"; align="left" rules="none" dir="ltr" cellpadding="0" cellspacing="0"    
         
         style="border-left: thin none #0000FF; position:absolute; padding: 0px; top:530px; left:10px;  height: 368px; width: 1245px; border-right-style: none; border-top-style: none; border-bottom-style: none;">
    <tr>
    <td>        
        <asp:Chart ID="topSector" runat="server" BackColor="ActiveCaption" 
            Height="342px" Width="437px" BorderDashStyle="Solid" 
            BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
                                        BorderlineWidth="0" 
            BackGradientStyle="TopBottom" Palette="Fire">
                                            <%--<Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Right" Font="Trebuchet MS, 1pt, style=Bold"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Column">
                                                </asp:Legend>
                                            </Legends>--%>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3" Text="Top Ten Sector" Name="Title1" 
                              ForeColor="26, 59, 105" Alignment="TopCenter"></asp:Title>
					     <asp:Title Name="Title2" Text="Value in Tk.">
                          </asp:Title> 
                         
					  </titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>

                                            <series>
                                                <asp:Series ChartArea="ChartArea1" Name="Sector" BorderWidth="0" 
                                                    CustomProperties="DrawSideBySide=True, BarLabelStyle=Right, DrawingStyle=Cylinder, EmptyPointValue=Zero, PointWidth=1, LabelStyle=Top" 
                                                    Font="Verdana, 8.25pt" IsVisibleInLegend="False"  
                                                    Label="#VAL{N2}\n#PERCENT\n" LabelAngle="0" LabelBorderWidth="0" 
                                                    YValuesPerPoint="20" ChartType="Bar">
                                                    <smartlabelstyle allowoutsideplotarea="No" calloutlineanchorcapstyle="None" 
                                                        isoverlappedhidden="False" 
                                                        movingdirection="Top, TopRight, BottomLeft, BottomRight" />
<SmartLabelStyle IsOverlappedHidden="False" MovingDirection="Top, TopRight, BottomLeft, BottomRight" 
                                                        CalloutLineAnchorCapStyle="None" enabled="False"></SmartLabelStyle>
                                                </asp:Series>
                                                <asp:Series ChartArea="ChartArea1" Color="255, 128, 128" Font="Verdana, 8.25pt" 
                                                    IsValueShownAsLabel="True" Label="#VAL" LabelAngle="0" IsXValueIndexed="True"
                                                    LabelForeColor="MidnightBlue" Name="Sectortm" IsVisibleInLegend="False" 
                                                    ChartType="Bar">
                                                    <smartlabelstyle enabled="true" />
<SmartLabelStyle Enabled="False"></SmartLabelStyle>
                                                </asp:Series>
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0" 
                                                    AlignmentOrientation="None" AlignmentStyle="None">
                                                    <Area3DStyle Rotation="0" enable3d="false" />
                                                    <AxisY LineColor="64, 64, 64, 64" >
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle  Font="Trebuchet MS, 8.25pt, style=regular"/>
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                        
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>
                                                    
                                                        <LabelStyle Font="Trebuchet MS, 7.00pt, style=regular" Interval="1" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="70" width="89.69954" x="4.72018337" y="30" />

                                                <Area3DStyle Enable3D="false"></Area3DStyle>

<Position Height="70" X="1.72018337" Y="23" Width="89.2798157"></Position>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>                             

    </td>
    <td>  
    <asp:Chart ID="topAdvertiser" runat="server" BackColor="ActiveCaption" 
            Height="345px" Width="437px" BorderDashStyle="Solid" 
            BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
                                        BorderlineWidth="0" 
            BackGradientStyle="TopBottom" Palette="Fire">
                                            <%--<Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Right" Font="Trebuchet MS, 1pt, style=Bold"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Column">
                                                </asp:Legend>
                                            </Legends>--%>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3" Text="Top Ten Advertiser" Name="Title1" 
                              ForeColor="26, 59, 105" Alignment="TopCenter"></asp:Title>
					   <asp:Title Name="Title2" Text="Value in Tk.">
                          </asp:Title>   
					  </titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>

                                            <series>
                                                <asp:Series ChartArea="ChartArea1" 
                                                    Legend="Default" Name="Advertiser" BorderWidth="0" 
                                                    CustomProperties="DrawSideBySide=True, BarLabelStyle=Right, DrawingStyle=Cylinder, EmptyPointValue=Zero, PointWidth=1, LabelStyle=Top" 
                                                    Font="Verdana, 8.25pt" IsVisibleInLegend="False"
                                                    Label="#VAL{N2}\n#PERCENT" LabelAngle="0" LabelBorderWidth="0" 
                                                    Color="Maroon" LabelForeColor="DarkOliveGreen" 
                                                    YValuesPerPoint="10" ChartType="Bar"> 
                                                    <smartlabelstyle allowoutsideplotarea="No" calloutlineanchorcapstyle="None" 
                                                        isoverlappedhidden="False" 
                                                        movingdirection="Top, TopRight, BottomLeft, BottomRight" />
<SmartLabelStyle IsOverlappedHidden="False" MovingDirection="Top, TopRight, BottomLeft, BottomRight" 
                                                        CalloutLineAnchorCapStyle="None" enabled="False"></SmartLabelStyle>

                                                </asp:Series>
                                                <asp:Series ChartArea="ChartArea1" Color="DarkOrange" Font="Verdana, 8.25pt" 
                                                    Label="#VAL" LabelAngle="0" Name="Advertisertm" 
                                                    LabelForeColor="MidnightBlue" ChartType="Bar">
                                                    <smartlabelstyle enabled="true" />
<SmartLabelStyle Enabled="False"></SmartLabelStyle>
                                                </asp:Series>
                                            </series>
                                          <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0" 
                                                    AlignmentOrientation="All">
                                                    <Area3DStyle Rotation="0" enable3d="false" />
                                                    <AxisY LineColor="64, 64, 64, 64" >
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle  Font="Trebuchet MS, 8.25pt, style=regular"/>
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                        
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>
                                                    
                                                        <LabelStyle Font="Trebuchet MS, 7.00pt, style=regular" Interval="1" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="70" width="89.69954" x="4.72018337" y="30" />

                                                <Area3DStyle Enable3D="false"></Area3DStyle>
                                                    <position height="60" width="89.69954" x="4.72018337" y="35" />

<Position X="1.72018337" Y="18" Width="89.2798157" Height="80"></Position>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>                             

    
     </td>
    <td>              
    <asp:Chart ID="topCustomer" runat="server" BackColor="ActiveCaption" 
            Height="342px" Width="437px" BorderDashStyle="Solid" 
            BackSecondaryColor="White" BorderWidth="2px" 
                                       BorderColor="#1A3B69" ImageLocation="~/TempImages/ChartPic_#SEQ(300,3)" 
                                        BorderlineWidth="0" 
            BackGradientStyle="TopBottom" Palette="Fire">
                                            <%--<Legends>
                                                <asp:Legend BackColor="Transparent" Alignment="Center" Docking="Right" Font="Trebuchet MS, 1pt, style=Bold"
                                                    IsTextAutoFit="False" Name="Default" LegendStyle="Column">
                                                </asp:Legend>
                                            </Legends>--%>
                      <titles>
					  <asp:Title ShadowColor="32, 0, 0, 0" Font="Trebuchet MS, 10.25pt, style=Bold" 
                              ShadowOffset="3" Text="Top Ten Customer" Name="Title1" 
                              ForeColor="26, 59, 105" Alignment="TopCenter"></asp:Title>
					      <asp:Title Name="Title2" Text="Value in Tk.">
                          </asp:Title>
                         
					  </titles>
		
                                            <BorderSkin borderwidth="0" backcolor="Transparent" skinstyle="Emboss" 
                                                pagecolor="Transparent" bordercolor="Transparent"></BorderSkin>

                                            <series>
                                                <%--<asp:Series ChartArea="ChartArea1" Name="Sector" BorderWidth="0" 
                                                    CustomProperties="DrawSideBySide=True, BarLabelStyle=Right, DrawingStyle=Cylinder, EmptyPointValue=Zero, PointWidth=1, LabelStyle=Top" 
                                                    Font="Verdana, 8.25pt" IsVisibleInLegend="False"  
                                                    Label="#VAL{N2}\n#PERCENT\n" LabelAngle="0" LabelBorderWidth="0" 
                                                    YValuesPerPoint="20" ChartType="Bar">
                                                    <smartlabelstyle allowoutsideplotarea="No" calloutlineanchorcapstyle="None" 
                                                        isoverlappedhidden="False" 
                                                        movingdirection="Top, TopRight, BottomLeft, BottomRight" />
<SmartLabelStyle IsOverlappedHidden="False" MovingDirection="Top, TopRight, BottomLeft, BottomRight" 
                                                        CalloutLineAnchorCapStyle="None" enabled="False"></SmartLabelStyle>
                                                </asp:Series>--%>
                                                <asp:Series ChartArea="ChartArea1" Color="255, 128, 128" Font="Verdana, 8.25pt" 
                                                    IsValueShownAsLabel="True" Label="#VAL" LabelAngle="0" IsXValueIndexed="True"
                                                    LabelForeColor="MidnightBlue" Name="Customertm" IsVisibleInLegend="False" 
                                                    ChartType="Bar">
                                                    <smartlabelstyle enabled="true"  />
<SmartLabelStyle Enabled="True"></SmartLabelStyle>
                                                </asp:Series>
                                            </series>
                                            <ChartAreas>
                                                <asp:ChartArea Name="ChartArea1" BorderColor="64, 64, 64, 64" BackSecondaryColor="Transparent"
                                                    BackColor="Transparent" ShadowColor="Transparent" BorderWidth="0" 
                                                    AlignmentOrientation="None" AlignmentStyle="None">
                                                    <Area3DStyle Rotation="0" enable3d="false" />
                                                    <AxisY LineColor="64, 64, 64, 64" >
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>

                                                        <LabelStyle  Font="Trebuchet MS, 10.25pt, style=regular"/>
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                        
                                                    </AxisY>
                                                    <AxisX LineColor="64, 64, 64, 64">
                                                    <MajorGrid LineColor="64, 64, 64, 64"></MajorGrid>
                                                    
                                                        <LabelStyle Font="Trebuchet MS, 10pt, style=regular" Interval="1" />
                                                        <MajorGrid LineColor="64, 64, 64, 64" />
                                                    </AxisX>

                                                    <position height="70" width="89.69954" x="4.72018337" y="30" />

                                                <Area3DStyle Enable3D="false"></Area3DStyle>

<Position Height="70" X="1.72018337" Y="22" Width="89.2798157"></Position>
                                                </asp:ChartArea>
                                            </ChartAreas>
                                        </asp:Chart>                            

    
        </td>
            </tr>   

     
 
   
  
   </table>
                    

    
    </form>
</body>
</html>
