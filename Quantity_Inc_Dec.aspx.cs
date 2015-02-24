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

public partial class Quantity_Inc_Dec : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    public string strDistrictFrom = "";
    public string strDistrictTo = "";
    public string strDivisionFrom = "";
    public string strDivisionTo = "";
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            bindAgent();
            bindRoute();
            bindsubRoute();
            bindDivision();
            bindDistrictFrom();

            bindDistrictTo();

            bindPSFrom();
            bindPSTo();
            //bindPO();

            BindddlCategory();
        }

        clsHelper.CheckLogin();
    }

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

    private void bindAgent()
    {
        string query = "SELECT DISTINCT customerId from orderEntry Order By customerId ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "customerId");

        ddlFrmAgent.DataSource = ds;
        ddlFrmAgent.DataTextField = "customerId";        
        ddlFrmAgent.DataBind();
        ddlFrmAgent.Items.Insert(0, "--Select--");

        ddlToAgent.DataSource = ds;
        ddlToAgent.DataTextField = "customerId";        
        ddlToAgent.DataBind();

        ddlToAgent.Items.Insert(0, "--Select--");
        
    }
    
    private void bindRoute()
    {
        string query = "SELECT distinct routeName from subRoute where delStatus<>1 Order By routeName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "routeName");

        ddlFrmRoute.DataSource = ds;
        ddlFrmRoute.DataTextField = "routeName";
        ddlFrmRoute.DataBind();

        ddlToRoute.DataSource = ds;
        ddlToRoute.DataTextField = "routeName";
        ddlToRoute.DataBind();

                
    }

    private void bindsubRoute()
    {
        string query = "SELECT  subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");

        ddlFrmSubRoute.DataSource = ds;
        ddlFrmSubRoute.DataTextField = "subRouteName";        
        ddlFrmSubRoute.DataBind();
        ddlFrmSubRoute.Items.Insert(0, "--Select--");

        ddlToSubRoute.DataSource = ds;
        ddlToSubRoute.DataTextField = "subRouteName";
        ddlToSubRoute.DataBind();

        
        ddlToSubRoute.Items.Insert(0, "--Select--");
    }


    private void bindDivision()
    {
        string query = "SELECT divName from division where delStatus<>1 Order By divName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "divName");

        ddlFrmDivision.DataSource = ds;
        ddlFrmDivision.DataTextField = "divName";        
        ddlFrmDivision.DataBind();

        ddlToDivision.DataSource = ds;
        ddlToDivision.DataTextField = "divName";        
        ddlToDivision.DataBind();

        ddlFrmDivision.Items.Insert(0, "--Select--");
        ddlToDivision.Items.Insert(0, "--Select--");
    }


    private void bindDistrictFrom()
    {
        string query = "";

        if (strDivisionFrom != null && strDivisionFrom != "")
        {
            query = "SELECT distName from district where delStatus<>1 AND divName='" + strDivisionFrom + "' Order By distName ASC ";
        }

        else
        {
            query = "SELECT distName from district where delStatus<>1  Order By distName ASC ";
        }
        
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "distName");

        ddlFrmDistrict.DataSource = ds;
        ddlFrmDistrict.DataTextField = "distName";        
        ddlFrmDistrict.DataBind();
        ddlFrmDistrict.Items.Insert(0, "--Select--");
    }

    private void bindDistrictTo()
    {
        string query = "";

        if (strDivisionTo != null && strDivisionTo != "")
        {
            query = "SELECT distName from district where delStatus<>1 AND divName='" + strDivisionTo + "' Order By distName ASC ";
        }

        else
        {
            query = "SELECT distName from district where delStatus<>1  Order By distName ASC ";
        }
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "distName");

        ddlToDistrict.DataSource = ds;
        ddlToDistrict.DataTextField = "distName";
        ddlToDistrict.DataValueField = "distName";
        ddlToDistrict.DataBind();        
        ddlToDistrict.Items.Insert(0, "--Select--");
    }


    private void bindPSFrom()
    {
        string query = "";

        if (strDistrictFrom != null && strDistrictFrom != "")
        {
            query = "SELECT psName from policeStation where delStatus<>1 AND distName='" + strDistrictFrom + "' Order By psName ASC ";
        }

        else
        {
            query = "SELECT psName from policeStation where delStatus<>1  Order By psName ASC ";
        }
                
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "psName");

        ddlFrmPS.DataSource = ds;
        ddlFrmPS.DataTextField = "psName";
        ddlFrmPS.DataValueField = "psName";
        ddlFrmPS.DataBind();

        ddlFrmPS.Items.Insert(0, "--Select--");
        
    }
    private void bindPSTo()
    {
        string query = "";

        if (strDistrictTo != null && strDistrictTo != "")
        {
            query = "SELECT psName from policeStation where delStatus<>1 AND distName='" + strDistrictTo + "' Order By psName ASC ";
        }

        else
        {
            query = "SELECT psName from policeStation where delStatus<>1  Order By psName ASC ";
        }
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "psName");
              
        ddlToPS.DataSource = ds;
        ddlToPS.DataTextField = "psName";
        ddlToPS.DataValueField = "psName";
        ddlToPS.DataBind();

        
        ddlToPS.Items.Insert(0, "--Select--");
    }


    //private void bindPO()
    //{
    //    string query = "SELECT poName from station where delStatus<>1 Order By poName ASC ";
    //    DataSet ds = new DataSet();
    //    ds = dataProvider.getDataSet(query, "poName");

    //    ddlFrmPO.DataSource = ds;
    //    ddlFrmPO.DataTextField = "poName";
    //    ddlFrmPO.DataValueField = "poName";
    //    ddlFrmPO.DataBind();

    //    ddlToPO.DataSource = ds;
    //    ddlToPO.DataTextField = "poName";
    //    ddlToPO.DataValueField = "poName";
    //    ddlToPO.DataBind();

    //    ddlFrmPO.Items.Insert(0, "--Select--");
    //    ddlToPO.Items.Insert(0, "--Select--");
    //}


    #endregion


    #region Button Event


    protected void btnSave_Click(object sender, EventArgs e)
    {
        string sel = "select count(orderNo) from orderEntry where orderDate='" + txtTransDate.Text + "' AND  subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "'";
        int rowNumber =Convert.ToInt32(dataProvider.getResultString(sel));

        if (rowNumber != 0)
        {


            if (IDrdoQuantity.Checked)
            {

                if (ddlChngQuantity.SelectedItem.Text == "Increase")
                {
                    string countquantity = "select quantity,stationName from orderEntry where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                    SqlDataReader sdr = dataProvider.getDataReader(countquantity);

                    while (sdr.Read())
                    {
                        string reason = txtReason.Text;
                        string station = sdr["stationName"].ToString();
                        int intQuantity = Convert.ToInt32(sdr["quantity"].ToString());
                        int quantity = (intQuantity + Convert.ToInt32(txtChngQuantity.Text));

                        string sqlstring = "update orderEntry set quantity='" + quantity + "' , modifyReason= '" + reason + "' where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' AND stationName='"+station+"' ";

                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(sqlstring, "orderEntry");
                    }
                    sdr.Close();

                }

                else if (ddlChngQuantity.SelectedItem.Text == "Decrease")
                {
                    string countquantity = "select quantity,stationName from orderEntry where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                    SqlDataReader sdr = dataProvider.getDataReader(countquantity);

                    while (sdr.Read())
                    {
                        string reason = txtReason.Text;
                        string station = sdr["stationName"].ToString();
                        int intQuantity = Convert.ToInt32(sdr["quantity"].ToString());
                        int quantity = (intQuantity - Convert.ToInt32(txtChngQuantity.Text));

                        string sqlstring = "update orderEntry set quantity='" + quantity + "' , modifyReason= '" + reason + "' where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' AND stationName='" + station + "' ";

                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(sqlstring, "orderEntry");
                    }
                    sdr.Close();

                }

                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Choose Only Increase / Decrease...');", true);
                }


            }

            else if (IDrdoQuantityPer.Checked)
            {

                if (ddlChngQuantity.SelectedItem.Text == "Increase")
                {
                    string countquantity = "select quantity,stationName from orderEntry where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                    SqlDataReader sdr = dataProvider.getDataReader(countquantity);

                    while (sdr.Read())
                    {
                        string reason = txtReason.Text;
                        string station = sdr["stationName"].ToString();
                        int intQuantity = Convert.ToInt32(sdr["quantity"].ToString());

                        decimal percent = 0.0M;
                        percent = (Convert.ToDecimal(txtChngQuantity.Text) / 100);
                        decimal finalquantity = (intQuantity + (intQuantity * percent));
                        int quantity = Convert.ToInt32(finalquantity);

                        string sqlstring = "update orderEntry set quantity='" + quantity + "' , modifyReason= '" + reason + "' where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' AND stationName='" + station + "' ";


                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(sqlstring, "orderEntry");
                    }


                }

                else if (ddlChngQuantity.SelectedItem.Text == "Decrease")
                {
                    string countquantity = "select quantity,stationName from orderEntry where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                    SqlDataReader sdr = dataProvider.getDataReader(countquantity);

                    while (sdr.Read())
                    {
                        string reason = txtReason.Text;
                        string station = sdr["stationName"].ToString();
                        int intQuantity = Convert.ToInt32(sdr["quantity"].ToString());

                        decimal percent = 0.0M;
                        percent = (Convert.ToDecimal(txtChngQuantity.Text) / 100);
                        decimal finalquantity = (intQuantity - (intQuantity * percent));
                        int quantity = Convert.ToInt32(finalquantity);

                        string sqlstring = "update orderEntry set quantity='" + quantity + "' , modifyReason= '" + reason + "' where  orderDate='" + txtTransDate.Text + "' AND subRoute='" + ddlFrmSubRoute.SelectedItem.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' AND stationName='" + station + "' ";


                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(sqlstring, "orderEntry");
                    }
                }

                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Choose Only Increase / Decrease...');", true);
                }

            }

        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Invalid Order Date......');", true);
        }
    }

    #endregion

    protected void ddlFrmDivision_SelectedIndexChanged(object sender, EventArgs e)
    {

        strDivisionFrom = ddlFrmDivision.SelectedItem.Text;

        bindDistrictFrom();
    }
    protected void ddlToDivision_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDivisionTo = ddlToDivision.SelectedItem.Text;

        bindDistrictTo();
    }
    protected void ddlFrmDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDistrictFrom = ddlFrmDistrict.SelectedItem.Text;

        bindPSFrom();
    }
    protected void ddlToDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        strDistrictTo = ddlToDistrict.SelectedItem.Text;

        bindPSTo();
    }
}