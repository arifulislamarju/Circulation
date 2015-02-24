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

public partial class subRoute : System.Web.UI.Page
{
    bll_subRoute bllcreate = new bll_subRoute();
    clsDataProvider dataProvider = new clsDataProvider();

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindStation();
            bindDdlRouteName();
            DdlHH();
            DdlMM();

            bindSubRoute();
            bindDdlRouteName();
        }
        clsHelper.CheckLogin();     
    }


    private void bindStation()
    {
        string query = "SELECT  stationName from station where delStatus<>1  Order By stationName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStartPoint.DataSource = ds;
        ddlStartPoint.DataTextField = "stationName";
        ddlStartPoint.DataValueField = "stationName";
        ddlStartPoint.DataBind();

        ddlEndPoint.DataSource = ds;
        ddlEndPoint.DataTextField = "stationName";
        ddlEndPoint.DataValueField = "stationName";
        ddlEndPoint.DataBind();

        ddlStartPoint.Items.Insert(0, "--Select--");
        ddlEndPoint.Items.Insert(0, "--Select--");
    }

    private void DdlHH()
    {
        for (int Y = 0; Y <= 12; Y++)
        {
            ddlDepartTimeHH.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
            ddlArrivTimeHH.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
        }

    }


    private void DdlMM()
    {
        for (int i = 0; i <= 59; i++)
        {
            ListItem itemMin = new ListItem(i.ToString(), i.ToString());
            string minutes = "";
            if (i < 10)
            {
                minutes = "0" + itemMin;
                ddlDepartTimeMM.Items.Add(minutes);
                ddlArrivTimeMM.Items.Add(minutes);
            }
            else
            {
                ddlDepartTimeMM.Items.Add(itemMin);
                ddlArrivTimeMM.Items.Add(itemMin);
            }
        }

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


    protected void btnGo_click(object sender, EventArgs e)
    {
        bindSubRoute();
    }


    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from subRoute where delStatus<>1 AND subRouteCode='" + txtSubRouteCode.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        string DepartTime = ((ddlDepartTimeHH.Text).ToString() + lblDepartTime1.Text + (ddlDepartTimeMM.Text).ToString() + (ddlDepartAmPm.Text).ToString());

        string ArriveTime = ((ddlArrivTimeHH.Text).ToString() + lblArrivTime1.Text + (ddlArrivTimeMM.Text).ToString() + (ddlArrivAmPm.Text).ToString());

        bllcreate.SUBROUTECODE = txtSubRouteCode.Text;
        bllcreate.SUBROUTENAMEBAN = txtSubRouteNameBan.Text;
        bllcreate.SUBROUTENAME = txtSubRouteName.Text.Replace("'","''");
        bllcreate.ROUTENAME = ddlRouteName.Text.Replace("'", "''");
        bllcreate.PRESS = ddlPress.SelectedItem.Text.Replace("'", "''");
        bllcreate.SORTINGORDER = txtSortingOrder.Text;
        bllcreate.STARTPOINT = ddlStartPoint.SelectedItem.Text.Replace("'", "''");
        bllcreate.ENDPOINT = ddlEndPoint.SelectedItem.Text.Replace("'", "''");
        bllcreate.DEPARTTIME = DepartTime;        
        bllcreate.ARRIVTIME = ArriveTime;
        bllcreate.LOCATION = ddlAgentLocation.SelectedItem.Text;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

        if (hdnSubRouteId.Value != "" && hdnSubRouteId.Value != null)
        {
            bllcreate.SUBROUTEID = Convert.ToInt32(hdnSubRouteId.Value);

            bllcreate.Update();

            hdnSubRouteId.Value = "";
            btnSave.Text = "Create";

            DdlHH();
            DdlMM();

        }
        else
        {
            if (rowNumber == 0)
            {
                bllcreate.Insert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Route Code Already Created, Try Another Route Code...');", true);
            }
        }

        bindSubRoute();

        txtSubRouteCode.Text = "";
        txtSubRouteNameBan.Text = "";
        txtSubRouteName.Text = "";
        txtSortingOrder.Text = "";

    }



    //  Grid

    private void bindSubRoute()
    {
        string sel = "";

        if (txtSubRouteCode.Text != "" && txtSubRouteCode.Text != null)
        {
            sel = "SELECT * from subRoute where delStatus<>1 AND subRouteCode like '%" + txtSubRouteCode.Text + "%' ";
        }
        else
        {
            sel = "SELECT * from subRoute where delStatus<>1";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "subRoute");
        grdSubRoute.DataSource = ds;
        grdSubRoute.DataBind();

    }


    protected void grdSubRoute_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "SUBROUTEID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route Code";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route Name (Bangla)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Route Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Press";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sorting Order";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Start Point";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "End Point";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Departure Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Arrival Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Location";
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


            grdSubRoute.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdSubRoute_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdSubRoute.PageIndex = e.NewPageIndex;
        grdSubRoute.DataBind();

        bindSubRoute();
    }

    protected void grdSubRoute_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnSubRouteId.Value = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[0].Text);
        txtSubRouteCode.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[1].Text);
        txtSubRouteNameBan.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[2].Text);
        txtSubRouteName.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[3].Text);
        ddlRouteName.SelectedItem.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[4].Text);
        //ddlPress.SelectedItem.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[5].Text);
        txtSortingOrder.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[6].Text);
        ddlStartPoint.SelectedItem.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[7].Text);
        ddlEndPoint.SelectedItem.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[8].Text);
        string DepartTime = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[9].Text);
        string ArriveTime = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[10].Text);
        ddlAgentLocation.SelectedItem.Text = HttpUtility.HtmlDecode(grdSubRoute.Rows[rowIndex].Cells[11].Text);

        btnSave.Text = "Update";

        bindSubRoute();

    }


    protected void grdSubRoute_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Sub-Route: " +
            DataBinder.Eval(e.Row.DataItem, "subRouteName") + "')");

        }
    }


    protected void grdSubRoute_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int subRouteId = (int)grdSubRoute.DataKeys[e.RowIndex].Value;
        bllcreate.SUBROUTEID = subRouteId;
        bllcreate.Delete();

        bindSubRoute();
    }


}