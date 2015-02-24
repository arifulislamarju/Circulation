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

public partial class Distribution : System.Web.UI.Page
{
    bll_CreateDistribution bllcreate = new bll_CreateDistribution();
    clsDataProvider dataProvider = new clsDataProvider();

    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

        con = dbCon.ConnectByXML();

        con.Open();
        con.Close();

        if (!IsPostBack)
        {
            bindRM();
            bindCustomer();
            bindStation();

            bindRMID();
            //bindCusID();
            //bindStatID();
            // bindfrmDb();

        }
        clsHelper.CheckLogin();

    }


    #region All Private Methods

    protected void ddlRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindRMID();
        bindfrmDb();
        bindCusID();
        bindStatID();
    }

    protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCusID();
    }

    protected void ddlStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindStatID();
    }


    #endregion


    #region Binding


    private void bindRM()
    {
        string query = "SELECT  rmName from regionalManager where delStatus<>1 Order By rmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "rmName");
        ddlRM.DataSource = ds;
        ddlRM.DataTextField = "rmName";
        ddlRM.DataValueField = "rmName";
        ddlRM.DataBind();
        ddlRM.Items.Insert(0, "-- Select --");
    }

    private void bindRMID()
    {
        string query = "SELECT rmId from regionalManager where delStatus<>1 AND rmName = '" + ddlRM.SelectedItem.Text + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "rmId");
        ddlRMID.DataSource = ds;
        ddlRMID.DataTextField = "rmId";
        ddlRMID.DataValueField = "rmId";
        ddlRMID.DataBind();
    }


    private void bindCustomer()
    {
        string query = "SELECT  hkrNameEng from hawkerInformation where delStatus<>1 Order By hkrNameEng ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "hkrNameEng");
        ddlCustomer.DataSource = ds;
        ddlCustomer.DataTextField = "hkrNameEng";
        ddlCustomer.DataValueField = "hkrNameEng";
        ddlCustomer.DataBind();
        ddlCustomer.Items.Insert(0, "-- Select --");
    }


    private void bindCusID()
    {   

        string query = "SELECT  hkrID from hawkerInformation where delStatus<>1 AND hkrNameEng = '" + ddlCustomer.SelectedItem.Text.Replace("'","''") + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "hkrID");
        ddlCusID.DataSource = ds;
        ddlCusID.DataTextField = "hkrID";
        ddlCusID.DataValueField = "hkrID";
        ddlCusID.DataBind();
    }


    private void bindStation()
    {
        string query = "SELECT  stationName from station where delStatus<>1  Order By stationName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStation.DataSource = ds;
        ddlStation.DataTextField = "stationName";
        ddlStation.DataValueField = "stationName";
        ddlStation.DataBind();
        ddlStation.Items.Insert(0, "-- Select --");
    }

    private void bindStatID()
    {
        
        string query = "SELECT  stationId from station where delStatus<>1 AND stationName = '" + ddlStation.SelectedItem.Text.Replace("'", "''") + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationId");
        ddlStatID.DataSource = ds;
        ddlStatID.DataTextField = "stationId";
        ddlStatID.DataValueField = "stationId";
        ddlStatID.DataBind();
    }


    #endregion


    #region Button

    protected void btnSave_click(object sender, EventArgs e)
    {
        string agentId = "";
        string selCountrow = "SELECT COUNT(*) from distribution where delStatus<>1 AND rmName='" + ddlRM.SelectedItem.Text + "' AND customerName = '" + ddlCustomer.SelectedItem.Text.Replace("'", "''") + "' AND stationName='" + ddlStation.SelectedItem.Text.Replace("'", "''") + "'";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        con.Open();

        using (SqlCommand selCusId = new SqlCommand("SELECT hkrid from hawkerInformation where delStatus<>1 AND hkrNameEng =@agentName", con))
        {
            selCusId.Parameters.AddWithValue("@agentName", ddlCustomer.SelectedItem.Text);
            //selCusId.Parameters.AddWithValue("@stationName", ddlStation.SelectedItem.Text);
            SqlDataReader sdrAgentId = selCusId.ExecuteReader();

            while (sdrAgentId.Read())
            {
                agentId = sdrAgentId["hkrid"].ToString();
            }
            sdrAgentId.Close();
        }

        string selStaId = "SELECT stationId from station where delStatus<>1 AND stationName='" + ddlStation.SelectedItem.Text + "'";
        int stationId = Convert.ToInt32(dataProvider.getResultString(selStaId));
               

        bllcreate.RMID = ddlRMID.SelectedItem.Text;
        bllcreate.RM = ddlRM.SelectedItem.Text;
        bllcreate.CUSTID = agentId;
        bllcreate.CUSTOMER = ddlCustomer.SelectedItem.Text.Replace("'","''");
        bllcreate.STATID =stationId.ToString();
        bllcreate.STATION = ddlStation.SelectedItem.Text;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdndsId.Value != "" && hdndsId.Value != null)
        {
            bllcreate.DSID = Convert.ToInt32(hdndsId.Value);

            bllcreate.update();

            hdndsId.Value = "";
            btnSave.Text = "Create";

        }
        else
        {
            if (rowNumber == 0)
            {
                bllcreate.insert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Duplication Found, try another name..');", true);
            }
        }

        bindfrmDb();

    }


    #endregion


    #region Grid View


    private void bindfrmDb()
    {
        string select = "SELECT * from distribution where delStatus<>1 and rmName = '"+ ddlRM.SelectedItem.Text +"' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(select, "distribution");
        grdDistribution.DataSource = ds;
        grdDistribution.DataBind();

    }


    protected void grdDistribution_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow =
            new GridViewRow(0, 0, DataControlRowType.Header,
            DataControlRowState.Insert);

            HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#BAD0DD");
            HeaderGridRow.ForeColor = System.Drawing.Color.Black;

            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "dsId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Regional Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Agent";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Created By";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Create Date";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Action";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);


            grdDistribution.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdDistribution_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdDistribution.PageIndex = e.NewPageIndex;
        grdDistribution.DataBind();
        bindfrmDb();
    }
    protected void grdDistribution_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {
        bindCusID();
        bindStatID();

        hdndsId.Value = HttpUtility.HtmlDecode(grdDistribution.Rows[rowIndex].Cells[0].Text);
        ddlRM.Text = HttpUtility.HtmlDecode(grdDistribution.Rows[rowIndex].Cells[1].Text);
        ddlCustomer.SelectedItem.Text = HttpUtility.HtmlDecode(grdDistribution.Rows[rowIndex].Cells[2].Text);
        ddlStation.SelectedItem.Text = HttpUtility.HtmlDecode(grdDistribution.Rows[rowIndex].Cells[3].Text);

        btnSave.Text = "Update";

        bindfrmDb();

    }
    protected void grdDistribution_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Regional Manager: " +
            DataBinder.Eval(e.Row.DataItem, "rmName") + "')");

        }
    }
    protected void grdDistribution_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int dsId = (int)grdDistribution.DataKeys[e.RowIndex].Value;
        bllcreate.DSID = dsId;
        bllcreate.delete();

        bindfrmDb();
    }





    #endregion




}