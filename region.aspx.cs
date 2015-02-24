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

public partial class region : System.Web.UI.Page
{
    bll_CreateRegion bllcreate = new bll_CreateRegion();
    clsDataProvider dataProvider = new clsDataProvider();
    public string strDivision = "";
    public string strDistrict = "";

    public bool flgUnion = false;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            bindDivision();
            //bindDistrict();
            //bindPoliceStation();
            //bindPostOffice();
            //bindStation();
            //bindGrdUnion();

            bindDdlSubRouteName();

            bindDdlDivision();

            string distforps = "SELECT  count(*) from district where  divName='"+ddlDivisionForPS.SelectedItem.Text+"' AND delStatus<>1";
            int intddlDistForPS = Convert.ToInt32(dataProvider.getResultString(distforps));

            if (intddlDistForPS != 0)
            {
                bindDdlDistrict();
            }


            string countPS = "SELECT  count(*) from policeStation where delStatus<>1 AND distName='" + ddlDistrictForPO.SelectedItem.Text + "' ";
            int PSForPO = Convert.ToInt32(dataProvider.getResultString(countPS));

            if (PSForPO != 0)
            {
                bindDdlPS();
            }

            string countPSforUnion = "SELECT  count(*) from geoUnion where delStatus<>1 AND district='" + ddlDistrictUnion.SelectedItem.Text + "' AND policestation='" + ddlPSUnion.SelectedItem.Text + "'  ";
            int PSForUnion = Convert.ToInt32(dataProvider.getResultString(countPSforUnion));

            if (PSForUnion != 0)
            {
                bindDdlPOForUnion();
            }


            string psforsta = "SELECT  count(*) from postOffice where delStatus<>1 and psName='"+ddlPSForSta.SelectedItem.Text+"' ";
            int countPSForSta = Convert.ToInt32(dataProvider.getResultString(psforsta));

            if (countPSForSta != 0)
            {
                bindDdlPOForSta();
            }


