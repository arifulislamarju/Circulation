using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_route
/// </summary>
public class dal_route
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_route bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_route '" + bllcreate.ROUTECODE + "' ,'"
                                        + bllcreate.ROUTENAMEBAN + "' ,'"
                                        + bllcreate.ROUTENAME + "' ,'"
                                        + bllcreate.SORTINGORDER + "' ,'"
                                        + bllcreate.STARTPOINT + "' ,'"
                                        + bllcreate.ENDPOINT + "' ,'"
                                        + bllcreate.DEPARTTIME + "' ,'"                                        
                                        + bllcreate.ARRIVTIME + "' ,'"
                                        + bllcreate.AUDITUSER + "' ,'"
                                        + bllcreate.CREATEDATE + "','"
                                        +bllcreate.DISTANCE+"' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Update(bll_route bllcreate)
    {
        try
        {
            cmd = "EXEC Update_route '"
                                   + bllcreate.ROUTEID + "','"
                                   + bllcreate.ROUTECODE + "' ,'"
                                   + bllcreate.ROUTENAMEBAN + "' ,'"
                                   + bllcreate.ROUTENAME + "' ,'"
                                   + bllcreate.SORTINGORDER + "' ,'"
                                   + bllcreate.STARTPOINT + "' ,'"
                                   + bllcreate.ENDPOINT + "' ,'"
                                   + bllcreate.DEPARTTIME + "' ,'"                                   
                                   + bllcreate.ARRIVTIME + "' ,'"
                                   + bllcreate.AUDITUSER + "' ,'"
                                   + bllcreate.CREATEDATE + "','"
                                   + bllcreate.DISTANCE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void Delete(bll_route bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_route '" + bllcreate.ROUTEID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }



}