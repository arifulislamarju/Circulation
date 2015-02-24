using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_YearlyTarget
/// </summary>
public class dal_YearlyTarget
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;


    #region All Insertion

    public void yrGmInsert(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_yearlyGM '" + bllcreate.YEAR + "' ,'"
                                           + bllcreate.GM + "' ,'"                                          
                                           + bllcreate.TARGETCOPY + "' ,'"
                                           + bllcreate.PRVACHIEVEMENT + "' ,'"
                                           + bllcreate.CURNTACHIEVEMENT + "' ,'"
                                           + bllcreate.AUDITUSER + "' ,'"
                                           + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void yrManInsert(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_yearlyManager '" + bllcreate.YEAR + "' ,'"
                                                + bllcreate.GM + "' ,'"
                                                + bllcreate.MANAGER + "' ,'"                                               
                                                + bllcreate.TARGETCOPY + "' ,'"
                                                + bllcreate.AUDITUSER + "' ,'"
                                                + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void yrRmInsert(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_yearlyRM '" + bllcreate.YEAR + "' ,'"
                                           + bllcreate.MANAGER + "' ,'"
                                           + bllcreate.RM + "' ,'"                                         
                                           + bllcreate.TARGETCOPY + "' ,'"
                                           + bllcreate.AUDITUSER + "' ,'"
                                           + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }



    #endregion



    #region All Updates


    public void yrGmUpdate(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Update_yearlyGM '"
                                            + bllcreate.YRGMID + "','"
                                            + bllcreate.GM + "' ,'"
                                            + bllcreate.YEAR + "' ,'"
                                            + bllcreate.TARGETCOPY + "' ,'"
                                            + bllcreate.PRVACHIEVEMENT + "' ,'"
                                            + bllcreate.CURNTACHIEVEMENT + "' ,'"
                                            + bllcreate.AUDITUSER + "' ,'"
                                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void yrManUpdate(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Update_yearlyManager '"                                            
                                            + bllcreate.YRMANAGERID + "','"
                                            + bllcreate.YEAR + "' ,'"
                                            + bllcreate.GM + "' ,'"
                                            + bllcreate.MANAGER + "' ,'"                                           
                                            + bllcreate.TARGETCOPY + "' ,'"
                                            + bllcreate.AUDITUSER + "' ,'"
                                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void yrRmUpdate(bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Update_yearlyRM '"
                                            + bllcreate.YRRMID + "','"
                                            + bllcreate.YEAR + "' ,'"
                                            + bllcreate.MANAGER + "' ,'"
                                            + bllcreate.RM + "' ,'"                                           
                                            + bllcreate.TARGETCOPY + "' ,'"
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


    public void yrGmDelete( bll_YearlyTarget bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_yearlyGM '" + bllcreate.YRGMID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
           
        }
    }



    #endregion

}