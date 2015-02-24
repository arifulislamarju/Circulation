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


public partial class OrderSynchronization : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindddlCategory();
        }
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

    private void loadData()
    {
        double totalQuantity = 0;
        string strCusNmae = "Select stationName,quantity,complementaryCopy,bonusCopy,daywiseChngQuantity,daywiseDefQuanttity from Daily_Order where orderDate BETWEEN '" + txtOrderDateFrom.Text + "' AND '" + txtOrderDateTo.Text + "' AND Catagory='" + ddlCategory.SelectedItem.Text + "' AND postStatus=0 ";


        if (ddlSalesType.SelectedItem.Text != "All")
        {
            strCusNmae = strCusNmae + "AND salesType='" + ddlSalesType.SelectedItem.Text + "'";
        }

        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(strCusNmae, "OrderSync");
        grdOrder.DataSource = ds;
        grdOrder.DataBind();

        foreach (GridViewRow rows in grdOrder.Rows)
        {
            lblTotalOrder.Text = " Total Order = " + grdOrder.Rows.Count.ToString();

            double Quantity = Convert.ToDouble(rows.Cells[1].Text) + Convert.ToDouble(rows.Cells[2].Text) + Convert.ToDouble(rows.Cells[3].Text) + Convert.ToDouble(rows.Cells[4].Text) + Convert.ToDouble(rows.Cells[5].Text);


            totalQuantity += Quantity;
            lblQuantity.Text = "Total Order Copy = " + totalQuantity.ToString("#,##");


        }
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
            HeaderCell.Text = "Complemenatry";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;


            HeaderCell = new TableCell();
            HeaderCell.Text = "Bonus Copy";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            HeaderCell = new TableCell();
            HeaderCell.Text = "Daily Change Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;


            HeaderCell = new TableCell();
            HeaderCell.Text = "Default Change Quantity";
            HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
            HeaderCell.Font.Bold = true;
            //HeaderCell.ColumnSpan = 2;
            HeaderGridRow.Cells.Add(HeaderCell);
            //HeaderCell.Visible = false;

            

            grdOrder.Controls[0].Controls.AddAt
            (0, HeaderGridRow);

        }
    }

    protected void btnDisplay_Click(object sender, EventArgs e)
    {
        loadData();
        btnPost.Enabled = true;

        //
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {
        string strPost="";

        strPost = "Update orderEntry set postStatus=1 where orderDate BETWEEN '" + txtOrderDateFrom.Text + "' AND '" + txtOrderDateTo.Text + "' AND Catagory='" + ddlCategory.SelectedItem.Text + "'  AND postStatus=0";

        
        dataProvider.ExecuteCommand(strPost);

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Syncronize Successfully..!!');", true);

        btnReverse.Enabled = true;

        loadData();
    }

    protected void btnReverse_Click(object sender, EventArgs e)
    {
        string strReverse = "Update orderEntry set postStatus=0 where orderDate BETWEEN '" + txtOrderDateFrom.Text + "' AND '" + txtOrderDateTo.Text + "' AND Catagory='" + ddlCategory.SelectedItem.Text + "'  AND postStatus=1";
        dataProvider.ExecuteCommand(strReverse);

        loadData();

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Reverse Successfully..!!');", true);
    }
}