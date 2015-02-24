using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class PaperComparison : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();

    BllPaperComparison paperObj = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!IsPostBack)
        {
            DisplayData();
        }

        clsHelper.CheckLogin();
    }

    private void DisplayData()
    {
        paperObj = new BllPaperComparison();
        DataTable dt = paperObj.DisplayData();
        gridView.DataSource = dt;
        gridView.DataBind();
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        DateTime date=DateTime.Today;
        paperObj = new BllPaperComparison();

        string strCount = "Select Count(PID) from PCOMPARE where PAPERNAME='"+txtName.Text+"'";
        int RowNumber =Convert.ToInt32(dataProvider.getResultString(strCount));

        if (RowNumber == 0)
        {
            //paperObj.Id = Convert.ToInt32(txtId.Text);
            paperObj.Name = txtName.Text;
            paperObj.PaperType = ddlPaperType.SelectedItem.Text;
            paperObj.PaperPrice = txtPaperPrc.Text;
            DateTime Date = date;
            string user = (string)Session["UserName"];
            paperObj.Status = Convert.ToInt32(rdbtnActive.SelectedValue);
            paperObj.SortOrder = Convert.ToInt32(txtSortingOrder.Text);

            paperObj.Save(paperObj, user, Date);
            ClientScript.RegisterStartupScript(GetType(), "Message", "<script language='javascript'>alert('Data inserted Successfully')</script>");
            Clear();
        }
        else
        {
            ClientScript.RegisterStartupScript(GetType(), "Message", "<script language='javascript'>alert('Data already exists')</script>");
        }
        
        DisplayData();
    }

    private void Clear()
    {
        txtId.Text = "";
        txtName.Text = "";
        txtPaperPrc.Text = "";
        ddlPaperType.SelectedItem.Text = "Select";
        rdbtnActive.SelectedValue = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Clear();
    }
    protected void gridView_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtId.Text = gridView.SelectedRow.Cells[0].Text;
        txtName.Text = gridView.SelectedRow.Cells[1].Text;
        ddlPaperType.SelectedItem.Text = gridView.SelectedRow.Cells[2].Text;
        txtPaperPrc.Text = gridView.SelectedRow.Cells[3].Text;
        txtSortingOrder.Text = gridView.SelectedRow.Cells[6].Text;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        int pId = Convert.ToInt32(txtId.Text);
        string pName = txtName.Text;
        string PaperType = ddlPaperType.SelectedItem.Text;
        string PaperPrice = txtPaperPrc.Text;
        //string auditor = (string)Session["UserName"];
        int status = Convert.ToInt32(rdbtnActive.SelectedValue);
        int sortOrder = Convert.ToInt32(txtSortingOrder.Text);

        paperObj = new BllPaperComparison();
        paperObj.Update(pId, pName, PaperType, PaperPrice, status, sortOrder);

        Clear();
        DisplayData();
    }
}