using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;
using System.Data.Common;
using CrystalDecisions.CrystalReports.Engine;

public partial class rptTransportSchedule : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    private ReportDocument report = new ReportDocument();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //bindSubroute();
        }
    }

    private void bindSubroute()
    {
        //DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);

        string query = "SELECT DISTINCT subRoute FROM RptTransportTime";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRoute");
        ddlSubRoute.DataSource = ds;
        ddlSubRoute.DataTextField = "subRoute";
        ddlSubRoute.DataValueField = "subRoute";
        ddlSubRoute.DataBind();
        ddlSubRoute.Items.Insert(0, "--Select--");
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

        string selQ = "Select sum(quantity + complementaryCopy + bonusCopy + daywiseChngQuantity + daywiseDefQuanttity) as quantity from Daily_Order where orderDate between '" + txtDateFrom.Text + "' and '" + txtDateTo.Text + "'";
        int Tq =Convert.ToInt32(dataProvider.getResultString(selQ));
        strSelect = "Select * from RptTransportTime where transDate between '" + txtDateFrom.Text + "' and '" + txtDateTo.Text + "'";

         //if (ddlSubRoute.SelectedItem.Text != "--Select--")
         //{
         //    strSelect = strSelect + "And subRoute='" + ddlSubRoute.SelectedItem.Text + "'";

         //}
        
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strSelect, "RptTransportTime");
            report.Load(Server.MapPath("Report\\TransportDaily.rpt"));
            report.SetDataSource(ds);
            report.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");
            report.SetParameterValue("QUAN", Tq);

            if (ddlExportType.SelectedItem.Text == "Pdf")
            {
                report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/TransportDaily.pdf"));
                ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/TransportDaily.pdf');popup.focus();", true);
            }
            else if (ddlExportType.SelectedItem.Text == "Excel")
            {

                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.ExcelRecord, Page.Response, false, "TransportDaily");
            }
            else
            {
                report.ExportToHttpResponse(CrystalDecisions.Shared.ExportFormatType.RichText, Page.Response, false, "TransportDaily");
            }
        }
        
    
    
}