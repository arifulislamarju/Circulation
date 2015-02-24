using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for dal_userGroup
/// </summary>
public class dal_userGroup
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_userGroup bllUserGroup)
    {
        try
        {
            cmd = "EXEC Insert_UserGroup '"
                            + bllUserGroup.GROUPNAME + "','"
                            + bllUserGroup.GROUPDESC + "','"
                            + bllUserGroup.CREATEDATE + "','"
                            + bllUserGroup.AUDUSER + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
        }
    }

    public void Update(bll_userGroup bllUserGroup)
    {
        try
        {
            cmd = "EXEC Update_UserGroup '"
                            + bllUserGroup.GROUPID + "','"
                            + bllUserGroup.GROUPNAME + "','"
                            + bllUserGroup.GROUPDESC + "','"
                            + bllUserGroup.CREATEDATE + "','"
                            + bllUserGroup.AUDUSER + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }

    public void Delete(bll_userGroup bllUserGroup)
    {
        try
        {
            cmd = "EXEC Delete_UserGroup '" + bllUserGroup.GROUPID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }
   
}