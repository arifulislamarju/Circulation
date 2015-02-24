using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_MonthlyTarget
/// </summary>
public class dal_MonthlyTarget
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;


    public void gmInsert(bll_MonthlyTarget bllcreate)
    {
        try
        {
            cmd = "INSERT INTO monthlyGM (mnthGmName, year, month, targetCopy) VALUES ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JAN + "', '" + bllcreate.TARGETCOPYJAN + "' ) , ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.FEB + "', '" + bllcreate.TARGETCOPYFEB + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAR + "', '" + bllcreate.TARGETCOPYMAR + "' ),  ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.APR + "', '" + bllcreate.TARGETCOPYAPR + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAY + "', '" + bllcreate.TARGETCOPYMAY + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUN + "', '" + bllcreate.TARGETCOPYJUN + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUL + "', '" + bllcreate.TARGETCOPYJUL + "'), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.AUG + "', '" + bllcreate.TARGETCOPYAUG + "' ),  ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.SEP + "', '" + bllcreate.TARGETCOPYSEP + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.OCT + "', '" + bllcreate.TARGETCOPYOCT + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.NOV + "', '" + bllcreate.TARGETCOPYNOV + "' ), ('" + bllcreate.MONTHGMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.DEC + "', '" + bllcreate.TARGETCOPYDEC + "')  ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void managerInsert(bll_MonthlyTarget bllcreate)
    {
        try
        {
            cmd = "INSERT INTO monthlyManager (managerName, year, month, targetCopy) VALUES ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JAN + "', '" + bllcreate.TARGETCOPYJAN + "' ) , ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.FEB + "', '" + bllcreate.TARGETCOPYFEB + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAR + "', '" + bllcreate.TARGETCOPYMAR + "' ),  ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.APR + "', '" + bllcreate.TARGETCOPYAPR + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAY + "', '" + bllcreate.TARGETCOPYMAY + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUN + "', '" + bllcreate.TARGETCOPYJUN + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUL + "', '" + bllcreate.TARGETCOPYJUL + "'), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.AUG + "', '" + bllcreate.TARGETCOPYAUG + "' ),  ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.SEP + "', '" + bllcreate.TARGETCOPYSEP + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.OCT + "', '" + bllcreate.TARGETCOPYOCT + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.NOV + "', '" + bllcreate.TARGETCOPYNOV + "' ), ('" + bllcreate.MONTHMANAGERNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.DEC + "', '" + bllcreate.TARGETCOPYDEC + "')  ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }


    public void rmInsert(bll_MonthlyTarget bllcreate)
    {
        try
        {
            cmd = "INSERT INTO monthlyRM (rmName, year, month, targetCopy) VALUES ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JAN + "', '" + bllcreate.TARGETCOPYJAN + "' ) , ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.FEB + "', '" + bllcreate.TARGETCOPYFEB + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAR + "', '" + bllcreate.TARGETCOPYMAR + "' ),  ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.APR + "', '" + bllcreate.TARGETCOPYAPR + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.MAY + "', '" + bllcreate.TARGETCOPYMAY + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUN + "', '" + bllcreate.TARGETCOPYJUN + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.JUL + "', '" + bllcreate.TARGETCOPYJUL + "'), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.AUG + "', '" + bllcreate.TARGETCOPYAUG + "' ),  ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.SEP + "', '" + bllcreate.TARGETCOPYSEP + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.OCT + "', '" + bllcreate.TARGETCOPYOCT + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.NOV + "', '" + bllcreate.TARGETCOPYNOV + "' ), ('" + bllcreate.MONTHRMNAME + "', '" + bllcreate.YEAR + "', '" + bllcreate.DEC + "', '" + bllcreate.TARGETCOPYDEC + "')  ";

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }
    }

}