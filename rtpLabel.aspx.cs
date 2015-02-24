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


public partial class rtpLabel : System.Web.UI.Page
{
    clsConnection connection = new clsConnection();
    clsDataProvider dataProvider = new clsDataProvider();

    private ReportDocument report = new ReportDocument();

    #region Page Load
    
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                bindsubRoute();
            }
            clsHelper.CheckLogin();
        }

    #endregion

    #region All Private Methode

        private void bindsubRoute()
        {
            string query = "SELECT  subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(query, "subRouteName");
            ddlArea.DataSource = ds;
            ddlArea.DataTextField = "subRouteName";
            ddlArea.DataValueField = "subRouteName";
            ddlArea.DataBind();
        }


        private void LoadReport()
        {
            string strLabelPrint = "";

            strLabelPrint = "Select * from News1 where ORDDATE between '"+txtfrmDate.Text+"' and '"+txtTodate.Text+"'";

            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strLabelPrint, "News1");
            report.Load(Server.MapPath("Report\\label.rpt"));
            report.FileName = Server.MapPath("Report\\label.rpt");
            report.SetParameterValue("individual", Convert.ToInt32(txtNewsReg.Text));
            report.SetParameterValue("individualExtra", Convert.ToInt32(txtNewsMax.Text));
            report.SetDataSource(ds);



            ReportDocument Subreport = new ReportDocument();

            string strLabelPrintSupp = "Select * from Suppliment1 where ORDDATE between '" + txtfrmDate.Text + "' and '" + txtTodate.Text + "'";

            DataSet ds1 = new DataSet();
            ds1 = dataProvider.getDataSet(strLabelPrintSupp, "Suppliment1");
            report.Load(Server.MapPath("Report\\label.rpt"));
            report.OpenSubreport("Suppliment").SetDataSource(ds1);

            Subreport = report.OpenSubreport("Suppliment");
            report.SetParameterValue("SupplimentMaximum", Convert.ToInt32(txtSupplementMax.Text), "Suppliment");
            report.SetParameterValue("Suppliment", Convert.ToInt32(txtSuppReg.Text), "Suppliment");
            Subreport.SetDataSource(ds1);
            

            report.SetDatabaseLogon("sa", "erp", "192.168.10.75", "ALOCIR");
            Subreport.SetDatabaseLogon("abomuser", "erp", "192.168.10.75", "ALOCIR");

            report.ExportToDisk(CrystalDecisions.Shared.ExportFormatType.PortableDocFormat, Server.MapPath("Report/label.pdf"));
            ClientScript.RegisterStartupScript(this.Page.GetType(), "popupOpener", "var popup=window.open('Report/label.pdf');popup.focus();", true);

        }

    #endregion

    #region All Button Event

        protected void btnpreviewLabel_Click(object sender, EventArgs e)
        {

            clsConnection dbCon = new clsConnection();
            SqlConnection con = new SqlConnection();
            //using (SqlConnection con = new SqlConnection())
            //{
                con = dbCon.ConnectByXML();
                con.Open();

                using (SqlCommand cmd = new SqlCommand("SPLabel", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add("@FrmDate", SqlDbType.DateTime).Value = txtfrmDate.Text;
                    cmd.Parameters.Add("@ToDate", SqlDbType.DateTime).Value = txtTodate.Text;

                    cmd.Parameters.Add("@Irns", SqlDbType.Int).Value = txtNewsReg.Text;
                    cmd.Parameters.Add("@Imns", SqlDbType.Int).Value = txtNewsMax.Text;
                    cmd.Parameters.Add("@Ircs", SqlDbType.Int).Value = txtSuppReg.Text;
                    cmd.Parameters.Add("@Imcs", SqlDbType.Int).Value = txtSupplementMax.Text;
                    cmd.Parameters.Add("@Crns", SqlDbType.Int).Value = txtRegSize.Text;
                    cmd.Parameters.Add("@Cmns", SqlDbType.Int).Value = txtMaxSize.Text;
                    cmd.Parameters.Add("@Category", SqlDbType.VarChar).Value = ddlCategory.SelectedItem.Text;
                    
                    
                    cmd.ExecuteNonQuery();
                }
           // }

            LoadReport();
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
}