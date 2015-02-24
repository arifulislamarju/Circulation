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

public partial class route : System.Web.UI.Page
{
    bll_route bllcreate = new bll_route();
    clsDataProvider dataProvider = new clsDataProvider();

    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindStation();
            DdlHH();
            DdlMM();

            bindRoute();
            //bindRouteFndr();
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


    //private void DdlArriveHH()
    //{
    //    for (int Y = 0; Y <= 12; Y++)
    //    {
    //        ddlArrivTimeHH.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
    //    }

    //}


    //private void DdlArriveMM()
    //{
    //    for (int i = 0; i <= 59; i++)
    //    {
    //        ListItem itemMin = new ListItem(i.ToString(), i.ToString());
    //        string minutes = "";
    //        if (i < 10)
    //        {
    //            minutes = "0" + itemMin;
    //            ddlArrivTimeMM.Items.Add(minutes);
    //        }
    //        else
    //        {
    //            ddlArrivTimeMM.Items.Add(itemMin);
    //        }
    //    }

    //}


    protected void btnGo_click(object sender, EventArgs e)
    {
        bindRoute();
    }


    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from route where delStatus<>1 AND routeCode='" + txtRouteCode.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        string DepartTime = ((ddlDepartTimeHH.Text).ToString() + lblDepartTime1.Text + (ddlDepartTimeMM.Text).ToString() + (ddlDepartAmPm.Text).ToString());

        string ArriveTime = ((ddlArrivTimeHH.Text).ToString() + lblArrivTime1.Text + (ddlArrivTimeMM.Text).ToString() + (ddlArrivAmPm.Text).ToString());

        bllcreate.ROUTECODE = txtRouteCode.Text;
        bllcreate.ROUTENAMEBAN = txtRouteNameBan.Text;
        bllcreate.ROUTENAME = txtRouteName.Text;
        bllcreate.SORTINGORDER = txtSortingOrder.Text;
        bllcreate.STARTPOINT = ddlStartPoint.SelectedItem.Text;
        bllcreate.ENDPOINT = ddlEndPoint.SelectedItem.Text;
        bllcreate.DEPARTTIME = DepartTime;     
        bllcreate.ARRIVTIME = ArriveTime;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();
        bllcreate.DISTANCE =Convert.ToInt32(txtDistance.Text);

        if (hdnRouteId.Value != "" && hdnRouteId.Value != null)
        {
            bllcreate.ROUTEID = Convert.ToInt32(hdnRouteId.Value);

            bllcreate.Update();

            hdnRouteId.Value = "";
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

        bindRoute();

        txtRouteCode.Text = "";
        txtRouteNameBan.Text = "";
        txtRouteName.Text = "";
        txtSortingOrder.Text = "";

    }



    //  Grid

    private void bindRoute()
    {
        string sel = "";

        if (txtRouteCode.Text != "" && txtRouteCode.Text != null)
        {
            sel = "SELECT * from route where delStatus<>1 AND routeCode like '%" + txtRouteCode.Text + "%' ";
        }
        else
        {
            sel = "SELECT * from route where delStatus<>1";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "route");
        grdRoute.DataSource = ds;
        grdRoute.DataBind();

    }


    protected void grdRoute_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Route ID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Route Code";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Route Name (Bangla)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell); 
           
            HeaderCell = new TableCell();
            HeaderCell.Text = "Route Name";
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
            HeaderCell.Text = "Distance";
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


            grdRoute.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdRoute_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRoute.PageIndex = e.NewPageIndex;
        grdRoute.DataBind();

        bindRoute();
    }

    protected void grdRoute_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnRouteId.Value = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[0].Text);
        txtRouteCode.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[1].Text);
        txtRouteNameBan.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[2].Text);
        txtRouteName.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[3].Text);
        txtSortingOrder.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[4].Text);
        ddlStartPoint.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[5].Text);
        ddlEndPoint.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[6].Text);
        txtDistance.Text = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[7].Text);
        string DepartTime = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[8].Text);        
        string ArriveTime = HttpUtility.HtmlDecode(grdRoute.Rows[rowIndex].Cells[9].Text);

        btnSave.Text = "Update";

        bindRoute();

    }


    protected void grdRoute_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Route: " +
            DataBinder.Eval(e.Row.DataItem, "routeName") + "')");

        }
    }


    protected void grdRoute_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int routeId = (int)grdRoute.DataKeys[e.RowIndex].Value;
        bllcreate.ROUTEID = routeId;
        bllcreate.Delete();

        bindRoute();
    }


    #region Finder

    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
        bindRouteFndr();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
         
    }
    private void bindRouteFndr()
    {
        string selUserList = "";

        if (txtFilter.Text != "" && txtFilter.Text != null)
        {

            if (ddlCustomer.SelectedItem.Text == "Route Name" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from route where delStatus<>1 and routeName like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Route Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from route where delStatus<>1 and routeName like '" + txtFilter.Text + "%'";
            }


            else if (ddlCustomer.SelectedItem.Text == "Route ID" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from route where delStatus<>1 and routeId like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Route ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from route where delStatus<>1 and routeId like '" + txtFilter.Text + "%'";
            }
        }

        else
        {

            selUserList = "SELECT * from route";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "route");
        grdRouteFndr.DataSource = ds;
        grdRouteFndr.DataBind();

    }

    #endregion

    #region Finder Gridview Event

    protected void grdRouteFndr_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdRouteFndr.PageIndex = e.NewPageIndex;
        grdRouteFndr.DataBind();
    }



    protected void grdRouteFndr_SelectedIndexChanged(object sender, EventArgs e)
    {
        hdnRouteId.Value = grdRouteFndr.SelectedRow.Cells[1].Text;
        txtRouteCode.Text = grdRouteFndr.SelectedRow.Cells[2].Text;
        txtRouteNameBan.Text = grdRouteFndr.SelectedRow.Cells[3].Text;
        txtRouteName.Text = grdRouteFndr.SelectedRow.Cells[4].Text;
        ddlStartPoint.SelectedItem.Text = grdRouteFndr.SelectedRow.Cells[5].Text;
        ddlEndPoint.SelectedItem.Text = grdRouteFndr.SelectedRow.Cells[6].Text;
        txtDistance.Text = grdRouteFndr.SelectedRow.Cells[12].Text;
        btnSave.Text = "Update";
        //txtHawkerId.Text = selectedID;
        //loadData();
    }


    protected void grdRouteFndr_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#91ff87'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdRouteFndr, "Select$" + e.Row.RowIndex);


        }
    }



    #endregion
}