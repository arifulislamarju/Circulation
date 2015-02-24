using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_ReasonOfUnsold
/// </summary>
public class dal_ReasonOfUnsold
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;
    
    public dal_ReasonOfUnsold()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    public void Insert(bll_ReasonOfUnsold bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_reasonOfUnsold '" +bllcreate.REASONTYPE+"','" 
                                                 + bllcreate.REASONDETAILS + "' ,'"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }



    public void Update(bll_ReasonOfUnsold bllcreate)
    {
        try
        {
            cmd = "EXEC Update_reasonOfUnsold '" + bllcreate.REASONID + "','"
                                                 + bllcreate.REASONTYPE+ "','"
                                                 + bllcreate.REASONDETAILS + "' ,'"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void Delete(bll_ReasonOfUnsold bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_reasonOfUnsold '" + bllcreate.REASONID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }



}