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

public partial class userGroup : System.Web.UI.Page
{
    bll_userGroup bllUserGroup = new bll_userGroup();
    clsDataProvider dataProvider = new clsDataProvider();

    #region All Global Variable
    #endregion

    #region Page Load Event

        protected void Page_Load(object sender, EventArgs e)
        {
            bindgroupList();
            clsHelper.CheckLogin();
        }
        

    #endregion

    #region All private Methods

        private void bindgroupList()
        {
            string selGroupList = "SELECT * from userGroup where delStatus=0 order by groupName Asc";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(selGroupList, "userGroup");
            grdGroupList.DataSource = ds;
            grdGroupList.DataBind();
        }
        

    #endregion

    #region All Buttont Event

        protected void btnCreateUserGroup_Click(object sender, EventArgs e)
        {
            string selCountrow = "SELECT COUNT(*) from userGroup where groupName='" + txtGroup.Text + "' AND delStatus<>1";
            int rowNumber =Convert.ToInt32( dataProvider.getResultString(selCountrow));

            bllUserGroup.GROUPNAME = txtGroup.Text;
            bllUserGroup.GROUPDESC = txtGroupDesc.Text;
            bllUserGroup.CREATEDATE = DateTime.Now;
            bllUserGroup.AUDUSER = Session["UserName"].ToString();

            if (hdnGroupId.Value != "" && hdnGroupId.Value != null)
            {
                bllUserGroup.GROUPID =Convert.ToInt32(hdnGroupId.Value);

                bllUserGroup.Update();

                btnCreateUserGroup.Text = "Create Group";

                hdnGroupId.Value = "";
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllUserGroup.Insert();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Group name exists, try another name..');", true);
                }
            }            

            bindgroupList();

            txtGroup.Text = "";
            txtGroupDesc.Text = "";
        }
        
    #endregion

    #region All Gridview Event

        protected void grdGroupList_RowCreated(object sender, GridViewRowEventArgs e)
        {

            if (e.Row.RowType == DataControlRowType.Header)
            {
                GridView HeaderGrid = (GridView)sender;
                GridViewRow HeaderGridRow =
                new GridViewRow(0, 0, DataControlRowType.Header,
                DataControlRowState.Insert);

                HeaderGridRow.BackColor = System.Drawing.ColorTranslator.FromHtml("#BAD0DD");
                HeaderGridRow.ForeColor = System.Drawing.Color.Black;

                TableCell HeaderCell = new TableCell();
                HeaderCell.Text = "Id";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Height = 30;
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                HeaderCell.Visible = false;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Group Name";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Group Description";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Created By";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                //HeaderCell.Visible = false;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Create Date";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Action";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);    


                grdGroupList.Controls[0].Controls.AddAt
                (0, HeaderGridRow);

            }
        }

        protected void grdGroupList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdGroupList.PageIndex = e.NewPageIndex;
            grdGroupList.DataBind();
            bindgroupList();
        }
        protected void grdGroupList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int rowIndex = e.NewSelectedIndex;
            PopulateLabelsByRowIndex(rowIndex);
        }

        private void PopulateLabelsByRowIndex(int rowIndex)
        {

            hdnGroupId.Value = HttpUtility.HtmlDecode(grdGroupList.Rows[rowIndex].Cells[0].Text);
            txtGroup.Text = HttpUtility.HtmlDecode(grdGroupList.Rows[rowIndex].Cells[1].Text);
            txtGroupDesc.Text = HttpUtility.HtmlDecode(grdGroupList.Rows[rowIndex].Cells[2].Text);

            btnCreateUserGroup.Text = "Update Group";
        }
        protected void grdGroupList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Visible = false;
                //e.Row.Cells[3].Visible = false;

                LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete group " +
                DataBinder.Eval(e.Row.DataItem, "GROUPNAME") + "')");

            }
        }
        protected void grdGroupList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int groupId = (int)grdGroupList.DataKeys[e.RowIndex].Value;
            bllUserGroup.GROUPID = groupId;

            string selCountrow = "SELECT COUNT(*) from userList where groupId='" + groupId + "' AND delStatus<>1";
            int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

            if (rowNumber == 0)
            {
                bllUserGroup.Delete();
            }
            else
            {
                Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('This group is used ! do not delete ..');", true);
            }

            bindgroupList();
        }

    #endregion

       
}