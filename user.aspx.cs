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

public partial class user : System.Web.UI.Page
{
    bll_CreateUsre bllCreateUser = new bll_CreateUsre();
    clsDataProvider dataProvider = new clsDataProvider();

    #region All Global Variable
    #endregion
    
    #region Page Load Event

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindDdlGroupName();
                bindUserList();
            }
            clsHelper.CheckLogin();
        }

    #endregion

    #region All Private methods

        private void bindDdlGroupName()
        {
            string query = "SELECT  groupName from userGroup where delStatus<>1 Order By groupName ASC ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(query, "groupName");
            ddlUserGroup.DataSource = ds;
            ddlUserGroup.DataTextField = "groupName";
            ddlUserGroup.DataValueField = "groupName";
            ddlUserGroup.DataBind();
        }

        private void bindUserList()
        {
            string selUserList = "SELECT * from userList where delStatus<>1";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(selUserList, "userList");
            grdUserList.DataSource = ds;
            grdUserList.DataBind();

            foreach (GridViewRow gvrItem in grdUserList.Rows)
            {
                string userName =gvrItem.Cells[6].Text;

                string groupId = "SELECT  groupID from userList where delStatus<>1 AND userName='" + userName + "' ";
                int grpId = Convert.ToInt32(dataProvider.getResultString(groupId));

                string grpName = "SELECT  groupName from userGroup where delStatus<>1 AND groupId='" + grpId + "' ";
                string groupName = dataProvider.getResultString(grpName);

                gvrItem.Cells[3].Text = groupName;
            }
        }

    #endregion

    #region All Button event

        protected void btnCreateUser_Click(object sender, EventArgs e)
        {
            string selGroupId = "SELECT groupId from userGroup where delStatus<>1 AND groupName='" + ddlUserGroup.SelectedItem.Text + "'";
            int groupId = Convert.ToInt32(dataProvider.getResultString(selGroupId));

            string selCountrow = "SELECT COUNT(*) from userList where userName='" + txtUserName.Text + "' AND delStatus<>1  ";
            int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));


            bllCreateUser.FULLNAME = txtFullName.Text;
            bllCreateUser.USERDESIGNATION = txtDesignation.Text;
            bllCreateUser.GROUPID = groupId;
            bllCreateUser.USERMOBILE = txtMobile.Text;
            bllCreateUser.USEREMAIL = txtEmail.Text;
            bllCreateUser.USERNAME = txtUserName.Text;
            bllCreateUser.USERPASSWORD = txtPassword.Text;
            bllCreateUser.CREATEDATE = DateTime.Now;
            bllCreateUser.AUDUSER = Session["UserName"].ToString();

            if (hdnUserId.Value != "" && hdnUserId.Value != null)
            {
                bllCreateUser.USERID = Convert.ToInt32(hdnUserId.Value);

                bllCreateUser.Update();

                hdnUserId.Value = "";
                btnCreateUser.Text = "Create User";
                                
            }
            else
            {
                if (rowNumber == 0)
                {
                    bllCreateUser.Insert();
                }
                else
                {
                    Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('User name exists, try another name..');", true);
                }
            }         
            
            bindUserList();

            txtFullName.Text = "";
            txtDesignation.Text = "";
            txtMobile.Text = "";
            txtEmail.Text = "";
            txtUserName.Text = "";

        }

    #endregion

    #region All Gridview Event

        protected void grdUserList_RowCreated(object sender, GridViewRowEventArgs e)
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
                HeaderCell.Text = "Full Name";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Designation";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Group";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);
                //HeaderCell.Visible = false;

                HeaderCell = new TableCell();
                HeaderCell.Text = "Mobile No.";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "Email";
                HeaderCell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#000000");
                HeaderCell.Font.Bold = true;
                //HeaderCell.ColumnSpan = 2;
                HeaderGridRow.Cells.Add(HeaderCell);

                HeaderCell = new TableCell();
                HeaderCell.Text = "User Name";
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


                grdUserList.Controls[0].Controls.AddAt
                (0, HeaderGridRow);

            }
        }

        protected void grdUserList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdUserList.PageIndex = e.NewPageIndex;
            grdUserList.DataBind();
            bindUserList();
        }
        protected void grdUserList_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
        {
            int rowIndex = e.NewSelectedIndex;
            PopulateLabelsByRowIndex(rowIndex);
        }

        private void PopulateLabelsByRowIndex(int rowIndex)
        {

            hdnUserId.Value = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[0].Text);
            txtFullName.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[1].Text);
            txtDesignation.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[2].Text);
            //ddlUserGroup.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[3].Text);
            txtMobile.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[4].Text);
            txtEmail.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[5].Text);
            txtUserName.Text = HttpUtility.HtmlDecode(grdUserList.Rows[rowIndex].Cells[6].Text);
            

            btnCreateUser.Text = "Update User";

            
        }
        protected void grdUserList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Cells[0].Visible = false;
                //e.Row.Cells[3].Visible = false;

                LinkButton l = (LinkButton)e.Row.FindControl("LinkButtonDelete");
                l.Attributes.Add("onclick", "javascript:return " +
                "confirm('Are you sure you want to delete user: " +
                DataBinder.Eval(e.Row.DataItem, "USERNAME") + "')");

            }
        }
        protected void grdUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int userId = (int)grdUserList.DataKeys[e.RowIndex].Value;
            bllCreateUser.USERID = userId;
            bllCreateUser.Delete();
            bindUserList();
        }

        #endregion

        
}
