using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    bll_CreateUsre bllCreateUser = new bll_CreateUsre();
    clsDataProvider dataProvider = new clsDataProvider();

    protected void Page_Load(object sender, EventArgs e)
    {
        txtUserName.Text = Session["UserName"].ToString();
    }

    protected void btnUpdatePassword_Click(object sender, EventArgs e)
    {
        string strUserName = Session["UserName"].ToString();

        try
        {
            if (Page.IsValid)
            {
                int i = 0;

                i = bllCreateUser.ValidateUser(txtUserName.Text, txtOldPassword.Text);

                if (i != 0)
                {
                    string chngPassword = "Update userList set userPassword='" + txtNewPassword.Text + "' where userName='" + txtUserName.Text + "' and userPassword='" + txtOldPassword.Text + "' and delStatus<>1 ";
                    dataProvider.ExecuteCommand(chngPassword);
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "return", "confirmMe();", true);
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "ErrorAlert", "alert(' Old password is wrong !!');", true);
                }
            }
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

}