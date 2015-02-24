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

public partial class hawkerInfo : System.Web.UI.Page
{
    bll_hawkerInfo bllHkrInfo = new bll_hawkerInfo();
    bll_AgentFamInfo bllcreate = new bll_AgentFamInfo();
    clsDataProvider dataProvider = new clsDataProvider();
    public string agentType = "";

    string connectionString = "Data Source=192.168.10.75;User ID=abomuser;Password=erp;Initial Catalog=ALODAT;Trusted_connection=false;Integrated Security=false;Pooling=false;";


    #region Page Load Event

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindAgent();

            string cntSubBoute = "SELECT  count(subRouteName) from subRoute where delStatus<>1";
            int noOfSubRoute = Convert.ToInt32(dataProvider.getResultString(cntSubBoute));

            if (noOfSubRoute != 0)
            {
                bindAgentArea();
            }

            string cntStation = "SELECT  count(stationName) from station where delStatus<>1";
            int numberOfStation = Convert.ToInt32(dataProvider.getResultString(cntStation));

            if (numberOfStation != 0)
            {
                bindStation();
            }

            bindAccPacCus();
            bindCustomer();
        }

        string selCountrow = "SELECT COUNT(*) from AgentDailyOrderChange where hkrID='" + txtAgntId.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            btnSaveOrderChange.Text = "New";
        }

        if (rowNumber != 0)
        {
            btnSaveOrderChange.Text = "Update";
        }

        if (ddlCusType.SelectedItem.Text == "Agent")
        {
            lblAgentName.Enabled = false;
            ddlAgentName.Enabled = false;
        }

        else
        {
            lblAgentName.Enabled = true;
            ddlAgentName.Enabled = true;
            bindSubAgent();
        }

        clsHelper.CheckLogin();

        bindfrmDistribution();
        
    }


    #endregion

    #region All private Methods

    protected void ddlCusType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlCusType.SelectedItem.Text == "Hawker")
        {
            lblAgentName.Enabled = true;
            ddlAgentName.Enabled = true;

            agentType = "Sub-Agent";

            lblAgentName.Text = "Sub-Agent Name";
            bindSubAgent();
        }

        else if (ddlCusType.SelectedItem.Text == "Sub-Agent")
        {

            lblAgentName.Enabled = true;
            ddlAgentName.Enabled = true;

            agentType = "Agent";

            lblAgentName.Text = "Agent Name";
            bindSubAgent();
        }

        else if (ddlCusType.SelectedItem.Text == "Agent")
        {
            //lblAgentName.Text = "Sub-Agent Name";
            //bindSubAgent();

            lblAgentName.Enabled = false;
            ddlAgentName.Enabled = false;
        }

    }


    private void bindAgentArea()
    {
        string query = "SELECT subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");
        ddlAgentArea.DataSource = ds;
        ddlAgentArea.DataTextField = "subRouteName";
        ddlAgentArea.DataValueField = "subRouteName";
        ddlAgentArea.DataBind();
        ddlAgentArea.Items.Insert(0, "--Select--"); 
    }

    private void bindStation()
    {
        string query = "SELECT stationName from station where delStatus<>1 Order By stationName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlSalesArea.DataSource = ds;
        ddlSalesArea.DataTextField = "stationName";
        ddlSalesArea.DataValueField = "stationName";
        ddlSalesArea.DataBind();
        ddlSalesArea.Items.Insert(0, "--Select--"); 
    }

    private void bindStationForDaywiseChange()
    {
        string query = "SELECT stationName from dayWisedefaultChange  where delStatus<>1 AND CustId='" + txtHawkerId.Text + "' Order By stationName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStation.DataSource = ds;
        ddlStation.DataTextField = "stationName";
        ddlStation.DataValueField = "stationName";
        ddlStation.DataBind();
        //ddlStation.Items.Insert(0, "--Select--");
    }

    private void bindAgent()
    {
        string query = "SELECT hkrNameEng from hawkerInformation where delStatus<>1 And hkrType = 'Agent' Order By hkrNameEng ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "hkrNameEng");
        ddlAgentName.DataSource = ds;
        ddlAgentName.DataTextField = "hkrNameEng";
        ddlAgentName.DataValueField = "hkrNameEng";
        ddlAgentName.DataBind();
    }

    private void bindSubAgent()
    {
        string query = "SELECT hkrNameEng from hawkerInformation where delStatus<>1 And hkrType = 'Sub-Agent' Order By hkrNameEng ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "hkrNameEng");
        ddlAgentName.DataSource = ds;
        ddlAgentName.DataTextField = "hkrNameEng";
        ddlAgentName.DataValueField = "hkrNameEng";
        ddlAgentName.DataBind();
    }

    private void readData()
    {
        bool flaghasDta = true;

        string sel = "select * from hawkerInformation where delStatus<>1 AND hkrID = '"+ txtHawkerId.Text +"' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            txtHawkerId.Text = sdr["hkrID"].ToString();
            
            txtHkrIdFmlInfo.Text = txtHawkerId.Text;
            bindGrid();
            bindfrmDistribution();

            txtAgntId.Text = txtHawkerId.Text;

            ddlCusType.Text = sdr["hkrType"].ToString();
            txtHkrNameBangla.Text = sdr["hkrNameBangla"].ToString();
            txtHkrName.Text = sdr["hkrNameEng"].ToString();

            lblAgntName.Text = txtHkrName.Text;

            txtHkrFatherName.Text = sdr["fatherName"].ToString();
            
            if (ddlCusType.SelectedItem.Text == "Hawker" || ddlCusType.SelectedItem.Text == "Sub-Agent")
            {
                ddlAgentName.Text = sdr["agentName"].ToString();
            }
            bindAgentArea();
            //ddlAgentArea.Text = sdr["agentArea"].ToString();
            //ddlArrival.Text = sdr["salesDuration"].ToString();
            txtSortingOrder.Text = sdr["sortingOrder"].ToString();
            txtMarriageDay.Text = sdr["marigeDay"].ToString();
            txtFloatCopy.Text = sdr["floatingCopy"].ToString();
            txtRegularCopy.Text = sdr["regularCopy"].ToString();
            txtCorporateCopy.Text = sdr["corporateCopy"].ToString();
            txtBillTo.Text = sdr["billTo"].ToString();
            bindStation();
            //ddlSalesArea.Text = sdr["salesArea"].ToString();
            txtBirthDay.Text = sdr["birthDay"].ToString();
            txtMobile.Text = sdr["mobileNumber"].ToString();

            flaghasDta = false;

            

        }

        if (flaghasDta == true)
        {
            txtMarriageDay.Text = "";
            txtFloatCopy.Text = "";
            txtRegularCopy.Text = "";
            txtCorporateCopy.Text = "";
            txtHkrName.Text = "";
            txtHkrNameBangla.Text = "";
            txtHkrFatherName.Text = "";
            txtBirthDay.Text = "";
            txtMobile.Text = "";
        }


    }


    private void Update()
    {
        string hkrType = "";
        string HkrNameBangla = "";
        string HkrName = "";
        string HkrFatherName = "";
        string AgentName = "";
        string AgentArea = "";
        string sortingOrder = "";
        string MarriageDay = "";
        string FloatingCopy = "";
        string RegularCopy = "";
        string CorporateCopy = "";
        string BillTo = "";
        string SalesArea = "";
        string BirthDay = "";
        string Mobile = "";

        string sel = "select * from hawkerInformation where delStatus<>1 AND hkrID='" + txtHawkerId.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            hkrType = ddlCusType.Text;
            HkrNameBangla = txtHkrNameBangla.Text;
            HkrName = txtHkrName.Text;
            HkrFatherName = txtHkrFatherName.Text;

            if (ddlCusType.SelectedItem.Text == "Hawker" || ddlCusType.SelectedItem.Text == "Sub-Agent")
            {
                AgentName = ddlAgentName.SelectedItem.Text;
            }

            AgentArea = ddlAgentArea.SelectedItem.Text;
            sortingOrder = txtSortingOrder.Text;
            MarriageDay = txtMarriageDay.Text;
            FloatingCopy = txtFloatCopy.Text;
            RegularCopy = txtRegularCopy.Text;
            CorporateCopy = txtCorporateCopy.Text;
            BillTo = txtBillTo.Text;
            SalesArea = ddlSalesArea.SelectedItem.Text;
            BirthDay = txtBirthDay.Text;
            Mobile = txtMobile.Text;
            DateTime CreateDate  = DateTime.Now;
            string AuditUser = Session["UserName"].ToString();

            string cmd = "update hawkerInformation set hkrType='" + hkrType + "', hkrNameBangla='" + HkrNameBangla + "', hkrNameEng='" + HkrName + "', fatherName='" + HkrFatherName + "', agentName='" + AgentName + "', agentArea='" + AgentArea + "', sortingOrder = '" + sortingOrder + "', marigeDay='" + MarriageDay + "', floatingCopy='" + FloatingCopy + "', regularCopy='" + RegularCopy + "', corporateCopy='" + CorporateCopy + "', billTo='" + BillTo + "', salesArea='" + SalesArea + "', birthDay='" + BirthDay + "', mobileNumber='" + Mobile + "', createDate ='" + CreateDate + "', audUser ='" + AuditUser + "' where delStatus<>1 AND hkrID='" + txtHawkerId.Text + "' ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readData();

    }


    protected void txtHawkerId_TextChanged(object sender, EventArgs e)
    {
        txtHkrIdFmlInfo.Text = txtHawkerId.Text;
        
        bindGrid();
        bindfrmDistribution();
        readDailyChange();
        bindAgentSalesData();

        txtChldName.Text = "";
        txtEducation.Text = "";
        txtCldBirthDay.Text = "";

    }


    #endregion

    #region All Buttont Event


    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveHkrInfo.Text = "Update";
        string MinId = "select min(hkrID)from hawkerInformation where delStatus<>1";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtHawkerId.Text = intMinId.ToString();

        bindStationForDaywiseChange();
        readData();
        readDailyChange();

        bindAgentSalesData();
        
    }


    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveHkrInfo.Text = "Update";
        string MinId = "select min(hkrID)from hawkerInformation where delStatus<>1";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        string agentId = txtHawkerId.Text;
        int agnt = Convert.ToInt32(agentId);
        agnt = agnt - 1;
        agentId = agnt.ToString();

        if (agnt >= intMinId)
        {
            txtHawkerId.Text = agentId;
            bindStationForDaywiseChange();
            readData();
            readDailyChange();
            bindAgentSalesData();
            
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
        }

    }

    protected void btnNext_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveHkrInfo.Text = "Update";
        string maxId = "select max(hkrID)from hawkerInformation where delStatus<>1";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        if (txtHawkerId.Text == "***New***")
        {
            txtHawkerId.Text = 1.ToString();
            bindStationForDaywiseChange();
            readData();
            readDailyChange();
            bindAgentSalesData();
            
        }

        else
        {
            string agentId = txtHawkerId.Text;
            int agnt = Convert.ToInt32(agentId);
            agnt = agnt + 1;

            if (agnt <= intMaxId)
            {
                txtHawkerId.Text = agnt.ToString();

                bindStationForDaywiseChange();
                readData();
                readDailyChange();
                bindAgentSalesData();
                
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Forward Data...');", true);
            }
        }

    }


    protected void btnLast_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveHkrInfo.Text = "Update";
        string maxId = "select max(hkrID)from hawkerInformation where delStatus<>1 ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtHawkerId.Text = intMaxId.ToString();

        bindStationForDaywiseChange();
        readData();
        readDailyChange();
        bindAgentSalesData();
        
    }

    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        btnSaveHkrInfo.Text = "Save";
        string countId = " SELECT  count(hkrID) from hawkerInformation where delStatus<>1 AND hkrID = (select max(hkrID)from hawkerInformation)";
        int intcountId = Convert.ToInt32(dataProvider.getResultString(countId));
        string agentId = "";

        if (intcountId == 0)
        {
            agentId = "00001";
            txtHawkerId.Text = 00001.ToString();
        }

        else
        {
            string maxId = "select max(hkrID)from hawkerInformation where delStatus<>1";
            int intmaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

            if (intmaxId != 0)
            {
                agentId = (intmaxId + 1).ToString();
                txtHawkerId.Text = (intmaxId + 1).ToString();
            }
        }

        txtAgntId.Text = txtHawkerId.Text;
        txtHkrIdFmlInfo.Text = txtHawkerId.Text;

        txtSortingOrder.Text = "";
        txtMarriageDay.Text = "";
        txtFloatCopy.Text = "";
        txtHkrName.Text = "";
        txtHkrNameBangla.Text = "";
        txtHkrFatherName.Text = "";
        txtBirthDay.Text = "";
        txtMobile.Text = "";

        btnSaveHkrInfo.Text = "Create";

    }


    protected void btnSaveHkrInfo_Click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from hawkerInformation where hkrID = '" + txtHawkerId.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            string hkrImage = "";

            string selCount = "Select count(*) from hawkerInformation";
            int rowNo = Convert.ToInt32(dataProvider.getResultString(selCount));

            if (rowNo == 0)
            {
                bllHkrInfo.HkrID = "1";
                txtHawkerId.Text = 1.ToString();
            }
            else
            {
                string selHkrId = "Select max(hkrID) from hawkerInformation";
                int maxHkrID = Convert.ToInt32(dataProvider.getResultString(selHkrId));

                bllHkrInfo.HkrID = (maxHkrID + 1).ToString();
                txtHawkerId.Text = (maxHkrID + 1).ToString();
            }

            bllHkrInfo.HkrType = ddlCusType.SelectedItem.Text;
            bllHkrInfo.HkrNameBangla = txtHkrNameBangla.Text;
            bllHkrInfo.HkrNameEng = txtHkrName.Text;
            lblAgntName.Text = txtHkrName.Text;
            bllHkrInfo.FatherName = txtHkrFatherName.Text;

            if (ddlCusType.SelectedItem.Text == "Hawker" || ddlCusType.SelectedItem.Text == "Sub-Agent")
            {
                bllHkrInfo.AgentName = ddlAgentName.SelectedItem.Text;
            }

            bllHkrInfo.AgentArea = ddlAgentArea.SelectedItem.Text;
            bllHkrInfo.MobileNumber = txtMobile.Text;
            bllHkrInfo.SalesDuration =txtSalesDuration.Text;
            bllHkrInfo.SORTINGORDER = float.Parse(txtSortingOrder.Text);
            if (txtMarriageDay.Text != "" && txtMarriageDay.Text != null)
            {
                bllHkrInfo.MarigeDay = DateTime.Parse(txtMarriageDay.Text);
            }
            bllHkrInfo.FloatingCopy = txtFloatCopy.Text;
            bllHkrInfo.RegularCopy = txtRegularCopy.Text;
            bllHkrInfo.CorporateCopy = txtCorporateCopy.Text;
            bllHkrInfo.BillTo = txtBillTo.Text;

            string FileName = Path.GetFileName(fileUploadImage.PostedFile.FileName);
            string userImagePath = fileUploadImage.PostedFile.FileName;
            string userImage = Path.GetFileName(userImagePath);

            if (userImage != null && userImage != "")
            {
                hkrImage = userImage;
                bllHkrInfo.ImagePath = ("AgentImage\\") + txtHawkerId.Text + "-" + userImage;
                fileUploadImage.SaveAs(Server.MapPath("AgentImage\\") + userImage);
            }
            else
            {
                bllHkrInfo.ImagePath = "";
            }

            bllHkrInfo.SalesArea = ddlSalesArea.SelectedItem.Text;

            if (txtBirthDay.Text != "" && txtBirthDay.Text != null)
            {
                bllHkrInfo.BirthDay = Convert.ToDateTime(txtBirthDay.Text);
            }           

            if (rbActiveInActive.Text == "Active")
            {
                bllHkrInfo.Status = 0;
            }
            else
            {
                bllHkrInfo.Status = 1;
            }
            bllHkrInfo.CREATEDATE = DateTime.Now;
            bllHkrInfo.AUDUSER = Session["UserName"].ToString();

            bllHkrInfo.Insert();
        }

        else
        {
            Update();
            btnSaveHkrInfo.Text = "Update";
        }
    }


    protected void btnHkrFmlInfo_Click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from agentFamInfo where delStatus<>1 And childName = '" + txtChldName.Text + "'";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.AGNTID = txtHkrIdFmlInfo.Text;
        bllcreate.CHILDNAME = txtChldName.Text;
        bllcreate.EDUCATION = txtEducation.Text;
        bllcreate.BIRTHDATE = Convert.ToDateTime(txtCldBirthDay.Text);
        bllcreate.AUDITUSER = Session["UserName"].ToString();
        bllcreate.CREATEDATE = DateTime.Now;


        if (hdnAgntId.Value != "" && hdnAgntId.Value != null)
        {
            bllcreate.AGNTID = hdnAgntId.Value;

            bllcreate.Update();

            hdnAgntId.Value = "";
            btnHkrFmlInfo.Text = "Create";
        }

        else
        {
            if (rowNumber == 0)
            {
                bllcreate.Insert();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Population Info. Already Created, Try Another...');", true);
            }
        }

        bindGrid();

        txtChldName.Text = "";
        txtEducation.Text = "";
        txtCldBirthDay.Text = "";

        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showFamilyInfo();", true);
    }


    #endregion


    #region All Gridview Event

    // Family Info. Grid

    private void bindGrid()
    {
        string sel = "SELECT * from agentFamInfo where delStatus<>1 AND hkrID = '" + txtHkrIdFmlInfo.Text + "'  ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(sel, "agentFamInfo");
        grdFamlInfo.DataSource = ds;
        grdFamlInfo.DataBind();

    }


    protected void grdFamlInfo_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "AgntId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Children Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Education";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Date Of Birth";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Audit User";
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


            grdFamlInfo.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdFamlInfo_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdFamlInfo.PageIndex = e.NewPageIndex;
        grdFamlInfo.DataBind();

        bindGrid();
    }

    protected void grdFamlInfo_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex(rowIndex);
    }

    private void PopulateLabelsByRowIndex(int rowIndex)
    {

        hdnAgntId.Value = HttpUtility.HtmlDecode(grdFamlInfo.Rows[rowIndex].Cells[0].Text);  
        txtChldName.Text = HttpUtility.HtmlDecode(grdFamlInfo.Rows[rowIndex].Cells[1].Text);
        txtEducation.Text = HttpUtility.HtmlDecode(grdFamlInfo.Rows[rowIndex].Cells[2].Text);
        txtCldBirthDay.Text = HttpUtility.HtmlDecode(grdFamlInfo.Rows[rowIndex].Cells[3].Text);

        btnHkrFmlInfo.Text = "Update";

        bindGrid();

    }


    protected void grdFamlInfo_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Family Info.: " +
            DataBinder.Eval(e.Row.DataItem, "childName") + "')");

        }
    }


    protected void grdFamlInfo_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string hkrID = (string)grdFamlInfo.DataKeys[e.RowIndex].Value;
        bllcreate.AGNTID = hkrID;
        bllcreate.Delete();

        bindGrid();
    }


    // Sales Area Grid

    private void bindfrmDistribution()
    {
        string select = "SELECT * from AgentDropPoint where delStatus<>1 and custId = '" + txtHawkerId.Text + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(select, "dbo.AgentDropPoint");
        grdOrderArea.DataSource = ds;
        grdOrderArea.DataBind();

    }


    protected void grdOrderArea_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "dsId";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "RM ID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            
            HeaderCell = new TableCell();
            HeaderCell.Text = "Regional Manager";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station ID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Default Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            grdOrderArea.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdOrderArea_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;
        }
    }




    #endregion

    #region Finder


    protected void txtFilter_TextChanged(object sender, EventArgs e)
    {
        bindAccPacCus();
    }

    protected void imgCustomerFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindAccPacCus();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
    }

    private void bindAccPacCus()
    {
        SqlConnection con = new SqlConnection(connectionString);
        con.Open();

        string selUserList = "";

        if (txtFilter.Text != "" && txtFilter.Text != null)
        {

            if (ddlCustomer.SelectedItem.Text == "Agent Name" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS where NAMECUST like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Agent Name" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS where NAMECUST like '" + txtFilter.Text + "%'";
            }


            else if (ddlCustomer.SelectedItem.Text == "Agent ID" && ddlSelectType.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS where IDCUST like '%" + txtFilter.Text + "%'";
            }

            else if (ddlCustomer.SelectedItem.Text == "Agent ID" && ddlSelectType.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS where IDCUST like '" + txtFilter.Text + "%'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderDiv();", true);
        }

        else
        {

            selUserList = "SELECT IDCUST, NAMECUST, CODESTTE,CODEPSTL, CODETERM, TEXTSTRE1 as ADDRESS1, TEXTSTRE2 as ADDRESS2, TEXTSTRE3 as ADDRESS3, SWACTV as STATUS, IDGRP, IDACCTSET FROM ARCUS";

        }

        SqlCommand cmd = new SqlCommand(selUserList, con);
        cmd.ExecuteNonQuery();

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        grdCustomer.DataSource = dt;
        grdCustomer.DataBind();

        con.Close();
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
        // lblCustomerID.Text = selectedID;
        txtBillTo.Text = selectedID;
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



    #region Finder Agent

    protected void txtFilterAgent_TextChanged(object sender, EventArgs e)
    {
        bindCustomer();
    }

    protected void imgAgentFinder_Click(object sender, ImageClickEventArgs e)
    {
        bindCustomer();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgent();", true);
    }

    private void bindCustomer()
    {
        string selUserList = "";

        if (txtFilterAgent.Text != "" && txtFilterAgent.Text != null)
        {

            if (ddlAgent.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '%" + txtFilterAgent.Text + "%'";
            }

            else if (ddlAgent.SelectedItem.Text == "Agent Name" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrNameEng like '" + txtFilterAgent.Text + "%'";
            }


            else if (ddlAgent.SelectedItem.Text == "Agent ID" && ddlSelectType1.SelectedItem.Text == "Contains")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilterAgent.Text + "'";
            }

            else if (ddlAgent.SelectedItem.Text == "Agent ID" && ddlSelectType1.SelectedItem.Text == "Starts With")
            {

                selUserList = "SELECT * from hawkerInformation where delStatus<>1 and hkrID='" + txtFilterAgent.Text + "'";
            }

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgent();", true);
        }

        else
        {

            selUserList = "SELECT * from hawkerInformation";
        }


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUserList, "hawkerInformation");
        grdAgent.DataSource = ds;
        grdAgent.DataBind();

    }

    #endregion

    #region Finder Gridview Event

    protected void grdAgent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdAgent.PageIndex = e.NewPageIndex;
        grdAgent.DataBind();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showFinderAgent();", true);
    }



    protected void grdAgent_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "BackMainDiv();", true);
        string selectedID = grdAgent.SelectedRow.Cells[1].Text;
        //lblCustomerID.Text = selectedID;
        txtHawkerId.Text = selectedID;

        bindStationForDaywiseChange();
        readDailyChange();
        bindAgentSalesData();
        readData();
    }


    protected void grdAgent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Attributes["onclick"] = "this.style.cursor='hand'; this.style.background = '#C3C5E5'; this.style.color = 'blue'; this.style.fontWeight='bold'";

            e.Row.Attributes["ondblclick"] = ClientScript.GetPostBackClientHyperlink(this.grdAgent, "Select$" + e.Row.RowIndex);

        }
    }



    #endregion



    #region Daily Order Change


    private void readDailyChange()
    {


        string strCountRow = "Select Count(*) from dayWisedefaultChange  where delStatus<>1 AND CustId='" + txtHawkerId.Text + "' ";
        int intRow = Convert.ToInt32(dataProvider.getResultString(strCountRow));

        if (intRow != 0 && intRow > 0)
        {

            bool flaghasDta = true;

            string strStationId = "Select stationId from station where stationName='" + ddlStation.SelectedItem.Text + "' and delStatus<>1";
            int stationId = Convert.ToInt32(dataProvider.getResultString(strStationId));


            string sel = "select day,quantityChange from AgentDailyOrderChange where hkrID='" + txtAgntId.Text + "' and StationId='" + stationId + "' AND category='" + ddlCategory.SelectedItem.Text + "' ";
            SqlDataReader sdr = dataProvider.getDataReader(sel);

            while (sdr.Read())
            {
                string strDay = sdr["day"].ToString();

                if (strDay == "SAT")
                {
                    txtSatPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "SUN")
                {
                    txtSunPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "MON")
                {
                    txtMonPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "TUE")
                {
                    txtTuesPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "WED")
                {
                    txtWedPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "THU")
                {
                    txtThursPage.Text = sdr["quantityChange"].ToString();
                }

                if (strDay == "FRI")
                {
                    txtFriPage.Text = sdr["quantityChange"].ToString();
                }

                flaghasDta = false;

            }

            if (flaghasDta == true)
            {
                txtSatPage.Text = "";
                txtSunPage.Text = "";
                txtMonPage.Text = "";
                txtTuesPage.Text = "";
                txtWedPage.Text = "";
                txtThursPage.Text = "";
                txtFriPage.Text = "";
            }
        }

    }



    protected void btnSaveOrderChange_click(object sender, EventArgs e)
    {
        string AgentId = txtAgntId.Text;
        lblAgntName.Text = txtHkrName.Text;
        string AgentName = lblAgntName.Text;

        string SAT = lblSat.Text;
        string SATPAGE = txtSatPage.Text;

        string SUN = lblSun.Text;
        string SUNPAGE = txtSunPage.Text;

        string MON = lblMon.Text;
        string MONPAGE = txtMonPage.Text;

        string TUES = lblTues.Text;
        string TUESPAGE = txtTuesPage.Text;

        string WED = lblWed.Text;
        string WEDPAGE = txtWedPage.Text;

        string THURS = lblThurs.Text;
        string THURSPAGE = txtThursPage.Text;

        string FRI = lblFri.Text;
        string FRIPAGE = txtFriPage.Text;

        DateTime CreateDate = DateTime.Now;
        string AuditUser = Session["UserName"].ToString();

        string strStationId = "Select stationId from station where stationName='" + ddlStation.SelectedItem.Text + "' and delStatus<>1";
        int stationId = Convert.ToInt32(dataProvider.getResultString(strStationId));

        string strCountRow = "select count(*) from AgentDailyOrderChange where hkrID='" + txtHawkerId.Text + "' AND StationId='" + stationId + "' AND category='" + ddlCategory.SelectedItem.Text + "' ";
        int rowNumber =Convert.ToInt32( dataProvider.getResultString(strCountRow));

        if (rowNumber == 0)
        {
            string insertQuery = "INSERT INTO AgentDailyOrderChange (hkrID,hkrNameEng,day,quantityChange,createDate,audUser,StationId,category) VALUES ('" + AgentId + "', '" + AgentName + "', '" + SAT + "','" + SATPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "','" + ddlCategory.SelectedItem.Text + "') , ('" + AgentId + "', '" + AgentName + "', '" + SUN + "','" + SUNPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "' ,'" + ddlCategory.SelectedItem.Text + "'), ('" + AgentId + "', '" + AgentName + "', '" + MON + "','" + MONPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "' ,'" + ddlCategory.SelectedItem.Text + "'), ('" + AgentId + "', '" + AgentName + "', '" + TUES + "','" + TUESPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "' ,'" + ddlCategory.SelectedItem.Text + "'), ('" + AgentId + "', '" + AgentName + "', '" + WED + "','" + WEDPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "','" + ddlCategory.SelectedItem.Text + "'), ('" + AgentId + "', '" + AgentName + "', '" + THURS + "','" + THURSPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "','" + ddlCategory.SelectedItem.Text + "'), ('" + AgentId + "', '" + AgentName + "', '" + FRI + "','" + FRIPAGE + "','" + CreateDate + "','" + AuditUser + "','" + stationId + "','" + ddlCategory.SelectedItem.Text + "')  ";

            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(insertQuery, "AgentDailyOrderChange");
        }

        else
        {
            UpdateDailyChange();
        }

        readDailyChange();


        btnSaveOrderChange.Text = "Update";
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showDailyOrderChange();", true);
    }



    private void UpdateDailyChange()
    {

        string quantityChange = "";
        string strDay = "";

        string strStationId = "Select stationId from station where stationName='" + ddlStation.SelectedItem.Text + "' and delStatus<>1";
        int stationId = Convert.ToInt32(dataProvider.getResultString(strStationId));

        string sel = "select day,quantityChange from AgentDailyOrderChange where hkrID='" + txtAgntId.Text + "' and category='" + ddlCategory.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            strDay = sdr["day"].ToString();

            if (strDay == "SAT")
            {
                quantityChange = txtSatPage.Text;
            }

            if (strDay == "SUN")
            {
                quantityChange = txtSunPage.Text;
            }

            if (strDay == "MON")
            {
                quantityChange = txtMonPage.Text;
            }

            if (strDay == "TUE")
            {
                quantityChange = txtTuesPage.Text;
            }

            if (strDay == "WED")
            {
                quantityChange = txtWedPage.Text;
            }

            if (strDay == "THU")
            {
                quantityChange = txtThursPage.Text;
            }

            if (strDay == "FRI")
            {
                quantityChange = txtFriPage.Text;
            }

            DateTime CreateDate = DateTime.Now;
            string AuditUser = Session["UserName"].ToString();

            string cmd = "update AgentDailyOrderChange set quantityChange = '" + quantityChange + "', createDate = '" + CreateDate + "', audUser = '" + AuditUser + "', StationId='" + stationId + "' where day = '" + strDay + "' and hkrID='" + txtAgntId.Text + "' and StationId='" + stationId + "' and category='" + ddlCategory.SelectedItem.Text + "' ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readDailyChange();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showDailyOrderChange();", true);
    }

    protected void ddlStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        readDailyChange();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showDailyOrderChange();", true);
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        readDailyChange();
        ScriptManager.RegisterStartupScript(this, this.GetType(), "showDiv", "showDailyOrderChange();", true);
    }

    #endregion

    #region Agent Sales Info


    private void bindAgentSalesData()
    {
        bool flag = false;

        lblhkrNameSales1.Text = txtHkrName.Text;

        string strPaperName = "Select PAPERNAME from PCOMPARE where USTATUS<>1";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strPaperName, "PCOMPARE");
        gridView.DataSource = ds;
        gridView.DataBind();

        foreach (GridViewRow gvrItem in gridView.Rows)
        {
            TextBox paperQuantoty = gvrItem.Cells[1].FindControl("txtPaperQuantity") as TextBox;

            string strSelQuantity = "Select PaperQuantity from AGENTSALESINFO where PAPERNAME='" + gvrItem.Cells[0].Text + "' and hkrId='"+txtHawkerId.Text+"'";
            
            SqlDataReader dr = dataProvider.getDataReader(strSelQuantity);
            
            while (dr.Read())
            {
                paperQuantoty.Text = dr["PaperQuantity"].ToString();

                flag = true;
                
            }
            dr.Close();
        }

        if (flag == true)
        {
            btnAgentSalesInfo.Text = "Update";
        }
        else
        {
            btnAgentSalesInfo.Text = "Save";
        }
    }


    protected void gridView_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Paper Name";
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



            gridView.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }
    protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;
        }
    }


    protected void btnAgentSalesInfo_Click(object sender, EventArgs e)
    {
                
            foreach (GridViewRow gridRow in gridView.Rows)
            {
                string createDate = DateTime.Now.ToString();
                string auditUser = Session["UserName"].ToString();
                TextBox paperQuantoty = gridRow.Cells[1].FindControl("txtPaperQuantity") as TextBox;

                string selCount = "Select Count(*) from AGENTSALESINFO where hkrId='" + txtHawkerId.Text + "' AND PAPERNAME='" + gridRow.Cells[0].Text + "'";
                int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCount));

                if (rowNumber == 0)
                {
                    string strInsert = "INSERT INTO AGENTSALESINFO VALUES('" + txtHawkerId.Text + "','" + gridRow.Cells[0].Text + "','" + paperQuantoty.Text + "','" + auditUser + "','" + createDate + "')";
                    dataProvider.ExecuteCommand(strInsert);
                }
                else
                {
                    string strUpdate = "Update AGENTSALESINFO set PAPERNAME='" + gridRow.Cells[0].Text + "',paperQuantity='" + paperQuantoty.Text + "',audUser='" + auditUser + "',createDate='" + createDate + "' where hkrId='" + txtHawkerId.Text + "' AND PAPERNAME='" + gridRow.Cells[0].Text + "'";
                    dataProvider.ExecuteCommand(strUpdate);
                }
                
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSummery();", true);
       
    }

    #endregion

}