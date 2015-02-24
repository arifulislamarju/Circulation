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

public partial class OrderCapture : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    #region Page Load

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindVechile();
            bindsubRoute();

            bindOrderNo();
            bindCustomer();

            BindddlCategory();
        }

        clsHelper.CheckLogin();   
    }

    #endregion

    #region Data Load

    private void loadData()
    {

        string strCusNmae = "Select stationId,stationName,defaultCopy,packType,BonusCopy,ComplementaryCopy from OrederCapture where hkrID='" + txtHawkerId.Text + "' AND stationName NOT IN (Select stationName from OrderExeStation where orderDate='" + txtOrderDate.Text + "' AND customerId='" + txtHawkerId.Text + "'  AND catagory='" + ddlCategory.SelectedItem.Text + "' and regQuantity<>0)";
        //string CusName = dataProvider.getResultString(strCusNmae);

            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(strCusNmae, "OrederCapture");
            grdOrder.DataSource = ds;
            grdOrder.DataBind();

            foreach (GridViewRow gvrItem in grdOrder.Rows)
            {
                TextBox txtQuantity = gvrItem.Cells[2].FindControl("txtQuantity") as TextBox;
                TextBox txtBonus = gvrItem.Cells[3].FindControl("txtBonus") as TextBox;
                TextBox txtComplementary = gvrItem.Cells[4].FindControl("txtComplementary") as TextBox;
                DropDownList ddlPacket = gvrItem.Cells[5].FindControl("ddlPacket") as DropDownList;

                string selQuantity = "Select defaultCopy from OrederCapture where stationId='" + HttpUtility.HtmlDecode(gvrItem.Cells[0].Text) + "'";
                txtQuantity.Text = dataProvider.getResultString(selQuantity);

                string selPacket = "Select packType from OrederCapture where stationId='" + HttpUtility.HtmlDecode(gvrItem.Cells[0].Text) + "'";
                ddlPacket.SelectedItem.Text = dataProvider.getResultString(selPacket);

                ListItem selectedListItem = ddlPacket.Items.FindByText("");

                txtBonus.Text = "0";
                txtComplementary.Text = "0";
            }

            //if (txtOrderNumber.Text != "****** New ******")
            //{

            //    string selpostStatus = "SELECT postStatus from orderEntry where orderNo = '" + txtOrderNumber.Text + "' ";
            //    int postStatus = Convert.ToInt32(dataProvider.getResultString(selpostStatus));

            //    if (postStatus == 0)
            //    {
            //        btnPost.Enabled = true;
            //    }
            //    else
            //    {
            //        btnPost.Enabled = false;
            //        btnSaveOrder.Enabled = false;
            //    }
            //}
    }


    #endregion

    #region All Binds

    private void BindddlCategory()
    {
        string query = "SELECT  CatName from CATEGORY where delStatus<>1 Order By CatName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "CatName");
        ddlCategory.DataSource = ds;
        ddlCategory.DataTextField = "CatName";
        ddlCategory.DataValueField = "CatName";
        ddlCategory.DataBind();
        ddlCategory.Items.Insert(0, "-- Select --");
    }

    private void bindVechile()
    {
        string query = "SELECT  vehicleName from vehicle where delStatus<>1 Order By vehicleName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "vehicleName");
        ddlVechile.DataSource = ds;
        ddlVechile.DataTextField = "vehicleName";
        ddlVechile.DataValueField = "vehicleName";
        ddlVechile.DataBind();

        //ddlVechile.Items.Insert(0, "-- Select --");
    }

    private void bindsubRoute()
    {
        string query = "SELECT  subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");
        ddlSubRoute.DataSource = ds;
        ddlSubRoute.DataTextField = "subRouteName";
        ddlSubRoute.DataValueField = "subRouteName";
        ddlSubRoute.DataBind();

        //ddlSubRoute.Items.Insert(0, "--Select--");
    }


    #endregion

    #region Data Read

    
    private void readData()
    {
        bool flaghasDta = true;
        string stationName = "";   

        string sel = "select * from orderEntry where orderNo = '" + txtOrderNumber.Text + "'";
        SqlDataReader sdr = dataProvider.getDataReader(sel);
        while (sdr.Read())
        {
            txtOrderNumber.Text = sdr["orderNo"].ToString();
            txtOrderDate.Text = sdr["orderDate"].ToString();
            ddlVechile.SelectedItem.Text = sdr["vehicle"].ToString();
            ddlSubRoute.SelectedItem.Text = sdr["subRoute"].ToString();
            txtHawkerId.Text = sdr["customerId"].ToString();
            ddlCategory.SelectedItem.Text = sdr["catagory"].ToString();
            txtRate.Text = sdr["rate"].ToString();
            ddlSalesType.SelectedItem.Text = sdr["salesType"].ToString();
            stationName = sdr["stationName"].ToString();
            ddlEdition.SelectedItem.Text = sdr["edition"].ToString();

            //string aa = sdr["type"].ToString();

            if (ddlSalesType.SelectedItem.Text == "Cash")
            {
                rbACashSales.Visible = true;


                if (sdr["type"].ToString() == "Flowting Street")
                {
                    rbACashSales.Visible = true;
                   
                }
                else if (sdr["type"].ToString() == "Flowting Outlet")
                {
                    rbACashSales.Visible = true;
                }

                ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "salesType();", true);
            }

            else if (ddlSalesType.SelectedItem.Text == "Credit")
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "displayCredirdiv", "salesType();", true);

                if (sdr["type"].ToString() == "Line Wise")
                {

                    chkLineWise.Checked = true;
                    ScriptManager.RegisterStartupScript(this, GetType(), "displayCorporatediv", "lineWiseSales();", true);

                    //chkLineWise.Visible = true;
                }
                else if (sdr["type"].ToString() == "Corporate")
                {
                    

                    //string ss = sdr["corporate"].ToString();

                    if (sdr["corporate"].ToString() == "Post Paid")
                    {
                        //chkPostPaid.Visible = true;
                        chkPostPaid.Checked = true;
                    }
                    else if (sdr["corporate"].ToString() == "Pre-Paid")
                    {
                        //ChkPrepaid.Visible = true;
                        ChkPrepaid.Checked = true;
                    }

                    ScriptManager.RegisterStartupScript(this, GetType(), "displayCorporatediv", "lineWiseSales();", true);
                }

            }

            
            flaghasDta = false;
            break;
        }

        if (flaghasDta == false)
        {
            string seldatagrd = "select * from ShowOrder where orderNo = '" + txtOrderNumber.Text + "' ";
            string CusName = dataProvider.getResultString(seldatagrd);
            //SqlDataReader sdr1 = dataProvider.getDataReader(seldata);

            //while (sdr1.Read())
            //{
                DataSet ds = new DataSet();
                ds = dataProvider.getDataSet(seldatagrd, "ShowOrder");
                grdOrder.DataSource = ds;
                grdOrder.DataBind();

                foreach (GridViewRow gridRow in grdOrder.Rows)
                {
                    string station = HttpUtility.HtmlDecode(gridRow.Cells[1].Text).Replace("'", "''");
                    TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
                    TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
                    TextBox txtComplementary = gridRow.Cells[4].FindControl("txtComplementary") as TextBox;
                    DropDownList ddlPacket = gridRow.Cells[5].FindControl("ddlPacket") as DropDownList;

                    string seldata = "select * from ShowOrder where orderNo = '" + txtOrderNumber.Text + "' AND stationName='" + HttpUtility.HtmlDecode(station.Trim()) + "' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(seldata);
                    while (sdr1.Read())                    
                    {
                        station = sdr1["stationName"].ToString();
                        txtQuantity.Text = sdr1["quantity"].ToString();
                        txtBonus.Text = sdr1["bonusCopy"].ToString();
                        txtComplementary.Text = sdr1["complementaryCopy"].ToString();
                        ddlPacket.Text = sdr1["packetType"].ToString();
                    }
                }
            //}
        }
        if (flaghasDta == true)
        {
            txtOrderNumber.Text = "";
            txtOrderDate.Text = "";           
            txtHawkerId.Text = "";          

        }

        int postStatus = 0;

        string selpostStatus = "SELECT postStatus from orderEntry where orderNo = '" + txtOrderNumber.Text + "' ";
        SqlDataReader sdrpost = dataProvider.getDataReader(selpostStatus);
        while (sdrpost.Read())
        {
             postStatus = sdrpost["postStatus"].Equals(DBNull.Value) ? 0 : Convert.ToInt32(sdrpost["postStatus"]);
        }

        sdrpost.Close();

        if (postStatus == 0)
        {
            btnPost.Enabled = true;
        }
        else
        {
            btnPost.Enabled = false;
            btnSaveOrder.Enabled = false;

            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Posted Data...!!');", true);
        }

    }


    private void Update()
    {
        foreach (GridViewRow gridRow in grdOrder.Rows)
        {
            string station =HttpUtility.HtmlDecode( gridRow.Cells[1].Text).Replace("'","''");
            TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
            TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
            TextBox txtComplementary = gridRow.Cells[4].FindControl("txtComplementary") as TextBox;
            DropDownList ddlPacket = gridRow.Cells[5].FindControl("ddlPacket") as DropDownList;

            int orderno = Convert.ToInt32(txtOrderNumber.Text);
            string orderDate = txtOrderDate.Text;
            string subroute = ddlSubRoute.SelectedItem.Text.Replace("'", "''");
            string vehicle = ddlVechile.SelectedItem.Text.Replace("'", "''");
            DateTime createDate = DateTime.Now;
            string auditUser = Session["UserName"].ToString();

            string type = "";
            string corporate = "";

            if (ddlSalesType.SelectedItem.Text == "Cash")
            {
                string selectValue = this.rbACashSales.SelectedValue;

                string cmd = "update orderEntry set orderDate='" + orderDate + "', vehicle='" + HttpUtility.HtmlDecode(ddlVechile.SelectedItem.Text.Trim()) + "', subRoute='" + HttpUtility.HtmlDecode(ddlSubRoute.SelectedItem.Text.Trim()) + "', customerId='" + txtHawkerId.Text + "', catagory='" + ddlCategory.SelectedItem.Text + "', rate='" + txtRate.Text + "', salesType='" + ddlSalesType.SelectedItem.Text + "', type='" + selectValue + "',  quantity='" + txtQuantity.Text + "', bonusCopy='" + txtBonus.Text + "', complementaryCopy='" + txtComplementary.Text + "', packetType='" + ddlPacket.SelectedItem.Text + "', auditUser='" + auditUser + "', createDate='" + createDate + "',edition='" + ddlEdition.SelectedItem.Text + "'  where orderNo = '" + orderno + "' AND stationName='" + HttpUtility.HtmlDecode(station.Trim().Replace("'", "''")) + "' ";
                dataProvider.ExecuteCommand(cmd);
            }

            if (ddlSalesType.SelectedItem.Text == "Credit")
            {
                if (chkLineWise.Checked)
                {
                    type = chkLineWise.Text.Trim();
                }

                if (chkCorporate.Checked)
                {
                    type = chkCorporate.Text.Trim();
                    if (ChkPrepaid.Checked)
                    {
                        corporate = ChkPrepaid.Text.Trim();
                    }

                    else if (chkPostPaid.Checked)
                    {
                        corporate = chkPostPaid.Text.Trim();
                    }

                }

                string cmd = "update orderEntry set orderDate='" + orderDate + "', vehicle='" + vehicle + "', subRoute='" + subroute + "', customerId='" + txtHawkerId.Text + "', catagory='" + ddlCategory.SelectedItem.Text + "', rate='" + txtRate.Text + "', salesType='" + ddlSalesType.SelectedItem.Text + "', type='" + type + "', corporate='" + corporate + "', stationName='" + station.Replace("'", "''") + "', quantity='" + txtQuantity.Text + "', bonusCopy='" + txtBonus.Text + "', complementaryCopy='" + txtComplementary.Text + "', packetType='" + ddlPacket.SelectedItem.Text + "', auditUser='" + auditUser + "', createDate='" + createDate + "',edition='" + ddlEdition.SelectedItem.Text + "'  where orderNo = '" + orderno + "' AND stationName='" + HttpUtility.HtmlDecode(station.Trim().Replace("'", "''")) + "' ";
                dataProvider.ExecuteCommand(cmd);

            }


        }

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
    }


    #endregion

    #region ALL Buttons

    protected void btnPost_Click(object sender, EventArgs e)
    {
        string cmd = "update orderEntry set postStatus=1 where orderNo = '" + txtOrderNumber.Text + "'";
        dataProvider.ExecuteCommand(cmd);

        btnSaveOrder.Enabled = false;
        btnPost.Enabled = false;
    }

    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        
        string MinId = "SELECT  Min(orderNo) from orderEntry";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtOrderNumber.Text = intMinId.ToString();

        readData();
    }


    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        
        if (txtOrderNumber.Text == "****** New ******")
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
        }

        else
        {
            string MinId = "SELECT  Min(orderNo) from orderEntry";
            int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

            int transId = Convert.ToInt32(txtOrderNumber.Text);
            transId = transId - 1;

            if (transId >= intMinId)
            {
                txtOrderNumber.Text = transId.ToString();
                readData();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
            }
        }

    }
    
    
    protected void btnNext_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        
        if (txtOrderNumber.Text == "****** New ******")
        {
            string minOeNo = "Select min(orderNo) from orderEntry";
            int intMinId = Convert.ToInt32(dataProvider.getResultString(minOeNo));
            //int Id = 1;
            txtOrderNumber.Text = intMinId.ToString();

            readData();
        }

        else
        {
            string maxId = "SELECT  Max(orderNo) from orderEntry";
            int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

            int transId = Convert.ToInt32(txtOrderNumber.Text);
            transId = transId + 1;

            if (transId <= intMaxId)
            {
                txtOrderNumber.Text = transId.ToString();

                readData();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Forward Data...');", true);
            }
        }

    }


    protected void btnLast_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        
        string maxId = "SELECT  Max(orderNo) from orderEntry";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtOrderNumber.Text = intMaxId.ToString();

        readData();
    }


    protected void imgNew_Click(object sender, ImageClickEventArgs e)
    {        
        string countNo = " SELECT  count(orderNo) from orderEntry where orderNo = (select max(orderNo)from orderEntry)";
        int intcountNo = Convert.ToInt32(dataProvider.getResultString(countNo));
       
        int orderNo = 0;

        if (intcountNo == 0)
        {
            orderNo = 1;
        }
        else
        {
            string maxNo = "select max(orderNo)from orderEntry";
            int intMaxNo = Convert.ToInt32(dataProvider.getResultString(maxNo));
            
            if (intMaxNo != 0)
            {
                orderNo = intMaxNo + 1;
            }
        }

        txtOrderNumber.Text = orderNo.ToString();
        txtOrderDate.Text = "";
        ddlCategory.SelectedItem.Text = "--Select--";
        txtRate.Text = "";
        txtHawkerId.Text = "";
    }


    protected void btnSaveOrder_Click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from orderEntry where orderNo = '" + txtOrderNumber.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            foreach (GridViewRow gridRow in grdOrder.Rows)
            {
                string station =HttpUtility.HtmlDecode( gridRow.Cells[1].Text.Replace("'","''"));
                TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
                TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
                TextBox txtComplementary = gridRow.Cells[4].FindControl("txtComplementary") as TextBox;
                DropDownList ddlPacket = gridRow.Cells[5].FindControl("ddlPacket") as DropDownList;

                int orderno = Convert.ToInt32(txtOrderNumber.Text);
                DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);
                DateTime createDate = DateTime.Now;
                string auditUser = Session["UserName"].ToString();

                string type = "";
                string corporate = "";

                if (ddlSalesType.SelectedItem.Value.ToString() == "0")
                {
                    string selectValue = this.rbACashSales.SelectedValue;

                    string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,auditUser,createDate,edition,postStatus,syncFlag) values('" + orderno + "','" + orderDate + "','" + HttpUtility.HtmlDecode(ddlVechile.SelectedItem.Text.Trim().Replace("'", "''")) + "','" + HttpUtility.HtmlDecode(ddlSubRoute.SelectedItem.Text.Trim().Replace("'", "''")) + "','" + txtHawkerId.Text + "', '" + ddlCategory.SelectedItem.Text + "','" + txtRate.Text + "','" + ddlSalesType.SelectedItem.Text + "','" + selectValue + "','" + corporate + "','" + HttpUtility.HtmlDecode(station.Trim().Replace("'", "''")) + "','" + txtQuantity.Text + "','" + txtBonus.Text + "','" + txtComplementary.Text + "','" + ddlPacket.SelectedItem.Text + "', '" + auditUser + "', '" + createDate + "','" + ddlEdition.SelectedItem.Text + "',0,0)";

                    SqlDataAdapter da = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                    //txtOrderDate.Text = "";

                }

                if (ddlSalesType.SelectedItem.Value.ToString() == "1")
                {
                    if (chkLineWise.Checked)
                    {
                        type = chkLineWise.Text.Trim();
                    }

                    if (chkCorporate.Checked)
                    {
                        type = chkCorporate.Text.Trim();
                        if (ChkPrepaid.Checked)
                        {
                            corporate = ChkPrepaid.Text.Trim();
                        }

                        else if (chkPostPaid.Checked)
                        {
                            corporate = chkPostPaid.Text.Trim();
                        }

                    }

                    string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,auditUser,createDate,edition,postStatus,syncFlag) values('" + orderno + "','" + orderDate + "','" + HttpUtility.HtmlDecode(ddlVechile.SelectedItem.Text.Trim().Replace("'", "''")) + "','" + HttpUtility.HtmlDecode(ddlSubRoute.SelectedItem.Text.Trim().Replace("'", "''")) + "','" + txtHawkerId.Text + "', '" + ddlCategory.SelectedItem.Text + "','" + txtRate.Text + "','" + ddlSalesType.SelectedItem.Text + "','" + type + "','" + corporate + "','" + HttpUtility.HtmlDecode(station.Trim().Replace("'", "''")) + "','" + txtQuantity.Text + "','" + txtBonus.Text + "','" + txtComplementary.Text + "','" + ddlPacket.SelectedItem.Text + "', '" + auditUser + "', '" + createDate + "','" + ddlEdition.SelectedItem.Text + "',0,0)";

                    SqlDataAdapter da = new SqlDataAdapter();
                    DataSet ds = new DataSet();
                    ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                }


            }
        }

        else
        {
            Update();
            btnSaveOrder.Text = "Update";
        }

        BindddlCategory();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
    }


    #endregion



    
    protected void txtHawkerId_TextChanged(object sender, EventArgs e)
    {
        loadData();
    }

    protected void ddlCategory_TextChanged(object sender, EventArgs e)
    {
        //DateTime issueDate = Convert.ToDateTime(txtOrderDate.Text);
        if (txtOrderDate.Text == null || txtOrderDate.Text == "" || txtOrderDate.Text.Length == 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Please Fill Order Date First...!!');", true);
        }
        
        else
        {
            string dayName = Convert.ToDateTime(txtOrderDate.Text).DayOfWeek.ToString();


            string extDayname = dayName.Substring(0, dayName.LastIndexOf("day"));
            string day = extDayname.Substring(0, 3).ToUpper();

            string strRate = "select count(rate) from weeklyRateSetup where day='" + day + "' and category='" + ddlCategory.SelectedItem.Text + "'";
            int intRate = Convert.ToInt32(dataProvider.getResultString(strRate));

            if (intRate != 0)
            {
                string selRate = "select rate from weeklyRateSetup where day='" + day + "' and category='" + ddlCategory.SelectedItem.Text + "'";
                txtRate.Text = dataProvider.getResultString(selRate);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No Rate SetUp Exists..!!');", true);
            }
        }

        
    }


    #region Grid View

    protected void grdOrder_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow =
            new GridViewRow(0, 0, DataControlRowType.Header,
            DataControlRowState.Insert);

            HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#DBDACE");
            HeaderGridRow.ForeColor = System.Drawing.Color.Black;

            TableCell HeaderCell = new TableCell();

            HeaderCell = new TableCell();
            HeaderCell.Text = "ID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Bonus Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Complementary Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Packet Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

           


            grdOrder.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }
    protected void grdOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;
        }
    }


    #endregion


    #region Order No. Finder
    
    protected void txtFilterOrder_TextChanged(object sender, EventArgs e)
    {
        bindOrderNo(); 
    }

    protected void txtFilterOrderDate_TextChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }

    protected void imgOrderFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindOrderNo();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }

    private void bindOrderNo()
    {
        string selUserList = "";

        if (txtFilterOrder.Text != "" && txtFilterOrder.Text != null)
        {
            if (ddlOrderNo.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Contains")
            {
                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute from orderFinder where delStatus<>1 and hkrNameEng like '%" + txtFilterOrder.Text + "%' AND orderDate = '" + txtFilterOrderDate.Text + "' ";
               
                //string selagentID = "SELECT hkrID from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilterOrder.Text + "%'";
                //SqlDataReader sdrOrderNo = dataProvider.getDataReader(selagentID);
                //selUserList = "SELECT  * from orderEntry where customerId =";
                //while (sdrOrderNo.Read())
                //{
                //    agentId = sdrOrderNo["hkrID"].ToString();

                //    if (i == 0)
                //    {
                //        selUserList = selUserList + agentId;
                //        i = 1;
                //    }
                //    else
                //    {
                //        selUserList = selUserList + " OR customerId=" + agentId + "";
                //    }
                //}
                //sdrOrderNo.Close();
            }

            else if (ddlOrderNo.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {
                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute from orderFinder where delStatus<>1 and hkrNameEng like '" + txtFilterOrder.Text + "%' AND orderDate = '" + txtFilterOrderDate.Text + "' ";
            }

            if (ddlOrderNo.SelectedItem.Text == "Order Id")
            {

                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute from orderFinder where orderNo ='" + txtFilterOrder.Text + "'";
            }

            else if (ddlOrderNo.SelectedItem.Text == "Order Date")
            {
                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute from orderFinder where orderDate ='" + txtFilterOrder.Text + "'";
            }

             ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
        }

        else
        {

            selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute from orderFinder ";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "orderFinder");
        grdOrderNo.DataSource = ds;
        grdOrderNo.DataBind();
    }

    #endregion

    #region Order No. Finder Gridview Event

    protected void grdOrderNo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOrderNo.PageIndex = e.NewPageIndex;
        grdOrderNo.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }



    protected void grdOrderNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);       
        //txtFilterOrder.Text = "";
        
        string selectedID = grdOrderNo.SelectedRow.Cells[1].Text;
        //lblCustomerID.Text = selectedID;
        txtOrderNumber.Text = selectedID;
        btnSaveOrder.Text = "Update";
        readData();

        //bindOrderNo();
        
        
    }


    protected void grdOrderNo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#C3C5E5'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdOrderNo, "Select$" + e.Row.RowIndex);


        }
    }



    #endregion


    #region Finder Agent

    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
        bindCustomer();
    }

    protected void imgCustomerFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindCustomer();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
    }

    private void bindCustomer()
    {
        string selUserList = "";

        if (txtFilter.Text != "" && txtFilter.Text != null)
        {

            if (ddlCustomer.SelectedItem.Text == "Customer Name" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Customer Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            }


            else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilter.Text + "'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilter.Text + "'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
        }

        else
        {

            selUserList = "SELECT * from hawkerInformation";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "hawkerInformation");
        grdCustomer.DataSource = ds;
        grdCustomer.DataBind();

    }

    #endregion

    #region Finder Gridview Event

    protected void grdCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomer.PageIndex = e.NewPageIndex;
        grdCustomer.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
    }

    

    protected void grdCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
        string selectedID = grdCustomer.SelectedRow.Cells[1].Text;
        //lblCustomerID.Text = selectedID;
        txtHawkerId.Text = selectedID;
        loadData();
    }


    protected void grdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#C3C5E5'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdCustomer, "Select$" + e.Row.RowIndex);

            
        }
    }



    #endregion

    
}