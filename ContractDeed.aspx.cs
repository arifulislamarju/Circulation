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


public partial class ContractDeed : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();   
    BLLContractDeed contractDeedObj = null;

    string connectionString = "Data Source=192.168.10.75;User ID=abomuser;Password=erp;;Initial Catalog=ALODAT;Trusted_connection=false;Integrated Security=false;Pooling=false;";


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }

        bindAgent();
        bindAccPacBank();

        clsHelper.CheckLogin();
    }


    private void bindDeedData()
    {
        string sel = "SELECT * from AGENTDEED where HawkerId = '" + txtId.Text + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "AGENTDEED");
        gridView.DataSource = ds;
        gridView.DataBind();

        SqlDataReader sdr = dataProvider.getDataReader(sel);
        while (sdr.Read())
        {
            txtName.Text = sdr["HawkerName"].ToString();
        }

    }


    protected void txtId_TextChanged(object sender, EventArgs e)
    {
        bindDeedData();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string replaceId = "";

        if (btnSave.Text == "Save")
        {
            string imageName = "";
            //txtId.Text = "1003";
            string fileName = Path.GetFileName(fileUpload.PostedFile.FileName);
            string imgId = txtId.Text + ".jpg";

            if (fileName != "" && fileName != null)
            {

                 replaceId = fileName.Replace(fileName, imgId);
                fileUpload.SaveAs(Server.MapPath("HawkerImage/" + replaceId));
            }

            try
            {
                imageName = "~/HawkerImage/" + replaceId;
                contractDeedObj = new BLLContractDeed();
                contractDeedObj.HawkerId = txtId.Text.ToString();
                contractDeedObj.HawkerName = txtName.Text;
                contractDeedObj.IssueDate = Convert.ToDateTime(txtIssuDate.Text);
               // DateTime asd = Convert.ToDateTime(txtExpDate.Text);
                contractDeedObj.DeedType = ddlDeedType.SelectedItem.Text;
                contractDeedObj.ExpDate = Convert.ToDateTime(txtExpDate.Text);
                contractDeedObj.Bank = txtBank.Text;
                contractDeedObj.DepositeTk = Convert.ToInt32(txtDeposit.Text);
                contractDeedObj.ImgName = imageName.ToString();
                contractDeedObj.auditUser = Session["UserName"].ToString();
                contractDeedObj.createDate = DateTime.Now;
            }
            catch (Exception frmEx)
            {
                msgError.Text = "Enter numeric figure in deposit field" + frmEx.Message;
            }
            contractDeedObj.Save(contractDeedObj);
        }

        else if (btnSave.Text == "Update")
        {
            contractDeedObj = new BLLContractDeed();
            string hawkerName = txtName.Text;
            string HawkerId = txtId.Text;
            DateTime issueDate = Convert.ToDateTime(txtIssuDate.Text);
            string DeedType = ddlDeedType.SelectedItem.Text;
            DateTime expDate = Convert.ToDateTime(txtExpDate.Text);
            string bank = txtBank.Text;
            int deposit = Convert.ToInt32(txtDeposit.Text);
            string auditUser = Session["UserName"].ToString();
            DateTime createDate = DateTime.Now;
            contractDeedObj.Update(HawkerId,hawkerName, issueDate, DeedType, expDate, bank, deposit, auditUser, createDate);
        }
       // DisplayHawker();
        Clear();
    }


    protected void btnPost_Click(object sender, EventArgs e)
    {
        string postStatus = "SELECT CAST(postStatus AS INT)  from AGENTDEED where HawkerId = '" + txtId.Text + "' ";
        int intStatus = Convert.ToInt32(dataProvider.getResultString(postStatus).ToString());

        if (intStatus == 0)
        {
            string cmd = "update AGENTDEED set postStatus = 1 where HawkerId = '" + txtId.Text + "' ";
            dataProvider.ExecuteCommand(cmd);

            btnPost.Enabled = false;
        }
        else
        {
            
            msgError.Text = "Post Data Can not be Edited";
        }

        
    }


    private void Clear()
    {
        txtName.Text = "";
        txtIssuDate.Text = "";
        txtExpDate.Text = "";
        txtBank.Text = "";
        txtDeposit.Text = "";
        btnSave.Text = "Save";
        
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }

    //protected void btnExit_Click(object sender, EventArgs e)
    //{
    //    txtHawkerId.Text = "";
    //    txtHawkerName.Text = "";
    //}

    //protected void btnSearch_Click(object sender, EventArgs e)
    //{
    //    string id = Convert.ToString(txtHawkerId.Text);
    //    string name = txtHawkerName.Text;
    //    contractDeedObj = new BLLContractDeed();
    //    DataTable dt=contractDeedObj.Search(id, name);
    //    gridView.DataSource = dt;
    //    gridView.DataBind();
    //}


    protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtName.Text = gridView.SelectedRow.Cells[0].Text;
        txtIssuDate.Text = gridView.SelectedRow.Cells[1].Text;
        ddlDeedType.Text = gridView.SelectedRow.Cells[2].Text;
        txtExpDate.Text = gridView.SelectedRow.Cells[3].Text;
        txtBank.Text = gridView.SelectedRow.Cells[4].Text;
        txtDeposit.Text = gridView.SelectedRow.Cells[5].Text;
        btnSave.Text = "Update";

        string postStatus = "SELECT CONVERT(INT, postStatus) AS IntValue from AGENTDEED where  HawkerId = '" + txtId.Text + "' ";
        int intStatus = Convert.ToInt32(dataProvider.getResultString(postStatus));

        if (intStatus == 1)
        {
            btnPost.Enabled = false;

            if (btnSave.Text == "Update")
            {
                btnSave.Enabled = false;
            }
        }
        else
        {
            btnPost.Enabled = true;

            if (btnSave.Text == "Update")
            {
                btnSave.Enabled = true;
            }
        }

    }



    #region Finder Agent


    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
        bindAgent();
    }

    protected void imgCustomerFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindAgent();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgntDiv();", true);
    }

    private void bindAgent()
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

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Agent ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilter.Text + "%'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgntDiv();", true);
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


    #region Agent Finder Gridview

    protected void grdCustomer_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdCustomer.PageIndex = e.NewPageIndex;
        grdCustomer.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgntDiv();", true);
    }



    protected void grdCustomer_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
        string selectedID = grdCustomer.SelectedRow.Cells[1].Text;
        //lblCustomerID.Text = selectedID;
        txtId.Text = selectedID;

        txtName.Text = grdCustomer.SelectedRow.Cells[4].Text;
        bindDeedData();

    }


    protected void grdCustomer_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#91ff87'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdCustomer, "Select$" + e.Row.RowIndex);
        }
    }



    #endregion


    #region Finder Bank

    private void bindAccPacBank()
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();


        string selBank = "SELECT * FROM BKAccount";

        SqlCommand cmd = new SqlCommand(selBank, con);
        cmd.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grdBank.DataSource = dt;
        grdBank.DataBind();


        con.Close();
    }


    #endregion

    #region Bank Finder Gridview

    protected void grdBank_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdBank.PageIndex = e.NewPageIndex;
        grdBank.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderBankDiv();", true);
    }

    protected void grdBank_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectBankID = grdBank.SelectedRow.Cells[1].Text;
        // lblCustomerID.Text = selectedID;
        txtBank.Text = selectBankID;
    }


    protected void grdBank_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#91ff87'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdBank, "Select$" + e.Row.RowIndex);

        }
    }



    #endregion



}