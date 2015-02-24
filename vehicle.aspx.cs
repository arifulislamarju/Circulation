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

public partial class vehicle : System.Web.UI.Page
{
    bll_vehicle bllcreate = new bll_vehicle();
    clsDataProvider dataProvider = new clsDataProvider();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bindVehicle();

            bindDdlRouteName();
            bindDdlSubRouteName();
        }
        clsHelper.CheckLogin();
    }


    private void bindDdlRouteName()
    {
        string query = "SELECT routeName from route where delStatus<>1 Order By routeName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "routeName");
        ddlRouteName.DataSource = ds;
        ddlRouteName.DataTextField = "routeName";
        ddlRouteName.DataValueField = "routeName";
        ddlRouteName.DataBind();

        ddlRouteName.Items.Insert(0, "--Select--"); 
    }

    private void bindDdlSubRouteName()
    {
        string query = "SELECT subRouteName from subRoute where delStatus<>1 AND routeName='" + ddlRouteName.SelectedItem.Text.Replace("'","''")+ "' Order By subRouteName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");
        ddlSubRouteName.DataSource = ds;
        ddlSubRouteName.DataTextField = "subRouteName";
        ddlSubRouteName.DataValueField = "subRouteName";
        ddlSubRouteName.DataBind();

        ddlSubRouteName.Items.Insert(0, "--Select--"); 
    }


    protected void ddlRouteName_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlSubRouteName();
    }


    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from vehicle where delStatus<>1 AND vehicleCode='" + txtVehicleCode.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.VEHICLECODE = txtVehicleCode.Text;
        bllcreate.VEHICLENAMEBAN = txtVehicleNameBan.Text;
        bllcreate.VEHICLENAME = txtVehicleName.Text;
        bllcreate.REGNO = txtRegNo.Text;
        bllcreate.CAPACITY = txtCapacity.Text;
        bllcreate.RATEPERTRIP = Convert.ToInt32(txtRatePerTrip.Text);
        bllcreate.OWNERNAME = txtOwnerName.Text;
        bllcreate.DRIVERNAME = txtDriverName.Text;
        bllcreate.LICENSENO = txtLicense.Text;
        bllcreate.ROUTE = ddlRouteName.SelectedItem.Text.Replace("'","''");
        bllcreate.SUBROUTE = ddlSubRouteName.SelectedItem.Text.Replace("'", "''");
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdnVehicleId.Value != "" && hdnVehicleId.Value != null)
        {
            bllcreate.VEHICLEID = Convert.ToInt32(hdnVehicleId.Value);

            bllcreate.Update();

            hdnVehicleId.Value = "";
            btnSave.Text = "Create";

        }
        else
        {
            if (rowNumber == 0)
            {
                bllcreate.Insert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Vehicle Code Exists, Try Another Vehicle Code...');", true);
            }
        }

        bindVehicle();

        txtVehicleCode.Text = "";
        txtVehicleNameBan.Text = "";
        txtVehicleName.Text = "";
        txtRegNo.Text = "";
        txtCapacity.Text = "";
        txtRatePerTrip.Text = "";
        txtOwnerName.Text = "";
        txtDriverName.Text = "";
        txtLicense.Text = "";

    }



    //  Grid

    private void bindVehicle()
    {
        string sel = "SELECT * from vehicle where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "vehicle");
        grdVehicle.DataSource = ds;
        grdVehicle.DataBind();

    }


    protected void grdVehicle_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Transporter Id";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Transporter Code";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Transporter Name (Bangla)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Transporter Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Registration No.";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Capacity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Rate Per Trip (Tk)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Owner Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Driver Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "License No.";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Route";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route";
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


            grdVehicle.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdVehicle_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdVehicle.PageIndex = e.NewPageIndex;
        grdVehicle.DataBind();

        bindVehicle();
    }

    protected void grdVehicle_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnVehicleId.Value = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[0].Text);
        txtVehicleCode.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[1].Text);
        txtVehicleNameBan.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[2].Text);
        txtVehicleName.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[3].Text);
        txtRegNo.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[4].Text);
        txtCapacity.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[5].Text);
        txtRatePerTrip.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[6].Text);
        txtOwnerName.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[7].Text);
        txtDriverName.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[8].Text);
        txtLicense.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[9].Text);
        ddlRouteName.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[10].Text);
        //ddlSubRouteName.Text = HttpUtility.HtmlDecode(grdVehicle.Rows[rowIndex].Cells[11].Text);
        bindDdlSubRouteName();

        btnSave.Text = "Update";

        bindVehicle();

    }


    protected void grdVehicle_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Vehicle Info.: " +
            DataBinder.Eval(e.Row.DataItem, "vehicleName") + "')");

        }
    }


    protected void grdVehicle_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int vehicleId = (int)grdVehicle.DataKeys[e.RowIndex].Value;
        bllcreate.VEHICLEID = vehicleId;
        bllcreate.Delete();

        bindVehicle();
    }



}