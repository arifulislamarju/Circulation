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

public partial class ChalanModify : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {
        
        con = dbCon.ConnectByXML();

        con.Open();
        con.Close();

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
        bindSubroute();
    }

    protected void ddlSubRoute_SelectedIndexChanged(object sender, EventArgs e)
    {
        loadData();
    }
    protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindSubroute();
        loadData();
    }


    private void loadData()
    {
        string dayName = Convert.ToDateTime(txtOrderDate.Text).DayOfWeek.ToString();
        string extDayname = dayName.Substring(0, dayName.LastIndexOf("day"));
        string day = extDayname.Substring(0, 3).ToUpper();
        con.Open();

        string strCusNmae = "Select customerId,orderDate,hkrNameEng,stationName,quantity,daywiseDefQuanttity,daywiseChngQuantity,bonusCopy,packetType from regularModify where subRoute='" + ddlSubRoute.SelectedItem.Text.Replace("'", "''") + "' AND orderDate = '" + txtOrderDate.Text + "' AND Category='" + ddlCategory.SelectedItem.Text + "' order by sortingOrder,hkrNameEng DESC";
        //string CusName = dataProvider.getResultString(strCusNmae);

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "regularModify");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow gvrItem in grdOrder.Rows)
        {



            //TextBox txtQuantity = gvrItem.Cells[3].FindControl("txtQuantity") as TextBox;
            TextBox txtdaywiseChngQuantity = gvrItem.Cells[5].FindControl("txtdaywiseChngQuantity") as TextBox;
            TextBox txtBonus = gvrItem.Cells[6].FindControl("txtBonus") as TextBox;
            DropDownList ddlPacket = gvrItem.Cells[7].FindControl("ddlPacket") as DropDownList;



            //string selQuantity = "Select quantity from regularModify where stationName='" + gvrItem.Cells[2].Text + "' And hkrNameEng='" + gvrItem.Cells[1].Text + "' AND orderDate = '" + txtOrderDate.Text + "' ";
            //txtQuantity.Text = dataProvider.getResultString(selQuantity);

            string Station = HttpUtility.HtmlDecode(gvrItem.Cells[2].Text.Trim());
            string agent = HttpUtility.HtmlDecode(gvrItem.Cells[1].Text.Trim());
            //con.Open();
            using (SqlCommand daywiseChngQuantity = new SqlCommand("Select daywiseChngQuantity,bonusCopy,packetType from regularModify where stationName= @Station And hkrNameEng=@agent AND orderDate = '" + txtOrderDate.Text + "' AND subRoute='" + ddlSubRoute.SelectedItem.Text.Replace("'", "''") + "' AND Category='" + ddlCategory.SelectedItem.Text + "' ", con))
            {   
                daywiseChngQuantity.Parameters.AddWithValue("@Station", Station);
                daywiseChngQuantity.Parameters.AddWithValue("@agent", agent);

                DbDataReader dr = daywiseChngQuantity.ExecuteReader();
                while (dr.Read())
                {
                    txtdaywiseChngQuantity.Text = dr["daywiseChngQuantity"].ToString();
                    txtBonus.Text = dr["bonusCopy"].ToString();
                    ddlPacket.SelectedItem.Text = dr["packetType"].ToString();
                }
                ListItem selectedListItem = ddlPacket.Items.FindByText("");
                
                dr.Close();
            }
                      
        }
        con.Close();
    }


    private void bindSubroute()
    {
        DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);

        string query = "SELECT  subRoute from regularModify where postStatus<>1 AND orderDate = '" + orderDate + "' and Category='"+ddlCategory.SelectedItem.Text+"' GROUP BY subRoute Order By subRoute ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "subRoute");
        ddlSubRoute.DataSource = ds;
        ddlSubRoute.DataTextField = "subRoute";
        ddlSubRoute.DataValueField = "subRoute";
        ddlSubRoute.DataBind();
        ddlSubRoute.Items.Insert(0, "--Select--"); 
    }


    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        con.Open();
        string agentId = "";
        foreach (GridViewRow gridRow in grdOrder.Rows)
        {
            string agentName =HttpUtility.HtmlDecode(gridRow.Cells[1].Text.Trim());
            string station = HttpUtility.HtmlDecode(gridRow.Cells[2].Text.Trim());
            TextBox txtdaywiseChngQuantity = gridRow.Cells[5].FindControl("txtdaywiseChngQuantity") as TextBox;
            TextBox txtBonus = gridRow.Cells[6].FindControl("txtBonus") as TextBox;
            DropDownList ddlPacket = gridRow.Cells[7].FindControl("ddlPacket") as DropDownList;

            DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);
            string subroute = ddlSubRoute.SelectedItem.Text;

            string createDate = DateTime.Now.ToString();
            string auditUser = Session["UserName"].ToString();

            using (SqlCommand stragentId = new SqlCommand("Select distinct customerId from regularModify where hkrNameEng =@agentName ", con))
            {

                stragentId.Parameters.AddWithValue("@agentName", agentName);
                SqlDataReader sdrAgentId = stragentId.ExecuteReader();
                
                while (sdrAgentId.Read())
                {
                    agentId = sdrAgentId["customerId"].ToString();
                }
                sdrAgentId.Close();
            }
            

            SqlCommand cmd = new SqlCommand("Update_chalanModify");
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter param1 = new SqlParameter("@orderDate", SqlDbType.DateTime);
            param1.Value = HttpUtility.HtmlDecode(txtOrderDate.Text);
            cmd.Parameters.Add(param1);

            SqlParameter param2 = new SqlParameter("@subRoute", SqlDbType.VarChar);
            param2.Value = HttpUtility.HtmlDecode(subroute.Trim());
            cmd.Parameters.Add(param2);

            SqlParameter param3 = new SqlParameter("@customerId", SqlDbType.VarChar);
            param3.Value = HttpUtility.HtmlDecode(agentId);
            cmd.Parameters.Add(param3);

            SqlParameter param4 = new SqlParameter("@stationName", SqlDbType.VarChar);
            param4.Value = HttpUtility.HtmlDecode(station);
            cmd.Parameters.Add(param4);

            SqlParameter param5 = new SqlParameter("@bonusCopy", SqlDbType.Int);
            param5.Value = HttpUtility.HtmlDecode(txtBonus.Text);
            cmd.Parameters.Add(param5);

            SqlParameter param6 = new SqlParameter("@packetType", SqlDbType.VarChar);
            param6.Value = HttpUtility.HtmlDecode(ddlPacket.SelectedItem.Text);
            cmd.Parameters.Add(param6);

            SqlParameter param7 = new SqlParameter("@auditUser", SqlDbType.VarChar);
            param7.Value = HttpUtility.HtmlDecode(auditUser);
            cmd.Parameters.Add(param7);

            SqlParameter param8 = new SqlParameter("@createDate", SqlDbType.DateTime);
            param8.Value = HttpUtility.HtmlDecode(createDate);
            cmd.Parameters.Add(param8);

            SqlParameter param9 = new SqlParameter("@daywiseChngQuantity", SqlDbType.VarChar);
            param9.Value = HttpUtility.HtmlDecode(txtdaywiseChngQuantity.Text);
            cmd.Parameters.Add(param9);

            SqlParameter param10 = new SqlParameter("@Category", SqlDbType.VarChar);
            param10.Value = HttpUtility.HtmlDecode(ddlCategory.SelectedItem.Text);
            cmd.Parameters.Add(param10);

           
            cmd.Connection = con;
            cmd.ExecuteScalar();
        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Updated Successfully..!!');", true);
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
            HeaderCell.Text = "Agent Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

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
            HeaderCell.Text = "Def. Change Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Modify Qty.";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Bonus Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Packet Type";
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


}