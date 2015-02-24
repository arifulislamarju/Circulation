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

public partial class PageSetup : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    protected void Page_Load(object sender, EventArgs e)
    {
        bindPage();

        clsHelper.CheckLogin();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {   

        string user=Session["UserName"].ToString();

        string selCountrow = "SELECT COUNT(*) from PageSetup where delStatus<>1 AND PageName='" + txtPageName.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (hdnPageId.Value == null || hdnPageId.Value == "")
        {
            if (rowNumber == 0)
            {
                string strInsert = "INSERT INTO PageSetup VALUES('" + txtPageName.Text + "','" + DateTime.Now + "','" + user + "',0)";
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
            string strUpdate = "UPDATE PageSetup set PageName='" + txtPageName.Text + "',createDate='" + DateTime.Now + "',audUser='" + user + "' where pageId='"+hdnPageId.Value+"'";
            dataProvider.ExecuteCommand(strUpdate);

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Update Successfully..!!');", true);

            hdnPageId.Value = null;
        }

        bindPage();
        btnSave.Text = "Save";
    }

    private void bindPage()
    {
        string sel = "SELECT * from PageSetup where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "PageSetup");
        grdPageSetup.DataSource = ds;
        grdPageSetup.DataBind();

    }

    protected void grdPageSetup_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "PageId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Page Name";
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


            grdPageSetup.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdPageSetup_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPageSetup.PageIndex = e.NewPageIndex;
        grdPageSetup.DataBind();

        bindPage();
    }

    protected void grdPageSetup_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnPageId.Value = HttpUtility.HtmlDecode(grdPageSetup.Rows[rowIndex].Cells[0].Text);       
        txtPageName.Text = HttpUtility.HtmlDecode(grdPageSetup.Rows[rowIndex].Cells[1].Text);

        btnSave.Text = "Update";

        bindPage();

    }


    protected void grdPageSetup_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Reason: " +
            DataBinder.Eval(e.Row.DataItem, "PageName") + "')");

        }

        //bindPage();
    }


    protected void grdPageSetup_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int pageId = (int)grdPageSetup.DataKeys[e.RowIndex].Value;

        string strUpdate = "UPDATE PageSetup set delStatus=1 where PageId='"+pageId+"')";
        dataProvider.ExecuteCommand(strUpdate);

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Deletion Complete..!!');", true);

        bindPage();
    }
}