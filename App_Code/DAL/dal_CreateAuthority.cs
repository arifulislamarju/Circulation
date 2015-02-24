using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_CreateAuthority
/// </summary>
public class dal_CreateAuthority
{
	public dal_CreateAuthority()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;


    #region All Insertion

    public void gmInsert(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_gm '" + bllcreate.GM + "' ,'"
                                     + bllcreate.AUDITUSER + "' ,'"
                                     + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
           
        }
    }

    public void managerInsert(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_manager '" + bllcreate.GM + "' ,'"
                                          + bllcreate.MANAGER + "' ,'"
                                          + bllcreate.AUDITUSER + "' ,'"
                                          + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            throw e;
        }
    }

    public void rmInsert(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_rm '" + bllcreate.GM + "' ,'"
                                     + bllcreate.MANAGER + "' ,'"
                                     + bllcreate.RM + "' ,'"
                                     + bllcreate.AUDITUSER + "' ,'"
                                     + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
            throw e;
        }
    }


    #endregion


    #region All Updates


    public void gmUpdate(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Update_gm '"
                            + bllcreate.GMID + "','"
                            + bllcreate.GM + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }



    public void managerUpdate(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Update_manager '"
                            + bllcreate.MANAGERID + "','"
                            + bllcreate.GM + "' ,'"
                            + bllcreate.MANAGER + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void rmUpdate(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Update_rm '"
                            + bllcreate.MANAGERID + "','"
                            + bllcreate.GM + "' ,'"
                            + bllcreate.MANAGER + "' ,'"
                            + bllcreate.RM + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }




    #endregion





    #region All Deletes


    public void gmDelete(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_gm '" + bllcreate.GMID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


    public void managerDelete(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_manager '" + bllcreate.MANAGERID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            
        }
    }


    public void rmDelete(bll_CreateAuthority bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_rm '" + bllcreate.RMID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
           
        }
    }





    #endregion



}