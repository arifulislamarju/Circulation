using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_CreateDistribution
/// </summary>
public class dal_CreateDistribution
{
	public dal_CreateDistribution()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;


    public void insert(bll_CreateDistribution bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_distribution '" + bllcreate.RMID + "' ,'"
                                               + bllcreate.RM + "' ,'"
                                               + bllcreate.CUSTID + "' ,'"
                                               + bllcreate.CUSTOMER + "' ,'"
                                               + bllcreate.STATID + "' ,'"
                                               + bllcreate.STATION + "' ,'"
                                               + bllcreate.AUDITUSER + "' ,'"
                                               + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            throw e;
        }
    }



    public void update(bll_CreateDistribution bllcreate)
    {
        try
        {
            cmd = "EXEC Update_distribution '" + bllcreate.DSID + "','"
                                               + bllcreate.RMID + "' ,'"
                                               + bllcreate.RM + "' ,'"
                                               + bllcreate.CUSTID + "' ,'"
                                               + bllcreate.CUSTOMER + "' ,'"
                                               + bllcreate.STATID + "' ,'"
                                               + bllcreate.STATION + "' ,'"
                                               + bllcreate.AUDITUSER + "' ,'"
                                               + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }



    public void delete(bll_CreateDistribution bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_distribution '" + bllcreate.DSID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }





}