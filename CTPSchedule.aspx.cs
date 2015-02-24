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
public partial class CTPSchedule : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    TextBox txtStartTimeH = new TextBox();
    TextBox txtStartTimeM = new TextBox();
    DropDownList ddlTimeFormat = new DropDownList();
    DropDownList ddlReason = new DropDownList();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //ddlHoure();
            //ddlMinute();            
            loadData();
            
        }
        clsHelper.CheckLogin();
    }

    private void bindReason()
    {
        string query = "SELECT  reasonDetails from reasonOfUnsold where delStatus<>1 and reasonType='CTP' Order By reasonDetails ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "reasonDetails");
        ddlReason.DataSource = ds;
        ddlReason.DataTextField = "reasonDetails";
        ddlReason.DataValueField = "reasonDetails";
        ddlReason.DataBind();
        ddlReason.Items.Insert(0, "-- None --");
    }

    protected void transDate_TextChanged(object sender, EventArgs e)
    {
        string strCount = "select Count(*) from CTPTransaction where transDate='" + txttransDate.Text + "' AND press='" + ddlPress.SelectedItem.Text + "'";
        int rouwNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rouwNumber == 0)
        {
            loadData();

            btnSave.Text = "Save";
        }
        else
        {
            readData();
            btnSave.Text = "Update";
        }
    }

    //private void ddlHoure()
    //{
    //    for (int Y = 0; Y <= 12; Y++)
    //    {
    //        ddlStartTimeH.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
            
    //    }
    //    ddlStartTimeH.Items.Insert(0, new ListItem("H", "0"));
        
    //}

    //private void ddlMinute()
    //{
    //    for (int i = 0; i <= 59; i++)
    //    {

    //        if (i < 10)
    //        {
    //            ddlStartTimeM.Items.Add("0" + new ListItem(i.ToString(), i.ToString()));
                
    //        }
    //        else
    //        {
    //            ddlStartTimeM.Items.Add(new ListItem(i.ToString(), i.ToString()));
    //        }
    //    }

    //    ddlStartTimeM.Items.Insert(0, new ListItem("MM", "0"));
        
    //}

    private void readData()
    {
        string strCusNmae = "Select pageId,pageName,deFaultTime from CTPTransaction where transDate='" + txttransDate.Text + "' and  press='" + ddlPress.SelectedItem.Text + "'";


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "CTPTransaction");
        grdCtpSchedule.DataSource = ds;
        grdCtpSchedule.DataBind();

        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {

            txtStartTimeH = gvrItem.Cells[2].FindControl("ddlStartH") as TextBox;
            txtStartTimeM = gvrItem.Cells[2].FindControl("ddlStartM") as TextBox;
            ddlTimeFormat = gvrItem.Cells[3].FindControl("ddlTimeformat") as DropDownList;
            ddlReason = gvrItem.Cells[4].FindControl("ddlReason") as DropDownList;

            //ddlHoure();
            //ddlMinute();
            bindReason();

            string strRegTime = "select regularTime,delayReason from CTPTransaction where pageName='" + gvrItem.Cells[1].Text + "' And transDate='" + txttransDate.Text + "'";
            //dataProvider.ExecuteCommand(strRegTime);
            DbDataReader dr = dataProvider.getDataReader(strRegTime);
                    while (dr.Read())
                    {
                        string depatureTime = dr["regularTime"].ToString();
                        string delayReason = dr["delayReason"].ToString();

                        txtStartTimeH.Text = depatureTime.Substring(0, depatureTime.IndexOf(":"));
                        txtStartTimeM.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 1, 2);
                        ddlTimeFormat.SelectedItem.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);
                        ddlReason.SelectedItem.Text = delayReason;

                    }
                    dr.Close();

        }
    }

    private void loadData()
    {
        string strCusNmae = "Select PageId,pageName,deFaultTime from viewCTPTransaction where press='" + ddlPress.SelectedItem.Text + "'";       


        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "viewCTPTransaction");
        grdCtpSchedule.DataSource = ds;
        grdCtpSchedule.DataBind();

        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {           

             txtStartTimeH = gvrItem.Cells[2].FindControl("ddlStartH") as TextBox;
             txtStartTimeM = gvrItem.Cells[2].FindControl("ddlStartM") as TextBox;           
             ddlTimeFormat = gvrItem.Cells[3].FindControl("ddlTimeformat") as DropDownList;
             ddlReason = gvrItem.Cells[4].FindControl("ddlReason") as DropDownList;

             bindReason();
             //ddlHoure();
             //ddlMinute();
            
        }
    }

    protected void grdCtpSchedule_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Page Id";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Page Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
           //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Default Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            HeaderCell.HorizontalAlign = HorizontalAlign.Right;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Start Time";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;            
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Time Format";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Reason Of Delay";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
                       

            grdCtpSchedule.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }


    protected void grdCtpSchedule_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;
            //e.Row.Cells[1].Visible = false;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string insert="";
        string auditUser = Session["UserName"].ToString();

        string strCount = "select Count(*) from CTPTransaction where transDate='" + txttransDate.Text + "' and press='" + ddlPress.SelectedItem.Text + "'";
        int rouwNumber=Convert.ToInt32(dataProvider.getResultString(strCount));

        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {   

             txtStartTimeH = gvrItem.Cells[2].FindControl("ddlStartH") as TextBox;
             txtStartTimeM = gvrItem.Cells[2].FindControl("ddlStartM") as TextBox;           
             ddlTimeFormat = gvrItem.Cells[3].FindControl("ddlTimeformat") as DropDownList;
             ddlReason = gvrItem.Cells[4].FindControl("ddlReason") as DropDownList;

             int hour = txtStartTimeH.Text.Length;
             int mnt = txtStartTimeM.Text.Length;
             string regularTime = "";

             if (hour == 1)
             {
                 txtStartTimeH.Text = "0" + txtStartTimeH.Text;
             }
             else
             {
                 txtStartTimeH.Text = txtStartTimeH.Text;
             }

             if (mnt == 1)
             {
                 txtStartTimeM.Text = "0" + txtStartTimeM.Text;
             }
             else
             {
                 txtStartTimeM.Text = txtStartTimeM.Text;
             }

             if (txtStartTimeH.Text != null && txtStartTimeH.Text != "")
             {
                  regularTime = txtStartTimeH.Text + ":" + txtStartTimeM.Text + " " + ddlTimeFormat.SelectedItem.Text;
             }
             else
             {
                 regularTime = "00" + ":" + "00" + " " + ddlTimeFormat.SelectedItem.Text;
             }



             

            if (rouwNumber == 0)
            {
                insert = "INSERT INTO CTPTransaction VALUES('" + txttransDate.Text + "','" + ddlPress.SelectedItem.Text + "','" + gvrItem.Cells[1].Text + "','" + gvrItem.Cells[2].Text + "','" + regularTime + "','" + DateTime.Now + "','" + auditUser + "','" + ddlReason.SelectedItem.Text + "','" + gvrItem.Cells[0].Text + "')";
                dataProvider.ExecuteCommand(insert);
            }
            else
            {
                string update = " UPDATE CTPTransaction set transDate='" + txttransDate.Text + "', regularTime='" + regularTime + "',audUser='" + auditUser + "',createDate='" + DateTime.Now + "',delayReason='" + ddlReason.SelectedItem.Text + "' where pageName='" + gvrItem.Cells[1].Text + "' and press='" + ddlPress.SelectedItem.Text + "' and transDate='" + txttransDate.Text + "'";
                dataProvider.ExecuteCommand(update);
            }
        }

        bindReason();
    }
    protected void ddlPress_TextChanged(object sender, EventArgs e)
    {
        string strCount = "select Count(*) from CTPTransaction where transDate='" + txttransDate.Text + "' AND press='" + ddlPress.SelectedItem.Text + "'";
        int rouwNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rouwNumber == 0)
        {
            loadData();

            btnSave.Text = "Save";
        }
        else
        {
            readData();
            btnSave.Text = "Update";
        }
    }
}