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

public partial class monthly : System.Web.UI.Page
{
    bll_MonthlyTarget bllcreate = new bll_MonthlyTarget();
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
                readDataGM();
                countTargetGM();
                btnChangeGM();
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
                readDataManager();
                countTargetManager();
                btnChangeManager();
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
                readDataRM();
                countTargetRM();
                btnChangeRM();
            }
                        
                     
        }

        clsHelper.CheckLogin();
        

    }

  


    #region General Manager

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
        string query = "SELECT  yrGmName from yearlyGM where delStatus<>1 AND yearGM='"+ ddlYearGM.SelectedItem.Text +"' Order By yrGmName ASC ";
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
        countTargetGM();
    }

    
    protected void ddlGM_SelectedIndexChanged(object sender, EventArgs e)
    {
        countTargetGM();        
    }

    
    private void CurrentAchieveMentGM()
    {
        string sel = "select orderDate from CurntAchivmnt where gmName= '" + ddlGM.SelectedItem.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            DateTime date = Convert.ToDateTime(sdr["orderDate"].ToString());
            string ss = date.ToString("MMM");

            int total = 0;

            if (ss == "Jan")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jan-2013' AND '31-Jan-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmJanCurnt.Text = total.ToString();
            }

            if (ss == "Feb")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Feb-2013' AND '31-Feb-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmFebCurnt.Text = total.ToString();
            }

            if (ss == "Mar")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Mar-2013' AND '31-Mar-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmMarCurnt.Text = total.ToString();
            }

            if (ss == "Apr")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Apr-2013' AND '31-Apr-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmAprCurnt.Text = total.ToString();
            }

            if (ss == "May")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-May-2013' AND '31-May-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmMayCurnt.Text = total.ToString();
            }

            if (ss == "Jun")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jun-2013' AND '31-Jun-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmJunCurnt.Text = total.ToString();
            }

            if (ss == "Jul")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jul-2013' AND '31-Jul-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmJulCurnt.Text = total.ToString();
            }

            if (ss == "Aug")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Aug-2013' AND '31-Aug-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmAugCurnt.Text = total.ToString();
            }

            if (ss == "Sep")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Sep-2013' AND '31-Sep-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmSepCurnt.Text = total.ToString();
            }

            if (ss == "Oct")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Oct-2013' AND '31-Oct-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmOctCurnt.Text = total.ToString();
            }

            if (ss == "Nov")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Nov-2013' AND '31-Nov-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmNovCurnt.Text = total.ToString();
            }

            if (ss == "Dec")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Dec-2013' AND '31-Dec-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtGmDecCurnt.Text = total.ToString();
            }


        }
    }


    private void countTargetGM()
    {

        string target = "SELECT count(*) from monthlyGM where  mnthGmName='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "'  ";
        int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

        if (intTarget == 0)
        {
            string target1 = "SELECT targetCopy from yearlyGM where delStatus<>1 AND yrGmName='" + ddlGM.SelectedItem.Text + "' AND  yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
            int intTarget1 = Convert.ToInt32(dataProvider.getResultString(target1));
            int targetGM = (intTarget1 / 12);

            txtGmJan.Text = Convert.ToString(targetGM);
            txtGmFeb.Text = Convert.ToString(targetGM);
            txtGmMar.Text = Convert.ToString(targetGM);
            txtGmApr.Text = Convert.ToString(targetGM);
            txtGmMay.Text = Convert.ToString(targetGM);
            txtGmJun.Text = Convert.ToString(targetGM);
            txtGmJul.Text = Convert.ToString(targetGM);
            txtGmAug.Text = Convert.ToString(targetGM);
            txtGmSep.Text = Convert.ToString(targetGM);
            txtGmOct.Text = Convert.ToString(targetGM);
            txtGmNov.Text = Convert.ToString(targetGM);
            txtGmDec.Text = Convert.ToString(targetGM);


            string PrvAchv = "SELECT prvAchv from yearlyGM where delStatus<>1 AND yrGmName='" + ddlGM.SelectedItem.Text + "' AND  yearGM='" + ddlYearGM.SelectedItem.Text + "'  ";
            int intPrvAchv = Convert.ToInt32(dataProvider.getResultString(PrvAchv));
            int PrvAchvGM = (intPrvAchv / 12);

            txtGmJanPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmFebPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmMarPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmAprPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmMayPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmJunPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmJulPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmAugPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmSepPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmOctPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmNovPrv.Text = Convert.ToString(PrvAchvGM);
            txtGmDecPrv.Text = Convert.ToString(PrvAchvGM);


            CurrentAchieveMentGM();
        }

        else 
        {
            readDataGM();
        }

    }


    private void btnChangeGM()
    {
        string selCountrow = "SELECT COUNT(*) from monthlyGM where mnthGmName = '" + ddlGM.SelectedItem.Text + "'  and year='" + ddlYearGM.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            btnSaveGM.Text = "New";
        }

        if (rowNumber != 0)
        {
            btnSaveGM.Text = "Update";
        }

    }


    protected void btnSaveGM_click(object sender, EventArgs e)
    {

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.JAN = lblGMJan.Text;
        bllcreate.TARGETCOPYJAN = Convert.ToInt32(txtGmJan.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.FEB = lblGMFeb.Text;
        bllcreate.TARGETCOPYFEB = Convert.ToInt32(txtGmFeb.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.MAR = lblGMMar.Text;
        bllcreate.TARGETCOPYMAR = Convert.ToInt32(txtGmMar.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.APR = lblGMApr.Text;
        bllcreate.TARGETCOPYAPR = Convert.ToInt32(txtGmApr.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.MAY = lblGMMay.Text;
        bllcreate.TARGETCOPYMAY = Convert.ToInt32(txtGmMay.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.JUN = lblGMJun.Text;
        bllcreate.TARGETCOPYJUN = Convert.ToInt32(txtGmJun.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.JUL = lblGMJul.Text;
        bllcreate.TARGETCOPYJUL = Convert.ToInt32(txtGmJul.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.AUG = lblGMAug.Text;
        bllcreate.TARGETCOPYAUG = Convert.ToInt32(txtGmAug.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.SEP = lblGMSep.Text;
        bllcreate.TARGETCOPYSEP = Convert.ToInt32(txtGmSep.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.OCT = lblGMOct.Text;
        bllcreate.TARGETCOPYOCT = Convert.ToInt32(txtGmOct.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.NOV = lblGMNov.Text;
        bllcreate.TARGETCOPYNOV = Convert.ToInt32(txtGmNov.Text);

        bllcreate.MONTHGMNAME = ddlGM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearGM.Text);
        bllcreate.DEC = lblGMDec.Text;
        bllcreate.TARGETCOPYDEC = Convert.ToInt32(txtGmDec.Text);


        if (btnSaveGM.Text == "New")
        {
            bllcreate.gmInsert();
        }

        if (btnSaveGM.Text == "Update")
        {
            UpdateGM();
        }


        txtGmJan.Text = "";
        txtGmFeb.Text = "";
        txtGmMar.Text = "";
        txtGmApr.Text = "";
        txtGmMay.Text = "";
        txtGmJun.Text = "";
        txtGmJul.Text = "";
        txtGmAug.Text = "";
        txtGmSep.Text = "";
        txtGmOct.Text = "";
        txtGmNov.Text = "";
        txtGmDec.Text = "";


        readDataGM();

    }


    private void readDataGM()
    {
        string sel = "select mnthGmName, year, month, targetCopy from monthlyGM where mnthGmName ='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            string strGmName = sdr["mnthGmName"].ToString();
            string strYear = sdr["year"].ToString();
            string strMonth = sdr["month"].ToString();

            if (strMonth == "JAN" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmJan.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "FEB" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmFeb.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAR" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmMar.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "APR" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmApr.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAY" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmMay.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUN" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmJun.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUL" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmJul.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "AUG" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmAug.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "SEP" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmSep.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "OCT" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmOct.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "NOV" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmNov.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "DEC" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                txtGmDec.Text = sdr["targetCopy"].ToString();
            }

        }

    }


    private void UpdateGM()
    {
        int intTarget= 0 ;
        string strMonth = "";
        string strGmName = "";
        string strYear = "";

        string sel = "select mnthGmName, year, month, targetCopy from monthlyGM where mnthGmName ='" + ddlGM.SelectedItem.Text + "' and year='" + ddlYearGM.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            strMonth = sdr["month"].ToString();
            strGmName = sdr["mnthGmName"].ToString();
            strYear = sdr["year"].ToString();

            if (strMonth == "JAN" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmJan.Text);
            }

            if (strMonth == "FEB" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmFeb.Text);
            }

            if (strMonth == "MAR" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmMar.Text);
            }

            if (strMonth == "APR" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmApr.Text);
            }

            if (strMonth == "MAY" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmMay.Text);
            }

            if (strMonth == "JUN" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmJun.Text);
            }

            if (strMonth == "JUL" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmJul.Text);
            }

            if (strMonth == "AUG" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Int32.Parse(txtGmAug.Text);
            }

            if (strMonth == "SEP" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmSep.Text);
            }

            if (strMonth == "OCT" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmOct.Text);
            }

            if (strMonth == "NOV" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmNov.Text);
            }

            if (strMonth == "DEC" && ddlGM.SelectedItem.Text == strGmName && ddlYearGM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtGmDec.Text);
            }


            string cmd = "update monthlyGM set targetCopy = '" + intTarget + "'  where month = '" + strMonth + "' and mnthGmName ='" + strGmName + "' and year='" + strYear + "'  ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readDataGM();

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
        string query = "SELECT  yrManagerName from yearlyManager where delStatus<>1 AND yearMan='"+ ddlYearManager.SelectedItem.Text +"' Order By yrManagerName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrManagerName");
        ddlManager.DataSource = ds;
        ddlManager.DataTextField = "yrManagerName";
        ddlManager.DataValueField = "yrManagerName";
        ddlManager.DataBind();

    }
    


    protected void ddlManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlYearManager();
        countTargetManager();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }


    protected void ddlYearManager_SelectedIndexChanged(object sender, EventArgs e)
    {
        countTargetManager();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }


    private void CurrentAchieveMentMan()
    {
        string sel = "select orderDate from CurntAchivmnt where managerName= '" + ddlManager.SelectedItem.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            DateTime date = Convert.ToDateTime(sdr["orderDate"].ToString());
            string ss = date.ToString("MMM");

            int total = 0;

            if (ss == "Jan")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jan-2013' AND '31-Jan-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManJanCurnt.Text = total.ToString();
            }

            if (ss == "Feb")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Feb-2013' AND '31-Feb-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManFebCurnt.Text = total.ToString();
            }

            if (ss == "Mar")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Mar-2013' AND '31-Mar-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManMarCurnt.Text = total.ToString();
            }

            if (ss == "Apr")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Apr-2013' AND '31-Apr-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManAprCurnt.Text = total.ToString();
            }

            if (ss == "May")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-May-2013' AND '31-May-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManMayCurnt.Text = total.ToString();
            }

            if (ss == "Jun")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jun-2013' AND '31-Jun-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManJunCurnt.Text = total.ToString();
            }

            if (ss == "Jul")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jul-2013' AND '31-Jul-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManJulCurnt.Text = total.ToString();
            }

            if (ss == "Aug")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Aug-2013' AND '31-Aug-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManAugCurnt.Text = total.ToString();
            }

            if (ss == "Sep")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Sep-2013' AND '31-Sep-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManSepCurnt.Text = total.ToString();
            }

            if (ss == "Oct")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Oct-2013' AND '31-Oct-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManOctCurnt.Text = total.ToString();
            }

            if (ss == "Nov")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Nov-2013' AND '31-Nov-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManNovCurnt.Text = total.ToString();
            }

            if (ss == "Dec")
            {
                string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Dec-2013' AND '31-Dec-2013' ";
                SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                while (sdr1.Read())
                {
                    int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                    int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                    int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                    int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                    total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                }

                txtManDecCurnt.Text = total.ToString();
            }


        }
    }


    private void countTargetManager()
    {

        string target = "SELECT count(*) from monthlyManager where  managerName='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "'  ";
        int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

        if (intTarget == 0)
        {
            target = "SELECT targetCopy from yearlyManager where delStatus<>1 AND yrManagerName='" + ddlManager.SelectedItem.Text + "' AND  yearMan='" + ddlYearManager.SelectedItem.Text + "'  ";
            intTarget = Convert.ToInt32(dataProvider.getResultString(target));
            int targetManager = (intTarget / 12);

            txtManJan.Text = Convert.ToString(targetManager);
            txtManFeb.Text = Convert.ToString(targetManager);
            txtManMar.Text = Convert.ToString(targetManager);
            txtManApr.Text = Convert.ToString(targetManager);
            txtManMay.Text = Convert.ToString(targetManager);
            txtManJun.Text = Convert.ToString(targetManager);
            txtManJul.Text = Convert.ToString(targetManager);
            txtManAug.Text = Convert.ToString(targetManager);
            txtManSep.Text = Convert.ToString(targetManager);
            txtManOct.Text = Convert.ToString(targetManager);
            txtManNov.Text = Convert.ToString(targetManager);
            txtManDec.Text = Convert.ToString(targetManager);

            CurrentAchieveMentMan();
        }

        else
        {
            readDataManager();
        }

    }


    private void btnChangeManager()
    {
        string selCountrow = "SELECT COUNT(*) from monthlyManager where managerName = '" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            btnSaveManager.Text = "New";
        }

        if (rowNumber != 0)
        {
            btnSaveManager.Text = "Update";
        }

    }


    protected void btnSaveManager_click(object sender, EventArgs e)
    {

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.JAN = lblManJan.Text;
        bllcreate.TARGETCOPYJAN = Convert.ToInt32(txtManJan.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.FEB = lblManFeb.Text;
        bllcreate.TARGETCOPYFEB = Convert.ToInt32(txtManFeb.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.MAR = lblManMar.Text;
        bllcreate.TARGETCOPYMAR = Convert.ToInt32(txtManMar.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.APR = lblManApr.Text;
        bllcreate.TARGETCOPYAPR = Convert.ToInt32(txtManApr.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.MAY = lblManMay.Text;
        bllcreate.TARGETCOPYMAY = Convert.ToInt32(txtManMay.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.JUN = lblManJun.Text;
        bllcreate.TARGETCOPYJUN = Convert.ToInt32(txtManJun.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.JUL = lblManJul.Text;
        bllcreate.TARGETCOPYJUL = Convert.ToInt32(txtManJul.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.AUG = lblManAug.Text;
        bllcreate.TARGETCOPYAUG = Convert.ToInt32(txtManAug.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.SEP = lblManSep.Text;
        bllcreate.TARGETCOPYSEP = Convert.ToInt32(txtManSep.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.OCT = lblManOct.Text;
        bllcreate.TARGETCOPYOCT = Convert.ToInt32(txtManOct.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.NOV = lblManNov.Text;
        bllcreate.TARGETCOPYNOV = Convert.ToInt32(txtManNov.Text);

        bllcreate.MONTHMANAGERNAME = ddlManager.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearManager.Text);
        bllcreate.DEC = lblManDec.Text;
        bllcreate.TARGETCOPYDEC = Convert.ToInt32(txtManDec.Text);


        if (btnSaveManager.Text == "New")
        {
            bllcreate.managerInsert();
        }

        if (btnSaveManager.Text == "Update")
        {
            UpdateManager();
        }


        readDataManager();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showM();", true);
    }


    private void readDataManager()
    {
        string sel = "select managerName, year, month, targetCopy from monthlyManager where managerName ='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            string strManName = sdr["managerName"].ToString();
            string strYear = sdr["year"].ToString();
            string strMonth = sdr["month"].ToString();

            if (strMonth == "JAN" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManJan.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "FEB" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManFeb.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAR" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManMar.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "APR" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManApr.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAY" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManMay.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUN" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManJun.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUL" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManJul.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "AUG" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManAug.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "SEP" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManSep.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "OCT" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManOct.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "NOV" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManNov.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "DEC" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                txtManDec.Text = sdr["targetCopy"].ToString();
            }

        }

    }


    private void UpdateManager()
    {
        int intTarget = 0;
        string strMonth = "";
        string strManName = "";
        string strYear = "";

        string sel = "select managerName, year, month, targetCopy from monthlyManager where managerName ='" + ddlManager.SelectedItem.Text + "' and year='" + ddlYearManager.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            strMonth = sdr["month"].ToString();
            strManName = sdr["managerName"].ToString();
            strYear = sdr["year"].ToString();

            if (strMonth == "JAN" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManJan.Text);
            }

            if (strMonth == "FEB" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManFeb.Text);
            }

            if (strMonth == "MAR" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManMar.Text);
            }

            if (strMonth == "APR" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManApr.Text);
            }

            if (strMonth == "MAY" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManMay.Text);
            }

            if (strMonth == "JUN" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManJun.Text);
            }

            if (strMonth == "JUL" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManJul.Text);
            }

            if (strMonth == "AUG" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Int32.Parse(txtManAug.Text);
            }

            if (strMonth == "SEP" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManSep.Text);
            }

            if (strMonth == "OCT" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManOct.Text);
            }

            if (strMonth == "NOV" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManNov.Text);
            }

            if (strMonth == "DEC" && ddlManager.SelectedItem.Text == strManName && ddlYearManager.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtManDec.Text);
            }


            string cmd = "update monthlyManager set targetCopy = '" + intTarget + "'  where month = '" + strMonth + "' and managerName ='" + strManName + "' and year='" + strYear + "'  ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readDataGM();

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
        string query = "SELECT  yrRmName from yearlyRM where delStatus<>1 AND yearRM='"+ ddlYearRM.SelectedItem.Text +"' Order By yrRmName ASC ";
        DataSet ds = new DataSet();
        ds = dataProvider.getDataSet(query, "yrRmName");
        ddlRM.DataSource = ds;
        ddlRM.DataTextField = "yrRmName";
        ddlRM.DataValueField = "yrRmName";
        ddlRM.DataBind();

    }


    protected void ddlRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindDdlYearRM();
        countTargetRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }


    protected void ddlYearRM_SelectedIndexChanged(object sender, EventArgs e)
    {
        countTargetRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }


    private void CurrentAchieveMentRM()
    {
        string sel = "select orderDate from CurntAchivmnt where rmName= '" + ddlRM.SelectedItem.Text + "' ";
        //int mm = Convert.ToInt32(dataProvider.getResultString(sel));
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        //if (mm != null && mm != 0)
        //{
            while (sdr.Read())
            {
                DateTime date = Convert.ToDateTime(sdr["orderDate"].ToString());
                string ss = date.ToString("MMM");

                int total = 0;

                if (ss == "Jan")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jan-2013' AND '31-Jan-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmJanCurnt.Text = total.ToString();
                }

                if (ss == "Feb")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Feb-2013' AND '31-Feb-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmFebCurnt.Text = total.ToString();
                }

                if (ss == "Mar")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Mar-2013' AND '31-Mar-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmMarCurnt.Text = total.ToString();
                }

                if (ss == "Apr")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Apr-2013' AND '31-Apr-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmAprCurnt.Text = total.ToString();
                }

                if (ss == "May")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-May-2013' AND '31-May-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmMayCurnt.Text = total.ToString();
                }

                if (ss == "Jun")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jun-2013' AND '31-Jun-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmJunCurnt.Text = total.ToString();
                }

                if (ss == "Jul")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Jul-2013' AND '31-Jul-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmJulCurnt.Text = total.ToString();
                }

                if (ss == "Aug")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Aug-2013' AND '31-Aug-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmAugCurnt.Text = total.ToString();
                }

                if (ss == "Sep")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Sep-2013' AND '31-Sep-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmSepCurnt.Text = total.ToString();
                }

                if (ss == "Oct")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Oct-2013' AND '31-Oct-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmOctCurnt.Text = total.ToString();
                }

                if (ss == "Nov")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Nov-2013' AND '31-Nov-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmNovCurnt.Text = total.ToString();
                }

                if (ss == "Dec")
                {
                    string sel1 = "select quantity, bonusCopy, complementaryCopy, returnCopy from CurntAchivmnt where orderDate BETWEEN '01-Dec-2013' AND '31-Dec-2013' ";
                    SqlDataReader sdr1 = dataProvider.getDataReader(sel1);

                    while (sdr1.Read())
                    {
                        int quantity1 = Convert.ToInt32(sdr1["quantity"].ToString());
                        int bonusCopy = Convert.ToInt32(sdr1["bonusCopy"].ToString());
                        int complementaryCopy = Convert.ToInt32(sdr1["complementaryCopy"].ToString());
                        int returnCopy = Convert.ToInt32(sdr1["returnCopy"].ToString());

                        total += ((quantity1 + bonusCopy + complementaryCopy) - returnCopy);
                    }

                    txtRmDecCurnt.Text = total.ToString();
                }


            }

        //}

        //else
        //{
        //    txtRmJanCurnt.Text = "";
        //    txtRmFebCurnt.Text = "";
        //    txtRmMarCurnt.Text = "";
        //    txtRmAprCurnt.Text = "";
        //    txtRmMayCurnt.Text = "";
        //    txtRmJunCurnt.Text = "";
        //    txtRmJulCurnt.Text = "";
        //    txtRmAugCurnt.Text = "";
        //    txtRmSepCurnt.Text = "";
        //    txtRmOctCurnt.Text = "";
        //    txtRmNovCurnt.Text = "";
        //    txtRmDecCurnt.Text = "";
        //}

    }


    private void countTargetRM()
    {

        string target = "SELECT count(*) from monthlyRM where  rmName='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "'  ";
        int intTarget = Convert.ToInt32(dataProvider.getResultString(target));

        if (intTarget == 0)
        {
            target = "SELECT targetCopy from yearlyRM where delStatus<>1 AND yrRmName='" + ddlRM.SelectedItem.Text + "' AND  yearRM='" + ddlYearRM.SelectedItem.Text + "'  ";
            intTarget = Convert.ToInt32(dataProvider.getResultString(target));
            int targetRM = (intTarget / 12);

            txtRmJan.Text = Convert.ToString(targetRM);
            txtRmFeb.Text = Convert.ToString(targetRM);
            txtRmMar.Text = Convert.ToString(targetRM);
            txtRmApr.Text = Convert.ToString(targetRM);
            txtRmMay.Text = Convert.ToString(targetRM);
            txtRmJun.Text = Convert.ToString(targetRM);
            txtRmJul.Text = Convert.ToString(targetRM);
            txtRmAug.Text = Convert.ToString(targetRM);
            txtRmSep.Text = Convert.ToString(targetRM);
            txtRmOct.Text = Convert.ToString(targetRM);
            txtRmNov.Text = Convert.ToString(targetRM);
            txtRmDec.Text = Convert.ToString(targetRM);


            CurrentAchieveMentRM();
        }

        else
        {
            readDataRM();
        }

    }


    private void btnChangeRM()
    {
        string selCountrow = "SELECT COUNT(*) from monthlyRM where rmName = '" + ddlRM.SelectedItem.Text + "'  and year='" + ddlYearRM.SelectedItem.Text + "' ";
        int rowNumber = Convert.ToInt32(dataProvider.getResultString(selCountrow));

        if (rowNumber == 0)
        {
            btnSaveRM.Text = "New";
        }

        if (rowNumber != 0)
        {
            btnSaveRM.Text = "Update";
        }

    }


    protected void btnSaveRM_click(object sender, EventArgs e)
    {

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.JAN = lblRmJan.Text;
        bllcreate.TARGETCOPYJAN = Convert.ToInt32(txtRmJan.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.FEB = lblRmFeb.Text;
        bllcreate.TARGETCOPYFEB = Convert.ToInt32(txtRmFeb.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.MAR = lblRmMar.Text;
        bllcreate.TARGETCOPYMAR = Convert.ToInt32(txtRmMar.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.APR = lblRmApr.Text;
        bllcreate.TARGETCOPYAPR = Convert.ToInt32(txtRmApr.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.MAY = lblRmMay.Text;
        bllcreate.TARGETCOPYMAY = Convert.ToInt32(txtRmMay.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.JUN = lblRmJun.Text;
        bllcreate.TARGETCOPYJUN = Convert.ToInt32(txtRmJun.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.JUL = lblRmJul.Text;
        bllcreate.TARGETCOPYJUL = Convert.ToInt32(txtRmJul.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.AUG = lblRmAug.Text;
        bllcreate.TARGETCOPYAUG = Convert.ToInt32(txtRmAug.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.SEP = lblRmSep.Text;
        bllcreate.TARGETCOPYSEP = Convert.ToInt32(txtRmSep.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.OCT = lblRmOct.Text;
        bllcreate.TARGETCOPYOCT = Convert.ToInt32(txtRmOct.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.NOV = lblRmNov.Text;
        bllcreate.TARGETCOPYNOV = Convert.ToInt32(txtRmNov.Text);

        bllcreate.MONTHRMNAME = ddlRM.Text;
        bllcreate.YEAR = Convert.ToInt32(ddlYearRM.Text);
        bllcreate.DEC = lblRmDec.Text;
        bllcreate.TARGETCOPYDEC = Convert.ToInt32(txtRmDec.Text);


        if (btnSaveRM.Text == "New")
        {
            bllcreate.rmInsert();
        }

        if (btnSaveRM.Text == "Update")
        {
            UpdateRM();
        }

        readDataRM();
        ScriptManager.RegisterStartupScript(this, GetType(), "Datasavedone", "showRM();", true);
    }


    private void readDataRM()
    {
        string sel = "select rmName, year, month, targetCopy from monthlyRM where rmName ='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "' ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            string strRmName = sdr["rmName"].ToString();
            string strYear = sdr["year"].ToString();
            string strMonth = sdr["month"].ToString();

            if (strMonth == "JAN" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmJan.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "FEB" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmFeb.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAR" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmMar.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "APR" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmApr.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "MAY" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmMay.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUN" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmJun.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "JUL" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmJul.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "AUG" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmAug.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "SEP" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmSep.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "OCT" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmOct.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "NOV" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmNov.Text = sdr["targetCopy"].ToString();
            }

            if (strMonth == "DEC" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                txtRmDec.Text = sdr["targetCopy"].ToString();
            }

        }

    }


    private void UpdateRM()
    {
        int intTarget = 0;
        string strMonth = "";
        string strRmName = "";
        string strYear = "";

        string sel = "select rmName, year, month, targetCopy from monthlyRM where rmName ='" + ddlRM.SelectedItem.Text + "' and year='" + ddlYearRM.SelectedItem.Text + "'  ";
        SqlDataReader sdr = dataProvider.getDataReader(sel);

        while (sdr.Read())
        {
            strMonth = sdr["month"].ToString();
            strRmName = sdr["rmName"].ToString();
            strYear = sdr["year"].ToString();

            if (strMonth == "JAN" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmJan.Text);
            }

            if (strMonth == "FEB" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmFeb.Text);
            }

            if (strMonth == "MAR" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmMar.Text);
            }

            if (strMonth == "APR" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmApr.Text);
            }

            if (strMonth == "MAY" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmMay.Text);
            }

            if (strMonth == "JUN" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmJun.Text);
            }

            if (strMonth == "JUL" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmJul.Text);
            }

            if (strMonth == "AUG" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Int32.Parse(txtRmAug.Text);
            }

            if (strMonth == "SEP" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmSep.Text);
            }

            if (strMonth == "OCT" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmOct.Text);
            }

            if (strMonth == "NOV" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmNov.Text);
            }

            if (strMonth == "DEC" && ddlRM.SelectedItem.Text == strRmName && ddlYearRM.SelectedItem.Text == strYear)
            {
                intTarget = Convert.ToInt32(txtRmDec.Text);
            }


            string cmd = "update monthlyRM set targetCopy = '" + intTarget + "'  where month = '" + strMonth + "' and rmName ='" + strRmName + "' and year='" + strYear + "'  ";
            dataProvider.ExecuteCommand(cmd);

        }

        Page.ClientScript.RegisterClientScriptBlock(this.GetType(), "errorsmg", "alert('Update Completed...');", true);

        readDataGM();

    }



    #endregion



}