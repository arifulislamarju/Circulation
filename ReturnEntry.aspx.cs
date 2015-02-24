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

public partial class ReturnEntry : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();    
    

    #region Page Load

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            bindOrderNo();
            bindReturn();
            Session["finder"] = "";
        }

       
        for (int i = 0; i < grdOrder.Rows.Count - 1; i++)
        {
            TextBox curTexbox = grdOrder.Rows[i].Cells[4].FindControl("txtReturnCopy") as TextBox;
            TextBox nexTextbox = grdOrder.Rows[i + 1].Cells[4].FindControl("txtReturnCopy") as TextBox;
            curTexbox.Attributes.Add("onkeypress", "return clickEnter('" + nexTextbox.ClientID + "', event)");
        }
                

        clsHelper.CheckLogin();
    }       
    #endregion


    #region Data Load

    private void loadData()
    {
        string strCusNmae = "Select stationId,stationName,(daywiseDefQuanttity+daywiseChngQuantity+smsQuantity+quantity) as quantity,bonusCopy,additionalReturn from ReturnCapture where orderNo='" + txtOrderNo.Text + "' and stationName NOT IN (Select stationName from returnEntry where orderNo='" + txtOrderNo.Text + "') Order by sortingOrder asc";
        //string CusName = dataProvider.getResultString(strCusNmae);

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "ReturnEntry");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow gvrItem in grdOrder.Rows)
        {
            //TextBox txtQuantity = gvrItem.Cells[2].FindControl("txtQuantity") as TextBox;
            //TextBox txtBonus = gvrItem.Cells[3].FindControl("txtBonus") as TextBox;
            TextBox txtAdditionalReturn = gvrItem.Cells[4].FindControl("txtAdditionalReturn") as TextBox;
            TextBox txtReturnCopy = gvrItem.Cells[5].FindControl("txtReturnCopy") as TextBox;
            DropDownList ddlReason = gvrItem.Cells[6].FindControl("ddlReason") as DropDownList;

            string query = "SELECT  reasonDetails from reasonOfUnsold where delStatus<>1 Order By reasonDetails ASC ";
            DataSet ds1 = new DataSet();
            ds1 = dataProvider.getDataSet(query, "reasonDetails");
            ddlReason.DataSource = ds1;
            ddlReason.DataTextField = "reasonDetails";
            ddlReason.DataValueField = "reasonDetails";
            ddlReason.DataBind();

            ddlReason.Items.Insert(0, new ListItem("Normal Return", "0"));

            //string selQuantity = "Select quantity,bonusCopy from ReturnCapture where stationName='" + gvrItem.Cells[1].Text + "' AND orderNo='" + txtOrderNo.Text + "'";
            //gvrItem.Cells[2].Text = dataProvider.getResultString(selQuantity);

            //gvrItem.Cells[3].Text = "0";
            txtAdditionalReturn.Text = "0";
            txtReturnCopy.Text = "0";
        }

        
        //if (postStatus == 0)
        //{
        //    btnPost.Enabled = true;
        //}
        //else
        //{
        //    btnPost.Enabled = false;
        //    btnSaveOrder.Enabled = false;
        //}
    }


    #endregion

    #region All Binds



    #endregion

    #region Data Read


    private void readData()
    {
        bool flaghasDta = true;

        string sel = "select * from returnEntry where returnNo = '" + txtReturnNumber.Text + "'";
        SqlDataReader sdr = dataProvider.getDataReader(sel);
        while (sdr.Read())
        {
            txtReturnNumber.Text = sdr["returnNo"].ToString();

            DateTime returnDate =Convert.ToDateTime(sdr["returnDate"].ToString());
            txtReturnDate.Text = returnDate.ToString("dd-MMM-yyyy");
            txtOrderNo.Text = sdr["orderNo"].ToString();

            flaghasDta = false;
            break;
        }

        if (flaghasDta == false)
        {
            string seldatagrd = "select * from showReturn where returnNo = '" + txtReturnNumber.Text + "' ";
            string CusName = dataProvider.getResultString(seldatagrd);

            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(seldatagrd, "showReturn");
            grdOrder.DataSource = ds;
            grdOrder.DataBind();

            foreach (GridViewRow gridRow in grdOrder.Rows)
            {
                string station = gridRow.Cells[1].Text;
                //TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
                //TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
                TextBox txtAdditionalReturn = gridRow.Cells[4].FindControl("txtAdditionalReturn") as TextBox;
                TextBox txtReturnCopy = gridRow.Cells[5].FindControl("txtReturnCopy") as TextBox;
                DropDownList ddlReason = gridRow.Cells[6].FindControl("ddlReason") as DropDownList;


                string query = "SELECT  reasonDetails from reasonOfUnsold where delStatus<>1 Order By reasonDetails ASC ";
                DataSet ds1 = new DataSet();
                ds1 = dataProvider.getDataSet(query, "reasonDetails");
                ddlReason.DataSource = ds1;
                ddlReason.DataTextField = "reasonDetails";
                ddlReason.DataValueField = "reasonDetails";
                ddlReason.DataBind();

                string seldata = "select * from showReturn where returnNo = '" + txtReturnNumber.Text + "' AND stationName='" + station + "' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(seldata);
                while (sdr1.Read())
                {
                    station = sdr1["stationName"].ToString();
                    //gvrItem.Cells[3].Text = sdr1["quantity"].ToString();
                    //gvrItem.Cells[3].Text = sdr1["bonusCopy"].ToString();
                    txtAdditionalReturn.Text = sdr1["additionalReturn"].ToString();
                    txtReturnCopy.Text = sdr1["returnCopy"].ToString();
                    ddlReason.SelectedItem.Text = sdr1["reason"].ToString();

                    //string r = sdr1["reason"].ToString();

                    //ddlReason.Text = r;
                }

            }
            
        }

        if (flaghasDta == true)
        {
            txtReturnNumber.Text = "";
            txtReturnDate.Text = "";
            txtOrderNo.Text = "";
        }

        //int postStatus = 0;

        //string selpostStatus = "SELECT postStatus from orderEntry where orderNo = '" + txtReturnNumber.Text + "' ";
        //SqlDataReader sdrpost = dataProvider.getDataReader(selpostStatus);
        //while (sdrpost.Read())
        //{
        //    postStatus = sdrpost["postStatus"].Equals(DBNull.Value) ? 0 : Convert.ToInt32(sdrpost["postStatus"]);
        //}

        //sdrpost.Close();

        //if (postStatus == 0)
        //{
        //    btnPost.Enabled = true;
        //}
        //else
        //{
        //    btnPost.Enabled = false;
        //    btnSaveOrder.Enabled = false;

        //    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Posted Data...!!');", true);
        //}

        string custName = "SELECT hkrNameEng from ReturnCapture where orderNo = '" + txtOrderNo.Text + "' ";
        lblCusNameDisplay.Text = dataProvider.getResultString(custName).ToString();


    }


    private void Update()
    {
        foreach (GridViewRow gridRow in grdOrder.Rows)
        {
            string station = gridRow.Cells[1].Text;
            //TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
            //TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
            TextBox txtAdditionalReturn = gridRow.Cells[4].FindControl("txtAdditionalReturn") as TextBox;
            TextBox txtReturnCopy = gridRow.Cells[5].FindControl("txtReturnCopy") as TextBox;
            DropDownList ddlReason = gridRow.Cells[6].FindControl("ddlReason") as DropDownList;

            int returnNo = Convert.ToInt32(txtReturnNumber.Text);
            DateTime returnDate = Convert.ToDateTime(txtReturnDate.Text);
            DateTime createDate = DateTime.Now;
            string auditUser = Session["UserName"].ToString();

            string cmd = "update returnEntry set returnDate='" + returnDate + "', stationName='" + station + "', quantity='" + gridRow.Cells[2].Text + "', bonusCopy='" + gridRow.Cells[3].Text + "', additionalReturn='" + txtAdditionalReturn.Text + "', returnCopy='" + txtReturnCopy.Text + "' , reason='" + ddlReason.SelectedItem.Text + "', createDate='" + createDate + "', auditUser='" + auditUser + "'   where returnNo = '" + returnNo + "' AND stationName='" + station + "' ";
            dataProvider.ExecuteCommand(cmd);

        }

    }


    #endregion

    #region ALL Buttons

    protected void btnPost_Click(object sender, EventArgs e)
    {
        string cmd = "update returnEntry set postStatus=1 where returnNo = '" + txtReturnNumber.Text + "'";
        dataProvider.ExecuteCommand(cmd);

        btnSaveOrder.Enabled = false;
        btnPost.Enabled = false;
    }

    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        //imgCustomerFinder.Visible = false;

        string MinId = "SELECT  Min(returnNo) from returnEntry";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtReturnNumber.Text = intMinId.ToString();

        readData();
    }


    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveOrder.Text = "Update";
        //imgCustomerFinder.Visible = false;

        if (txtReturnNumber.Text == "****** New ******")
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
        }

        else
        {
            string MinId = "SELECT  Min(returnNo) from returnEntry";
            int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

            int transId = Convert.ToInt32(txtReturnNumber.Text);
            transId = transId - 1;

            if (transId >= intMinId)
            {
                txtReturnNumber.Text = transId.ToString();
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
        //imgCustomerFinder.Visible = false;

        if (txtReturnNumber.Text == "****** New ******")
        {
            string minOeNo = "Select min(returnNo) from returnEntry";
            int intMinId = Convert.ToInt32(dataProvider.getResultString(minOeNo));
            //int Id = 1;
            txtReturnNumber.Text = intMinId.ToString();

            readData();
        }

        else
        {
            string maxId = "SELECT  Max(returnNo) from returnEntry";
            int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

            int transId = Convert.ToInt32(txtReturnNumber.Text);
            transId = transId + 1;

            if (transId <= intMaxId)
            {
                txtReturnNumber.Text = transId.ToString();

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
        //imgCustomerFinder.Visible = false;

        string maxId = "SELECT  Max(returnNo) from returnEntry";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtReturnNumber.Text = intMaxId.ToString();

        readData();
    }


    //protected void imgNew_Click(object sender, ImageClickEventArgs e)
    //{
    //    imgCustomerFinder.Visible = true;
        
    //    string countNo = " SELECT  count(returnNo) from returnEntry where orderNo = (select max(returnNo)from returnEntry)";
    //    int intcountNo = Convert.ToInt32(dataProvider.getResultString(countNo));

    //    int orderNo = 0;

    //    if (intcountNo == 0)
    //    {
    //        orderNo = 1;
    //    }
    //    else
    //    {
    //        string maxNo = "select max(returnNo)from returnEntry";
    //        int intMaxNo = Convert.ToInt32(dataProvider.getResultString(maxNo));

    //        if (intMaxNo != 0)
    //        {
    //            orderNo = intMaxNo + 1;
    //        }
    //    }

    //    txtReturnNumber.Text = orderNo.ToString();
    //    txtReturnDate.Text = "";
    //    txtOrderNo.Text = "";
    //}


    protected void btnSaveOrder_Click(object sender, EventArgs e)
    {
        int returnNumber;
        string selCountrow = "SELECT COUNT(*) from returnEntry where orderNo = '" + txtOrderNo.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        string selOrderCountrow = "SELECT COUNT(*) from OrderEntry where orderNo = '" + txtOrderNo.Text + "' ";
        int OrderrowNumber = Convert.ToInt32(dataProvider.getResultString(selOrderCountrow));

        string selIsNull = "SELECT COUNT(*) from returnEntry ";
        int rowNull = Convert.ToInt32(dataProvider.getResultString(selIsNull));

        if (rowNull == 0)
        {
            returnNumber = 1;
        }
        else
        {
            string selReNo = "SELECT MAX(returnNo) from returnEntry";
            returnNumber = Convert.ToInt32(dataProvider.getResultString(selReNo));

            returnNumber = returnNumber + 1;
        }

        //if (txtReturnNumber.Text == "****** New ******")
        if (rowNumber != OrderrowNumber)
        {

            foreach (GridViewRow gridRow in grdOrder.Rows)
            {
                string station = gridRow.Cells[1].Text;
                //TextBox txtQuantity = gridRow.Cells[2].FindControl("txtQuantity") as TextBox;
                //TextBox txtBonus = gridRow.Cells[3].FindControl("txtBonus") as TextBox;
                TextBox txtAdditionalReturn = gridRow.Cells[4].FindControl("txtAdditionalReturn") as TextBox;
                TextBox txtReturnCopy = gridRow.Cells[5].FindControl("txtReturnCopy") as TextBox;
                DropDownList ddlReason = gridRow.Cells[6].FindControl("ddlReason") as DropDownList;

                //string returnno = txtReturnNumber.Text;
                DateTime returnDate = Convert.ToDateTime(txtReturnDate.Text);
                int quantity = Convert.ToInt32(gridRow.Cells[2].Text);
                int bonus = Convert.ToInt32(gridRow.Cells[3].Text);
                int additional = Convert.ToInt32(txtAdditionalReturn.Text);
                int returnCopy = Convert.ToInt32(txtReturnCopy.Text);
                DateTime createDate = DateTime.Now;
                string auditUser = Session["UserName"].ToString();

                string insertQuery = "insert into returnEntry values('" + returnNumber + "','" + returnDate + "','" + txtOrderNo.Text + "','" + station + "','" + quantity + "','" + bonus + "','" + additional + "','" + returnCopy + "','" + ddlReason.SelectedItem.Text + "', '" + createDate + "', '" + auditUser + "')";

                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                ds = dataProvider.getDataSet(insertQuery, "returnEntry");


                string selMaxReNo = "SELECT returnNo from returnEntry where orderNo = '" + txtOrderNo.Text + "' ";
                txtReturnNumber.Text = dataProvider.getResultString(selMaxReNo);

            }
        }

        else
        {
            Update();
            //btnSaveOrder.Text = "Update";
        }

    }


    #endregion




    protected void txtOrderNo_TextChanged(object sender, EventArgs e)
    {
        loadData();
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
            HeaderCell.Text = "Regular Return";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Additional Return";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason Of Return";
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

    protected void imgCustomerFinder_Click(object sender, ImageClickEventArgs e)
    {
        
        bindOrderNo();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
        Session["finder"] = "asd";
            
    }


    private void bindOrderNo()
    {
        string selUserList = "";

        if (txtFilterOrder.Text != "" && txtFilterOrder.Text != null)
        {

            if (ddlCustomer1.SelectedItem.Text == "Customer Name" && ddlSelectType1.SelectedItem.Text == "Contains")
            {
                if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  hkrNameEng like '%" + txtFilterOrder.Text + "%' AND orderDate='" + txtFilterOrderDate.Text + "'";
                }
                else
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  hkrNameEng like '%" + txtFilterOrder.Text + "%'";
                }
                                   
            }

            else if (ddlCustomer1.SelectedItem.Text == "Customer Name" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {
                if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  hkrNameEng like '" + txtFilterOrder.Text + "%' AND orderDate='" + txtFilterOrderDate.Text + "'";
                }
                else
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  hkrNameEng like '" + txtFilterOrder.Text + "%'";
                }

            }


            else if (ddlCustomer1.SelectedItem.Text == "Customer ID" && ddlSelectType1.SelectedItem.Text == "Contains")
            {
                if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  customerid like '%" + txtFilterOrder.Text + "%' AND orderDate='" + txtFilterOrderDate.Text + "'";
                }
                else
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  customerid like '%" + txtFilterOrder.Text + "%'";
                }

            }

            else if (ddlCustomer1.SelectedItem.Text == "Customer ID" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {
                if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  customerid like '" + txtFilterOrder.Text + "%' AND orderDate='" + txtFilterOrderDate.Text + "'";
                }
                else
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  customerid like '" + txtFilterOrder.Text + "%'";
                }
                
            }

            else if (ddlCustomer1.SelectedItem.Text == "Order No" )
            {
                if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  orderNo='" + txtFilterOrder.Text + "' AND orderDate='" + txtFilterOrderDate.Text + "'";
                }
                else
                {
                    selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where  orderNo='" + txtFilterOrder.Text + "'";
                }

            }


            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
        }

        else
        {
            if (txtFilterOrderDate.Text != "" && txtFilterOrderDate.Text != null)
            {
                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn where orderDate='" + txtFilterOrderDate.Text + "'";
            }

            else
            {
                selUserList = "SELECT distinct orderNo,orderDate,customerId,hkrNameEng,subRoute  from OrderReturn ";
            }

            
        }
        selUserList = selUserList + "Order by customerId ASC";

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "OrderReturn");
        grdOrderNo.DataSource = ds;
        grdOrderNo.DataBind();

        

    }

    protected void txtFilterOrderDate_TextChanged(object sender, EventArgs e)
    {
        bindOrderNo();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }

    #endregion

    #region Order No. Finder Gridview Event

    protected void grdOrderNo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdOrderNo.PageIndex = e.NewPageIndex;
        grdOrderNo.DataBind();
        bindOrderNo();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }



    protected void grdOrderNo_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);

        DateTime orderDtae = new DateTime();
        orderDtae =Convert.ToDateTime(grdOrderNo.SelectedRow.Cells[2].Text);

        string selectedID = grdOrderNo.SelectedRow.Cells[1].Text;
        lblCusNameDisplay.Text = grdOrderNo.SelectedRow.Cells[4].Text;
        txtReturnDate.Text = orderDtae.ToString("dd-MMM-yyyy");
        txtOrderNo.Text = selectedID;
        //readData();
        loadData();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
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


    #region Finder


    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
        if (Session["finder"] == "" || Session["finder"] == null)
        {
            bindReturn();
        }
    }

    protected void imgOrderFinder_Click(object sender, ImageClickEventArgs e)
    {
        if (Session["finder"].ToString() == "" || Session["finder"] == null)
        {
            bindReturn();
            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
        }
    }


    private void bindReturn()
    {
        string selUserList = "";

        if (txtFilter.Text != "" && txtFilter.Text != null)
        {

            if (ddlCustomer.SelectedItem.Text == "Order No" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from returnEntry where  orderNo like '%" + txtFilter.Text + "%'";
            }

            //else if (ddlCustomer.SelectedItem.Text == "Customer Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            //{

            //    selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            //}


            else if (ddlCustomer.SelectedItem.Text == "Return No" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from returnEntry where  returnNo like '%" + txtFilter.Text + "%'";
            }

            //else if (ddlCustomer.SelectedItem.Text == "Customer ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            //{

            //    selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            //}

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
        }

        else
        {

            selUserList = "SELECT * from returnEntry";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "returnEntry");
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
        
        txtReturnNumber.Text = selectedID;
        readData();
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