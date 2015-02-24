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

public partial class yearly : System.Web.UI.Page
{
    bll_YearlyTarget bllcreate = new bll_YearlyTarget();
    clsDataProvider dataProvider = new clsDataProvider();

    protected void Page_Load(object sender, EventArgs e)
    {        
        bindDdlGM();
        bindGM();
        DdlYear();

            if (!Page.IsPostBack)
            {
                // Manager

                bindDdlYearManager();
                bindDdlGMforManager();

                string selGm = "SELECT count(gmName) from generalManager where delStatus<>1";
                int rowGm = Convert.ToInt32(dataProvider.getResultString(selGm));

                string selYear = "SELECT count(yearGM) from yearlyGM where delStatus<>1";
                int rowYear = Convert.ToInt32(dataProvider.getResultString(selYear));

                if (rowGm != 0 && rowYear != 0)
                {
                    bindGridview();
                }


                // RM

                bindDdlYearRM();
                bindDdlManagerForRM();

                string selRm = "SELECT  count(yrManagerName) from yearlyManager where delStatus<>1";
                int rowRm = Convert.ToInt32(dataProvider.getResultString(selRm));

                string selYr = "SELECT  count(yearMan) from yearlyManager where delStatus<>1";
                int rowYr = Convert.ToInt32(dataProvider.getResultString(selYr));

                if (rowRm != 0 && rowYr != 0)
                {
                    bindGridviewRM();
                }
                
            }

            clsHelper.CheckLogin();
    }


    private void DdlYear()
    {
        int year = DateTime.Now.Year;

        for (int Y = year-5 ; Y <= DateTime.Now.Year + 10; Y++)
        {
            ddlYearGM.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
        }

        //ddlYearGM.SelectedValue = DateTime.Now.Year.ToString();

    } 


    #region GM
    // GM window

