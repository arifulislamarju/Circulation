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

public partial class groupAuthorization : System.Web.UI.Page
{

    clsDataProvider dataProvider = new clsDataProvider();
    bll_GroupAuthorization bllGruopAuthorization = new bll_GroupAuthorization();

    #region All Global Variable
    #endregion

    #region All Page load event

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                bindDdlGroupName();

                CheckboxListBind();

                populateGroupPermission();
            }
            clsHelper.CheckLogin();
            
        }

    #endregion

    #region All private methods

        private void populateGroupPermission()
        {
            string strFncName = "";
            int j = 0;
            int intFncId=0;

            string selGroupId = "SELECT groupId from userGroup where delStatus<>1 AND groupName='" + ddlUserGroup.SelectedItem.Text + "'";
            int groupId = Convert.ToInt32(dataProvider.getResultString(selGroupId));

            string selFunctionName = "SELECT functionId FROM GropuPermission where groupId='"+groupId+"'";            
            SqlDataReader sdr = dataProvider.getDataReader(selFunctionName);
            

            while (sdr.Read())
            {              

                 intFncId =Convert.ToInt32(sdr["functionId"]);

                string selFunName = "SELECT functionName FROM groupFunction where functionId='" + intFncId + "'";
                strFncName = dataProvider.getResultString(selFunName);
                
                int i = j;
                for (i = j; i < this.chkFunctionList.Items.Count; i++)
                {
                    if (this.chkFunctionList.Items[i].Text.ToString()==strFncName)
                    {
                        chkFunctionList.Items[i].Selected = true;
                        j = i+1;                       
                    }
                    else
                    {
                        chkFunctionList.Items[i].Selected = false;
                    }
                }
            }
            
            sdr.Close();

            if (intFncId== 0)
            {
                int i = 0;
                for (i = j; i < this.chkFunctionList.Items.Count; i++)
                {
                    chkFunctionList.Items[i].Selected = false;
                }
            }

            
        }

        private void bindDdlGroupName()
        {
            string query = "SELECT  groupName from userGroup where delStatus<>1 Order By groupName ASC ";
            DataSet ds = new DataSet();
            ds = dataProvider.getDataSet(query, "groupName");
            ddlUserGroup.DataSource = ds;
            ddlUserGroup.DataTextField = "groupName";
            ddlUserGroup.DataValueField = "groupName";
            ddlUserGroup.DataBind();

            groupDesc();
        }
        private void groupDesc()
        {
            string selGroupDesc = "SELECT groupDescription from userGroup where  groupName='" + ddlUserGroup.SelectedItem.Text + "'"; 
            this.txtGroupDesc.Text = dataProvider.getResultString(selGroupDesc);

        }
        private void CheckboxListBind()
        {
            
            string selFunctionName = "SELECT functionName FROM groupFunction order by functionId asc";
            SqlDataReader sdr = dataProvider.getDataReader(selFunctionName);
           
            while (sdr.Read())
            {
                chkFunctionList.Items.Add(sdr.GetValue(0).ToString());
            }
            sdr.Close();
        }

        private void CustomizeList()
        {
            int i = 0;
            for (i = 0; i < this.chkFunctionList.Items.Count; i++)
            {
                if (this.chkFunctionList.Items[i].Text.ToString().Contains("FORM") == true)
                {
                    this.chkFunctionList.Items[i].Attributes.CssStyle.Add("color", "blue");
                    this.chkFunctionList.Items[i].Attributes.CssStyle.Add("font-weight", "bold");
                }
                else
                {
                    this.chkFunctionList.Items[i].Attributes.CssStyle.Add("color", "green");
                    this.chkFunctionList.Items[i].Attributes.CssStyle.Add("position", "relative");
                    this.chkFunctionList.Items[i].Attributes.CssStyle.Add("left", "16px");
                }
            }
        }

    #endregion

    #region All Button event

        protected void btnSave_Click(object sender, EventArgs e)
        {

            bool chkPermission = false;

            for (int i = 0; i < chkFunctionList.Items.Count; i++)
            {
                if (chkFunctionList.Items[i].Selected)
                {
                    string selGroupId = "SELECT groupId from userGroup where delStatus<>1 AND groupName='" + ddlUserGroup.SelectedItem.Text + "'";
                    int groupId = Convert.ToInt32(dataProvider.getResultString(selGroupId));

                    string selFunction = "SELECT functionId from groupFunction where functionName='" + chkFunctionList.Items[i].Text + "'";
                    int functionId = Convert.ToInt32(dataProvider.getResultString(selFunction));

                    string countRow = "Select count(*) from GropuPermission where groupId='" + groupId + "' ";
                    int rowNumber=Convert.ToInt32(dataProvider.getResultString(countRow));
                    


                    bllGruopAuthorization.GROUPID = groupId;
                    bllGruopAuthorization.FUNCTIONID = functionId;
                    bllGruopAuthorization.CREATEDATE = DateTime.Now;
                    bllGruopAuthorization.AUDUSER = Session["UserName"].ToString();

                    if (rowNumber == 0)
                    {
                        bllGruopAuthorization.Insert();
                    }
                    else
                    {
                        if (chkPermission == false)
                        {
                            bllGruopAuthorization.Update();

                            chkPermission = true;
                        }

                        bllGruopAuthorization.Insert();
                    }
                }
            }
        }

    #endregion

    #region CheckBoxList Custom Design Method

        protected void ddlUserGroup_SelectedIndexChanged(object sender, EventArgs e)
        {
            groupDesc();

            populateGroupPermission();
        }

        protected void chkFunctionList_Load(object sender, EventArgs e)
        {
            CustomizeList();
        }
    #endregion

       
}