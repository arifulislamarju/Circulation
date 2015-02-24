using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.DataVisualization.Charting;
using System.Drawing;
using System.Collections.Generic;
using System.Text;

using System.Data.SqlClient;
 

public partial class Summaryreport : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

        con = dbCon.ConnectByXML();

        con.Open();
        con.Close();

        PressWiseAvg();
        //countAdv();
        DivisionWiseProduction();
        DailyProduction();
        //topAdvertiserStatus();
        //topCustomerStatus();
        //topSectorStatus();
        //salesComparison();
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        int count = Session.Count;
    }

    private void PressWiseAvg()
    {

        con.Open();

        string strColInch = "Select press,Quantity From PressWiseAgv ";

        SqlDataAdapter da = new SqlDataAdapter(strColInch, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        PressAvg.DataSource = ds;

        PressAvg.Series["serReveneu"].XValueMember = "press";
        PressAvg.Series["serReveneu"].YValueMembers = "Quantity";
       
        PressAvg.ChartAreas[0].AxisX.Interval = 1;

        con.Close();
            
    }

    
    private void DailyProduction()
    {

        string strmonthName = "";
        string strpremonthName = "";


        strmonthName = DateTime.Now.ToString("MMMM");
        strpremonthName = DateTime.Now.AddMonths(-1).ToString("MMMM");      
        
        con.Open();

        string strDailyProduction = "Select * from ProductionCompair order by TransactionDate Asc";

        SqlDataAdapter da = new SqlDataAdapter(strDailyProduction, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        dailyProduction.DataSource = ds;

        dailyProduction.Series["Last Month"].XValueMember = "TransactionDate";
        dailyProduction.Series["Last Month"].YValueMembers = "QuantityLastMonth";
        dailyProduction.Series["Current Month"].XValueMember = "TransactionDate";
        dailyProduction.Series["Current Month"].YValueMembers = "QuantityCurrentMonth";

        dailyProduction.ChartAreas[0].AxisX.Interval = 1;
        //salesComparisontbl.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
        dailyProduction.Series["Current Month"].BorderWidth = 2;
        dailyProduction.Series["Last Month"].BorderWidth = 2;

        //LineSeries line = (LineSeries)Chart.Series.Add(SeriesType.Line);
        //dailyProduction.Series["Current Month"].EmptyPointStyle.MarkerStyle = MarkerStyle.Cross;
        //dailyProduction.Series["Last Month"].EmptyPointStyle.MarkerStyle = MarkerStyle.Cross;

        dailyProduction.Series["Last Month"].ToolTip = "#VALX : #VAL ";
        dailyProduction.Series["Current Month"].ToolTip = "#VALX  : #VAL ";

        dailyProduction.Titles["titleSales"].Text = "Daily Production Compair : " + strpremonthName + " & " + strmonthName;

        con.Close();
    }

    private void DivisionWiseProduction()
    {

        string strAmount = "";
        int i = 0;

        
        con.Open();
        string query = "Select Quantity,divName from DivisionWiseProduction order by Quantity asc";
                
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        dailyProductionDiv.DataSource = ds;

        dailyProductionDiv.Series["Quantity"].XValueMember = "divName";
        dailyProductionDiv.Series["Quantity"].YValueMembers = "Quantity";
        //AllocatedValue.Series["Booked"].XValueMember = "SUPPNAME";
        //AllocatedValue.Series["Booked"].YValueMembers = "BookedSpace";

        dailyProductionDiv.ChartAreas[0].AxisX.Interval = 1;
        dailyProductionDiv.ChartAreas[0].AxisY.LabelStyle.Angle = 0;        
        //Revenue.Series[0].SmartLabelStyle.Enabled = false;      
        //Revenue.Series["sreRevenue"].ToolTip = "#VALX : #VAL "+" Taka";

        //AllocatedValue.Series["Allocated"].Label = "#PERCENT";

        //Revenue.Series["sreRevenue"].Label = "#PERCENT" + strAmount;

        //Revenue.Series["Allocated"]["DrawingStyle"] = "Cylinder";
        //Revenue.Series["Booked"]["DrawingStyle"] = "Cylinder";

        con.Close();
    }

    private void topAdvertiserStatus()
    {
       
        
        con.Open();
        string query = "select * from MonthlyAdvertiserSale ";
        
        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);
        topAdvertiser.DataSource = ds;       

        
        topAdvertiser.Series["Advertisertm"].XValueMember = "ADVERTISER";
        topAdvertiser.Series["Advertisertm"].YValueMembers = "ThisMonth";
        topAdvertiser.Series["Advertisertm"].ToolTip = "#VALX: #VAL ";
        topAdvertiser.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Trebuchet MS", 9.25f, System.Drawing.FontStyle.Regular);
        topAdvertiser.ChartAreas[0].AxisX.Interval = 1;
           
        topAdvertiser.Series[0].SmartLabelStyle.Enabled = true;               

        topAdvertiser.Series["Advertiser"]["DrawingStyle"] = "Cylinder";

        con.Close();
    }

    private void topCustomerStatus()
    {
        con.Open();
        string query = "select * from MonthlyCustomerSales";


        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        topCustomer.DataSource = ds;



        //topCustomer.Series["Customer"].XValueMember = "CUSTNAME";
        //topCustomer.Series["Customer"].YValueMembers = "Amount";
        //topCustomer.Series["Customer"].ToolTip = "#VALX: #VAL ";
        topCustomer.Series["Customertm"].XValueMember = "CUSTNAME";
        topCustomer.Series["Customertm"].YValueMembers = "ThisMonth";

        //topCustomer.Series["Customer"].ToolTip = "#VALX: #VAL ";
        topCustomer.Series["Customertm"].ToolTip = "#VALX: #VAL ";
        topCustomer.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Trebuchet MS", 9.25f, System.Drawing.FontStyle.Regular);

        
        topCustomer.ChartAreas[0].AxisX.Interval = 1;


        //topCustomer.ChartAreas[0].AxisX.LabelStyle.Angle = -90;
        //topCustomer.Series[0].SmartLabelStyle.Enabled = false;



        //topCustomer.Series["Customertm"]["DrawingStyle"] = "Cylinder";
    }

    private void topSectorStatus()
    {
        con.Open();
        string query = "select * from MonthlyAdvSectorSale";


        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        topSector.DataSource = ds;



        //topSector.Series["Sector"].XValueMember = "ADVSECTOR";
        //topSector.Series["Sector"].YValueMembers = "Amount";
        //topSector.Series["Sector"].ToolTip = "#VALX: #VAL ";

        topSector.Series["Sectortm"].XValueMember = "ADVSECTOR";
        topSector.Series["Sectortm"].YValueMembers = "ThisMOnth";
        topSector.Series[0].ToolTip = "#VALX: #VAL";
        topSector.Series[1].ToolTip = "#VALX: #VAL";     

        topSector.ChartAreas[0].AxisX.Interval = 1;
        //topSector.ChartAreas[0].AxisX.LabelStyle.Angle = 0;
        topSector.Series[0].SmartLabelStyle.Enabled = false;
        topSector.ChartAreas[0].AxisX.LabelStyle.Font = new System.Drawing.Font("Trebuchet MS", 9.25f, System.Drawing.FontStyle.Regular);
        


        topSector.Series["Sector"]["DrawingStyle"] = "Cylinder";
    }

    private void salesComparison()
    {
        string strmonthName ="";
        string strpremonthName = "";

        
        strmonthName = DateTime.Now.ToString("MMMM");
        strpremonthName = DateTime.Now.AddMonths(-1).ToString("MMMM");      
        
        con.Open();
        string query = "select  * from Salescomparison order by Transdate asc ";

       

        SqlDataAdapter da = new SqlDataAdapter(query, con);
        DataSet ds = new DataSet();
        DataTable t = new DataTable();
        da.Fill(t);
        da.Fill(ds);

        salesComparisontbl.DataSource = ds;

        salesComparisontbl.Series["Last Month"].XValueMember = "TransDate";
        salesComparisontbl.Series["Last Month"].YValueMembers = "LastMonth";
        salesComparisontbl.Series["Current Month"].XValueMember = "TransDate";
        salesComparisontbl.Series["Current Month"].YValueMembers = "ThisMonth";

        salesComparisontbl.ChartAreas[0].AxisX.Interval = 1;
        //salesComparisontbl.ChartAreas[0].AxisX.IntervalType = DateTimeIntervalType.Days;
                
       
        salesComparisontbl.Series["Last Month"].ToolTip = "#VALX : #VAL ";
        salesComparisontbl.Series["Current Month"].ToolTip = "#VALX  : #VAL ";

        salesComparisontbl.Titles["titleSales"].Text = "Daily Column-Inch Comparision : "+ strpremonthName+ " & "+ strmonthName;
   

    }

    //protected void grdColumnInch_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowType == DataControlRowType.Header)
    //    {
    //        GridView HeaderGrid = (GridView)sender;
    //        GridViewRow HeaderGridRow =
    //        new GridViewRow(0, 0, DataControlRowType.Header,
    //        DataControlRowState.Insert);

    //        HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("LemonChiffon");


    //        TableCell HeaderCell = new TableCell();
    //        HeaderCell = new TableCell();
    //        HeaderCell.Text = "Category";
    //        HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#F0F1EE");
    //        HeaderCell.Font.Bold = false;
    //        HeaderCell.Font.Size = 10;
    //        //HeaderCell.ColumnSpan = 2;
    //        HeaderGridRow.Cells.Add(HeaderCell);          

    //        HeaderCell = new TableCell();
    //        HeaderCell.Text = "Amount";
    //        HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#F0F1EE");
    //        HeaderCell.Font.Bold = false;
    //        HeaderCell.Font.Size = 10;
    //        HeaderGridRow.Cells.Add(HeaderCell);
        
    //        grdColumnInch.Controls[0].Controls.AddAt
    //           (0, HeaderGridRow);
    //    }

    //}
    //protected void grdColumnInch_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
  
        
    //}
    
}