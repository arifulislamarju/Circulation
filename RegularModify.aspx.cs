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
using System.Data.Common;

public partial class RegularModify : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindddlCategory();
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

    protected void txtOrderDate_TextChanged(object sender, EventArgs e)
    {        
        bindAgent();
    }

    protected void ddlAgentName_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        bindStation();
    }

    protected void ddlStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        readData();
    }

    private void readData()
    {   
        bool  hasData=false;
        string sel = "select * from regularModify where postStatus<>1 AND stationName = '" + ddlStation.SelectedItem.Text.Replace("'", "''") + "' AND hkrNameEng ='" + ddlAgentName.SelectedItem.Text.Replace("'", "''") + "' AND orderDate='" + txtOrderDate.Text + "' AND Category='"+ddlCategory.SelectedItem.Text+"' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            txtQuantity.Text = sdr["quantity"].ToString();
            txtBonusCopy.Text = sdr["bonusCopy"].ToString();
            txtComplementary.Text = sdr["complementaryCopy"].ToString();
            txtDaywiseDefQty.Text = sdr["daywiseDefQuanttity"].ToString();
            txtDaywiseChngQty.Text = sdr["daywiseChngQuantity"].ToString();
            txtSmsQuantity.Text = sdr["smsQuantity"].ToString();
            ddlPacketType.SelectedItem.Text = sdr["packetType"].ToString();
            txtoeId.Text = sdr["oeId"].ToString();
           
            hasData=true;
        }

        if(hasData==false)
        {
            txtQuantity.Text = "";
            txtDaywiseChngQty.Text = "";
            txtBonusCopy.Text = "";
        }
    }


    #region All Binds
    
    private void bindAgent()
    {
        DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);

        string query = "SELECT  hkrNameEng from regularModify where postStatus<>1 AND orderDate = '" + orderDate + "' GROUP BY hkrNameEng Order By hkrNameEng ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "hkrNameEng");
        ddlAgentName.DataSource = ds;
        ddlAgentName.DataTextField = "hkrNameEng";
        ddlAgentName.DataValueField = "hkrNameEng";
        ddlAgentName.DataBind();
    }
    
    private void bindStation()
    {
        string selRow = "SELECT  count(*) from regularModify where hkrNameEng='" + ddlAgentName.SelectedItem.Text.Replace("'","''") + "' AND postStatus<>1";
        int count = Convert.ToInt32(dataProvider.getResultString(selRow));

        if (count != 0)
        {
            string query = "SELECT  stationName from regularModify where postStatus<>1 AND hkrNameEng = '" + ddlAgentName.SelectedItem.Text.Replace("'", "''") + "' GROUP BY stationName Order By stationName ASC ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(query, "stationName");
            ddlStation.DataSource = ds;
            ddlStation.DataTextField = "stationName";
            ddlStation.DataValueField = "stationName";
            ddlStation.DataBind();
            ddlStation.Items.Insert(0, "--Select--"); 
        }
    }

    #endregion


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int daywiseChngQuantity = Convert.ToInt32(txtDaywiseChngQty.Text);
        int bonusCopy = Convert.ToInt32(txtBonusCopy.Text);
        string packetType = ddlPacketType.SelectedItem.Text;

        string cmd = "update orderEntry set daywiseChngQuantity = '" + daywiseChngQuantity + "', bonusCopy = '" + bonusCopy + "', packetType = '" + packetType + "' where oeId = '" + txtoeId.Text + "' AND Catagory='" + ddlCategory.SelectedItem.Text + "' ";
        dataProvider.ExecuteCommand(cmd);

        txtQuantity.Text = "";
        txtDaywiseChngQty.Text = "";
        txtBonusCopy.Text = "";
    }



    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindStation();
        //readData();
    }
}