using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for dal_weeklyRateSetup
/// </summary>
public class dal_weeklyRateSetup
{
	public dal_weeklyRateSetup()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    clsDataProvider dataProvider = new clsDataProvider();
    string cmd;


    public void Insert(bll_weeklyRateSetup bllRate)
    {
        try
        {

            cmd = "INSERT INTO weeklyRateSetup (day, noOfPage, rate,category) VALUES ('" + bllRate.SAT + "', '" + bllRate.SATPAGE + "', '" + bllRate.SATRATE + "','" + bllRate.CATEGORY + "') , ('" + bllRate.SUN + "', '" + bllRate.SUNPAGE + "', '" + bllRate.SUNRATE + "','" + bllRate.CATEGORY + "'), ('" + bllRate.MON + "', '" + bllRate.MONPAGE + "', '" + bllRate.MONRATE + "','" + bllRate.CATEGORY + "'),  ('" + bllRate.TUES + "', '" + bllRate.TUESPAGE + "', '" + bllRate.TUESRATE + "','" + bllRate.CATEGORY + "'), ('" + bllRate.WED + "', '" + bllRate.WEDPAGE + "', '" + bllRate.WEDRATE + "','" + bllRate.CATEGORY + "'), ('" + bllRate.THURS + "', '" + bllRate.THURSPAGE + "', '" + bllRate.THURSRATE + "','" + bllRate.CATEGORY + "'), ('" + bllRate.FRI + "', '" + bllRate.FRIPAGE + "', '" + bllRate.FRIRATE + "','" + bllRate.CATEGORY + "')   ";


            //cmd = "INSERT INTO weeklyRateSetup (day, noOfPage, rate) set day ='" + bllRate.SAT + "', noOfPage = '" + bllRate.SATPAGE + "', rate = '" + bllRate.SATRATE + "' set day = '" + bllRate.SUN + "', noOfPage = '" + bllRate.SUNPAGE + "',  rate = '" + bllRate.SUNRATE + "' set day ='" + bllRate.MON + "', noOfPage = '" + bllRate.MONPAGE + "', rate = '" + bllRate.MONRATE + "' set day ='" + bllRate.TUES + "', noOfPage = '" + bllRate.TUESPAGE + "', rate = '" + bllRate.TUESRATE + "' set day ='" + bllRate.WED + "', noOfPage = '" + bllRate.WEDPAGE + "', rate = '" + bllRate.WEDRATE + "'  set day ='" + bllRate.THURS + "', noOfPage = '" + bllRate.THURSPAGE + "', rate = '" + bllRate.THURSRATE + "'  set day ='" + bllRate.FRI + "', noOfPage = '" + bllRate.FRIPAGE + "', rate = '" + bllRate.FRIRATE + "'   ";   

            dataProvider.ExecuteCommand(cmd);
        }

        catch (Exception e)
        {

        }

    }


    //public void Update(bll_weeklyRateSetup bllRate)
    //{
    //    try
    //    {

    //        cmd = "UPDATE weeklyRateSetup (day, noOfPage, rate) set day ='" + bllRate.SAT + "', noOfPage = '" + bllRate.SATPAGE + "', rate = '" + bllRate.SATRATE + "' where setupId = 1 set day = '" + bllRate.SUN + "', noOfPage = '" + bllRate.SUNPAGE + "',  rate = '" + bllRate.SUNRATE + "' set day ='" + bllRate.MON + "', noOfPage = '" + bllRate.MONPAGE + "', rate = '" + bllRate.MONRATE + "' set day ='" + bllRate.TUES + "', noOfPage = '" + bllRate.TUESPAGE + "', rate = '" + bllRate.TUESRATE + "' set day ='" + bllRate.WED + "', noOfPage = '" + bllRate.WEDPAGE + "', rate = '" + bllRate.WEDRATE + "'  set day ='" + bllRate.THURS + "', noOfPage = '" + bllRate.THURSPAGE + "', rate = '" + bllRate.THURSRATE + "'  set day ='" + bllRate.FRI + "', noOfPage = '" + bllRate.FRIPAGE + "', rate = '" + bllRate.FRIRATE + "'   ";   


    //        dataProvider.ExecuteCommand(cmd);
    //    }

    //    catch (Exception e)
    //    {

    //    }

    //}



}