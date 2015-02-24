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

public partial class AgentSalesQuantity : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindCustomer();
            bindOrderNo();
        }

        clsHelper.CheckLogin();  
    }


    private void bindAgent()
    {
        string sel = "SELECT * from hawkerInformation where hkrID = '" + txtAgentId.Text + "' ";

        SqlDataReader sdr = dataProvider.getDataReader(sel);
        while (sdr.Read())
        {
            txtAgentName.Text = sdr["hkrNameEng"].ToString();
            txtRegularCopy.Text = sdr["regularCopy"].ToString();
            txtFloatCopy.Text = sdr["floatingCopy"].ToString();
            txtCorporateCopy.Text = sdr["corporateCopy"].ToString();

        }

    }

    protected void txtAgentId_TextChanged(object sender, EventArgs e)
    {
        bindAgent();
    }


    private void readData()
    {
        bool flaghasDta = true;

        string sel = "select * from AgentSalesQty where orderNo = '" + txtOrderNumber.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            txtAgentId.Text = sdr["agentId"].ToString();
            txtAgentName.Text = sdr["agentName"].ToString();
            txtRegularCopy.Text = sdr["regularQty"].ToString();
            txtFloatCopy.Text = sdr["floatQty"].ToString();
            txtCorporateCopy.Text = sdr["corporateQty"].ToString();
            txtOrderDate.Text = sdr["orderDate"].ToString();
            txtActRegularCopy.Text = sdr["actRegularQty"].ToString();
            txtActFloatCopy.Text = sdr["actFloatQty"].ToString();
            txtActCorporateCopy.Text = sdr["actCorporateQty"].ToString();

            flaghasDta = false;
        }

        if (flaghasDta == true)
        {
            txtAgentId.Text = "";
            txtAgentName.Text = "";
            txtRegularCopy.Text = "";
            txtFloatCopy.Text = "";
            txtCorporateCopy.Text = "";
            txtOrderDate.Text = "";
            txtActRegularCopy.Text = "";
            txtActFloatCopy.Text = "";
            txtActCorporateCopy.Text = "";
        }


    }


    private void Update()
    {
        string sel = "select * from AgentSalesQty where orderNo='" + txtOrderNumber.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            string agentId = txtAgentId.Text;
            string agentName = txtAgentName.Text;
            int regularQty = Convert.ToInt32(txtRegularCopy.Text);
            int floatQty = Convert.ToInt32(txtFloatCopy.Text);
            int corporateQty = Convert.ToInt32(txtCorporateCopy.Text);
            DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);
            int actRegularQty = Convert.ToInt32(txtActRegularCopy.Text);
            int actFloatQty = Convert.ToInt32(txtActFloatCopy.Text);
            int actCorporateQty = Convert.ToInt32(txtActCorporateCopy.Text);
            DateTime CreateDate = DateTime.Now.Date;
            string AuditUser = Session["UserName"].ToString();

            string cmd = "update AgentSalesQty set orderDate='" + orderDate + "', actRegularQty='" + actRegularQty + "', actFloatQty='" + actFloatQty + "', actCorporateQty='" + actCorporateQty + "', createDate ='" + CreateDate + "', auditUser ='" + AuditUser + "' where orderNo='" + txtOrderNumber.Text + "' ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readData();
    }


    #region All Buttont Event


    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        btnSave.Text = "Update";
        string MinId = "select min(orderNo)from AgentSalesQty ";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtOrderNumber.Text = intMinId.ToString();

        readData();
    }


    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        btnSave.Text = "Update";
        string MinId = "select min(orderNo)from AgentSalesQty ";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        if (txtOrderNumber.Text == "**** New ****")
        {
            txtOrderNumber.Text = 1.ToString();
            readData();
        }
        else
        {
            string agentId = txtOrderNumber.Text;
            int agnt = Convert.ToInt32(agentId);
            agnt = agnt - 1;
            agentId = agnt.ToString();

            if (agnt >= intMinId)
            {
                txtOrderNumber.Text = agentId;
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
        btnSave.Text = "Update";
        string maxId = "select max(orderNo)from AgentSalesQty ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        if (txtOrderNumber.Text == "**** New ****")
        {
            txtOrderNumber.Text = 1.ToString();
            readData();
        }

        else
        {
            string agentId = txtOrderNumber.Text;
            int agnt = Convert.ToInt32(agentId);
            agnt = agnt + 1;

            if (agnt <= intMaxId)
            {
                txtOrderNumber.Text = agnt.ToString();

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
        btnSave.Text = "Update";
        string maxId = "select max(orderNo)from AgentSalesQty ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtOrderNumber.Text = intMaxId.ToString();

        readData();
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        string countId = " SELECT  count(orderNo) from AgentSalesQty where orderNo = (select max(orderNo)from AgentSalesQty)";
        int intcountId = Convert.ToInt32(dataProvider.getResultString(countId));
        string agentId = "";

        if (intcountId == 0)
        {
            agentId = "1";
            txtOrderNumber.Text = 1.ToString();
        }

        else
        {
            string maxId = "select max(orderNo)from AgentSalesQty ";
            int intmaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

            if (intmaxId != 0)
            {
                agentId = (intmaxId + 1).ToString();
                txtOrderNumber.Text = (intmaxId + 1).ToString();
            }
        }

        txtAgentId.Text = "";
        txtAgentName.Text = "";
        txtRegularCopy.Text = "";
        txtFloatCopy.Text = "";
        txtCorporateCopy.Text = "";
        txtOrderDate.Text = "";
        txtActRegularCopy.Text = "";
        txtActFloatCopy.Text = "";
        txtActCorporateCopy.Text = "";

        btnSave.Text = "Create";

    }




    protected void btnSave_Click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from AgentSalesQty where orderNo = '" + txtOrderNumber.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            //string countId = " SELECT  count(orderNo) from AgentSalesQty where orderNo = (select max(orderNo)from AgentSalesQty)";
            //int intcountId = Convert.ToInt32(dataProvider.getResultString(countId));
            //string agentId = "";

            //if (intcountId == 0 && txtAgentId.Text == "**** New ****" )
            //{
            //    agentId = "1";
            //}

            //else
            //{
            //    string maxId = "select max(orderNo)from AgentSalesQty ";
            //    int intmaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

            //    if (intmaxId != 0)
            //    {
            //        agentId = (intmaxId + 1).ToString();
            //    }
            //}

            string orderNo = txtOrderNumber.Text;
            string agentId = txtAgentId.Text;
            string agentName = txtAgentName.Text;
            int regularQty = Convert.ToInt32(txtRegularCopy.Text);
            int floatQty = Convert.ToInt32(txtFloatCopy.Text);
            int corporateQty = Convert.ToInt32(txtCorporateCopy.Text);
            DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text).Date;
            int actRegularQty = Convert.ToInt32(txtActRegularCopy.Text);
            int actFloatQty = Convert.ToInt32(txtActFloatCopy.Text);
            int actCorporateQty = Convert.ToInt32(txtActCorporateCopy.Text);
            DateTime CreateDate = DateTime.Now.Date;
            string AuditUser = Session["UserName"].ToString();

            string insertQuery = "INSERT INTO AgentSalesQty VALUES ('" + orderNo + "', '" + agentId + "', '" + agentName + "','" + regularQty + "','" + floatQty + "','" + corporateQty + "', '" + orderDate + "', '" + actRegularQty + "', '" + actFloatQty + "','" + actCorporateQty + "','" + CreateDate + "','" + AuditUser + "')  ";

            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(insertQuery, "AgentSalesQty");
        }

        else
        {
            Update();
            btnSave.Text = "Update";
        }
    }



    #endregion




    #region Order No. Finder


    protected void txtFilterOrder_TextChanged(object sender, EventArgs e)
    {
        bindOrderNo();
    }

    protected void imgOrderFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindOrderNo();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
    }

    private void bindOrderNo()
    {
        string selOrderList = "";

        if (txtFilterOrder.Text != "" && txtFilterOrder.Text != null)
        {

            if (ddlCustomer1.SelectedItem.Text == "Order No" && ddlSelectType1.SelectedItem.Text == "Contains")
            {

                selOrderList = "SELECT * from AgentSalesQty where orderNo like '%" + txtFilterOrder.Text + "%'";
            }

            else if (ddlCustomer1.SelectedItem.Text == "Order No" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {

                selOrderList = "SELECT * from AgentSalesQty where orderNo like '" + txtFilterOrder.Text + "%'";
            }


            else if (ddlCustomer1.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Contains")
            {

                selOrderList = "SELECT * from AgentSalesQty where agentName like '%" + txtFilterOrder.Text + "%'";
            }

            else if (ddlCustomer1.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {

                selOrderList = "SELECT * from AgentSalesQty where agentName like '" + txtFilterOrder.Text + "%'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showOrderFinderDiv();", true);
        }

        else
        {

            selOrderList = "SELECT * from AgentSalesQty";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selOrderList, "AgentSalesQty");
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
        string selectedID = grdOrderNo.SelectedRow.Cells[1].Text;
        txtOrderNumber.Text = selectedID;
        readData();
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

            if (ddlCustomer.SelectedItem.Text == "Agent Name" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Agent Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            }


            else if (ddlCustomer.SelectedItem.Text == "Agent ID" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Agent ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID like '" + txtFilter.Text + "%'";
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

    #region Finder Agent Gridview Event

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
        txtAgentId.Text = selectedID;
        txtAgentName.Text = grdCustomer.SelectedRow.Cells[4].Text;
        bindAgent();      
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