using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_subRoute
/// </summary>
public class dal_subRoute
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_subRoute bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_subRoute '" + bllcreate.SUBROUTECODE + "' ,'"
                                        + bllcreate.SUBROUTENAMEBAN + "' ,'"
                                        + bllcreate.SUBROUTENAME + "' ,'"
                                        + bllcreate.ROUTENAME + "' ,'"
                                        + bllcreate.PRESS + "' ,'"
                                        + bllcreate.SORTINGORDER + "' ,'"
                                        + bllcreate.STARTPOINT + "' ,'"
                                        + bllcreate.ENDPOINT + "' ,'"
                                        + bllcreate.DEPARTTIME + "' ,'"                                      
                                        + bllcreate.ARRIVTIME + "' ,'"
                                        + bllcreate.LOCATION + "' ,'"
                                        + bllcreate.AUDITUSER + "' ,'"
                                        + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Update(bll_subRoute bllcreate)
    {
        try
        {
            cmd = "EXEC Update_subRoute '"
                                   + bllcreate.SUBROUTEID + "','"
                                   + bllcreate.SUBROUTECODE + "' ,'"
                                   + bllcreate.SUBROUTENAMEBAN + "' ,'"
                                   + bllcreate.SUBROUTENAME + "' ,'"
                                   + bllcreate.ROUTENAME + "' ,'"
                                   + bllcreate.PRESS + "' ,'"
                                   + bllcreate.SORTINGORDER + "' ,'"
                                   + bllcreate.STARTPOINT + "' ,'"
                                   + bllcreate.ENDPOINT + "' ,'"
                                   + bllcreate.DEPARTTIME + "' ,'"                                
                                   + bllcreate.ARRIVTIME + "' ,'"
                                   + bllcreate.LOCATION + "' ,'"
                                   + bllcreate.AUDITUSER + "' ,'"
                                   + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void Delete(bll_subRoute bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_subRoute '" + bllcreate.SUBROUTEID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


}