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

public partial class Authority : System.Web.UI.Page
{
    bll_CreateAuthority bllcreate = new bll_CreateAuthority();
    clsDataProvider dataProvider = new clsDataProvider();


    protected void Page_Load(object sender, EventArgs e)
    {
        string gmforrm = "SELECT  count(gmName) from generalManager where delStatus<>1";
        int ddlGMForRM = Convert.ToInt32(dataProvider.getResultString(gmforrm));


        if (!Page.IsPostBack)
        {
            bindGM();
            bindManager();
            bindRM();
            
            bindDdlGM();

            bindDdlGMForRM();
            if (ddlGMForRM != 0)
            {
                bindDdlManagerForRM();
            }

        }
        clsHelper.CheckLogin();

    }



    protected void ddlGMForRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlManagerForRM();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showRM();", true);
    }





    #region All DropDown Lists

    // Manager UI

    private void bindDdlGM()
    {
        string query = "SELECT  gmName from generalManager where delStatus<>1 Order By gmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "gmName");
        ddlGM.DataSource = ds;
        ddlGM.DataTextField = "gmName";
        ddlGM.DataValueField = "gmName";
        ddlGM.DataBind();

        ddlGMForRM.DataSource = ds;
        ddlGMForRM.DataTextField = "gmName";
        ddlGMForRM.DataValueField = "gmName";
        ddlGMForRM.DataBind();

        ddlGM.Items.Insert(0, "-- Select --");

    }


    // Regional Manager UI

    private void bindDdlGMForRM()
    {
        string query = "SELECT  gmName from generalManager where delStatus<>1 Order By gmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "gmName");
        ddlGMForRM.DataSource = ds;
        ddlGMForRM.DataTextField = "gmName";
        ddlGMForRM.DataValueField = "gmName";
        ddlGMForRM.DataBind();
        ddlGMForRM.Items.Insert(0, "-- Select --");

    }

    private void bindDdlManagerForRM()
    {
        string query = "SELECT  managerName from manager where delStatus<>1 AND gmName='" + ddlGMForRM.SelectedItem.Text + "' Order By managerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "managerName");
        ddlManager.DataSource = ds;
        ddlManager.DataTextField = "managerName";
        ddlManager.DataValueField = "managerName";
        ddlManager.DataBind();
        ddlManager.Items.Insert(0, "-- Select --");

    }



    #endregion



    #region All Buttons


    protected void btnSaveGM_click(object sender, EventArgs e)
    {

        string selCountrow = "SELECT COUNT(*) from generalManager where delStatus<>1 AND gmName='" + txtGM.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            bllcreate.GM = txtGM.Text;
            bllcreate.CREATEDATE = DateTime.Now;
            bllcreate.AUDITUSER = Session["UserName"].ToString();

       if (hdngmId.Value != "" && hdngmId.Value != null)
            {
                bllcreate.GMID = Convert.ToInt32(hdngmId.Value);

                bllcreate.gmUpdate();

                hdngmId.Value = "";
                btnSaveGM.Text = "Create";
                                
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.gmInsert();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('User name exists, try another name..');", true);
                }
            }

       bindDdlGM();
       bindGM();

       txtGM.Text = "";

       ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showGM();", true);
    }




    protected void btnSaveManager_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from manager where delStatus<>1 AND managerName='" + txtManager.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.GM = ddlGM.Text;
        bllcreate.MANAGER = txtManager.Text;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdnManagerId.Value != "" && hdnManagerId.Value != null)
        {
            bllcreate.MANAGERID = Convert.ToInt32(hdnManagerId.Value);

            bllcreate.managerUpdate();

            hdnManagerId.Value = "";
            btnSaveManager.Text = "Create";

        }
        else
        {
            if (rowNumber == 0)
            {
                bllcreate.managerInsert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Manager exists, try another name..');", true);
            }
        }

        //bindDdlGMForRM();
        bindDdlManagerForRM();

        bindManager();

        txtManager.Text = "";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showM();", true);

    }
    



    protected void btnSaveRM_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from regionalManager where delStatus<>1 AND rmName='" + txtRM.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            bllcreate.GM = ddlGMForRM.Text;
            bllcreate.MANAGER = ddlManager.Text;
            bllcreate.RM = txtRM.Text;
            bllcreate.CREATEDATE = DateTime.Now;
            bllcreate.AUDITUSER = Session["UserName"].ToString();

            if (hdnRmId.Value != "" && hdnRmId.Value != null)
            {
                bllcreate.RMID = Convert.ToInt32(hdnRmId.Value);

                bllcreate.rmUpdate();

                hdnRmId.Value = "";
                btnSaveRM.Text = "Create";

            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.rmInsert();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Regional Manager exists, try another name..');", true);
                }
            }

            bindRM();

            txtRM.Text = "";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showRM();", true);

    }

   

    #endregion




    #region All Gridview Event


    private void bindGM()
    {
        string selGM = "SELECT * from generalManager where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selGM, "generalManager");
        grdGM.DataSource = ds;
        grdGM.DataBind();
  
        //foreach (GridViewRow gvrItem in grdGM.Rows)
        //{
        //    string gmName = gvrItem.Cells[1].Text;
        //}
    }



    protected void grdGM_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "GMId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "General Manager";
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


            grdGM.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdGM_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdGM.PageIndex = e.NewPageIndex;
        grdGM.DataBind();
        bindGM();
    }
    protected void grdGM_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_GM(rowIndex);
    }

    private void PopulateLabelsByRowIndex_GM(int rowIndex)
    {

        hdngmId.Value = HttpUtility.HtmlDecode(grdGM.Rows[rowIndex].Cells[0].Text);
        txtGM.Text = HttpUtility.HtmlDecode(grdGM.Rows[rowIndex].Cells[1].Text);

        btnSaveGM.Text = "Update";

        bindGM();

    }
    protected void grdGM_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete GM: " +
            DataBinder.Eval(e.Row.DataItem, "gmName") + "')");

        }
    }
    protected void grdGM_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int gmId = (int)grdGM.DataKeys[e.RowIndex].Value;
        bllcreate.GMID = gmId;
        bllcreate.gmDelete();
        bindGM();
    }





    // Manager Grid View


    private void bindManager()
    {
        string selManager = "SELECT * from manager where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selManager, "manager");
        grdManager.DataSource = ds;
        grdManager.DataBind();

    }



    protected void grdManager_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "ManagerId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "General Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Manager";
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


            grdManager.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdManager_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdManager.PageIndex = e.NewPageIndex;
        grdManager.DataBind();
        bindManager();
    }
    protected void grdManager_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_Manager(rowIndex);
    }

    private void PopulateLabelsByRowIndex_Manager(int rowIndex)
    {
        
        hdnManagerId.Value = HttpUtility.HtmlDecode(grdManager.Rows[rowIndex].Cells[0].Text);
        ddlGM.Text = HttpUtility.HtmlDecode(grdManager.Rows[rowIndex].Cells[1].Text);
        txtManager.Text = HttpUtility.HtmlDecode(grdManager.Rows[rowIndex].Cells[2].Text);

        btnSaveManager.Text = "Update";

        bindManager();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showM();", true);


    }
    protected void grdManager_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Manager: " +
            DataBinder.Eval(e.Row.DataItem, "managerName") + "')");

        }
    }
    protected void grdManager_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int managerId = (int)grdManager.DataKeys[e.RowIndex].Value;
        bllcreate.MANAGERID = managerId;
        bllcreate.managerDelete();
        bindManager();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showM();", true);

    }





    // Regional Manager




    private void bindRM()
    {
        string selRM = "SELECT * from regionalManager where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selRM, "regionalManager");
        grdRM.DataSource = ds;
        grdRM.DataBind();

    }



    protected void grdRM_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "RmId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "General Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Regional Manager";
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


            grdRM.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdRM_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRM.PageIndex = e.NewPageIndex;
        grdRM.DataBind();
        bindRM();
    }
    protected void grdRM_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_RM(rowIndex);
    }

    private void PopulateLabelsByRowIndex_RM(int rowIndex)
    {
        
        hdnRmId.Value = HttpUtility.HtmlDecode(grdRM.Rows[rowIndex].Cells[0].Text);
        ddlGMForRM.Text = HttpUtility.HtmlDecode(grdRM.Rows[rowIndex].Cells[1].Text);

        bindDdlManagerForRM();
        ddlManager.Text = HttpUtility.HtmlDecode(grdRM.Rows[rowIndex].Cells[2].Text);
        txtRM.Text = HttpUtility.HtmlDecode(grdRM.Rows[rowIndex].Cells[3].Text);

        btnSaveRM.Text = "Update";

        bindRM();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showRM();", true);

    }
    protected void grdRM_RowDataBound(object sender, GridViewRowEventArgs e)
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
    protected void grdRM_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int rmId = (int)grdRM.DataKeys[e.RowIndex].Value;
        bllcreate.RMID = rmId;
        bllcreate.rmDelete();
        bindRM();

        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showRM();", true);
    }





    #endregion






}