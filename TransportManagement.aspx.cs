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

public partial class TransportManagement : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    SqlConnection con = new SqlConnection();
    clsConnection dbCon = new clsConnection();
    DropDownList ddlReason = new DropDownList();

    public  int StationId = 0;

    protected void Page_Load(object sender, EventArgs e)
    {

        con = dbCon.ConnectByXML();

        con.Open();
        con.Close();

        if (!IsPostBack)
        {
            bindddlStationName();

            //loadData();

            //DdlHH();
            //DdlMM();

            //RaedData();

           bindReason();
        }
        clsHelper.CheckLogin();
    }

    private void bindReason()
    {
        string query = "SELECT  reasonDetails from reasonOfUnsold where delStatus<>1 and reasonType='Vehicle' Order By reasonDetails ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "reasonDetails");
        ddlReason.DataSource = ds;
        ddlReason.DataTextField = "reasonDetails";
        ddlReason.DataValueField = "reasonDetails";
        ddlReason.DataBind();
        ddlReason.Items.Insert(0, "-- None --");
    }

    protected void btnFirst_Click(object sender, ImageClickEventArgs e)
    {
        string MinId = "SELECT  Min(transId) from TRANSPORTMANAGEMENT ";
        int intMinId = Convert.ToInt32(dataProvider.getResultString(MinId));

        txtTransId.Text = intMinId.ToString();

        RaedData();
    }


    protected void btnPrevious_Click(object sender, ImageClickEventArgs e)
    {
        string MinId = "SELECT  Min(transId) from TRANSPORTMANAGEMENT";
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
            RaedData();
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Previous Data...');", true);
        }

    }


    protected void btnNext_Click(object sender, ImageClickEventArgs e)
    {
        string maxId = "SELECT  Max(transId) from TRANSPORTMANAGEMENT ";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        int transId = 0;

        if (txtTransId.Text == "" || txtTransId.Text == null)
        {
            string Id = "SELECT  TOP 1 transId from TRANSPORTMANAGEMENT";
            transId = Convert.ToInt32(dataProvider.getResultString(Id));

            //transId = 1;
        }
        else
        {
            transId = Convert.ToInt32(txtTransId.Text);
            transId = transId + 1;
        }

        if (transId <= intMaxId)
        {
            txtTransId.Text = transId.ToString();

            RaedData();
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('No More Forward Data...');", true);
        }

    }


    protected void btnLast_Click(object sender, ImageClickEventArgs e)
    {
        string maxId = "SELECT  Max(transId) from TRANSPORTMANAGEMENT";
        int intMaxId = Convert.ToInt32(dataProvider.getResultString(maxId));

        txtTransId.Text = intMaxId.ToString();

        RaedData();
    }

    private void bindddlStationName()
    {
        string query = "SELECT stationName from station where delStatus<>1 Order By stationName ASC";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStationName.DataSource = ds;
        ddlStationName.DataTextField = "stationName";
        ddlStationName.DataValueField = "stationName";
        ddlStationName.DataBind();

        //ddlStationName.Items.Insert(0, "Prothom Alo");

    }

    private void loadData()
    {
        con.Open();


        string strCusNmae = "Select PAPERNAME from PCOMPARE where USTATUS<>1 AND PAPERNAME<>'Prothom Alo Kallan' AND PAPERNAME<>'Prothom Alo Hawkar'";

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "PCOMPARE");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow gvrItem in grdOrder.Rows)
        {

            TextBox txtDepartureTimeH = gvrItem.Cells[2].FindControl("txtDepartureTimeH") as TextBox;
            TextBox txtDepartureTimeM = gvrItem.Cells[2].FindControl("txtDepartureTimeM") as TextBox;
            DropDownList ddlTimeDepformat = gvrItem.Cells[3].FindControl("TimeDepformat") as DropDownList;
            TextBox txtArrivalTimeH = gvrItem.Cells[4].FindControl("txtArrivalTimeH") as TextBox;
            TextBox txtArrivalTimeM = gvrItem.Cells[4].FindControl("txtArrivalTimeM") as TextBox;
            DropDownList ddlTimeArrFormat = gvrItem.Cells[5].FindControl("ddlTimeArrformat") as DropDownList;
            ddlReason = gvrItem.Cells[6].FindControl("ddlReason") as DropDownList;

            if (gvrItem.Cells[1].Text != "Prothom Alo")
            {
                
                txtDepartureTimeH.ReadOnly = true;
                txtDepartureTimeM.ReadOnly = true;
            }
            else
            {
              
                txtDepartureTimeH.ReadOnly = false;
                txtDepartureTimeM.ReadOnly = false;
            }


            bindReason();

           
        }
        con.Close();
        btnSave.Text = "Save";
    }

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
            HeaderCell.Text = "EDIT";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            HeaderCell.Visible = false;

            

            HeaderCell = new TableCell();
            HeaderCell.Text = "Paper";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Departure Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Dep. Time Format";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);   

            HeaderCell = new TableCell();
            HeaderCell.Text = "Arrival Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Arri. Time Format";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason Of Delay";
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
    
  
    protected void btnSave_Click(object sender, EventArgs e)
    {
        con.Open();

        string PaperName = "";
        string createDate = "";
        string auditUser = "";
        string depatureTime = "";
        string arrivalTime = "";
        int tranId;
        int totatlRow = 0;

                 
        string strCount = "Select Count(transId) from TRANSPORTMANAGEMENT ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rowNumber == 0)
        {
            tranId = 1;
        }
        else
        {
            string maxId = "SELECT  Max(transId) from TRANSPORTMANAGEMENT ";
            tranId = Convert.ToInt32(dataProvider.getResultString(maxId));

            tranId = tranId + 1;
        }

        bindReason();
       
            foreach (GridViewRow gridRow in grdOrder.Rows)
            {
                //string subRoutecode = HttpUtility.HtmlDecode(gridRow.Cells[1].Text.Trim());
                PaperName = HttpUtility.HtmlDecode(gridRow.Cells[1].Text.Trim());
                //string startPoint = HttpUtility.HtmlDecode(gridRow.Cells[3].Text.Trim());
                //string endPoint = HttpUtility.HtmlDecode(gridRow.Cells[4].Text.Trim());

                TextBox depatureH = gridRow.Cells[2].FindControl("txtDepartureTimeH") as TextBox;
                TextBox depatureM = gridRow.Cells[2].FindControl("txtDepartureTimeM") as TextBox;

                DropDownList timeDepFormat = gridRow.Cells[3].FindControl("ddlTimeArrformat") as DropDownList;
                string strTimeDepFormat = timeDepFormat.SelectedItem.Text;

                TextBox arrivalH = gridRow.Cells[4].FindControl("txtArrivalTimeH") as TextBox;
                TextBox arrivalM = gridRow.Cells[4].FindControl("txtArrivalTimeM") as TextBox;

                 

                DropDownList timeArrFormat = gridRow.Cells[5].FindControl("ddlTimeArrformat") as DropDownList;
                string strTimeArrFormat = timeArrFormat.SelectedItem.Text;

                int hourDepature = depatureH.Text.Length;
                int mntDepature = depatureM.Text.Length;

                int hourArrival = arrivalH.Text.Length;
                int mntArrival = arrivalM.Text.Length;

                if (hourDepature == 1)
                {
                    depatureH.Text = "0" + depatureH.Text;
                }
                else
                {
                    depatureH.Text = depatureH.Text;
                }

                if (mntDepature == 1)
                {
                    depatureM.Text = "0" + depatureM.Text;
                }
                else
                {
                    depatureM.Text = depatureM.Text;
                }


                if (hourArrival == 1)
                {
                    arrivalH.Text = "0" + arrivalH.Text;
                }
                else
                {
                    arrivalH.Text = arrivalH.Text;
                }

                if (mntArrival == 1)
                {
                    arrivalM.Text = "0" + arrivalM.Text;
                }
                else
                {
                    arrivalM.Text = arrivalM.Text;
                }


                if (arrivalH.Text != null && arrivalH.Text != "")
                {
                    arrivalTime = arrivalH.Text + ":" + arrivalM.Text + " " + strTimeArrFormat;
                }
                else
                {
                    arrivalTime = "00" + ":" + "00" + " " + strTimeArrFormat;
                }


                 DropDownList reason = gridRow.Cells[6].FindControl("ddlReason") as DropDownList;
                 string strReason = reason.SelectedItem.Text;

                 createDate = DateTime.Now.ToString();
                 auditUser = Session["UserName"].ToString();

                
                     if (depatureH.Text != null && depatureH.Text != "")
                     {
                         depatureTime = depatureH.Text + ":" + depatureM.Text + " " + strTimeDepFormat;
                     }
                     else
                     {
                         depatureTime = "00" + ":" + "00" + " " + strTimeDepFormat;
                     }


                  

                     using (SqlCommand strstationId = new SqlCommand("Select stationId from station where stationName=@stattionName", con))
                     {
                         strstationId.Parameters.AddWithValue("@stattionName", ddlStationName.SelectedItem.Text);
                         DbDataReader dr = strstationId.ExecuteReader();
                         while (dr.Read())
                         {
                             StationId = Convert.ToInt32(dr["stationId"]);
                         }
                         dr.Close();
                     }

                     using (SqlCommand strstationId = new SqlCommand("Select count(*) as rownumber from TRANSPORTMANAGEMENT where PAPERNAME='" + PaperName + "' and transDate='" + txtTransDate.Text + "' and stationId='" + StationId + "'", con))
                     {
                         strstationId.Parameters.AddWithValue("@stattionName", ddlStationName.SelectedItem.Text);
                         DbDataReader dr = strstationId.ExecuteReader();
                         while (dr.Read())
                         {
                             totatlRow = Convert.ToInt32(dr["rownumber"]);
                         }
                         dr.Close();
                     }

                if (totatlRow == 0)
                {
                    using (SqlCommand strInsert = new SqlCommand("INSERT INTO TRANSPORTMANAGEMENT VALUES('" + tranId + "','" + txtTransDate.Text + "','" + PaperName + "','" + depatureTime + "','" + arrivalTime + "','" + createDate + "','" + auditUser + "','" + ddlReason.SelectedItem.Text + "','" + StationId + "')", con))
                    {
                        //strInsert.Parameters.AddWithValue("@stationName", ddlStationName.SelectedItem.Text);
                        strInsert.ExecuteNonQuery();
                    }

                    txtTransId.Text = tranId.ToString();

                    depatureH.Text = "";
                    depatureM.Text = "";

                    arrivalH.Text = "";
                    arrivalM.Text = "";
                }

                else
                {
                    using (SqlCommand strInsert = new SqlCommand("UPDATE TRANSPORTMANAGEMENT SET actDeparture='" + depatureTime + "',actArrival='" + arrivalTime + "',createDate='" + createDate + "',audUser='" + auditUser + "',delayReason='" + ddlReason.SelectedItem.Text + "' where transDate='" + txtTransDate.Text + "' AND paperName='" + PaperName + "' AND  stationId='" + StationId + "'", con))
                    {
                        //strInsert.Parameters.AddWithValue("@stationName", ddlStationName.SelectedItem.Text);
                        strInsert.ExecuteNonQuery();
                    }

                }

                //Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Save Successfully..!!');", true);

            }
       
        con.Close();


        
        
    }

    private void RaedData()
    {
        con.Open();
        string strCusNmae = "";

        string strstationId = "Select stationId from station where stationName='" + ddlStationName.SelectedItem.Text.Replace("'", " ") + "'";
        int intStationId = Convert.ToInt32(dataProvider.getResultString(strstationId));


        if (txtTransId.Text != "" && txtTransId.Text != null)
        {
            strCusNmae = "Select paperName,actDeparture,actArrival,delayReason from TransManagement where transId='" + txtTransId.Text + "' ";
        }
        else
        {
            strCusNmae = "Select paperName,actDeparture,actArrival,delayReason from TransManagement where  transDate='" + txtTransDate.Text + "' AND  stationId='" + intStationId + "'";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "TransManagement");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow gvrItem in grdOrder.Rows)
        {

            TextBox txtDepartureTimeH = gvrItem.Cells[2].FindControl("txtDepartureTimeH") as TextBox;
            TextBox txtDepartureTimeM = gvrItem.Cells[2].FindControl("txtDepartureTimeM") as TextBox;
            DropDownList ddlTimeDepformat = gvrItem.Cells[3].FindControl("ddlTimeDepformat") as DropDownList;
            TextBox txtArrivalTimeH = gvrItem.Cells[4].FindControl("txtArrivalTimeH") as TextBox;
            TextBox txtArrivalTimeM = gvrItem.Cells[4].FindControl("txtArrivalTimeM") as TextBox;
            DropDownList ddlTimeArrFormat = gvrItem.Cells[5].FindControl("ddlTimeArrformat") as DropDownList;
            ddlReason = gvrItem.Cells[6].FindControl("ddlReason") as DropDownList;

            
            string PaperName = HttpUtility.HtmlDecode(gvrItem.Cells[1].Text.Trim());
            //string agent = HttpUtility.HtmlDecode(gvrItem.Cells[1].Text.Trim());


            if (txtTransId.Text != "" && txtTransId.Text != null)
            {
                using (SqlCommand selectTime = new SqlCommand("Select actDeparture,actArrival,delayReason,replace(convert(char(11),transDate,113),' ','-') as transDate from TRANSPORTMANAGEMENT where  transId = '" + txtTransId.Text + "'", con))
                {
                    selectTime.Parameters.AddWithValue("@PaperName", PaperName);
                    //daywiseChngQuantity.Parameters.AddWithValue("@agent", agent);

                    DbDataReader dr = selectTime.ExecuteReader();
                    while (dr.Read())
                    {
                        string depatureTime = dr["actDeparture"].ToString();
                        string actArrivalTime = dr["actArrival"].ToString();
                        string reason = dr["delayReason"].ToString();
                        txtTransDate.Text = dr["transDate"].ToString();

                        if (gvrItem.Cells[1].Text == "Prothom Alo")
                        {
                            txtDepartureTimeH.Text = depatureTime.Substring(0, depatureTime.IndexOf(":"));
                            txtDepartureTimeM.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 1, 3);
                            ddlTimeDepformat.SelectedItem.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);
                        }

                        txtArrivalTimeH.Text = actArrivalTime.Substring(0, actArrivalTime.IndexOf(":"));
                        txtArrivalTimeM.Text = actArrivalTime.Substring(actArrivalTime.IndexOf(":") + 1, 3);

                        //string a = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);

                       
                        ddlTimeArrFormat.SelectedItem.Text = actArrivalTime.Substring(actArrivalTime.IndexOf(":") + 4, 2);

                        bindReason();

                        ddlReason.SelectedItem.Text = reason;

                    }
                    //ListItem selectedListItem = txtArrivalTimeH.Items.FindByText("");
                    //ListItem selectedListItem = ddlPacket.Items.FindByText("");

                    dr.Close();
                }
            }
            else
            {



                using (SqlCommand selectTime = new SqlCommand("Select actDeparture,actArrival,delayReason from TransManagement where  transDate = '" + txtTransDate.Text + "' AND paperName=@PaperName and stationId='" + intStationId + "' ", con))
                {
                    selectTime.Parameters.AddWithValue("@PaperName", PaperName);
                    //daywiseChngQuantity.Parameters.AddWithValue("@agent", agent);



                    DbDataReader dr = selectTime.ExecuteReader();
                    while (dr.Read())
                    {
                        string depatureTime = dr["actDeparture"].ToString();
                        string actArrivalTime = dr["actArrival"].ToString();
                        string delayReason = dr["delayReason"].ToString();

                        if (gvrItem.Cells[1].Text == "Prothom Alo")
                        {
                            
                            txtDepartureTimeH.Text = depatureTime.Substring(0, depatureTime.IndexOf(":"));
                            txtDepartureTimeM.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 1, 3);
                            ddlTimeDepformat.SelectedItem.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);
                        }

                        
                        txtArrivalTimeH.Text = actArrivalTime.Substring(0, actArrivalTime.IndexOf(":"));
                        txtArrivalTimeM.Text = actArrivalTime.Substring(actArrivalTime.IndexOf(":") + 1, 3);

                        //string a = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);

                        
                        ddlTimeArrFormat.SelectedItem.Text = actArrivalTime.Substring(actArrivalTime.IndexOf(":") + 4, 2);

                        bindReason();

                        ddlReason.SelectedItem.Text = delayReason;


                    }
                    //ListItem selectedListItem = txtArrivalTimeH.Items.FindByText("");
                    //ListItem selectedListItem = ddlPacket.Items.FindByText("");

                    dr.Close();
                }

            }     
            
        }
        con.Close();
        btnSave.Text = "Update";
        bindReason();
    }

    protected void txtTransDate_TextChanged(object sender, EventArgs e)
    {
        bindReason();
        int intStationId = 0;

       con.Open();

        using (SqlCommand strstationId = new SqlCommand("Select stationId from station where stationName=@stattionName ", con))
        {
            strstationId.Parameters.AddWithValue("@stattionName", ddlStationName.SelectedItem.Text);
            DbDataReader dr = strstationId.ExecuteReader();
            while (dr.Read())
            {
                intStationId = Convert.ToInt32(dr["stationId"]);
            }
            dr.Close();
        }

        con.Close();

        string strCount = "Select Count(transId) from TRANSPORTMANAGEMENT where transDate='" + txtTransDate.Text + "' AND stationID='" + intStationId + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rowNumber == 0)
        {
            loadData();
        }
        else
        {
            RaedData();
        }
        
    }
    protected void ddlStationName_SelectedIndexChanged(object sender, EventArgs e)
    {
        int intStationId = 0;

        bindReason();
        con.Open();

        using (SqlCommand strstationId = new SqlCommand("Select stationId from station where stationName=@stattionName", con))
        {
            strstationId.Parameters.AddWithValue("@stattionName", ddlStationName.SelectedItem.Text);
            DbDataReader dr = strstationId.ExecuteReader();
             while (dr.Read())
             {
                 intStationId = Convert.ToInt32(dr["stationId"]);
             }
             dr.Close();
        }
       
        con.Close();
        //string strstationId = "Select stationId from station where stationName='" + ddlStationName.SelectedItem.Text.Replace("'", " ") + "'";
        //int intStationId = Convert.ToInt32(dataProvider.getResultString(strstationId));

        string strCount = "Select Count(transId) from TRANSPORTMANAGEMENT where transDate='" + txtTransDate.Text + "' AND stationID='" + intStationId + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rowNumber == 0)
        {
            loadData();
        }
        else
        {
            RaedData();
        }
        
    }
}