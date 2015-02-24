using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_AgentFamInfo
/// </summary>
public class dal_AgentFamInfo
{
	public dal_AgentFamInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_AgentFamInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_AgentFamInfo '" + bllcreate.AGNTID + "','"
                                                 + bllcreate.CHILDNAME + "' ,'"
                                                 + bllcreate.EDUCATION + "' ,'"
                                                 + bllcreate.BIRTHDATE + "' ,'"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }




    public void Update(bll_AgentFamInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Update_AgentFamInfo '" + bllcreate.AGNTID + "','"
                                                 + bllcreate.CHILDNAME + "' ,'"
                                                 + bllcreate.EDUCATION + "' ,'"
                                                 + bllcreate.BIRTHDATE + "' ,'"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Delete(bll_AgentFamInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_AgentFamInfo '" + bllcreate.AGNTID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


}