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

public partial class CTPSetup : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    TextBox txtStartH = new TextBox();
    TextBox txtStartM = new TextBox();
    DropDownList ddlTimeformat = new DropDownList();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string strCount = "select Count(*) from CTPSETUP where press='" + ddlPress.SelectedItem.Text + "'";
            int rouwNumber=Convert.ToInt32(dataProvider.getResultString(strCount));

            if (rouwNumber == 0)
            {
                bindData();
                btnSave.Text = "Save";
            }
            else
            {
                readData();                
                btnSave.Text = "Update";
            }

            
        }
        clsHelper.CheckLogin();
    }


    //private void ddlHoure()
    //{
    //    for (int Y = 0; Y <= 12; Y++)
    //    {
    //        txtStartH.Items.Add(new ListItem(Y.ToString(), Y.ToString()));
            
    //    }
    //    txtStartH.Items.Insert(0, new ListItem("H", "0"));
                       
    //}

    //private void ddlMinute()
    //{
    //    for (int i = 0; i <= 59; i++)
    //    {
           
    //        if (i < 10)
    //        {

    //            txtStartM.Items.Add("0" + new ListItem(i.ToString(), i.ToString()));
                
    //        }
    //        else
    //        {
    //            txtStartM.Items.Add(new ListItem(i.ToString(), i.ToString()));
                
    //        }
    //    }

    //    txtStartM.Items.Insert(0, new ListItem("MM", "0"));
                
    //}
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string strInsert = "";
        string auditUser = Session["UserName"].ToString();


        string strCount = "select Count(*) from CTPSETUP where press='" + ddlPress.SelectedItem.Text +"'";
        int rouwNumber=Convert.ToInt32(dataProvider.getResultString(strCount));

        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {
            txtStartH = gvrItem.Cells[1].FindControl("txtStartH") as TextBox;
            txtStartM = gvrItem.Cells[1].FindControl("txtStartM") as TextBox;
            ddlTimeformat = gvrItem.Cells[2].FindControl("ddlTimeformat") as DropDownList;


            int hour = txtStartH.Text.Length;
            int mnt = txtStartM.Text.Length;

            if (hour == 1)
            {
                txtStartH.Text = "0" + txtStartH.Text;
            }
            else
            {
                txtStartH.Text = txtStartH.Text;
            }

            if (mnt == 1)
            {
                txtStartM.Text = "0" + txtStartM.Text;
            }
            else
            {
                txtStartM.Text = txtStartM.Text;
            }


            string startTime = txtStartH.Text + ":" + txtStartM.Text + " " + ddlTimeformat.SelectedItem.Text;

            if (rouwNumber == 0)
            {
                strInsert = "INSERT INTO CTPSETUP VALUES('" + ddlPress.SelectedItem.Text + "','" + gvrItem.Cells[1].Text + "','" + startTime + "','" + DateTime.Now.ToString("dd-MMM-yyyy") + "','" + auditUser + "','" + gvrItem.Cells[0].Text + "')";
                dataProvider.ExecuteCommand(strInsert);
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Save Successfully..!!');", true);
            }

            else
            {
                strInsert = "UPDATE CTPSETUP set press='" + ddlPress.SelectedItem.Text + "',deFaultTime='" + startTime + "' where pageId='" + gvrItem.Cells[0].Text + "'";
                dataProvider.ExecuteCommand(strInsert);

                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Update Successfully..!!');", true);
            }
        }

        bindData();
    }
    private void bindData()
    {
        string strDhkTime = "select  * from PAGESETUP ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strDhkTime, "PAGESETUP");
        grdCtpSchedule.DataSource = ds;
        grdCtpSchedule.DataBind();


        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {

            txtStartH = gvrItem.Cells[1].FindControl("txtStartH") as TextBox;
            txtStartM = gvrItem.Cells[1].FindControl("txtStartM") as TextBox;

            //ddlHoure();
            //ddlMinute();
        }

        
    }

    private void readData()
    {
        string strDhkTime = "select PageId,PageName,deFaultTime from CTPSETUP where press='" + ddlPress.SelectedItem.Text + "'";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strDhkTime, "CTPSETUP");
        grdCtpSchedule.DataSource = ds;
        grdCtpSchedule.DataBind();

        
        foreach (GridViewRow gvrItem in grdCtpSchedule.Rows)
        {

            txtStartH = gvrItem.Cells[2].FindControl("txtStartH") as TextBox;
            txtStartM = gvrItem.Cells[2].FindControl("txtStartM") as TextBox;
            ddlTimeformat = gvrItem.Cells[3].FindControl("ddlTimeformat") as DropDownList;

            //ddlHoure();
            //ddlMinute();

            string strRegTime = "select deFaultTime from CTPSETUP where pageName='" + gvrItem.Cells[1].Text + "'";
            //dataProvider.ExecuteCommand(strRegTime);
            DbDataReader dr = dataProvider.getDataReader(strRegTime);
            while (dr.Read())
            {
                string depatureTime = dr["deFaultTime"].ToString();
                

                txtStartH.Text = depatureTime.Substring(0, depatureTime.IndexOf(":"));
                txtStartM.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 1, 2);
                ddlTimeformat.SelectedItem.Text = depatureTime.Substring(depatureTime.IndexOf(":") + 4, 2);
            }

            dr.Close();
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
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Time format";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
                       
           
            grdCtpSchedule.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }
    protected void ddlPress_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strCount = "select Count(*) from CTPSETUP where press='" + ddlPress.SelectedItem.Text + "'";
        int rouwNumber = Convert.ToInt32(dataProvider.getResultString(strCount));

        if (rouwNumber == 0)
        {
            bindData();
            btnSave.Text = "Save";
        }
        else
        {
            readData();
            btnSave.Text = "Update";
        }
    }
}