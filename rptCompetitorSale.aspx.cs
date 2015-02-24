using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.Common;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

public partial class rptCompetitorSale : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindStation();
        }
    }


    private void bindStation()
    {
        string query = "SELECT  PaperName from PCOMPARE where UStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "PaperName");
        ddlPaperName.DataSource = ds;
        ddlPaperName.DataTextField = "PaperName";
        ddlPaperName.DataValueField = "PaperName";
        ddlPaperName.DataBind();
        ddlPaperName.Items.Insert(0, "--Select--");
    }

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

    protected void btnPreview_Click(object sender, EventArgs e)
    {
        string strSelect = "";

        if (ddlReportName.SelectedItem.Text == "Competitor Sales")
        {
            strSelect = "Select * from View_TRANSACTIONPAPER where TRADATE between '" + txtDateFrom.Text + "' and '" + txtDateTo.Text + "'";

            if (ddlPaperName.SelectedItem.Text != "--Select--")
            {
                if (ddlPaperName.SelectedItem.Text == "Prothom Alo")
                {
                    strSelect = strSelect + "AND ( PAPERNAME like'%Prothom Alo%') ";
                }
                else
                {
                    strSelect = strSelect + "AND PAPERNAME='" + ddlPaperName.SelectedItem.Text + "'";
                }
            }

            strSelect = strSelect + "ORDER BY sortOrder asc";
        }
        else
        {
            strSelect = "Select * from CompetitorSummary where TRADATE between '" + txtDateFrom.Text + "' and '" + txtDateTo.Text + "'";
        }


        if (ddlReportName.SelectedItem.Text == "Competitor Sales" && ddlPaperName.SelectedItem.Text == "--Select--")
        {

            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "View_TRANSACTIONPAPER");
            report.Load(Server.MapPath("Report\\CompetitorInfo.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/CompetitorInfo.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/CompetitorInfo.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {

                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "CompetitorInfo");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "CompetitorInfo");
            }
        }
        else if (ddlReportName.SelectedItem.Text == "Competitor Summary" && ddlPaperName.SelectedItem.Text == "--Select--")
        {
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "CompetitorSummary");
            report.Load(Server.MapPath("Report\\CompetitorSummary.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/CompetitorSummary.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/CompetitorSummary.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {

                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "CompetitorSummary");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "CompetitorSummary");
            }
        }
        else 
        {
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "View_TRANSACTIONPAPER");
            report.Load(Server.MapPath("Report\\CompetitorInfoPalo.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/CompetitorInfoPalo.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/CompetitorInfoPalo.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {

                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "CompetitorInfoPalo");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "CompetitorInfoPalo");
            }
        }
    }
}