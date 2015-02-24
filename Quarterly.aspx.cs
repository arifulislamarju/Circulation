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

public partial class Quarterly : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            //GM Load

            bindDdlYearGM();

            string yearGM = "SELECT  count(yearGM) from yearlyGM where delStatus<>1";
            int countyearGM = Convert.ToInt32(dataProvider.getResultString(yearGM));

            if (countyearGM != 0)
            {
                bindDdlGM();
            }

            string GmName = "SELECT  count(yrGmName) from yearlyGM where delStatus<>1 AND yearGM='" + ddlYearGM.SelectedItem.Text + "' ";
            int countGmName = Convert.ToInt32(dataProvider.getResultString(GmName));

            if (countyearGM != 0 && countGmName != 0)
            {
                //readDataGM();
                //btnChangeGM();
            }



            //Manager Load

            bindDdlYearManager();

            string yearMan = "SELECT  count(yearMan) from yearlyManager where delStatus<>1";
            int countyearMan = Convert.ToInt32(dataProvider.getResultString(yearMan));

            if (countyearMan != 0)
            {
                bindDdlManager();
            }

            string ManName = "SELECT  count(yrManagerName) from yearlyManager where delStatus<>1";
            int countManName = Convert.ToInt32(dataProvider.getResultString(ManName));

            if (countyearMan != 0 && countManName != 0)
            {
                //readDataManager();
                //btnChangeManager();
            }


            //RM Load

            bindDdlYearRM();

            string yearRM = "SELECT  count(yearRM) from yearlyRM where delStatus<>1";
            int countyearRM = Convert.ToInt32(dataProvider.getResultString(yearRM));

            if (countyearRM != 0)
            {
                bindDdlRM();
            }

            string RmName = "SELECT  count(yrRmName) from yearlyRM where delStatus<>1";
            int countRmName = Convert.ToInt32(dataProvider.getResultString(RmName));

            if (countyearRM != 0 && countRmName != 0)
            {
                //readDataRM();
                //btnChangeRM();
            }


        }
        clsHelper.CheckLogin();
    }


    #region GM


    private void bindDdlYearGM()
    {
        string query = "SELECT  yearGM from yearlyGM where delStatus<>1 Order By yearGM ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yearGM");
        ddlYearGM.DataSource = ds;
        ddlYearGM.DataTextField = "yearGM";
        ddlYearGM.DataValueField = "yearGM";
        ddlYearGM.DataBind();
    }


    private void bindDdlGM()
    {
        string query = "SELECT  yrGmName from yearlyGM where delStatus<>1 AND yearGM='" + ddlYearGM.SelectedItem.Text + "' Order By yrGmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrGmName");
        ddlGM.DataSource = ds;
        ddlGM.DataTextField = "yrGmName";
        ddlGM.DataValueField = "yrGmName";
        ddlGM.DataBind();

    }


    protected void ddlYearGM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlYearGM();
    }


    protected void ddlQuarterGM_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuarterGM.SelectedItem.Text == "1st")
        {
            lblGMJan.Text = "JAN";
            lblGMFeb.Text = "FEB";
            lblGMMar.Text = "MAR";
            lblGMApr.Text = "APR";

            string target = "SELECT count(*) from quarterlyGM where  GmName='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                string target1 = "SELECT targetCopy from yearlyGM where delStatus<>1 AND yrGmName='" + ddlGM.SelectedItem.Text + "' AND  yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
                int intTarget1 = Convert.ToInt32(dataProvider.getResultString(target1));
                int targetGM = (intTarget1 / 3);

                txtGmJan.Text = Convert.ToString(targetGM);
                txtGmFeb.Text = Convert.ToString(targetGM);
                txtGmMar.Text = Convert.ToString(targetGM);
                txtGmApr.Text = Convert.ToString(targetGM);
            }

        }
        
        if (ddlQuarterGM.SelectedItem.Text == "2nd")
        {
            lblGMJan.Text = "MAY";
            lblGMFeb.Text = "JUN";
            lblGMMar.Text = "JUL";
            lblGMApr.Text = "AUG";

            string target = "SELECT count(*) from quarterlyGM where  GmName='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                string target1 = "SELECT targetCopy from yearlyGM where delStatus<>1 AND yrGmName='" + ddlGM.SelectedItem.Text + "' AND  yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
                int intTarget1 = Convert.ToInt32(dataProvider.getResultString(target1));
                int targetGM = (intTarget1 / 3);

                txtGmJan.Text = Convert.ToString(targetGM);
                txtGmFeb.Text = Convert.ToString(targetGM);
                txtGmMar.Text = Convert.ToString(targetGM);
                txtGmApr.Text = Convert.ToString(targetGM);
            }

        }

        if (ddlQuarterGM.SelectedItem.Text == "3rd")
        {
            lblGMJan.Text = "SEP";
            lblGMFeb.Text = "OCT";
            lblGMMar.Text = "NOV";
            lblGMApr.Text = "DEC";

            string target = "SELECT count(*) from quarterlyGM where  GmName='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                string target1 = "SELECT targetCopy from yearlyGM where delStatus<>1 AND yrGmName='" + ddlGM.SelectedItem.Text + "' AND  yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
                int intTarget1 = Convert.ToInt32(dataProvider.getResultString(target1));
                int targetGM = (intTarget1 / 3);

                txtGmJan.Text = Convert.ToString(targetGM);
                txtGmFeb.Text = Convert.ToString(targetGM);
                txtGmMar.Text = Convert.ToString(targetGM);
                txtGmApr.Text = Convert.ToString(targetGM);
            }

        }

    }


    #endregion



    #region Manager


    private void bindDdlYearManager()
    {
        string query = "SELECT  yearMan from yearlyManager where delStatus<>1  Order By yearMan ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yearMan");
        ddlYearManager.DataSource = ds;
        ddlYearManager.DataTextField = "yearMan";
        ddlYearManager.DataValueField = "yearMan";
        ddlYearManager.DataBind();
    }


    private void bindDdlManager()
    {
        string query = "SELECT  yrManagerName from yearlyManager where delStatus<>1 AND yearMan='" + ddlYearManager.SelectedItem.Text + "' Order By yrManagerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrManagerName");
        ddlManager.DataSource = ds;
        ddlManager.DataTextField = "yrManagerName";
        ddlManager.DataValueField = "yrManagerName";
        ddlManager.DataBind();

    }


    protected void ddlYearManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlYearManager();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }


    protected void ddlQuarterMan_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuarterMan.SelectedItem.Text == "1st")
        {
            lblManJan.Text = "JAN";
            lblManFeb.Text = "FEB";
            lblManMar.Text = "MAR";
            lblManApr.Text = "APR";

            string target = "SELECT count(*) from quarterlyManager where  managerName='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyManager where delStatus<>1 AND yrManagerName='" + ddlManager.SelectedItem.Text + "' AND  yearMan='" + ddlYearManager.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetManager = (intTarget / 3);

                txtManJan.Text = Convert.ToString(targetManager);
                txtManFeb.Text = Convert.ToString(targetManager);
                txtManMar.Text = Convert.ToString(targetManager);
                txtManApr.Text = Convert.ToString(targetManager);
            }

            else
            {
                //readDataManager();
            }

        }
        
        if (ddlQuarterMan.SelectedItem.Text == "2nd")
        {
            lblManJan.Text = "MAY";
            lblManFeb.Text = "JUN";
            lblManMar.Text = "JUL";
            lblManApr.Text = "AUG";

            string target = "SELECT count(*) from quarterlyManager where  managerName='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyManager where delStatus<>1 AND yrManagerName='" + ddlManager.SelectedItem.Text + "' AND  yearMan='" + ddlYearManager.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetManager = (intTarget / 3);

                txtManJan.Text = Convert.ToString(targetManager);
                txtManFeb.Text = Convert.ToString(targetManager);
                txtManMar.Text = Convert.ToString(targetManager);
                txtManApr.Text = Convert.ToString(targetManager);
            }

            else
            {
                //readDataManager();
            }

        }

        if (ddlQuarterMan.SelectedItem.Text == "3rd")
        {
            lblManJan.Text = "SEP";
            lblManFeb.Text = "OCT";
            lblManMar.Text = "NOV";
            lblManApr.Text = "DEC";

            string target = "SELECT count(*) from quarterlyManager where  managerName='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyManager where delStatus<>1 AND yrManagerName='" + ddlManager.SelectedItem.Text + "' AND  yearMan='" + ddlYearManager.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetManager = (intTarget / 3);

                txtManJan.Text = Convert.ToString(targetManager);
                txtManFeb.Text = Convert.ToString(targetManager);
                txtManMar.Text = Convert.ToString(targetManager);
                txtManApr.Text = Convert.ToString(targetManager);
            }

            else
            {
                //readDataManager();
            }

        }

        ScriptManager.RegisterStartupScript(this, GetType(), "PageLoadDone", "showM();", true);
    }


    #endregion



    #region Regional Manager


    private void bindDdlYearRM()
    {
        string query = "SELECT  yearRM from yearlyRM where delStatus<>1 Order By yearRM ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yearRM");
        ddlYearRM.DataSource = ds;
        ddlYearRM.DataTextField = "yearRM";
        ddlYearRM.DataValueField = "yearRM";
        ddlYearRM.DataBind();
    }


    private void bindDdlRM()
    {
        string query = "SELECT  yrRmName from yearlyRM where delStatus<>1 AND yearRM='" + ddlYearRM.SelectedItem.Text + "' Order By yrRmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrRmName");
        ddlRM.DataSource = ds;
        ddlRM.DataTextField = "yrRmName";
        ddlRM.DataValueField = "yrRmName";
        ddlRM.DataBind();

    }

    protected void ddlYearRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlYearRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }


    protected void ddlQuarterRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlQuarterRM.SelectedItem.Text == "1st")
        {
            lblRmJan.Text = "JAN";
            lblRmFeb.Text = "FEB";
            lblRmMar.Text = "MAR";
            lblRmApr.Text = "APR";

            string target = "SELECT count(*) from quarterlyRM where  rmName='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyRM where delStatus<>1 AND yrRmName='" + ddlRM.SelectedItem.Text + "' AND  yearRM='" + ddlYearRM.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetRM = (intTarget / 3);

                txtRmJan.Text = Convert.ToString(targetRM);
                txtRmFeb.Text = Convert.ToString(targetRM);
                txtRmMar.Text = Convert.ToString(targetRM);
                txtRmApr.Text = Convert.ToString(targetRM);
            }

            else
            {
                //readDataRM();
            }

        }

        if (ddlQuarterRM.SelectedItem.Text == "2nd")
        {
            lblRmJan.Text = "MAY";
            lblRmFeb.Text = "JUN";
            lblRmMar.Text = "JUL";
            lblRmApr.Text = "AUG";

            string target = "SELECT count(*) from quarterlyRM where  rmName='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyRM where delStatus<>1 AND yrRmName='" + ddlRM.SelectedItem.Text + "' AND  yearRM='" + ddlYearRM.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetRM = (intTarget / 3);

                txtRmJan.Text = Convert.ToString(targetRM);
                txtRmFeb.Text = Convert.ToString(targetRM);
                txtRmMar.Text = Convert.ToString(targetRM);
                txtRmApr.Text = Convert.ToString(targetRM);
            }

            else
            {
                //readDataRM();
            }

        }

        if (ddlQuarterRM.SelectedItem.Text == "3rd")
        {
            lblRmJan.Text = "SEP";
            lblRmFeb.Text = "OCT";
            lblRmMar.Text = "NOV";
            lblRmApr.Text = "DEC";

            string target = "SELECT count(*) from quarterlyRM where  rmName='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "'  ";
            int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

            if (intTarget == 0)
            {
                target = "SELECT targetCopy from yearlyRM where delStatus<>1 AND yrRmName='" + ddlRM.SelectedItem.Text + "' AND  yearRM='" + ddlYearRM.SelectedItem.Text + "'  ";
                intTarget = Convert.ToInt32(dataProvider.getResultString(target));
                int targetRM = (intTarget / 3);

                txtRmJan.Text = Convert.ToString(targetRM);
                txtRmFeb.Text = Convert.ToString(targetRM);
                txtRmMar.Text = Convert.ToString(targetRM);
                txtRmApr.Text = Convert.ToString(targetRM);
            }

            else
            {
                //readDataRM();
            }

        }

        ScriptManager.RegisterStartupScript(this, GetType(), "PageLoadDone", "showRM();", true);
    }


    #endregion

}