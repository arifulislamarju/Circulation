using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_PopulationInfo
/// </summary>
public class dal_PopulationInfo
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_PopulationInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_populationInfo '" + bllcreate.STATIONNAME + "' ,'"
                                                 + bllcreate.POPULATION + "' ,'"
                                                 + bllcreate.LITERATE + "' ,'"
                                                 + bllcreate.TAKEPALO + "' ,'"
                                                 + bllcreate.REGULAR + "','"
                                                 + bllcreate.FLOATING + "','"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }




    public void Update(bll_PopulationInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Update_populationInfo '" + bllcreate.PIID + "','"
                                                 + bllcreate.STATIONNAME + "' ,'"
                                                 + bllcreate.POPULATION + "' ,'"
                                                 + bllcreate.LITERATE + "' ,'"
                                                 + bllcreate.TAKEPALO + "' ,'"
                                                 +bllcreate.REGULAR+"','"
                                                 +bllcreate.FLOATING+"','"
                                                 + bllcreate.AUDITUSER + "' ,'"
                                                 + bllcreate.CREATEDATE + "' ";
               
            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    public void Delete(bll_PopulationInfo bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_populationInfo '" + bllcreate.PIID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


}