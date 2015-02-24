using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_TransportSchedule
/// </summary>
public class dal_TransportSchedule
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_TransportSchedule bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_TransportSchedule '" + bllcreate.TRANSACTIONDATE + "' ,'"
                                                    + bllcreate.ROUTE + "' ,'"
                                                    + bllcreate.SUBROUTE + "' ,'"
                                                    + bllcreate.SORTINGORDER + "' ,'"
                                                    + bllcreate.VEHICLENAME + "' ,'"
                                                    + bllcreate.OWNERNAME + "' ,'"
                                                    + bllcreate.DRIVERNAME + "' ,'"
                                                    + bllcreate.LICENSENO + "' ,'"
                                                    + bllcreate.DEPARTTIME + "' ,'"
                                                    + bllcreate.ARRIVTIME + "' ,'"
                                                    + bllcreate.CAPACITY + "' ,'"
                                                    + bllcreate.ACTUALCOPY + "' ,'"
                                                    + bllcreate.ACTDEPARTURE + "' ,'"
                                                    + bllcreate.ACTUALARRIVAL + "' ,'"
                                                    + bllcreate.PAPERNAME + "' ,'"
                                                    + bllcreate.PIONNAME + "' ,'"
                                                    + bllcreate.DELAYREASON + "' ,'"
                                                    + bllcreate.AUDITUSER + "' ,'"
                                                    + bllcreate.CREATEDATE + "' ";
               
            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Update(bll_TransportSchedule bllcreate)
    {
        try
        {
            cmd = "EXEC Update_TransportSchedule '"
                                                    + bllcreate.TSID + "','"
                                                    + bllcreate.TRANSACTIONDATE + "' ,'"
                                                    + bllcreate.ROUTE + "' ,'"
                                                    + bllcreate.SUBROUTE + "' ,'"
                                                    + bllcreate.SORTINGORDER + "' ,'"
                                                    + bllcreate.VEHICLENAME + "' ,'"
                                                    + bllcreate.OWNERNAME + "' ,'"
                                                    + bllcreate.DRIVERNAME + "' ,'"
                                                    + bllcreate.LICENSENO + "' ,'"
                                                    + bllcreate.DEPARTTIME + "' ,'"
                                                    + bllcreate.ARRIVTIME + "' ,'"
                                                    + bllcreate.CAPACITY + "' ,'"
                                                    + bllcreate.ACTUALCOPY + "' ,'"
                                                    + bllcreate.ACTDEPARTURE + "' ,'"
                                                    + bllcreate.ACTUALARRIVAL + "' ,'"
                                                    + bllcreate.PAPERNAME + "' ,'"
                                                    + bllcreate.PIONNAME + "' ,'"
                                                    + bllcreate.DELAYREASON + "' ,'"
                                                    + bllcreate.AUDITUSER + "' ,'"
                                                    + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void Delete(bll_TransportSchedule bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_TransportSchedule '" + bllcreate.TSID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            
        }
    }


}