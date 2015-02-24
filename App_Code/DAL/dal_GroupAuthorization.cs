using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_GroupAuthorization
/// </summary>
public class dal_GroupAuthorization
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_GroupAuthorization bllGruopAuthorization)
    {
        try
        {
            cmd = "EXEC Insert_GroupAuthorization '"
                            + bllGruopAuthorization.GROUPID + "','"
                            + bllGruopAuthorization.FUNCTIONID + "','"
                            + bllGruopAuthorization.CREATEDATE + "','"
                            + bllGruopAuthorization.AUDUSER + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
        }
    }

    public void Update(bll_GroupAuthorization bllGruopAuthorization)
    {
        try
        {
            cmd = "EXEC Update_GroupAuthorization '"
                            + bllGruopAuthorization.GROUPID + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }
}