    private void ReadDataGM()
    {
        string sel = "select prvAchv, curntAchv from yearlyGM where delStatus <>1 AND yearGM='" + ddlYearGM.SelectedItem.Text + "' AND yrGmName='" + ddlGM.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            lblGMPrevAchv1.Text = sdr["prvAchv"].ToString();
            lblGMCurntAchv1.Text = sdr["curntAchv"].ToString();
        }
    }

    protected void ddlYearGM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlGM();
        ReadDataGM();
    }


    private void bindDdlGM()
    {
        string query = "SELECT  gmName from generalManager where delStatus<>1 Order By gmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "gmName");
        ddlGM.DataSource = ds;
        ddlGM.DataTextField = "gmName";
        ddlGM.DataValueField = "gmName";
        ddlGM.DataBind();

    }


    protected void btnSaveGM_click(object sender, EventArgs e)
    {

        string selCountrow = "SELECT COUNT(*) from yearlyGM where delStatus<>1 AND yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.GM = ddlGM.Text;       
        bllcreate.TARGETCOPY = Convert.ToInt32(txtTargetGM.Text);
        bllcreate.PRVACHIEVEMENT = Convert.ToInt32(lblGMPrevAchv1.Text);
        bllcreate.CURNTACHIEVEMENT = Convert.ToInt32(lblGMCurntAchv1.Text);
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdngmId.Value != "" && hdngmId.Value != null)
        {
            bllcreate.YRGMID = Convert.ToInt32(hdngmId.Value);

            bllcreate.yrGmUpdate();

            hdngmId.Value = "";
            btnSaveGM.Text = "Create";

        }
        else
        {
            if (rowNumber == 0)
            {
                bllcreate.yrGmInsert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Already exists, try another name..');", true);
            }
        }

    }


    private void bindGM()
    {
        string selGM = "SELECT * from yearlyGM where delStatus<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selGM, "yearlyGM");
        grdGM.DataSource = ds;
        grdGM.DataBind();
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
            HeaderCell.Text = "YRGMId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Year";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "General Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            
            HeaderCell = new TableCell();
            HeaderCell.Text = "Target Copy";
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
        ddlYearGM.Text = HttpUtility.HtmlDecode(grdGM.Rows[rowIndex].Cells[1].Text);
        ddlGM.Text = HttpUtility.HtmlDecode(grdGM.Rows[rowIndex].Cells[2].Text);
        txtTargetGM.Text = HttpUtility.HtmlDecode(grdGM.Rows[rowIndex].Cells[3].Text);

        string sel = "select prvAchv, curntAchv from yearlyGM where delStatus <>1 AND yearGM='" + ddlYearGM.SelectedItem.Text + "' AND yrGmName='"+ ddlGM.SelectedItem.Text +"'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            lblGMPrevAchv1.Text = sdr["prvAchv"].ToString();
            lblGMCurntAchv1.Text = sdr["curntAchv"].ToString();
        }

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
            DataBinder.Eval(e.Row.DataItem, "yrGmName") + "')");

        }
    }
    protected void grdGM_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int yrGmId = (int)grdGM.DataKeys[e.RowIndex].Value;
        bllcreate.YRGMID = yrGmId;
        bllcreate.yrGmDelete();

        bindGM();
    }


    #endregion



    #region Manager

    // Manager Window


    protected void ddlYearManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlGMforManager();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }

    protected void ddlGMforManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindGridview();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }


    private void ReadDataMan()
    {
        string sel = "select targetCopy from yearlyGM where delStatus <>1 AND yearGM='" + ddlYearManager.SelectedItem.Text + "' AND yrGmName='" + ddlGMforManager.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            lblManPrevAchv1.Text = sdr["targetCopy"].ToString();
        }
    }


    private void bindDdlYearManager()
    {
        string query = "SELECT  yearGM from yearlyGM where delStatus<>1 Order By yearGM ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yearGM");
        ddlYearManager.DataSource = ds;
        ddlYearManager.DataTextField = "yearGM";
        ddlYearManager.DataValueField = "yearGM";
        ddlYearManager.DataBind();
    }


    private void bindDdlGMforManager()
    {
        string query = "SELECT  gmName from generalManager where delStatus<>1 Order By gmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "gmName");
        ddlGMforManager.DataSource = ds;
        ddlGMforManager.DataTextField = "gmName";
        ddlGMforManager.DataValueField = "gmName";
        ddlGMforManager.DataBind();

    }


    private void bindGridview()
    {
        ReadDataMan();
        
        string selCountrow = "SELECT COUNT(*) from yearlyManager where delStatus<>1 AND yrGmName = '" + ddlGMforManager.SelectedItem.Text + "' and yearMan='" + ddlYearManager.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber != 0)
        {
            string selManager = "SELECT yrManId as yrGmId,yearMan as YearGM ,yrGmName,yrManagerName as managerName,targetCopy,auditUser,createDate FROM yearlyManager where delStatus<>1 AND yrGmName = '" + ddlGMforManager.SelectedItem.Text + "' and yearMan='" + ddlYearManager.SelectedItem.Text + "' ";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            ds = dataProvider.getDataSet(selManager, "yearlyManager");
            dt = ds.Tables["yearlyManager"];
            grdManager.DataSource = ds;
            grdManager.DataBind();
        
            //int totalRows = ds.Tables["yearlyManager"].Rows.Count;

            int i=0;

            foreach (DataRow dr in dt.Rows)
            {
                GridViewRow RowView = (GridViewRow)grdManager.Rows[i];
                TextBox txt = (TextBox)grdManager.Rows[i].FindControl("txtTargetCopy");
                txt.Text = dt.Rows[i][4].ToString();
                i = i + 1;
            }
        }

        else
        {
            string selManager = "SELECT * from yeralyTargetMan where delStatus<>1 AND yrGmName = '" + ddlGMforManager.SelectedItem.Text + "' and yearGM='" + ddlYearManager.SelectedItem.Text + "' ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(selManager, "yeralyTarget");
            grdManager.DataSource = ds;
            grdManager.DataBind();


            foreach (GridViewRow gridRow in grdManager.Rows)
            {

                string countManager = "SELECT COUNT(managerName) from yeralyTargetMan where delStatus<>1 AND yrGmName='" + ddlGMforManager.SelectedItem.Text + "' AND yearGM='" + ddlYearManager.SelectedItem.Text + "'  ";
                int noOfManager = Convert.ToInt32(dataProvider.getResultString(countManager));

                string target = "SELECT targetCopy from yeralyTargetMan where delStatus<>1 AND yrGmName='" + ddlGMforManager.SelectedItem.Text +"' AND yearGM='" + ddlYearManager.SelectedItem.Text + "'  ";
                int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

                if (noOfManager != 0)
                {
                    int targetManager = (intTarget / noOfManager);

                    TextBox txtTargetCopy = gridRow.Cells[4].FindControl("txtTargetCopy") as TextBox;

                    txtTargetCopy.Text = targetManager.ToString();
                }

                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No Manager Created..');", true);
                }

            }
        }

    }
 


      protected void btnSaveManager_click(object sender, EventArgs e)
      {
          foreach (GridViewRow gridRow in grdManager.Rows)
          {
              string selCountrow = "SELECT COUNT(*) from yearlyManager where delStatus<>1 AND yrManagerName='" + gridRow.Cells[3].Text + "' ";
              int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

              TextBox txtTargetCopy = gridRow.Cells[4].FindControl("txtTargetCopy") as TextBox;

              bllcreate.YRMANAGERID = Convert.ToInt32(gridRow.Cells[0].Text);
              bllcreate.YEAR = Convert.ToInt32(gridRow.Cells[1].Text);
              bllcreate.GM = gridRow.Cells[2].Text;
              bllcreate.MANAGER = gridRow.Cells[3].Text;
              bllcreate.TARGETCOPY = Convert.ToInt32(txtTargetCopy.Text);
              bllcreate.CREATEDATE = DateTime.Now;
              bllcreate.AUDITUSER = Session["UserName"].ToString();

              if (rowNumber == 0)
              {
                  bllcreate.yrManInsert();
              }

              else
              {
                  bllcreate.yrManUpdate();
              }

          }

          bindGridview();
          ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
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
            HeaderCell.Text = "YRMANAGERID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Year";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

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
            HeaderCell.Text = "Target Copy";
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


            grdManager.Controls[0].Controls.AddAt (0, HeaderGridRow);

        }
    }

    protected void grdManager_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdManager.PageIndex = e.NewPageIndex;
        grdManager.DataBind();

        bindGridview();
    }

    //protected void grdManager_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    //{
    //    int rowIndex = e.NewSelectedIndex;
    //    PopulateLabelsByRowIndex_Manager(rowIndex);
    //}

    //private void PopulateLabelsByRowIndex_Manager(int rowIndex)
    //{
    //    hdnManagerId.Value = HttpUtility.HtmlDecode(grdManager.Rows[rowIndex].Cells[0].Text);

    //    btnSaveManager.Text = "Update";

    //    bindGridview();

    //}

    protected void grdManager_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

        }
    }



    #endregion



    #region Regional Manager

    // Regional Manager Window


    protected void ddlYearRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlManagerForRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }

    
    protected void ddlManagerForRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindGridviewRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }

    private void ReadDataRM()
    {
        string sel = "select targetCopy from yearlyManager where delStatus <>1 AND yearMan='" + ddlYearRM.SelectedItem.Text + "' AND yrManagerName='" + ddlManagerForRM.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            lblRmPrevAchv1.Text = sdr["targetCopy"].ToString();
        }
    }


    private void bindDdlYearRM()
    {
        string query = "SELECT  yearMan from yearlyManager where delStatus<>1 Order By yearMan ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yearMan");
        ddlYearRM.DataSource = ds;
        ddlYearRM.DataTextField = "yearMan";
        ddlYearRM.DataValueField = "yearMan";
        ddlYearRM.DataBind();
    }

    private void bindDdlManagerForRM()
    {
        string query = "SELECT  yrManagerName from yearlyManager where delStatus<>1 Order By yrManagerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrManagerName");
        ddlManagerForRM.DataSource = ds;
        ddlManagerForRM.DataTextField = "yrManagerName";
        ddlManagerForRM.DataValueField = "yrManagerName";
        ddlManagerForRM.DataBind();

    }



    private void bindGridviewRM()
    {
        ReadDataRM();
        
        string selCountrow = "SELECT COUNT(*) from yearlyRM where delStatus<>1 AND yrManagerName = '" + ddlManagerForRM.SelectedItem.Text + "' and yearRM='" + ddlYearRM.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber != 0)
        {
            string selRM = "SELECT [yrRmId] as yrManId,[yearRM] as yearMan ,yrManagerName,[yrRmName] as rmName,targetCopy,auditUser,createDate FROM yearlyRM where delStatus<>1 AND yrManagerName = '" + ddlManagerForRM.SelectedItem.Text + "' and yearRM='" + ddlYearRM.SelectedItem.Text + "' ";
            DataSet ds = new DataSet();
            DataTable dt = new DataTable();

            ds = dataProvider.getDataSet(selRM, "yearlyRM");
            dt = ds.Tables["yearlyRM"];
            grdRM.DataSource = ds;
            grdRM.DataBind();

            //int totalRows = ds.Tables["yearlyRM"].Rows.Count;

            int i = 0;

            foreach (DataRow dr in dt.Rows)
            {
                GridViewRow RowView = (GridViewRow)grdRM.Rows[i];
                TextBox txt = (TextBox)grdRM.Rows[i].FindControl("txtTargetCopyRM");
                txt.Text = dt.Rows[i][4].ToString();
                i = i + 1;
            }

        }

        else
        {
            string selManager = "SELECT * from yearlyTargetRM where delStatus<>1 AND yrManagerName = '" + ddlManagerForRM.SelectedItem.Text + "' and yearMan='" + ddlYearRM.SelectedItem.Text + "' ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(selManager, "yearlyTargetRM");
            grdRM.DataSource = ds;
            grdRM.DataBind();


            foreach (GridViewRow gridRow in grdRM.Rows)
            {

                string countRM = "SELECT COUNT(rmName) from yearlyTargetRM where delStatus<>1 AND yrManagerName='" + gridRow.Cells[2].Text + "' AND yearMan='" + ddlYearRM.SelectedItem.Text + "'  ";
                int noOfRM = Convert.ToInt32(dataProvider.getResultString(countRM));

                string target = "SELECT targetCopy from yearlyTargetRM where delStatus<>1 AND yrManagerName='" + gridRow.Cells[2].Text + "' AND yearMan='" + ddlYearRM.SelectedItem.Text + "'  ";
                int intTarget = Convert.ToInt32(dataProvider.getResultString(target));



                if (noOfRM != 0)
                {
                    int targetManager = (intTarget / noOfRM);

                    TextBox txtTargetCopyRM = gridRow.Cells[4].FindControl("txtTargetCopyRM") as TextBox;

                    txtTargetCopyRM.Text = targetManager.ToString();
                }

                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No Regional Manager Created..');", true);
                }

            }
        }

    }
 


    protected void btnSaveRM_click(object sender, EventArgs e)
    {
        foreach (GridViewRow gridRow in grdRM.Rows)
        {
            string selCountrow = "SELECT COUNT(*) from yearlyRM where delStatus<>1 AND yrRmName='" + gridRow.Cells[3].Text + "' ";
            int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            TextBox txtTargetCopyRM = gridRow.Cells[4].FindControl("txtTargetCopyRM") as TextBox;

            bllcreate.YRRMID = Convert.ToInt32(gridRow.Cells[0].Text);
            bllcreate.YEAR = Convert.ToInt32(gridRow.Cells[1].Text);
            bllcreate.MANAGER = gridRow.Cells[2].Text;
            bllcreate.RM = gridRow.Cells[3].Text;
            bllcreate.TARGETCOPY = Convert.ToInt32(txtTargetCopyRM.Text);
            bllcreate.CREATEDATE = DateTime.Now;
            bllcreate.AUDITUSER = Session["UserName"].ToString();

            if (rowNumber == 0)
            {
                bllcreate.yrRmInsert();
            }

            else
            {
                bllcreate.yrRmUpdate();
            }

        }

        bindGridviewRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
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
            HeaderCell.Text = "YRRMID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Year";
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
            HeaderCell.Text = "Target Copy";
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

            grdRM.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdRM_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRM.PageIndex = e.NewPageIndex;
        grdRM.DataBind();

        bindGridviewRM();
    }
    

    protected void grdRM_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

        }
    }



    #endregion


}