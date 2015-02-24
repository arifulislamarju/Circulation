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

public partial class copyOrder : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    public DateTime? yesterday1 { get; set; }
    public DateTime? sameday1 { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            //string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
            //ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);

            BindddlCategory();
        }  
            bindRoute();
            bindsubRoute();
        
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

    private void bindRoute()
    {
        string query = "SELECT  routeName from subRoute where delStatus<>1 Order By routeName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "routeName");

        ddlFrmRoute.DataSource = ds;
        ddlFrmRoute.DataTextField = "routeName";
        ddlFrmRoute.DataValueField = "routeName";
        ddlFrmRoute.DataBind();

        ddlToRoute.DataSource = ds;
        ddlToRoute.DataTextField = "routeName";
        ddlToRoute.DataValueField = "routeName";
        ddlToRoute.DataBind();

        ddlFrmRoute.Items.Insert(0, "--Select--");
        ddlToRoute.Items.Insert(0, "--Select--");
    }

    private void bindsubRoute()
    {
        string query = "SELECT  subRouteName from subRoute where delStatus<>1 Order By subRouteName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRouteName");

        ddlFrmSubRoute.DataSource = ds;
        ddlFrmSubRoute.DataTextField = "subRouteName";
        ddlFrmSubRoute.DataValueField = "subRouteName";
        ddlFrmSubRoute.DataBind();

        ddlToSubRoute.DataSource = ds;
        ddlToSubRoute.DataTextField = "subRouteName";
        ddlToSubRoute.DataValueField = "subRouteName";
        ddlToSubRoute.DataBind();

        ddlFrmSubRoute.Items.Insert(0, "--Select--");
        ddlToSubRoute.Items.Insert(0, "--Select--");
    }


    private void AgentQty()
    {
        string sel1 = "select customerId from orderEntry where orderDate = '" + txtTransDate.Text + "' GROUP BY customerId ";
        SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

        while (sdr1.Read())
        {
            string AgentId = sdr1["customerId"].ToString();

            string dayName = Convert.ToDateTime(txtTransDate.Text).DayOfWeek.ToString();
            string extDayname = dayName.Substring(0, dayName.LastIndexOf("day"));
            string day = extDayname.Substring(0, 3).ToUpper();

            string sel = "select day,quantityChange,StationId from AgentDailyOrderChange where hkrID = '" + AgentId + "' AND category='" + ddlCategory.SelectedItem.Text + "'";
            SqlDataReader sdr = dataProvider.getDataReader(sel);

            while (sdr.Read())
            {
                string strDay = sdr["day"].ToString();
                string qtyChange = sdr["quantityChange"].ToString();
                int StationId = Convert.ToInt32(sdr["StationId"].ToString());

                string strStationId = "Select stationName from station where stationId='" + StationId + "' and delStatus<>1";
                string stationName = dataProvider.getResultString(strStationId);

                if (qtyChange != "" && qtyChange != null)
                {
                    if (day == strDay)
                    {
                        string cmd = "update orderEntry set daywiseDefQuanttity = '" + qtyChange + "' where customerId='" + AgentId + "' and orderDate = '" + txtTransDate.Text + "' and  stationName='" + stationName + "' and  catagory='" + ddlCategory.SelectedItem.Text + "' ";
                        dataProvider.ExecuteCommand(cmd);

                    }
                }

            }
            sdr.Close();
        }
        sdr1.Close();
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {

        string frmSubroute = "";
        string toSubroute = "";

        string strcountDate = "SELECT  count(*) from orderEntry where orderDate = '" + txtTransDate.Text + "' AND catagory='"+ddlCategory.SelectedItem.Text+"' ";
        int countDate = Convert.ToInt32(dataProvider.getResultString(strcountDate));

        if (countDate != 0)
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Already Exits This Date...');", true);
        }

        else
        {
            if (ddlFrmRoute.SelectedItem.Text != "--Select--" && ddlToRoute.SelectedItem.Text != "--Select--")
            {
                string strfrmSubroute = "select subRouteName from subRoute where delStatus <> 1 and routeName = '" + HttpUtility.HtmlDecode(ddlFrmRoute.SelectedItem.Text.Trim()) + "' ";
                frmSubroute = dataProvider.getResultString(strfrmSubroute);

                string strtoSubroute = "select subRouteName from subRoute where delStatus <> 1 and routeName = '" + HttpUtility.HtmlDecode(ddlToRoute.SelectedItem.Text.Trim()) + "' ";
                toSubroute = dataProvider.getResultString(strtoSubroute);
            }

            string strsubRoute = "select subRoute from orderEntry";
            string subRoute = dataProvider.getResultString(strsubRoute);

            if (IDrdoPrvDate.Checked)
            {
                DateTime ss = Convert.ToDateTime(txtTransDate.Text);
                string strYesterday = ss.AddDays(-1).ToString("dd-MMM-yyyy");
                yesterday1 = Convert.ToDateTime(strYesterday);
            }

            if (IDrdoSamDate.Checked)
            {
                DateTime ss = Convert.ToDateTime(txtTransDate.Text);
                string strSameday = ss.AddDays(-7).ToString("dd/MM/yyyy");
                sameday1 = Convert.ToDateTime(strSameday);
            }

            string sel = "select orderNo from orderEntry where orderDate = '" + txtDate.Text + "' or orderDate = '" + yesterday1 + "' or orderDate = '" + sameday1 + "' GROUP BY orderNo ";
            SqlDataReader sdr = dataProvider.getDataReader(sel);

            while (sdr.Read())
            {
                int oeOrderNo = Convert.ToInt32(sdr["orderNo"].ToString());

                string orderNo = "select (MAX(orderNo)+1) from orderEntry ";
                int intorderNo = Convert.ToInt32(dataProvider.getResultString(orderNo));

                string modifyReason = "0";
                string edition = "City Edition";
                byte postStatus = 0;
                byte syncFlag = 0;
                int daywiseDefQuanttity = 0;
                int daywiseChngQuantity = 0;
                int smsQuantity = 0;

                DateTime createDate = DateTime.Now;
                string auditUser = Session["UserName"].ToString();

                if (IDrdoDate.Checked)
                {
                    DateTime orderDate = Convert.ToDateTime(txtDate.Text);
                    DateTime strOrderDate = Convert.ToDateTime(txtTransDate.Text);

                    if (frmSubroute == subRoute && toSubroute == subRoute && ddlFrmRoute.SelectedItem.Text != "--Select--" && ddlToRoute.SelectedItem.Text != "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,,edition,0,0,0,0,0 from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";


                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }
                    else if (ddlFrmSubRoute.SelectedItem.Text != "--Select--" && ddlToSubRoute.SelectedItem.Text != "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else if (ddlFrmSubRoute.SelectedItem.Text == "--Select--" && ddlToSubRoute.SelectedItem.Text == "--Select--" && ddlFrmRoute.SelectedItem.Text == "--Select--" && ddlToRoute.SelectedItem.Text == "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "'  ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + orderDate + "' AND orderNo = '" + oeOrderNo + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Choose Correct Format...');", true);
                    }

                }

                if (IDrdoPrvDate.Checked)
                {
                    DateTime ss = Convert.ToDateTime(txtTransDate.Text);
                    string strYesterday = ss.AddDays(-1).ToString("dd-MMM-yyyy");
                    DateTime yesterday = Convert.ToDateTime(strYesterday);

                    DateTime strOrderDate = Convert.ToDateTime(txtTransDate.Text);

                    if (frmSubroute == subRoute && toSubroute == subRoute && ddlFrmRoute.SelectedItem.Text != "--Select--" && ddlToRoute.SelectedItem.Text != "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }
                    else if (ddlFrmSubRoute.SelectedItem.Text != "--Select--" && ddlToSubRoute.SelectedItem.Text != "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else if (ddlFrmSubRoute.SelectedItem.Text == "--Select--" && ddlToSubRoute.SelectedItem.Text == "--Select--" && ddlFrmRoute.SelectedItem.Text == "--Select--" && ddlToRoute.SelectedItem.Text == "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "'  ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + yesterday + "' AND orderNo = '" + oeOrderNo + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Choose Correct Format...');", true);
                    }
                }

                if (IDrdoSamDate.Checked)
                {
                    DateTime ss = Convert.ToDateTime(txtTransDate.Text);
                    string strSameday = ss.AddDays(-7).ToString("dd/MM/yyyy");
                    DateTime sameday = Convert.ToDateTime(strSameday);

                    DateTime strOrderDate = Convert.ToDateTime(txtTransDate.Text);

                    if (frmSubroute == subRoute && toSubroute == subRoute && ddlFrmRoute.SelectedItem.Text != "--Select--" && ddlToRoute.SelectedItem.Text != "--Select--")
                    {
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + frmSubroute + "' and '" + toSubroute + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }
                    else if (ddlFrmSubRoute.SelectedItem.Text != "--Select--" && ddlToSubRoute.SelectedItem.Text != "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "' AND subRoute between '" + HttpUtility.HtmlDecode(ddlFrmSubRoute.SelectedItem.Text.Trim()) + "' and '" + HttpUtility.HtmlDecode(ddlToSubRoute.SelectedItem.Text.Trim()) + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else if (ddlFrmSubRoute.SelectedItem.Text == "--Select--" && ddlToSubRoute.SelectedItem.Text == "--Select--" && ddlFrmRoute.SelectedItem.Text == "--Select--" && ddlToRoute.SelectedItem.Text == "--Select--")
                    {
                        //string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "'  ";
                        string insertQuery = "insert into orderEntry(orderNo,orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity,bonusCopy,complementaryCopy,packetType,modifyReason,auditUser,createDate,edition,postStatus,syncFlag,daywiseDefQuanttity,daywiseChngQuantity,smsQuantity) select '" + intorderNo + "' as orderNo, '" + strOrderDate + "' as orderDate,vehicle,subRoute,customerId,catagory,rate,salesType,type,corporate,stationName,quantity+daywiseDefQuanttity+daywiseChngQuantity+smsQuantity,bonusCopy,complementaryCopy,packetType,modifyReason, '" + auditUser + "' as auditUser, '" + createDate + "' as createDate,edition,0,0,0,0,0 from orderEntry where orderDate = '" + sameday + "' AND orderNo = '" + oeOrderNo + "'  AND catagory='" + ddlCategory.SelectedItem.Text + "' ";

                        SqlDataAdapter da = new SqlDataAdapter();
                        DataSet ds = new DataSet();
                        ds = dataProvider.getDataSet(insertQuery, "orderEntry");

                        //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                        //bindfrmDb();
                    }

                    else
                    {
                        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Choose Correct Format...');", true);
                    }
                }

                string strcountTargetDate = "SELECT  count(*) from orderEntry where orderDate = '" + txtTransDate.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                int countTargetDate = Convert.ToInt32(dataProvider.getResultString(strcountTargetDate));



                string strcountData = "SELECT  count(*) from orderEntry where orderDate = '" + txtDate.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "' ";
                int countDataFromDate = Convert.ToInt32(dataProvider.getResultString(strcountData));

                if (countTargetDate == countDataFromDate)
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
                    break;
                }


            }
           
            sdr.Close();
            //bindfrmDb();
            AgentQty();
            confirmation();
           // Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data is Copied...');", true);
        }
    }

    private void confirmation()
    {
        string defaultQuantity = "Select count(*) as defQ from orderEntry where orderdate='" + txtDate.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "'";
        string defQuan = dataProvider.getResultString(defaultQuantity);

        string CopiedQuantity = "Select count(*) as defQ from orderEntry where orderdate='" + txtTransDate.Text + "' AND catagory='" + ddlCategory.SelectedItem.Text + "'";
        string CopiedQuan = dataProvider.getResultString(CopiedQuantity);


        lblConfirm.Text = "Copied Order : " + CopiedQuan + " Out Of : " + defQuan;
    }

    //public void CreateSqlCommand()
    //{
    //    SqlCommand cmd = new SqlCommand();
    //    cmd.CommandTimeout = 15;
    //    cmd.CommandType = CommandType.Text;
    //}

    #region Grid View


    private void bindfrmDb()
    {
        string maxId = "SELECT  Max(orderNo) from orderEntry";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        string select = "SELECT * from orderEntry where orderNo = '" + intMaxId + "' ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(select, "orderEntry");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

    }


    protected void grdOrder_RowCreated(object sender, GridViewRowEventArgs e)
    {

        if (e.Row.RowType == DataControlRowType.Header)
        {
            GridView HeaderGrid = (GridView)sender;
            GridViewRow HeaderGridRow =
            new GridViewRow(0, 0, DataControlRowType.Header,
            DataControlRowState.Insert);

            HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#4A3C8C");
            HeaderGridRow.ForeColor = System.Drawing.Color.White;

            TableCell HeaderCell = new TableCell();
            HeaderCell.Text = "Order No.";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Height = 30;
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Order Date";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Vehicle";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sub-Route";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Customer Id";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Catagory";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Rate";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Sales Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Corporate";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Station Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Bonus Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Complementary Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Packet Type";
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


            grdOrder.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }


    protected void grdOrder_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            e.Row.Cells[0].Visible = false;

            LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
            l.Attributes.Add("onclick", "javascript:return " +
            "confirm('Are you sure you want to delete This Order: " +
            DataBinder.Eval(e.Row.DataItem, "orderNo") + "')");

        }
    }
    protected void grdOrder_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        grdOrder.DeleteRow(e.RowIndex);
        grdOrder.DataBind();

        bindfrmDb();
    }


    #endregion



}