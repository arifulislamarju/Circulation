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

public partial class weeklyRateSetup : System.Web.UI.Page
{

    bll_weeklyRateSetup bllRate = new bll_weeklyRateSetup();
    clsDataProvider dataProvider = new clsDataProvider();


    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            BindddlCategory();
        }

        

        string selCountrow = "SELECT COUNT(*) from weeklyRateSetup where category='" + ddlCategory.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            if (rowNumber == 0)
            {
                btnSave.Text = "New";
            }

            if (rowNumber != 0)
            {
                btnSave.Text = "Update";
            }

            if (!Page.IsPostBack)
            {
                readData();
            }

            

            clsHelper.CheckLogin();
    }

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

    private void readData()
    {   

        bool flaghasDta = true;

        string sel = "select day,noOfPage,rate from weeklyRateSetup where category='"+ddlCategory.SelectedItem.Text+"'";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            string strDay = sdr["day"].ToString();

            if (strDay == "SAT")
            {
                txtSatPage.Text = sdr["noOfPage"].ToString();
                txtSatRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "SUN")
            {
                txtSunPage.Text = sdr["noOfPage"].ToString();
                txtSunRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "MON")
            {
                txtMonPage.Text = sdr["noOfPage"].ToString();
                txtMonRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "TUE")
            {
                txtTuesPage.Text = sdr["noOfPage"].ToString();
                txtTuesRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "WED")
            {
                txtWedPage.Text = sdr["noOfPage"].ToString();
                txtWedRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "THU")
            {
                txtThursPage.Text = sdr["noOfPage"].ToString();
                txtThursRate.Text = sdr["rate"].ToString();
            }

            if (strDay == "FRI")
            {
                txtFriPage.Text = sdr["noOfPage"].ToString();
                txtFriRate.Text = sdr["rate"].ToString();
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

            txtSatRate.Text = "";
            txtSunRate.Text = "";
            txtMonRate.Text = "";
            txtTuesRate.Text = "";
            txtWedRate.Text = "";
            txtThursRate.Text = "";
            txtFriRate.Text = "";
        }

    }



    protected void btnSave_click(object sender, EventArgs e)
    {

        bllRate.SAT = lblSat.Text;
        bllRate.SATPAGE = Convert.ToInt32(txtSatPage.Text);
        bllRate.SATRATE = Convert.ToInt32(txtSatRate.Text);

        bllRate.SUN = lblSun.Text;
        bllRate.SUNPAGE = Convert.ToInt32(txtSunPage.Text);
        bllRate.SUNRATE = Convert.ToInt32(txtSunRate.Text);

        bllRate.MON = lblMon.Text;
        bllRate.MONPAGE = Convert.ToInt32(txtMonPage.Text);
        bllRate.MONRATE = Convert.ToInt32(txtMonRate.Text);

        bllRate.TUES = lblTues.Text;
        bllRate.TUESPAGE = Convert.ToInt32(txtTuesPage.Text);
        bllRate.TUESRATE = Convert.ToInt32(txtTuesRate.Text);

        bllRate.WED = lblWed.Text;
        bllRate.WEDPAGE = Convert.ToInt32(txtWedPage.Text);
        bllRate.WEDRATE = Convert.ToInt32(txtWedRate.Text);

        bllRate.THURS = lblThurs.Text;
        bllRate.THURSPAGE = Convert.ToInt32(txtThursPage.Text);
        bllRate.THURSRATE = Convert.ToInt32(txtThursRate.Text);

        bllRate.FRI = lblFri.Text;
        bllRate.FRIPAGE = Convert.ToInt32(txtFriPage.Text);
        bllRate.FRIRATE = Convert.ToInt32(txtFriRate.Text);
        bllRate.CATEGORY = ddlCategory.SelectedItem.Text;


        if (btnSave.Text == "New")
        {
            bllRate.Insert();
        }

        if (btnSave.Text == "Update")
        {
            Update();          
        }

        readData();


        btnSave.Text = "Update";
    }



    private void Update()
    {

        int intNopage = 0;
        int intRate = 0;
        string strDay = "";

        string sel = "select day,noOfPage,rate from weeklyRateSetup where category='" + ddlCategory.SelectedItem.Text + "'";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            strDay = sdr["day"].ToString();

            if (strDay == "SAT")
            {
                intNopage = Int32.Parse(txtSatPage.Text);
                intRate = Int32.Parse(txtSatRate.Text);
            }

            if (strDay == "SUN")
            {
                intNopage = Convert.ToInt32(txtSunPage.Text);
                intRate = Convert.ToInt32(txtSunRate.Text);
            }

            if (strDay == "MON")
            {
                intNopage = Convert.ToInt32(txtMonPage.Text);
                intRate = Convert.ToInt32(txtMonRate.Text);
            }

            if (strDay == "TUE")
            {
                intNopage = Convert.ToInt32(txtTuesPage.Text);
                intRate = Convert.ToInt32(txtTuesRate.Text);
            }

            if (strDay == "WED")
            {
                intNopage = Convert.ToInt32(txtWedPage.Text);
                intRate = Convert.ToInt32(txtWedRate.Text);
            }

            if (strDay == "THU")
            {
                intNopage = Convert.ToInt32(txtThursPage.Text);
                intRate = Convert.ToInt32(txtThursRate.Text);
            }

            if (strDay == "FRI")
            {
                intNopage = Convert.ToInt32(txtFriPage.Text);
                intRate = Convert.ToInt32(txtFriRate.Text);
            }


            string cmd = "update weeklyRateSetup set noOfPage = '" + intNopage + "', rate = '" + intRate + "' where day = '" + strDay + "' and category='" + ddlCategory.SelectedItem.Text + "'  ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readData();

    }


    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        readData();
    }
}