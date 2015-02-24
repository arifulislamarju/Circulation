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

public partial class reasonOfUnsold : System.Web.UI.Page
{
    bll_ReasonOfUnsold bllcreate = new bll_ReasonOfUnsold();
    clsDataProvider dataProvider = new clsDataProvider();


    protected void Page_Load(object sender, EventArgs e)
    {
        bindReason();
        clsHelper.CheckLogin();
    }



    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from reasonOfUnsold where delStatus<>1 AND reasonDetails='" + txtReason.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.REASONTYPE = ddlReasonType.SelectedItem.Text;
        bllcreate.REASONDETAILS = txtReason.Text;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdnReasonId.Value != "" && hdnReasonId.Value != null)
        {
            bllcreate.REASONID = Convert.ToInt32(hdnReasonId.Value);

            bllcreate.Update();

            hdnReasonId.Value = "";
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
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Reason Already Created, Try Another Reason...');", true);
            }
        }

        bindReason();

        txtReason.Text = "";

    }



    //  Grid

    private void bindReason()
    {
        string sel = "SELECT * from reasonOfUnsold where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "reasonOfUnsold");
        grdReason.DataSource = ds;
        grdReason.DataBind();

    }


    protected void grdReason_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "REASONID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason";
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


            grdReason.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdReason_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdReason.PageIndex = e.NewPageIndex;
        grdReason.DataBind();

        bindReason();
    }

    protected void grdReason_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnReasonId.Value = HttpUtility.HtmlDecode(grdReason.Rows[rowIndex].Cells[0].Text);
        ddlReasonType.SelectedItem.Text = HttpUtility.HtmlDecode(grdReason.Rows[rowIndex].Cells[1].Text);
        txtReason.Text = HttpUtility.HtmlDecode(grdReason.Rows[rowIndex].Cells[2].Text);

        btnSave.Text = "Update";

        bindReason();

    }


    protected void grdReason_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Reason: " +
            DataBinder.Eval(e.Row.DataItem, "reasonDetails") + "')");

        }
    }


    protected void grdReason_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int reasonId = (int)grdReason.DataKeys[e.RowIndex].Value;
        bllcreate.REASONID = reasonId;
        bllcreate.Delete();

        bindReason();
    }




}