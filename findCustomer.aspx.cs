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


public partial class findCustomer : System.Web.UI.Page
{
    //string connectionString = "Data Source=192.168.10.75;InitialCatalog=ALODAT; UserID=abomuser;  Password=erp;";

    string connectionString = "Data Source=192.168.10.75;User ID=abomuser;Password=erp;;Initial Catalog=ALODAT;Trusted_connection=false;Integrated Security=false;Pooling=false;";

    clsDataProvider dataProvider = new clsDataProvider();

    #region All Global Variable
    #endregion

    #region Page Load Event

        protected void Page_Load(object sender, EventArgs e)
        {   
            SqlConnection con =new SqlConnection(connectionString);
            con.Open();
            //con.Open();

            if (Convert.ToString(Request["page"]) == "OrderCapture")
            {
                bindCustomer();
            }

            else
            {
                bindAccPacCus();
            }

            clsHelper.CheckLogin();
        }

    #endregion

    #region All Private methods


        private void bindAccPacCus()
        {
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            

            string selCus = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS";

            SqlCommand cmd = new SqlCommand(selCus, con);
            cmd.ExecuteNonQuery();

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            grdCustomer.DataSource = dt;
            grdCustomer.DataBind();


            con.Close();
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

                    selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilter.Text + "%'";
                }

                else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Starts With")
                {

                    selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
                }
            }

            else
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 ";
            }


            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(selUserList, "hawkerInformation");
            grdCustomer.DataSource = ds;
            grdCustomer.DataBind();

        }

    #endregion

    #region All Gridview Event

        protected void grdCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdCustomer.PageIndex = e.NewPageIndex;
            grdCustomer.DataBind();
        }



         protected void grdCustomer_SelectedIndexChanged(object sender, EventArgs e)
         {

             string selectedID = grdCustomer.SelectedRow.Cells[1].Text;
             lblCustomerID.Text = selectedID;


             if (Convert.ToString(Request["page"]) == "OrderCapture")
             {
                 string script = "<script language=\"javascript\">";

                 script += "window.opener.aspnetForm.document.getElementById('" + selectedID + "';";
                
                 script += "window.close()";
                 
                 script += "</script>";

                 this.ltScript.Text = script;
                

             }



             else if (Convert.ToString(Request["page"]) == "AgentInfo")
             {


                 string script = "<script language=\"javascript\">";



                script += "window.opener.aspnetForm.document.getElementById('ctl00_ContentPlaceHolder1_txtBillTo').value='" + selectedID + "';";
                //script += "window.opener.aspnetForm.document.getElementById('ctl00_ContentPlaceHolder1_hdnfldCustID').value='" + this.lblCustomerID.Text.ToString() + "';";

                
                script += "window.close()";

                script += "</script>";

                this.ltScript.Text = script;

                //ScriptManager.RegisterStartupScript(Page, this.GetType(), "CCode", "<script>window.opener.document.forms[0].submit();window.close();</script>", false);

               // ScriptManager.RegisterStartupScript(Page, this.GetType(), "str", "<script language='javascript' type='text/javascript'>window.opener.document.getElementById('ctl00_ContentPlaceHolder1_txtBillTo').value  ='" + selectedID + "'; window.close();</script>", true);
           

             }

             else
             {
             }
         }


         protected void grdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
         {
             if (e.Row.RowType == DataControlRowType.DataRow)
             {
                 e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#91ff87'; this.style.color = 'blue'; this.style.fontWeight='bold'";
                
                 e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdCustomer, "Select$" + e.Row.RowIndex); 


             }
         }
    #endregion
}