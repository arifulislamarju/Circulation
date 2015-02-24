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

public partial class FORM_PopulationInformation : System.Web.UI.Page
{
    bll_PopulationInfo bllcreate = new bll_PopulationInfo();
    clsDataProvider dataProvider = new clsDataProvider();


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindStation();
            bindGrid();
        }

        clsHelper.CheckLogin();
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

    }


    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from PopulationInformation where delStatus<>1 AND stationName='" + ddlStation.SelectedItem.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.STATIONNAME = ddlStation.Text;
        bllcreate.POPULATION = txtPopulation.Text;
        bllcreate.LITERATE = txtLiterate.Text;
        bllcreate.TAKEPALO = txtProthomAloUse.Text;
        bllcreate.REGULAR =Convert.ToInt32(txtRegular.Text);
        bllcreate.FLOATING = Convert.ToInt32(txtFloating.Text);
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdnPiId.Value != "" && hdnPiId.Value != null)
        {
            bllcreate.PIID = Convert.ToInt32(hdnPiId.Value);

            bllcreate.Update();

            hdnPiId.Value = "";
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
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Population Info. Already Created, Try Another...');", true);
            }
        }

        bindGrid();

        txtPopulation.Text = "";
        txtLiterate.Text = "";
        txtProthomAloUse.Text = "";

    }



    //  Grid

    private void bindGrid()
    {
        string sel = "SELECT * from PopulationInformation where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "PopulationInformation");
        grdPopulationInfo.DataSource = ds;
        grdPopulationInfo.DataBind();

    }


    protected void grdPopulationInfo_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "PIID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Population";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Literate rate";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Subscriber of PALO";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Regular Subscriber";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Floating Subscriber";
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


            grdPopulationInfo.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdPopulationInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPopulationInfo.PageIndex = e.NewPageIndex;
        grdPopulationInfo.DataBind();

        bindGrid();
    }

    protected void grdPopulationInfo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnPiId.Value = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[0].Text);
        ddlStation.SelectedItem.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[1].Text);
        txtPopulation.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[2].Text);
        txtLiterate.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[3].Text);
        txtProthomAloUse.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[4].Text);
        txtRegular.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[5].Text);
        txtFloating.Text = HttpUtility.HtmlDecode(grdPopulationInfo.Rows[rowIndex].Cells[6].Text);

        btnSave.Text = "Update";

        bindGrid();

    }


    protected void grdPopulationInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Population Info.: " +
            DataBinder.Eval(e.Row.DataItem, "stationName") + "')");

        }
    }


    protected void grdPopulationInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int piId = (int)grdPopulationInfo.DataKeys[e.RowIndex].Value;
        bllcreate.PIID = piId;
        bllcreate.Delete();

        bindGrid();
    }


}