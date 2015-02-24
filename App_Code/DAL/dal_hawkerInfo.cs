using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_hawkerInfo
/// </summary>
public class dal_hawkerInfo
{
    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;

    public void Insert(bll_hawkerInfo bllHkrInfo)
    {
        try
        {
            cmd = "EXEC Insert_HawkerInfo '"
                            + bllHkrInfo.HkrID + "','"
                            + bllHkrInfo.HkrType + "','"
                            + bllHkrInfo.HkrNameBangla + "','"
                            + bllHkrInfo.HkrNameEng + "','"
                            + bllHkrInfo.FatherName + "','"
                            + bllHkrInfo.AgentName + "','"
                            + bllHkrInfo.AgentArea + "','"
                            + bllHkrInfo.SalesDuration + "','"
                            + bllHkrInfo.SORTINGORDER + "' ,'"
                            + bllHkrInfo.MarigeDay + "','"
                            + bllHkrInfo.FloatingCopy + "','"
                            + bllHkrInfo.RegularCopy + "','"
                            + bllHkrInfo.CorporateCopy + "','"
                            + bllHkrInfo.BillTo + "','"
                            + bllHkrInfo.ImagePath + "','"
                            + bllHkrInfo.SalesArea + "','"
                            + bllHkrInfo.BirthDay + "','"
                            + bllHkrInfo.MobileNumber + "','"
                            + bllHkrInfo.CREATEDATE + "','"
                            + bllHkrInfo.AUDUSER + "','"
                            + bllHkrInfo.Status + "'";

            dataProvider.ExecuteCommand(cmd);
        }
        catch (Exception e)
        {
        }
    }
}