using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_vehicle
/// </summary>
public class dal_vehicle
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_vehicle bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_vehicle '" + bllcreate.VEHICLECODE + "' ,'"
                                        + bllcreate.VEHICLENAMEBAN + "' ,'"
                                        + bllcreate.VEHICLENAME + "' ,'"
                                        + bllcreate.REGNO + "' ,'"
                                        + bllcreate.CAPACITY + "' ,'"
                                        + bllcreate.RATEPERTRIP + "' ,'"
                                        + bllcreate.OWNERNAME + "' ,'"
                                        + bllcreate.DRIVERNAME + "' ,'"
                                        + bllcreate.LICENSENO + "' ,'"
                                        + bllcreate.ROUTE + "' ,'"
                                        + bllcreate.SUBROUTE + "' ,'"
                                        + bllcreate.AUDITUSER + "' ,'"
                                        + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Update(bll_vehicle bllcreate)
    {
        try
        {
            cmd = "EXEC Update_vehicle '"
                                        + bllcreate.VEHICLEID + "','"
                                        + bllcreate.VEHICLECODE + "' ,'"
                                        + bllcreate.VEHICLENAMEBAN + "' ,'"
                                        + bllcreate.VEHICLENAME + "' ,'"
                                        + bllcreate.REGNO + "' ,'"
                                        + bllcreate.CAPACITY + "' ,'"
                                        + bllcreate.RATEPERTRIP + "' ,'"
                                        + bllcreate.OWNERNAME + "' ,'"
                                        + bllcreate.DRIVERNAME + "' ,'"
                                        + bllcreate.LICENSENO + "' ,'"
                                        + bllcreate.ROUTE + "' ,'"
                                        + bllcreate.SUBROUTE + "' ,'"
                                        + bllcreate.AUDITUSER + "' ,'"
                                        + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void Delete(bll_vehicle bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_vehicle '" + bllcreate.VEHICLEID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


}