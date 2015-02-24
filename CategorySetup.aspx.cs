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

public partial class CategorySetup : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    protected void Page_Load(object sender, EventArgs e)
    {

        bindCategory();
        clsHelper.CheckLogin();
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {

        string user = Session["UserName"].ToString();

        string selCountrow = "SELECT COUNT(*) from Category where delStatus<>1 AND CATNAME='" + txtCatName.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (hdnCatId.Value == null || hdnCatId.Value == "")
        {
            if (rowNumber == 0)
            {
                string strInsert = "INSERT INTO Category VALUES('" + txtCatName.Text + "','" + DateTime.Now + "','" + user + "',0)";
                dataProvider.ExecuteCommand(strInsert);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Save Successfully..!!');", true);
            }

            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data exists..!!');", true);
            }

        }
        else
        {
            string strUpdate = "UPDATE Category set CatName='" + txtCatName.Text + "',createDate='" + DateTime.Now + "',audUser='" + user + "' where CatId='" + hdnCatId.Value + "'";
            dataProvider.ExecuteCommand(strUpdate);

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Update Successfully..!!');", true);

            hdnCatId.Value = null;
        }

        bindCategory();
        btnSave.Text = "Save";
    }

    private void bindCategory()
    {
        string sel = "SELECT * from Category where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "Category");
        grdCatSetup.DataSource = ds;
        grdCatSetup.DataBind();

    }

    protected void grdCatSetup_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "CatId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Category Name";
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


            grdCatSetup.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdCatSetup_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCatSetup.PageIndex = e.NewPageIndex;
        grdCatSetup.DataBind();

        bindCategory();
    }

    protected void grdCatSetup_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnCatId.Value = HttpUtility.HtmlDecode(grdCatSetup.Rows[rowIndex].Cells[0].Text);
        txtCatName.Text = HttpUtility.HtmlDecode(grdCatSetup.Rows[rowIndex].Cells[1].Text);

        btnSave.Text = "Update";

        bindCategory();

    }


    protected void grdCatSetup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Reason: " +
            DataBinder.Eval(e.Row.DataItem, "CatName") + "')");

        }

        //bindCategory();
    }


    protected void grdCatSetup_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int pageId = (int)grdCatSetup.DataKeys[e.RowIndex].Value;

        string strUpdate = "UPDATE CATEGORY set delStatus=1 where CATID='" + pageId + "'";
        dataProvider.ExecuteCommand(strUpdate);

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Deletion Complete..!!');", true);

        bindCategory();
    }
}