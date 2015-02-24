using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Text;
using System.Data.SqlClient;

/// <summary>
/// Summary description for dal_CreateRegion
/// </summary>
public class dal_CreateRegion
{
    public dal_CreateRegion()
    {
        //
        // TODO: Add constructor logic here
        //
    }


    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;



    #region All Inserts


    public void divInsert(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_division '" + bllcreate.DIVISION + "' ,'"
                                           + bllcreate.AUDITUSER+ "' ,'"
                                           + bllcreate.CREATEDATE+ "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
          
        }
    }

    public void distInsert(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_district '" + bllcreate.DIVISION + "' ,'"
                                           + bllcreate.DISTRICT + "' ,'"
                                           + bllcreate.AUDITUSER + "' ,'"
                                           + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
          
        }
    }

    public void psInsert(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_policeStation '" + bllcreate.DIVISION + "' ,'"
                                                + bllcreate.DISTRICT + "' ,'"
                                                + bllcreate.POLICESTATION + "' ,'"
                                                + bllcreate.AUDITUSER + "' ,'"
                                                + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
        
        }
    }

    public void poInsert(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_postOffice '" + bllcreate.DIVISION + "' ,'"
                                             + bllcreate.DISTRICT + "' ,'"
                                             + bllcreate.POLICESTATION + "' ,'"
                                             + bllcreate.POSTOFFICE + "' ,'"
                                             + bllcreate.POCODE + "' ,'"
                                             + bllcreate.AUDITUSER + "' ,'"
                                             + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
          
        }
    }

    public void stationInsert(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Insert_station '" + bllcreate.DIVISION + "' ,'"
                                          + bllcreate.DISTRICT + "' ,'"
                                          + bllcreate.POLICESTATION + "' ,'"
                                          + bllcreate.POSTOFFICE + "' ,'"
                                          + bllcreate.UNION + "' ,'"
                                          + bllcreate.STATIONBAN + "' ,'"
                                          + bllcreate.STATIONENG + "' ,'"
                                          + bllcreate.DEFAULTCOPY + "' ,'"
                                          + bllcreate.PACKTYPE + "' ,'"
                                          + bllcreate.SUBROUTENAME + "' ,'"
                                          + bllcreate.SORTINGORDER + "' ,'"
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

    public void divUpdate(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Update_division '"
                            + bllcreate.DIVISIONID + "','"
                            + bllcreate.DIVISION + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void distUpdate(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Update_district '"
                            + bllcreate.DISTRICTID + "','"
                            + bllcreate.DIVISION + "' ,'"
                            + bllcreate.DISTRICT + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void psUpdate(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Update_policeStation '"
                            + bllcreate.PSID + "','"
                            + bllcreate.DIVISION + "' ,'"
                            + bllcreate.DISTRICT + "' ,'"
                            + bllcreate.POLICESTATION + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void poUpdate(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Update_postOffice '"
                            + bllcreate.POID + "','"
                            + bllcreate.DIVISION + "' ,'"
                            + bllcreate.DISTRICT + "' ,'"
                            + bllcreate.POLICESTATION + "' ,'"
                            + bllcreate.POSTOFFICE + "' ,'"
                            + bllcreate.POCODE + "' ,'"
                            + bllcreate.AUDITUSER + "' ,'"
                            + bllcreate.CREATEDATE + "' ";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {

        }
    }


    public void stationUpdate(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Update_station '"
                            + bllcreate.STATIONID + "','"
                            + bllcreate.DIVISION + "' ,'"
                            + bllcreate.DISTRICT + "' ,'"
                            + bllcreate.POLICESTATION + "' ,'"
                            + bllcreate.POSTOFFICE + "' ,'"
                            + bllcreate.UNION + "' ,'"
                            + bllcreate.STATIONBAN + "' ,'"
                            + bllcreate.STATIONENG + "' ,'"
                            + bllcreate.DEFAULTCOPY + "' ,'"
                            + bllcreate.PACKTYPE + "' ,'"
                            + bllcreate.SUBROUTENAME + "' ,'"
                            + bllcreate.SORTINGORDER + "' ,'"
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


    public void divDelete(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_division '" + bllcreate.DIVISIONID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
            //Use label to print an error >> lbl.text = e.Message;
        }
    }


    public void distDelete(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_district '" + bllcreate.DISTRICTID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {
          
        }
    }

    public void psDelete(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_policeStation '" + bllcreate.PSID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void poDelete(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_postOffice '" + bllcreate.POID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }

    public void stationDelete(bll_CreateRegion bllcreate)
    {
        try
        {
            cmd = "EXEC Delete_station '" + bllcreate.STATIONID + "'";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }



    #endregion




}