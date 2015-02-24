using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing;
using System.Data.Common;
using System.IO;
using System.Text;
using System.Data.SqlClient;

public partial class PaperTransaction : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    BllPaperTransaction transactionObj = null;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           
            BindPaperName();
            bindStation();

        }       

        clsHelper.CheckLogin();
    }


    private void bindStation()
    {
        string query = "SELECT  stationName from station where delStatus<>1  Order By stationName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "stationName");
        ddlStation.DataSource = ds;
        ddlStation.DataTextField = "stationName";
        ddlStation.DataValueField = "stationName";
        ddlStation.DataBind();
        ddlStation.Items.Insert(0, "Abdullahpur");
    }

    protected void gridView_RowCreated(object sender, GridViewRowEventArgs e)
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
            HeaderCell.Text = "Paper Name";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Paper Type";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Paper Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);

            HeaderCell = new TableCell();
            HeaderCell.Text = "Return Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);




            gridView.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }
    protected void gridView_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            //e.Row.Cells[0].Visible = false;
        }
    }
    
    private void BindPaperName()
    {
        string strSelQuantity = "";
        string strPaperName = "Select PAPERNAME,PAPERTYPE from PCOMPARE where USTATUS<>1 AND PAPERNAME<>'Prothom Alo' Order By sortOrder asc ";        
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strPaperName, "PCOMPARE");
        gridView.DataSource = ds;
        gridView.DataBind();

        foreach (GridViewRow gvrItem in gridView.Rows)
        {
            TextBox paperQuantity = gvrItem.Cells[2].FindControl("txtPaperQuantity") as TextBox;

            if (gvrItem.Cells[0].Text == "Prothom Alo Kallan")
            {
                strSelQuantity = "select sum (quantity+daywiseChngQuantity+daywiseDefQuanttity)as TRANSAMOUNT from OrderSync where orderDate='" + txtDate.Text + "' AND customerId=125";
                DbDataReader dr = dataProvider.getDataReader(strSelQuantity);
                while (dr.Read())
                {
                    
                        paperQuantity.Text = dr["TRANSAMOUNT"].ToString();

                    
                }
                dr.Close();
            }

            else if (gvrItem.Cells[0].Text == "Prothom Alo Hawkar")
            {
                strSelQuantity = "select sum (quantity+daywiseChngQuantity+daywiseDefQuanttity)as TRANSAMOUNT from OrderSync where orderDate='" + txtDate.Text + "' AND customerId=127";
                DbDataReader dr = dataProvider.getDataReader(strSelQuantity);
                while (dr.Read())
                {
                    
                   paperQuantity.Text = dr["TRANSAMOUNT"].ToString();

                }
                dr.Close();
            }

            else if (gvrItem.Cells[0].Text == "Prothom Alo Floating")
            {
                strSelQuantity = "select sum (quantity+daywiseChngQuantity+daywiseDefQuanttity)as TRANSAMOUNT from OrderSync where orderDate='" + txtDate.Text + "' AND   (customerId=716 OR customerId=717)";
                DbDataReader dr = dataProvider.getDataReader(strSelQuantity);
                while (dr.Read())
                {

                    paperQuantity.Text = dr["TRANSAMOUNT"].ToString();

                }
                dr.Close();
            }
            else if (gvrItem.Cells[0].Text == "Prothom Alo Cor.(Dhk)")
            {
                strSelQuantity = "select sum (quantity+daywiseChngQuantity+daywiseDefQuanttity)as TRANSAMOUNT from OrderSync where orderDate='" + txtDate.Text + "' AND   (customerId=751 OR customerId=775 OR customerId=759)";
                DbDataReader dr = dataProvider.getDataReader(strSelQuantity);
                while (dr.Read())
                {

                    paperQuantity.Text = dr["TRANSAMOUNT"].ToString();

                }
                dr.Close();
            }
              
             
            
            
        }

    }

    private void bindData()
    {
        string strSelQuantity = "";

        string strPaperName = "Select PAPERNAME,PAPERTYPE from PCOMPARE where USTATUS<>1 AND PAPERNAME<>'Prothom Alo' Order By PAPERNAME DESC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strPaperName, "CompititorSales");
        gridView.DataSource = ds;
        gridView.DataBind();

        foreach (GridViewRow gvrItem in gridView.Rows)
        {
            TextBox paperQuantity = gvrItem.Cells[2].FindControl("txtPaperQuantity") as TextBox;
            TextBox returnQuantity = gvrItem.Cells[3].FindControl("txtreturnQuantity") as TextBox;

           
           strSelQuantity = "Select TRAAMOUNT,RETURNQUAN from CompititorSales where PAPERNAME='" + gvrItem.Cells[0].Text + "' and TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "'";
            
            DbDataReader dr = dataProvider.getDataReader(strSelQuantity);
             while (dr.Read())
             {
                     paperQuantity.Text = dr["TRAAMOUNT"].ToString();
                     returnQuantity.Text = dr["RETURNQUAN"].ToString();
                 
             }
             dr.Close();
        }
    }

    protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtTransactionId.Text = gridView.SelectedRow.Cells[0].Text;
        txtDate.Text = gridView.SelectedRow.Cells[2].Text;
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string selCount = "Select Count(*) from TRANSACTIONPAPER where TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'","") + "'";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCount));

        if (rowNumber == 0)
        {
            foreach (GridViewRow gridRow in gridView.Rows)
            {
                string createDate = DateTime.Now.ToString();
                string auditUser = Session["UserName"].ToString();
                TextBox paperQuantity = gridRow.Cells[2].FindControl("txtPaperQuantity") as TextBox;
                TextBox returnQuantity = gridRow.Cells[3].FindControl("txtreturnQuantity") as TextBox;

                string strInsert = "INSERT INTO TRANSACTIONPAPER VALUES('" + gridRow.Cells[0].Text + "','" + txtDate.Text + "','" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "','" + paperQuantity.Text + "','" + auditUser + "','" + createDate + "','" + returnQuantity.Text+ "')";
                dataProvider.ExecuteCommand(strInsert);
            }
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data Save Successfully..!!');", true);
            btnUpdate.Enabled = true;
        }
        else
        {
            Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Data already exists..!!');", true);
            btnUpdate.Enabled = false;
        }

        bindData();
    }
    
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow gridRow in gridView.Rows)
        {
            string createDate = DateTime.Now.ToString();
            string auditUser = Session["UserName"].ToString();
            TextBox paperQuantity = gridRow.Cells[2].FindControl("txtPaperQuantity") as TextBox;
            TextBox returnQuantity = gridRow.Cells[3].FindControl("txtreturnQuantity") as TextBox;

            string selCount = "Select Count(*) from TRANSACTIONPAPER where TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "' AND PAPERNAME='" + gridRow.Cells[0].Text + "' ";
            int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCount));

            if (rowNumber == 0)
            {
                string strInsert = "INSERT INTO TRANSACTIONPAPER VALUES('" + gridRow.Cells[0].Text + "','" + txtDate.Text + "','" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "','" + paperQuantity.Text + "','" + auditUser + "','" + createDate + "','" + returnQuantity.Text + "')";
                dataProvider.ExecuteCommand(strInsert);
            }
            else
            {
                string strUpdate = "UPDATE TRANSACTIONPAPER SET TRAAMOUNT='" + paperQuantity.Text + "',audUser='" + auditUser + "',createDate='" + createDate + "',RETURNQUAN='" + returnQuantity.Text + "' where TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "' AND PAPERNAME='" + gridRow.Cells[0].Text + "'";
                dataProvider.ExecuteCommand(strUpdate);
            }

           
        }
    }

    protected void ddlStation_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selCount = "Select Count(*) from TRANSACTIONPAPER where TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "'";
        int rowNumber =Convert.ToInt32( dataProvider.getResultString(selCount));

        if (rowNumber == 0)
        {
            BindPaperName();
            btnUpdate.Enabled = false;
        }
        else
        {
            bindData();
            btnUpdate.Enabled = true;
        }
    }
    protected void txtDate_TextChanged(object sender, EventArgs e)
    {
        string selCount = "Select Count(*) from TRANSACTIONPAPER where TRADATE='" + txtDate.Text + "' and station='" + ddlStation.SelectedItem.Text.Trim().Replace("'", "") + "'";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCount));

        if (rowNumber == 0)
        {
            BindPaperName();
            btnUpdate.Enabled = false;
        }
        else
        {
            bindData();
            btnUpdate.Enabled = true;
        }
    }
}