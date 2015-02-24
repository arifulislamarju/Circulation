using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_MonthlyTarget
/// </summary>
public class bll_MonthlyTarget
{
    dal_MonthlyTarget dalCreate = new dal_MonthlyTarget();

    private int _MONTHGMID;
    private string _MONTHGMNAME;

    private int _MONTHMANAGERID;
    private string _MONTHMANAGERNAME;

    private int _MONTHRMID;
    private string _MONTHRMNAME;

    private int _YEAR;

    private string _JAN;
    private int _TARGETCOPYJAN;

    private string _FEB;
    private int _TARGETCOPYFEB;

    private string _MAR;
    private int _TARGETCOPYMAR;

    private string _APR;
    private int _TARGETCOPYAPR;

    private string _MAY;
    private int _TARGETCOPYMAY;

    private string _JUN;
    private int _TARGETCOPYJUN;

    private string _JUL;
    private int _TARGETCOPYJUL;

    private string _AUG;
    private int _TARGETCOPYAUG;

    private string _SEP;
    private int _TARGETCOPYSEP;

    private string _OCT;
    private int _TARGETCOPYOCT;

    private string _NOV;
    private int _TARGETCOPYNOV;

    private string _DEC;
    private int _TARGETCOPYDEC;


    public int MONTHGMID
    {
        get { return _MONTHGMID; }
        set { _MONTHGMID = value; }
    }

    public string MONTHGMNAME
    {
        get { return _MONTHGMNAME; }
        set { _MONTHGMNAME = value; }
    }

    //------------

    public int MONTHMANAGERID
    {
        get { return _MONTHMANAGERID; }
        set { _MONTHMANAGERID = value; }
    }

    public string MONTHMANAGERNAME
    {
        get { return _MONTHMANAGERNAME; }
        set { _MONTHMANAGERNAME = value; }
    }

    //-----------

    public int MONTHRMID
    {
        get { return _MONTHRMID; }
        set { _MONTHRMID = value; }
    }

    public string MONTHRMNAME
    {
        get { return _MONTHRMNAME; }
        set { _MONTHRMNAME = value; }
    }

    public int YEAR
    {
        get { return _YEAR; }
        set { _YEAR = value; }
    }

    //-----------

    public string JAN
    {
        get { return _JAN; }
        set { _JAN = value; }
    }

    public int TARGETCOPYJAN
    {
        get { return _TARGETCOPYJAN; }
        set { _TARGETCOPYJAN = value; }
    }
    
    //------------

    public string FEB
    {
        get { return _FEB; }
        set { _FEB = value; }
    }

    public int TARGETCOPYFEB
    {
        get { return _TARGETCOPYFEB; }
        set { _TARGETCOPYFEB = value; }
    }

    //---------

    public string MAR
    {
        get { return _MAR; }
        set { _MAR = value; }
    }

    public int TARGETCOPYMAR
    {
        get { return _TARGETCOPYMAR; }
        set { _TARGETCOPYMAR = value; }
    }

    //--------------

    public string APR
    {
        get { return _APR; }
        set { _APR = value; }
    }

    public int TARGETCOPYAPR
    {
        get { return _TARGETCOPYAPR; }
        set { _TARGETCOPYAPR = value; }
    }

    //-------------

    public string MAY
    {
        get { return _MAY; }
        set { _MAY = value; }
    }

    public int TARGETCOPYMAY
    {
        get { return _TARGETCOPYMAY; }
        set { _TARGETCOPYMAY = value; }
    }

    //---------------

    public string JUN
    {
        get { return _JUN; }
        set { _JUN = value; }
    }

    public int TARGETCOPYJUN
    {
        get { return _TARGETCOPYJUN; }
        set { _TARGETCOPYJUN = value; }
    }

    //-----------------

    public string JUL
    {
        get { return _JUL; }
        set { _JUL = value; }
    }

    public int TARGETCOPYJUL
    {
        get { return _TARGETCOPYJUL; }
        set { _TARGETCOPYJUL = value; }
    }

    //---------------

    public string AUG
    {
        get { return _AUG; }
        set { _AUG = value; }
    }

    public int TARGETCOPYAUG
    {
        get { return _TARGETCOPYAUG; }
        set { _TARGETCOPYAUG = value; }
    }

    //-------------------

    public string SEP
    {
        get { return _SEP; }
        set { _SEP = value; }
    }

    public int TARGETCOPYSEP
    {
        get { return _TARGETCOPYSEP; }
        set { _TARGETCOPYSEP = value; }
    }

    //-----------------

    public string OCT
    {
        get { return _OCT; }
        set { _OCT = value; }
    }

    public int TARGETCOPYOCT
    {
        get { return _TARGETCOPYOCT; }
        set { _TARGETCOPYOCT = value; }
    }

    //--------------------

    public string NOV
    {
        get { return _NOV; }
        set { _NOV = value; }
    }

    public int TARGETCOPYNOV
    {
        get { return _TARGETCOPYNOV; }
        set { _TARGETCOPYNOV = value; }
    }

    //--------------------

    public string DEC
    {
        get { return _DEC; }
        set { _DEC = value; }
    }

    public int TARGETCOPYDEC
    {
        get { return _TARGETCOPYDEC; }
        set { _TARGETCOPYDEC = value; }
    }




    //-------------------------

    public void gmInsert()
    {
        dalCreate.gmInsert(this);
    }

    public void managerInsert()
    {
        dalCreate.managerInsert(this);
    }

    public void rmInsert()
    {
        dalCreate.rmInsert(this);
    }


}