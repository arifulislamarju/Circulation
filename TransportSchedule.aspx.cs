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

public partial class TransportSchedule : System.Web.UI.Page
{
    bll_TransportSchedule bllcreate = new bll_TransportSchedule();
    clsDataProvider dataProvider = new clsDataProvider();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from transportSchedule where delStatus<>1 AND transportId='" + txtTransId.Text + "'  ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            btnSave.Text = "Create";
        }

        if (rowNumber != 0)
        {
            btnSave.Text = "Update";
        }
        
        if (!Page.IsPostBack)
        {
            

            bindDdlRoute();
            
            string route = "SELECT  count(routeName) from route where delStatus<>1 ";
            int countRoute = Convert.ToInt32(dataProvider.getResultString(route));

            if (countRoute != 0)
            {
                bindDdlSubRoute();
            }

            string subRoute = "SELECT  count(subRouteName) from subRoute where delStatus<>1 AND routeName='" + ddlRouteName.SelectedItem.Text + "' ";
            int countSubRoute = Convert.ToInt32(dataProvider.getResultString(subRoute));

            if (countSubRoute != 0)
            {
                bindDdlVehicle();
                bindDeparTime();
                bindArrivTime();

            }

            string vehicle = "SELECT  count(vehicleName) from vehicle where delStatus<>1 AND subRoute='" + ddlSubRouteName.SelectedItem.Text + "' ";
            int countVehicle = Convert.ToInt32(dataProvider.getResultString(vehicle));           
                        
            if (countVehicle != 0)
            {
                bindCapacity();
            }
            
            BindHH();
            BindMM();

            bindDdlPapername();
            //readData();

        }

        clsHelper.CheckLogin();
    }

    #region All Binds

    private void BindMM()
    {
        for (int i = 0; i <= 59; i++)
        {
            ListItem itemMin = new ListItem(i.ToString(),i.ToString());
            string minutes = "";
            if (i < 10)
            {
                minutes = "0" + itemMin;
                ddlDpMin.Items.Add(minutes);
                ddlArMin.Items.Add(minutes);
            }
            else
            {
                ddlDpMin.Items.Add(itemMin);
                ddlArMin.Items.Add(itemMin);
            }
        }
    }

    private void BindHH()
    {
        for (int i = 1; i <= 12; i++)
        {
            ListItem item = new ListItem(i.ToString(), i.ToString());
            ddlDpHr.Items.Add(item);
            ddlArHr.Items.Add(item);
        }
    }



    protected void ddlRouteName_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlSubRoute();
    }


    protected void ddlSubRouteName_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlVehicle();
        bindDeparTime();
        bindArrivTime();
    }


    protected void ddlVehicleName_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindCapacity();
    }
    
    private void bindDdlRoute()
    {
        string query = "SELECT routeName from route where delStatus<>1 Order By routeName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "routeName");
        ddlRouteName.DataSource = ds;
        ddlRouteName.DataTextField = "routeName";
        ddlRouteName.DataValueField = "routeName";
        ddlRouteName.DataBind();

    }

    private void bindDdlPapername()
    {
        string query = "SELECT DISTINCT PAPERNAME from PCOMPARE where USTATUS<>1 Order By PAPERNAME ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "PAPERNAME");
        ddlPaperName.DataSource = ds;
        ddlPaperName.DataTextField = "PAPERNAME";
        ddlPaperName.DataValueField = "PAPERNAME";
        ddlPaperName.DataBind();

    }



    private void bindDdlSubRoute()
    {
        string query = "SELECT subRouteName from subRoute where delStatus<>1 AND routeName='" + ddlRouteName.SelectedItem.Text + "' Order By subRouteName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");
        ddlSubRouteName.DataSource = ds;
        ddlSubRouteName.DataTextField = "subRouteName";
        ddlSubRouteName.DataValueField = "subRouteName";
        ddlSubRouteName.DataBind();

    }


    private void bindDdlVehicle()
    {
        string query = "SELECT vehicleName from vehicle where delStatus<>1 AND subRoute='" + ddlSubRouteName.SelectedItem.Text + "' AND route ='" + ddlRouteName.SelectedItem.Text + "' Order By vehicleName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "vehicleName");
        ddlVehicleName.DataSource = ds;
        ddlVehicleName.DataTextField = "vehicleName";
        ddlVehicleName.DataValueField = "vehicleName";
        ddlVehicleName.DataBind();

    }


    private void bindDeparTime()
    {
        string query = "SELECT departTime from subRoute where delStatus<>1 AND subRouteName='" + ddlSubRouteName.SelectedItem.Text + "' Order By departTime ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "departTime");
        ddlDeparture.DataSource = ds;
        ddlDeparture.DataTextField = "departTime";
        ddlDeparture.DataValueField = "departTime";
        ddlDeparture.DataBind();

    }


    private void bindArrivTime()
    {
        string query = "SELECT arrivTime from subRoute where delStatus<>1 AND subRouteName='" + ddlSubRouteName.SelectedItem.Text + "' Order By arrivTime ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "arrivTime");
        ddlArrival.DataSource = ds;
        ddlArrival.DataTextField = "arrivTime";
        ddlArrival.DataValueField = "arrivTime";
        ddlArrival.DataBind();

    }


    private void bindCapacity()
    {
        string Capacity = "SELECT capacity from vehicle where delStatus<>1 AND vehicleName='" + ddlVehicleName.SelectedItem.Text + "' ";
        int intCapacity = Convert.ToInt32(dataProvider.getResultString(Capacity));
        txtCapacity.Text = intCapacity.ToString();
    }

    #endregion


    #region All Private Functions

    private void readData()
    {
        bool flaghasDta = true;

        string sel = "select * from transportSchedule where delStatus<>1 and transportId='" + txtTransId.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            txtTransId.Text = sdr["transportId"].ToString();
            txtTransDate.Text = sdr["transactionDate"].ToString();
            ddlRouteName.SelectedItem.Text = sdr["routeName"].ToString();

            string subroute = "SELECT subRouteName from transportSchedule where delStatus<>1 AND routeName='" + ddlRouteName.SelectedItem.Text + "' Order By subRouteName ASC";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(subroute, "subRouteName");
            ddlSubRouteName.DataSource = ds;
            ddlSubRouteName.DataTextField = "subRouteName";
            ddlSubRouteName.DataValueField = "subRouteName";
            ddlSubRouteName.DataBind();
            //ddlSubRouteName.SelectedItem.Text = sdr["subRouteName"].ToString();

            txtSortingOrder.Text = sdr["sortingOrder"].ToString();

            string vehicle = "SELECT vehicleName from transportSchedule where delStatus<>1 AND subRouteName='" + ddlSubRouteName.SelectedItem.Text + "' AND routeName ='" + ddlRouteName.SelectedItem.Text + "' Order By vehicleName ASC";
            DataSet ds1 = new DataSet();
            ds1 = dataProvider.getDataSet(vehicle, "vehicleName");
            ddlVehicleName.DataSource = ds;
            ddlVehicleName.DataTextField = "vehicleName";
            ddlVehicleName.DataValueField = "vehicleName";
            //ddlVehicleName.DataBind();
            //ddlVehicleName.SelectedItem.Text = sdr["vehicleName"].ToString();

            txtOwnerName.Text = sdr["ownerName"].ToString();
            txtDriverName.Text = sdr["driverName"].ToString();
            txtLicense.Text = sdr["licenseNo"].ToString();
            ddlDeparture.SelectedItem.Text = sdr["departureTime"].ToString();
            ddlArrival.SelectedItem.Text = sdr["arrivalTime"].ToString();
            txtCapacity.Text = sdr["capacity"].ToString();
            txtActualCopy.Text = sdr["actualCopy"].ToString();
            ddlPaperName.Text = sdr["paperName"].ToString();
            txtPionName.Text = sdr["pionName"].ToString();
            txtReasonDelay.Text = sdr["delayReason"].ToString();

            flaghasDta = false;

        }

        if (flaghasDta == true)
        {
            //txtTransDate.Text = "";
            //txtActualCopy.Text = "";
            
        }

    }


    private void Update()
    {
        string transactionDate = "";
        string routeName = "";
        string subRouteName = "";
        string sortingOrder = "";
        string vehicleName = "";
        string ownerName = "";
        string driverName = "";
        string licenseNo = "";
        string departureTime = "";
        string arrivalTime = "";
        string capacity = "";
        int actualCopy = 0;

        string ddlDpHH = "";
        string ddlDpMM = "";
        string ddlDpAmPm = "";
        string ddlArHH = "";
        string ddlArMM = "";
        string ddlArAmPm = "";
        string actDeparture = "";
        string actArrival = "";
        string paperName = "";
        string pionName = "";
        string delayReason = "";
        string auditUser = "";

        string sel = "select * from transportSchedule where delStatus<>1 AND transportId='" + txtTransId.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            transactionDate = txtTransDate.Text;
            routeName = ddlRouteName.Text;
            subRouteName = ddlSubRouteName.Text;
            sortingOrder = txtSortingOrder.Text;
            vehicleName = ddlVehicleName.Text;
            departureTime = ddlDeparture.Text;
            arrivalTime = ddlArrival.Text;
            ownerName = txtOwnerName.Text;
            driverName = txtDriverName.Text;
            licenseNo = txtLicense.Text;
            capacity = txtCapacity.Text;
            actualCopy = Convert.ToInt32(txtActualCopy.Text);

            ddlDpHH = ddlDpHr.Text;
            ddlDpMM = ddlDpMin.Text;
            ddlDpAmPm = ddlDpAMPM.Text;

            ddlArHH = ddlArHr.Text;
            ddlArMM = ddlArMin.Text;
            ddlArAmPm = ddlArAMPM.Text;

            actDeparture = ddlDpHH + ":" + ddlDpMM + " " + ddlDpAmPm;
            actArrival = ddlArHH + ":" + ddlArMM + " " + ddlArAmPm;

            paperName = ddlPaperName.SelectedItem.Text;
            pionName = txtPionName.Text;
            delayReason = txtReasonDelay.Text;
            auditUser = Session["UserName"].ToString();
            DateTime createDate = DateTime.Now;


            string cmd = "update transportSchedule set transactionDate='" + transactionDate + "', routeName='" + routeName + "', subRouteName='" + subRouteName + "', sortingOrder='" + sortingOrder + "', vehicleName='" + vehicleName + "', ownerName='" + ownerName + "', driverName='" + driverName + "', licenseNo='" + licenseNo + "', departureTime='" + departureTime + "', arrivalTime='" + arrivalTime + "', capacity='" + capacity + "', actualCopy='" + actualCopy + "', actDeparture='" + actDeparture + "', actArrival='" + actArrival + "', paperName='" + paperName + "', pionName='" + pionName + "', delayReason='" + delayReason + "', auditUser='" + auditUser + "', createDate='"+ createDate +"'  where delStatus<>1 AND transportId='" + txtTransId.Text + "' ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readData();

    }


    #endregion


    #region All Buttons


    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        string MinId = "SELECT  Min(transportId) from transportSchedule where delStatus<>1 ";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtTransId.Text = intMinId.ToString();

        readData();
    }
    

    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        string MinId = "SELECT  Min(transportId) from transportSchedule where delStatus<>1 ";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));
        
        int transId = 0;

        if (txtTransId.Text == "" || txtTransId.Text == null)
        {
            transId = 1;
        }
        else
        {
            transId = Convert.ToInt32(txtTransId.Text);
            transId = transId - 1;
        }

        if (transId >= intMinId)
        {
            txtTransId.Text = transId.ToString();
            readData();
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
        }
        
    }


    protected void btnNext_Click(object sender, ImageClickEventArgs e)
    {
        string maxId = "SELECT  Max(transportId) from transportSchedule where delStatus<>1 ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        int transId = 0;

        if (txtTransId.Text == "" || txtTransId.Text == null)
        {
            transId = 1;
        }
        else
        {
            transId = Convert.ToInt32(txtTransId.Text);
            transId = transId + 1;
        }

        if (transId <= intMaxId)
        {
            txtTransId.Text = transId.ToString();

            readData();
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Forward Data...');", true);
        }
        
    }


    protected void btnLast_Click(object sender, ImageClickEventArgs e)
    {
        string maxId = "SELECT  Max(transportId) from transportSchedule where delStatus<>1 ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtTransId.Text = intMaxId.ToString();

        readData();
    }


    protected void btnNew_Click(object sender, ImageClickEventArgs e)
    {
        string countId = " SELECT  count(transportId) from transportSchedule where delStatus<>1 AND transportId = (select max(transportId)from transportSchedule)";
        int intcountId = Convert.ToInt32(dataProvider.getResultString(countId));       
        int transId = 0;

        if (intcountId == 0)
        {
            transId = 1;
        }

        else
        {
            string maxId = "select max(transportId)from transportSchedule";
            int intmaxId = Convert.ToInt32(dataProvider.getResultString(maxId));
            
            if (intmaxId != 0)
            {
                transId = intmaxId + 1;
            }
        }

        txtTransId.Text = transId.ToString();
        //txtTransDate.Text = "";
        //txtActualCopy.Text = "";

        btnSave.Text = "Create";
               
    }
    

    protected void btnSave_click(object sender, EventArgs e)
    {
        string selCountrow = "SELECT COUNT(*) from transportSchedule where delStatus<>1 AND transportId='" + txtTransId.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        string ActDeparture = ( (ddlDpHr.Text).ToString() + ":" + (ddlDpMin.Text).ToString() + " " + (ddlDpAMPM.Text).ToString() );
        string ActArrival = ( (ddlArHr.Text).ToString() + ":" + (ddlArMin.Text).ToString() + " " + (ddlArAMPM.Text).ToString() );       

        bllcreate.TRANSACTIONDATE =Convert.ToDateTime(txtTransDate.Text);
        bllcreate.ROUTE = ddlRouteName.Text;
        bllcreate.SUBROUTE = ddlSubRouteName.Text;
        bllcreate.SORTINGORDER = txtSortingOrder.Text;
        bllcreate.VEHICLENAME = ddlVehicleName.Text;
        bllcreate.OWNERNAME = txtOwnerName.Text;
        bllcreate.DRIVERNAME = txtDriverName.Text;
        bllcreate.LICENSENO = txtLicense.Text;
        bllcreate.DEPARTTIME = ddlDeparture.Text;
        bllcreate.ARRIVTIME = ddlArrival.Text;
        bllcreate.CAPACITY = txtCapacity.Text;
        bllcreate.ACTUALCOPY = Convert.ToInt32(txtActualCopy.Text);
        bllcreate.ACTDEPARTURE = ActDeparture;
        bllcreate.ACTUALARRIVAL = ActArrival;
        bllcreate.PAPERNAME = ddlPaperName.SelectedItem.Text;
        bllcreate.PIONNAME = txtPionName.Text;
        bllcreate.DELAYREASON = txtReasonDelay.Text;
        bllcreate.AUDITUSER = Session["UserName"].ToString();
        bllcreate.CREATEDATE = DateTime.Now;

        if (btnSave.Text == "Create")
        {
            bllcreate.Insert();
        }

        if (btnSave.Text == "Update")
        {
            Update();
        }

        readData();

        btnSave.Text = "Update";

    }



    #endregion



}