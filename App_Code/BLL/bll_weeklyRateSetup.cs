using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_weeklyRateSetup
/// </summary>
public class bll_weeklyRateSetup
{
	

    dal_weeklyRateSetup dalCreate = new dal_weeklyRateSetup();

    private int _SETUPID;

    private string _SAT;
    private int _SATPAGE;
    private int _SATRATE;

    private string _SUN;
    private int _SUNPAGE;
    private int _SUNRATE;

    private string _MON;
    private int _MONPAGE;
    private int _MONRATE;

    private string _TUES;
    private int _TUESPAGE;
    private int _TUESRATE;

    private string _WED;
    private int _WEDPAGE;
    private int _WEDRATE;

    private string _THURS;
    private int _THURSPAGE;
    private int _THURSRATE;

    private string _FRI;
    private int _FRIPAGE;
    private int _FRIRATE;

    private string _CATEGORY; 


    public int SETUPID
    {
        get { return _SETUPID; }
        set { _SETUPID = value; }
    }

    //------------

    public string SAT
    {
        get { return _SAT; }
        set { _SAT = value; }
    }

    public int SATPAGE
    {
        get { return _SATPAGE; }
        set { _SATPAGE = value; }
    }

    public int SATRATE
    {
        get { return _SATRATE; }
        set { _SATRATE = value; }
    }

    //-----------

    public string SUN
    {
        get { return _SUN; }
        set { _SUN = value; }
    }

    public int SUNPAGE
    {
        get { return _SUNPAGE; }
        set { _SUNPAGE = value; }
    }

    public int SUNRATE
    {
        get { return _SUNRATE; }
        set { _SUNRATE = value; }
    }

    //--------------

    public string MON
    {
        get { return _MON; }
        set { _MON = value; }
    }

    public int MONPAGE
    {
        get { return _MONPAGE; }
        set { _MONPAGE = value; }
    }

    public int MONRATE
    {
        get { return _MONRATE; }
        set { _MONRATE = value; }
    }

    //---------------

    public string TUES
    {
        get { return _TUES; }
        set { _TUES = value; }
    }

    public int TUESPAGE
    {
        get { return _TUESPAGE; }
        set { _TUESPAGE = value; }
    }

    public int TUESRATE
    {
        get { return _TUESRATE; }
        set { _TUESRATE = value; }
    }

    //----------------------

    public string WED
    {
        get { return _WED; }
        set { _WED = value; }
    }

    public int WEDPAGE
    {
        get { return _WEDPAGE; }
        set { _WEDPAGE = value; }
    }

    public int WEDRATE
    {
        get { return _WEDRATE; }
        set { _WEDRATE = value; }
    }

    //------------------

    public string THURS
    {
        get { return _THURS; }
        set { _THURS = value; }
    }

    public int THURSPAGE
    {
        get { return _THURSPAGE; }
        set { _THURSPAGE = value; }
    }

    public int THURSRATE
    {
        get { return _THURSRATE; }
        set { _THURSRATE = value; }
    }

    //-------------------

    public string FRI
    {
        get { return _FRI; }
        set { _FRI = value; }
    }

    public int FRIPAGE
    {
        get { return _FRIPAGE; }
        set { _FRIPAGE = value; }
    }

    public int FRIRATE
    {
        get { return _FRIRATE; }
        set { _FRIRATE = value; }
    }

    //----------------


    public void Insert()
    {
        dalCreate.Insert(this);

    }

    public string CATEGORY
    {
        get { return _CATEGORY; }
        set { _CATEGORY = value; }
    }

    //public void Update()
    //{
    //    dalCreate.Update(this);

    //}



}