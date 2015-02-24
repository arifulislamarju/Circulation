using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class UnsoldReport : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();
    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();

    //#region Page Load
    //#endregion

    #region Page Load
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //this.txtReturnDateFrom.Text = DateTime.Today.ToString("dd-MMM-yyyy");
                //this.txtReturnDateTo.Text = DateTime.Today.ToString("dd-MMM-yyyy");

                ddlRmName();
            }

            clsHelper.CheckLogin();
        }

    #endregion

    protected void imgCustomerFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindCustomer();
        
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
    }

    #region Button Event

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        string strSelect = "";

        con = dbCon.ConnectByXML();
        con.Open(); 

        

        strSelect = "Select * from UnsoldReport where returnDate between '" + txtReturnDateFrom.Text + "' and '" + txtReturnDateTo.Text + "'";

        if (txtCustomaerName.Text != "All" && txtCustomaerName.Text != "")
        {
            strSelect = strSelect + "AND hkrNameEng='" + txtCustomaerName.Text + "'";
        }

        if (ddlRmname.SelectedItem.Text != "--Select--")
        {
            strSelect = strSelect + "AND rmName='" + ddlRmname.SelectedItem.Text + "'";
        }

        strSelect = strSelect + "Order By sortingOrder asc";

        
        

        if (ddlReportName.SelectedItem.Text == "Serial Report")
        {

            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "UnsoldReport");
            report.Load(Server.MapPath("Report\\Unsold.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/Unsold.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/Unsold.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {

                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "UnsoldReport");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "UnsoldReport");
            }
        }
        else if (ddlReportName.SelectedItem.Text == "Executive Wise")
        {
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "UnsoldReport");
            report.Load(Server.MapPath("Report\\ExecutiveUnsold.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/ExecutiveUnsold.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/ExecutiveUnsold.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "ExecutiveUnsold");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "ExecutiveUnsold");
            }
        }
        else
        {
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "UnsoldReport");
            report.Load(Server.MapPath("Report\\ExecutiveUnsoldSummary.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/ExecutiveUnsoldSummary.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/ExecutiveUnsoldSummary.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "ExecutiveUnsoldSummary");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "ExecutiveUnsoldSummary");
            }
        }

    }




    #endregion

    #region Textbox Event

    protected void txtFilter_TextChanged(object sender, EventArgs e)
        {
            bindCustomer();
        }

    #endregion

    #region Report Build

    protected override void OnUnload(EventArgs e)
        {
            base.OnUnload(e);
            this.Unload += new EventHandler(Page_Unload);
        }


        public void Page_Unload(object sender, EventArgs e)
        {
            report.Clone();
            report.Dispose();

        }

    #endregion

    #region Private Method


        private void ddlRmName()
        {
            string query = "SELECT  rmName from regionalManager where delStatus<>1 order by rmName asc";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(query, "rmName");
            ddlRmname.DataSource = ds;
            ddlRmname.DataTextField = "rmName";
            ddlRmname.DataValueField = "rmName";
            ddlRmname.DataBind();
            ddlRmname.Items.Insert(0, "--Select--");
        }

        private void bindCustomer()
    {
        string selUserList = "";

        if (txtFilter.Text != "" && txtFilter.Text != null)
        {

            if (ddlCustomer.SelectedItem.Text == "Customer Name" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Customer Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            }


            else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilter.Text + "'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilter.Text + "'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
        }

        else
        {

            selUserList = "SELECT * from hawkerInformation";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "hawkerInformation");
        grdCustomer.DataSource = ds;
        grdCustomer.DataBind();

    }

    #endregion  

    #region Gridview Event


    protected void grdCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomer.PageIndex = e.NewPageIndex;
        grdCustomer.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
    }

    protected void grdCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
       
        string selectedID = grdCustomer.SelectedRow.Cells[4].Text;        
        txtCustomaerName.Text = selectedID;
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
    }

    protected void grdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#C3C5E5'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdCustomer, "Select$" + e.Row.RowIndex);


        }
    }

   #endregion



   
}