            showHideunionpo();
        }

        

        clsHelper.CheckLogin();

    }

    // District UI

    protected void ddlDivisionForDist_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDistrict();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDist();", true);
    }


    // Police Station UI

    protected void ddlDivisionForPS_SelectedIndexChanged(object sender, EventArgs e)
    {          
        bindDdlDistrict();
        string distforps = "SELECT  count(*) from district where  divName='" + ddlDivisionForPS.SelectedItem.Text + "' AND delStatus<>1";
        int intddlDistForPS = Convert.ToInt32(dataProvider.getResultString(distforps));

        if (intddlDistForPS != 0)
        {
            bindPoliceStation();
        }
        
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);
    }

    protected void ddlDistrictForPS_SelectedIndexChanged(object sender, EventArgs e)
    {
        string distforps = "SELECT  count(*) from district where  divName='" + ddlDivisionForPS.SelectedItem.Text + "' AND delStatus<>1";
        int intddlDistForPS = Convert.ToInt32(dataProvider.getResultString(distforps));

        if (intddlDistForPS != 0)
        {
            bindPoliceStation();
        }
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);
    }

    // Post Office UI

    protected void ddlDivisionForPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intddlPSForSta = 0;
        int intcountDist = 0;

        strDivision = ddlDivisionForPO.SelectedItem.Text;

            bindDdlDistrict();
        
            if (ddlDistrictForPO.SelectedValue != null && ddlDistrictForPO.SelectedValue != "")
            {
                string psforsta = "SELECT  count(psName) from policeStation where delStatus<>1 and divName='" + ddlDivisionForPO.SelectedItem.Text + "' and distName='" + ddlDistrictForPO.SelectedItem.Text + "' ";
                intddlPSForSta = Convert.ToInt32(dataProvider.getResultString(psforsta));
            }
            else
            {               
                ddlPSForSta.Items.Insert(0, "Select");                
            }

        if (intddlPSForSta != 0)
        {
            bindDdlPS();
        }
        else
        {
            ddlPSForSta.Items.Insert(0, "Select"); 
        }
       

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }

    protected void ddlDistrictForPO_SelectedIndexChanged(object sender, EventArgs e)
    {

        strDistrict = ddlDistrictForPO.SelectedItem.Text;

        bindDdlPS();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }

    protected void ddlPSForPO_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindPostOffice();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }


    // Union UI


    protected void ddlDivisionUnion_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDivision = ddlDivisionUnion.SelectedItem.Text;

        bindDdlDistrict();
        bindDdlPS();
        bindDdlPOForUnion();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }

    protected void ddlDistrictUnion_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDistrict = ddlDistrictUnion.SelectedItem.Text;

        bindDdlPS();
        bindDdlPOForUnion();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }

    protected void ddlPSUnion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlPOForUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }

    protected void ddlPOForUnion_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindGrdUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }


    // Station UI

    protected void ddlDivisionForSta_SelectedIndexChanged(object sender, EventArgs e)
    {

        strDivision = ddlDivisionForSta.SelectedItem.Text;

        bindDdlDistrict();

        if (ddlDistrictForSta.SelectedItem != null && ddlDistrictForSta.SelectedItem != null)
        {
            bindDdlPS();
            bindDdlPOForSta();
        }
        showHideunionpo(); 
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }


    protected void ddlDistrictForSta_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDistrict = ddlDistrictForSta.SelectedItem.Text;

        bindDdlPS();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }

    protected void ddlPSForSta_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlPOForSta();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }

    protected void ddlPOForSta_SelectedIndexChanged(object sender, EventArgs e)
    {
        showHideunionpo();
        bindStation();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }

    protected void ddlPackType_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }

    protected void ddlSubRouteName_SelectedIndexChanged(object sender, EventArgs e)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }

    private void showHideunionpo()
    {

        string unionforsta = "SELECT  count(*) from geoUnion where delStatus<>1 and policestation='" + ddlPSForSta.SelectedItem.Text.Replace("'", "''") + "' ";
        int countUnionForSta = Convert.ToInt32(dataProvider.getResultString(unionforsta));

        if (countUnionForSta != 0)
        {
            bindDdlUnionSta();

            //lblUnionStation.Visible = true;
            //ddlUnionStation.Visible = true;

            //lblPO.Visible = false;
            //ddlPOForSta.Visible = false;

            //flgUnion = true;
        }

        //else
        //{
        //    lblUnionStation.Visible = false;
        //    ddlUnionStation.Visible = false;

        //    lblPO.Visible = true;
        //    ddlPOForSta.Visible = true;
        //}
    }


    #region All DropDown Lists


    private void bindDdlDivision()
    {
        string query = "SELECT  divName from division where delStatus<>1 Order By divName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "divName");
        ddlDivisionForDist.DataSource = ds;
        ddlDivisionForDist.DataTextField = "divName";
        ddlDivisionForDist.DataValueField = "divName";
        ddlDivisionForDist.DataBind();

        ddlDivisionForDist.DataSource = ds;
        ddlDivisionForDist.DataTextField = "divName";
        ddlDivisionForDist.DataValueField = "divName";
        ddlDivisionForDist.DataBind();

        ddlDivisionForPS.DataSource = ds;
        ddlDivisionForPS.DataTextField = "divName";
        ddlDivisionForPS.DataValueField = "divName";
        ddlDivisionForPS.DataBind();

        ddlDivisionForPO.DataSource = ds;
        ddlDivisionForPO.DataTextField = "divName";
        ddlDivisionForPO.DataValueField = "divName";
        ddlDivisionForPO.DataBind();

        ddlDivisionForSta.DataSource = ds;
        ddlDivisionForSta.DataTextField = "divName";
        ddlDivisionForSta.DataValueField = "divName";
        ddlDivisionForSta.DataBind();

        ddlDivisionUnion.DataSource = ds;
        ddlDivisionUnion.DataTextField = "divName";
        ddlDivisionUnion.DataValueField = "divName";
        ddlDivisionUnion.DataBind();

    }
    

    private void bindDdlDistrict()
    {
        string query = "";

        if (strDivision != "" && strDivision != null)
        {
            query = "SELECT  distName from district where delStatus<>1 and divName='" + strDivision + "' Order By distName ASC ";
        }
        else
        {
            query = "SELECT  distName from district where delStatus<>1 and divName='" + ddlDivisionForPS.SelectedItem.Text + "' Order By distName ASC ";
        }
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "distName");
        ddlDistrictForPS.DataSource = ds;
        ddlDistrictForPS.DataTextField = "distName";
        ddlDistrictForPS.DataValueField = "distName";
        ddlDistrictForPS.DataBind();

        ddlDistrictForPO.DataSource = ds;
        ddlDistrictForPO.DataTextField = "distName";
        ddlDistrictForPO.DataValueField = "distName";
        ddlDistrictForPO.DataBind();

        ddlDistrictForSta.DataSource = ds;
        ddlDistrictForSta.DataTextField = "distName";
        ddlDistrictForSta.DataValueField = "distName";
        ddlDistrictForSta.DataBind();

        ddlDistrictUnion.DataSource = ds;
        ddlDistrictUnion.DataTextField = "distName";
        ddlDistrictUnion.DataValueField = "distName";
        ddlDistrictUnion.DataBind();

    }


    private void bindDdlPS()
    {
        string query = "";
        if (strDistrict != "" && strDistrict != "")
        {
            query = "SELECT  psName from policeStation where delStatus<>1 and distName='" + strDistrict.Replace("'","''") + "'  Order By psName ASC ";
        }
        else
        {
            query = "SELECT  psName from policeStation where delStatus<>1 and distName='" + ddlDistrictForSta.SelectedItem.Text.Replace("'", "''") + "'  Order By psName ASC ";
        }

         
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "psName");
        ddlPSForPO.DataSource = ds;
        ddlPSForPO.DataTextField = "psName";
        ddlPSForPO.DataValueField = "psName";
        ddlPSForPO.DataBind();
        ddlPSForPO.Items.Insert(0, "--Select--"); 

        ddlPSForSta.DataSource = ds;
        ddlPSForSta.DataTextField = "psName";
        ddlPSForSta.DataValueField = "psName";
        ddlPSForSta.DataBind();
        ddlPSForSta.Items.Insert(0, "--Select--"); 

        ddlPSUnion.DataSource = ds;
        ddlPSUnion.DataTextField = "psName";
        ddlPSUnion.DataValueField = "psName";
        ddlPSUnion.DataBind();
        ddlPSUnion.Items.Insert(0, "--Select--"); 
    }


    private void bindDdlPOForUnion()
    {
        string query = "SELECT  poName from postOffice where delStatus<>1 and psName='" + ddlPSUnion.SelectedItem.Text.Replace("'", "''") + "' Order By poName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "poName");
        ddlPOForUnion.DataSource = ds;
        ddlPOForUnion.DataTextField = "poName";
        ddlPOForUnion.DataValueField = "poName";
        ddlPOForUnion.DataBind();
        ddlPOForUnion.Items.Insert(0, "--Select--"); 
    }


    private void bindDdlPOForSta()
    {
        string query = "SELECT  poName from postOffice where delStatus<>1 and psName='" + ddlPSForSta.SelectedItem.Text.Replace("'", "''") + "' Order By poName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "poName");
        ddlPOForSta.DataSource = ds;
        ddlPOForSta.DataTextField = "poName";
        ddlPOForSta.DataValueField = "poName";
        ddlPOForSta.DataBind();

        ddlPOForSta.Items.Insert(0, "--Select--"); 
    }

    private void bindDdlUnionSta()
    {
        string query = "SELECT  UnionName from geoUnion where delStatus<>1 and postOffice='" + ddlPOForSta.SelectedItem.Text + "' Order By UnionName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "UnionName");
        ddlUnionStation.DataSource = ds;
        ddlUnionStation.DataTextField = "UnionName";
        ddlUnionStation.DataValueField = "UnionName";
        ddlUnionStation.DataBind();
    }

    private void bindDdlSubRouteName()
    {
        string query = "SELECT subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");
        ddlSubRouteName.DataSource = ds;
        ddlSubRouteName.DataTextField = "subRouteName";
        ddlSubRouteName.DataValueField = "subRouteName";
        ddlSubRouteName.DataBind();
        ddlSubRouteName.Items.Insert(0, "--Select--");
    }

    #endregion



    #region All Buttons

    protected void btnSaveDiv_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from division where delStatus<>1 AND divName='" + txtDivision.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));    
        
        bllcreate.DIVISION = txtDivision.Text;
            bllcreate.CREATEDATE = DateTime.Now;
            bllcreate.AUDITUSER = Session["UserName"].ToString();

            //bindDdlDivisionForDist();

            if (hdndivId.Value != "" && hdndivId.Value != null)
            {
                bllcreate.DIVISIONID = Convert.ToInt32(hdndivId.Value);

                bllcreate.divUpdate();

                hdndivId.Value = "";
                btnSaveDiv.Text = "Create";

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Division is Updated..!!');", true);
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.divInsert();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Division is Inserted..!!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Division exists, try another name..');", true);
                }
            }

            bindDivision();
            bindDdlDivision();

            txtDivision.Text = "";

    }


    protected void btnSaveDist_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from district where delStatus<>1 AND distName='" + txtDistrict.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.DIVISION = ddlDivisionForDist.Text;
        bllcreate.DISTRICT = txtDistrict.Text;
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();

            //bindDdlDivisionForPS();
            //bindDdlDistrictForPS();

       if (hdndistId.Value != "" && hdndistId.Value != null)
            {
                bllcreate.DISTRICTID = Convert.ToInt32(hdndistId.Value);

                bllcreate.distUpdate();

                hdndistId.Value = "";
                btnSaveDist.Text = "Create";

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('District is Updated..!!');", true);
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.distInsert();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('District is Inserted..!!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('District exists, try another name..');", true);
                }
            }

            bindDistrict();
            bindDdlDistrict();   
            txtDistrict.Text = "";

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDist();", true);
    }


    protected void btnGoPS_click(object sender, EventArgs e)
    {
        bindPoliceStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);
    }


    protected void btnSavePS_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from policeStation where delStatus<>1 AND psName='" + txtPS.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.DIVISION = ddlDivisionForPS.Text;
        bllcreate.DISTRICT = ddlDistrictForPS.Text.Replace("'","''");
        bllcreate.POLICESTATION = txtPS.Text.Replace("'", "''");
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();
        

        if (hdnpsId.Value != "" && hdnpsId.Value != null)
            {
                bllcreate.PSID = Convert.ToInt32(hdnpsId.Value);

                bllcreate.psUpdate();

                hdnpsId.Value = "";
                btnSavePS.Text = "Create";

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Police Station is Updated..!!');", true);
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.psInsert();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Police Station is Inserted..!!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Police Station exists, try another name..');", true);
                }
            }

            bindPoliceStation();
            bindDdlPS();

            txtPS.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);

    }


    protected void btnGoPO_click(object sender, EventArgs e)
    {
        bindPostOffice();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }



    protected void btnSavePO_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from postOffice where delStatus<>1 AND poName='" + txtPO.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            bllcreate.DIVISION = ddlDivisionForPO.Text;
            bllcreate.DISTRICT = ddlDistrictForPO.Text.Replace("'", "''");
            bllcreate.POLICESTATION = ddlPSForPO.Text.Replace("'", "''");
            bllcreate.POSTOFFICE = txtPO.Text.Replace("'", "''");
            bllcreate.POCODE = txtPostCode.Text;
            bllcreate.CREATEDATE = DateTime.Now;
            bllcreate.AUDITUSER = Session["UserName"].ToString();

           
        if (hdnpoId.Value != "" && hdnpoId.Value != null)
            {
                bllcreate.POID = Convert.ToInt32(hdnpoId.Value);

                bllcreate.poUpdate();

                hdnpoId.Value = "";
                btnSavePO.Text = "Create";

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Post Office is Updated..!!');", true);
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.poInsert();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Post Office is Inserted..!!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Post Office exists, try another name..');", true);
                }
            }

            bindPostOffice();
            bindDdlPOForSta();

            txtPO.Text = "";

            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);

    }


    protected void btnGoUnion_click(object sender, EventArgs e)
    {
        bindGrdUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }


    protected void btnUnion_click(object sender, EventArgs e)
    {
        string strUser = Session["UserName"].ToString();

        string count = "select count(*) from geoUnion where UnionName='" + txtUnion.Text.Replace("'", "''") + "' and delStatus<>1 ";
        int RowNumber = Convert.ToInt32(dataProvider.getResultString(count));

        if (hdnUnion.Value != "" && hdnUnion.Value != null)
        {
            string upadateUnion = "update geoUnion set UnionName='" + txtUnion.Text.Replace("'", "''") + "',division= '" + ddlDivisionUnion.SelectedItem.Text.Replace("'", "''") + "',district='" + ddlDistrictUnion.SelectedItem.Text.Replace("'", "''") + "',policestation='" + ddlPSUnion.SelectedItem.Text.Replace("'", "''") + "',postOffice='" + ddlPOForUnion.SelectedItem.Text.Replace("'", "''") + "',createUser='" + strUser + "',createDate='" + DateTime.Now + "' where UnionId='" + hdnUnion.Value + "'";
            SqlDataAdapter da = new SqlDataAdapter();
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(upadateUnion, "geoUnion");

            hdnUnion.Value = "";
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Union is Updated..!!');", true);
        }

        else
        {
            if (RowNumber == 0)
            {

                string insertUnion = "insert into geoUnion(UnionName,division,district,policestation,postOffice,createUser,createDate,delStatus)VALUES('" + txtUnion.Text.Replace("'", "''") + "','" + ddlDivisionUnion.SelectedItem.Text.Replace("'", "''") + "','" + ddlDistrictUnion.SelectedItem.Text.Replace("'", "''") + "','" + ddlPSUnion.SelectedItem.Text.Replace("'", "''") + "','" + ddlPOForUnion.SelectedItem.Text.Replace("'", "''") + "','" + strUser + "','" + DateTime.Now + "',0)";
                SqlDataAdapter da = new SqlDataAdapter();
                DataSet ds = new DataSet();
                ds = dataProvider.getDataSet(insertUnion, "geoUnion");

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Union is Inserted..!!');", true);
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Union exists, try another name..');", true);
            }

        }

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);

        bindGrdUnion();
        txtUnion.Text = "";
    }


    protected void btnGoStation_click(object sender, EventArgs e)
    {
        bindStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }


    protected void btnSaveStation_click(object sender, EventArgs e)
    {

        showHideunionpo();

        string selCountrow = "SELECT COUNT(*) from station where delStatus<>1 AND stationName='" + txtStation.Text.Replace("'", "''") + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        bllcreate.DIVISION = ddlDivisionForSta.Text.Replace("'", "''");
        bllcreate.DISTRICT = ddlDistrictForSta.Text.Replace("'", "''");
        bllcreate.POLICESTATION = ddlPSForSta.Text.Replace("'", "''");
        bllcreate.POSTOFFICE = ddlPOForSta.Text.Replace("'", "''");
        bllcreate.UNION = ddlUnionStation.SelectedItem.Text.Replace("'", "''");
        bllcreate.STATIONBAN = txtStationBan.Text.Replace("'", "''");
        bllcreate.STATIONENG = txtStation.Text.Replace("'", "''");
        bllcreate.DEFAULTCOPY = Convert.ToInt32(txtDefaultCopy.Text.Replace("'", "''"));
        bllcreate.PACKTYPE = ddlPackType.Text;
        bllcreate.SUBROUTENAME = ddlSubRouteName.Text.Replace("'", "''");
        bllcreate.SORTINGORDER =float.Parse(txtSortingOrder.Text);
        bllcreate.CREATEDATE = DateTime.Now;
        bllcreate.AUDITUSER = Session["UserName"].ToString();
    
        if (hdnStationId.Value != "" && hdnStationId.Value != null)
            {
                bllcreate.STATIONID = Convert.ToInt32(hdnStationId.Value);

                bllcreate.stationUpdate();

                hdnStationId.Value = "";
                btnSaveStation.Text = "Create";

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Station is Updated..!!');", true);
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllcreate.stationInsert();
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Station is Inserted..!!');", true);
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Station exists, try another name..');", true);
                }
            }

            bindStation();
            bindDdlSubRouteName();

            txtStationBan.Text = "";
            txtStation.Text = "";
            txtDefaultCopy.Text = "";
            txtSortingOrder.Text = "";
            ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);

    }



    #endregion



    #region ALL GRID


    // Division Grid


    private void bindDivision()
    {
        string selDiv = "SELECT * from division where delStatus<>1 ORDER BY divName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selDiv, "division");
        grdDivision.DataSource = ds;
        grdDivision.DataBind();
    }


    protected void grdDivision_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "DIVISIONID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
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


            grdDivision.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdDivision_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdDivision.PageIndex = e.NewPageIndex;
        grdDivision.DataBind();
        bindDivision();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDiv();", true);
    }
    protected void grdDivision_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_Division(rowIndex);
    }

    private void PopulateLabelsByRowIndex_Division(int rowIndex)
    {

        hdndivId.Value = HttpUtility.HtmlDecode(grdDivision.Rows[rowIndex].Cells[0].Text);
        txtDivision.Text = HttpUtility.HtmlDecode(grdDivision.Rows[rowIndex].Cells[1].Text);

        btnSaveDiv.Text = "Update";

        bindDivision();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDiv();", true);

    }
    protected void grdDivision_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("linkButtonEditDiv");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Division: " +
            DataBinder.Eval(e.Row.DataItem, "divName") + "')");

        }
    }
    protected void grdDivision_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int divId = (int)grdDivision.DataKeys[e.RowIndex].Value;
        bllcreate.DIVISIONID = divId;
        bllcreate.divDelete();
        bindDivision();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDiv();", true);
    }




    // District Grid

    private void bindDistrict()
    {
        string selDist = "SELECT * from district where delStatus<>1 AND divName= '" + ddlDivisionForDist.SelectedItem.Text + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selDist, "district");
        grdDistrict.DataSource = ds;
        grdDistrict.DataBind();

    }

    protected void grdDistrict_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "DISTRICTID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "District";
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


            grdDistrict.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdDistrict_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdDistrict.PageIndex = e.NewPageIndex;
        grdDistrict.DataBind();
        bindDistrict();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDist();", true);
    }
    protected void grdDistrict_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_District(rowIndex);
    }

    private void PopulateLabelsByRowIndex_District(int rowIndex)
    {

        hdndistId.Value = HttpUtility.HtmlDecode(grdDistrict.Rows[rowIndex].Cells[0].Text);
        ddlDivisionForDist.Text = HttpUtility.HtmlDecode(grdDistrict.Rows[rowIndex].Cells[1].Text);
        txtDistrict.Text = HttpUtility.HtmlDecode(grdDistrict.Rows[rowIndex].Cells[2].Text);

        btnSaveDist.Text = "Update";

        bindDistrict();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDist();", true);

    }
    protected void grdDistrict_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete District: " +
            DataBinder.Eval(e.Row.DataItem, "distName") + "')");

        }
    }
    protected void grdDistrict_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int distId = (int)grdDistrict.DataKeys[e.RowIndex].Value;
        bllcreate.DISTRICTID = distId;
        bllcreate.distDelete();
        bindDistrict();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showDist();", true);
    }



    // Police Station Grid

    private void bindPoliceStation()
    {
        string selPS = "";

        if (txtPS.Text != "" && txtPS.Text != null)
        {
            selPS = "SELECT * from policeStation where delStatus<>1 AND psName like '%" + txtPS.Text.Replace("'", "''") + "%' ";
        }
        else
        {
            selPS = "SELECT * from policeStation where delStatus<>1 AND distName like '%" + ddlDistrictForPS.SelectedItem.Text.Replace("'","''") + "%' AND divName= '" + ddlDivisionForPS.SelectedItem.Text + "' ";
        }
            
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selPS, "policeStation");
        grdPS.DataSource = ds;
        grdPS.DataBind();

    }

    protected void grdPS_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "PSID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "District";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Police Station";
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


            grdPS.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdPS_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPS.PageIndex = e.NewPageIndex;
        grdPS.DataBind();
        bindPoliceStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);
    }
    protected void grdPS_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_PS(rowIndex);
    }

    private void PopulateLabelsByRowIndex_PS(int rowIndex)
    {

        hdnpsId.Value = HttpUtility.HtmlDecode(grdPS.Rows[rowIndex].Cells[0].Text);
        ddlDivisionForPS.Text = HttpUtility.HtmlDecode(grdPS.Rows[rowIndex].Cells[1].Text);
        ddlDistrictForPS.Text = HttpUtility.HtmlDecode(grdPS.Rows[rowIndex].Cells[2].Text);
        txtPS.Text = HttpUtility.HtmlDecode(grdPS.Rows[rowIndex].Cells[3].Text);

        btnSavePS.Text = "Update";

        bindPoliceStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);

    }
    protected void grdPS_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDeletePS");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Police Station: " +
            DataBinder.Eval(e.Row.DataItem, "psName") + "')");

        }
    }
    protected void grdPS_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int psId = (int)grdPS.DataKeys[e.RowIndex].Value;
        bllcreate.PSID = psId;
        bllcreate.psDelete();

        bindPoliceStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPS();", true);
    }



    // Post Office Grid

    private void bindPostOffice()
    {
        string selPO = "";

        if (txtPO.Text != "" && txtPO.Text != null)
        {
            selPO = "SELECT * from postOffice where delStatus<>1 AND poName like '%" + txtPO.Text + "%' ";
        }
        else
        {
            selPO = "SELECT * from postOffice where delStatus<>1 AND psName = '" + ddlPSForPO.SelectedItem.Text.Replace("'","''") + "' ";
        }

         
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selPO, "postOffice");
        grdPO.DataSource = ds;
        grdPO.DataBind();

    }

    protected void grdPO_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "POID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "District";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Police Station";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Post Office";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Post Code";
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


            grdPO.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdPO_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdPO.PageIndex = e.NewPageIndex;
        grdPO.DataBind();

        bindPostOffice();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }
    protected void grdPO_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_PO(rowIndex);
    }

    private void PopulateLabelsByRowIndex_PO(int rowIndex)
    {

        hdnpoId.Value = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[0].Text);
        ddlDivisionForPO.Text = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[1].Text);
        ddlDistrictForPO.Text = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[2].Text);
        ddlPSForPO.Text = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[3].Text);
        txtPO.Text = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[4].Text);
        txtPostCode.Text = HttpUtility.HtmlDecode(grdPO.Rows[rowIndex].Cells[5].Text);

        btnSavePO.Text = "Update";

        bindPostOffice();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);

    }
    protected void grdPO_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Post Office: " +
            DataBinder.Eval(e.Row.DataItem, "poName") + "')");

        }
    }
    protected void grdPO_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int poId = (int)grdPO.DataKeys[e.RowIndex].Value;
        bllcreate.POID = poId;
        bllcreate.poDelete();

        bindPostOffice();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showPO();", true);
    }




    // Union Grid


    private void bindGrdUnion()
    {
        string selUnion = "";

        if (txtUnion.Text != "" && txtUnion.Text != null)
        {
            selUnion = "SELECT * from geoUnion where delStatus<>1 AND UnionName like '%" + txtUnion.Text.Replace("'", "''") + "%' ";
        }
        else
        {
            selUnion = "SELECT * from geoUnion where delStatus<>1 AND postOffice = '" + ddlPOForUnion.SelectedItem.Text.Replace("'", "''") + "' ORDER BY UnionName ASC";
        }
         
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selUnion, "geoUnion");
        grdUnion.DataSource = ds;
        grdUnion.DataBind();
    }


    protected void grdUnion_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Union Id";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "District";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Police Station";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Post Office";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Union";
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


            grdUnion.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdUnion_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdUnion.PageIndex = e.NewPageIndex;
        grdUnion.DataBind();
        bindGrdUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }
    protected void grdUnion_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_Union(rowIndex);
    }

    private void PopulateLabelsByRowIndex_Union(int rowIndex)
    {

        hdnUnion.Value = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[0].Text);
        ddlDivisionUnion.Text = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[1].Text);

        strDivision = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[1].Text);

        bindDdlDistrict();

        ddlDistrictUnion.Text = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[2].Text);

        strDistrict = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[2].Text);

        bindDdlPS();

        ddlPSUnion.Text = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[3].Text);
        txtUnion.Text = HttpUtility.HtmlDecode(grdUnion.Rows[rowIndex].Cells[4].Text);

        btnSaveDiv.Text = "Update";

        bindGrdUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);

    }
    protected void grdUnion_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Union: " +
            DataBinder.Eval(e.Row.DataItem, "UnionName") + "')");

        }
    }
    protected void grdUnion_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string strUser = Session["UserName"].ToString();

        int unionId = (int)grdUnion.DataKeys[e.RowIndex].Value;

        string upadateUnion = "update geoUnion set delStatus=1,createUser='" + strUser + "',createDate='" + DateTime.Now + "' where UnionId='" + unionId + "'";
        SqlDataAdapter da = new SqlDataAdapter();
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(upadateUnion, "geoUnion");

        bindGrdUnion();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showUnion();", true);
    }





    // Station Grid

    private void bindStation()
    {
        string selStation = "";

        if (txtStation.Text != "" && txtStation.Text != null)
        {
            selStation = "SELECT * from station where delStatus<>1 AND stationName like '%" + txtStation.Text.Replace("'", "''") + "%' ";

        }
        else
        {
            selStation = "SELECT * from station where delStatus<>1 AND poName = '" + ddlPOForSta.SelectedItem.Text.Replace("'", "''") + "' ";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(selStation, "station");
        grdStation.DataSource = ds;
        grdStation.DataBind();

    }

    protected void grdStation_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "STATIONID";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Division";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "District";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Police Station";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Post Office";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Union";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station(Ban)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station(Eng)";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Default Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Pack Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sorting Order";
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


            grdStation.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void grdStation_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grdStation.PageIndex = e.NewPageIndex;
        grdStation.DataBind();

        bindStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }
    protected void grdStation_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        int rowIndex = e.NewSelectedIndex;
        PopulateLabelsByRowIndex_Station(rowIndex);
    }

    private void PopulateLabelsByRowIndex_Station(int rowIndex)
    {

        hdnStationId.Value = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[0].Text);
        ddlDivisionForSta.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[1].Text);

        strDivision = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[1].Text);

        bindDdlDistrict();

        ddlDistrictForSta.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[2].Text);

        bindDdlPS();

        ddlPSForSta.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[3].Text);

        bindDdlPOForSta();

        showHideunionpo();

        ddlUnionStation.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[5].Text);

        ddlPOForSta.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[4].Text);
               
        
        txtStationBan.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[6].Text);
        txtStation.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[7].Text);
        txtDefaultCopy.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[8].Text);
        ddlPackType.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[9].Text);
        ddlSubRouteName.SelectedItem.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[10].Text);
        txtSortingOrder.Text = HttpUtility.HtmlDecode(grdStation.Rows[rowIndex].Cells[11].Text);

        btnSaveStation.Text = "Update";

        bindStation();

        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);

    }
    protected void grdStation_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete Station: " +
            DataBinder.Eval(e.Row.DataItem, "stationName") + "')");

        }
    }
    protected void grdStation_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int stationId = (int)grdStation.DataKeys[e.RowIndex].Value;
        bllcreate.STATIONID = stationId;
        bllcreate.stationDelete();

        bindStation();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showSta();", true);
    }




    #endregion






}