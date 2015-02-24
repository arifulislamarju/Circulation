using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_YearlyTarget
/// </summary>
public class bll_YearlyTarget
{
    dal_YearlyTarget dalCreate = new dal_YearlyTarget();


    private int _YRGMID;
    private int _YRMANAGERID;
    private int _YRRMID;

    private string _GM;
    private string _MANAGER;
    private string _RM;
    private int _YEAR;
    private int _TARGETCOPY;
    private int _PRVACHIEVEMENT;
    private int _CURNTACHIEVEMENT;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int YRGMID
    {
        get { return _YRGMID; }
        set { _YRGMID = value; }
    }

    public int YRMANAGERID
    {
        get { return _YRMANAGERID; }
        set { _YRMANAGERID = value; }
    }

    public int YRRMID
    {
        get { return _YRRMID; }
        set { _YRRMID = value; }
    }



    public int YEAR
    {
        get { return _YEAR; }
        set { _YEAR = value; }
    }

    public string GM
    {
        get { return _GM; }
        set { _GM = value; }
    }

    public string MANAGER
    {
        get { return _MANAGER; }
        set { _MANAGER = value; }
    }

    public string RM
    {
        get { return _RM; }
        set { _RM = value; }
    }

    public int TARGETCOPY
    {
        get { return _TARGETCOPY; }
        set { _TARGETCOPY = value; }
    }

    public int PRVACHIEVEMENT
    {
        get { return _PRVACHIEVEMENT; }
        set { _PRVACHIEVEMENT = value; }
    }

    public int CURNTACHIEVEMENT
    {
        get { return _CURNTACHIEVEMENT; }
        set { _CURNTACHIEVEMENT = value; }
    }

    public string AUDITUSER
    {
        get { return _AUDITUSER; }
        set { _AUDITUSER = value; }
    }

    public DateTime CREATEDATE
    {
        get { return _CREATEDATE; }
        set { _CREATEDATE = value; }
    }



    // Insert

    public void yrGmInsert()
    {
        dalCreate.yrGmInsert(this);

    }

    public void yrManInsert()
    {
        dalCreate.yrManInsert(this);

    }

    public void yrRmInsert()
    {
        dalCreate.yrRmInsert(this);

    }




    // Update

    public void yrGmUpdate()
    {
        dalCreate.yrGmUpdate(this);
    }

    public void yrManUpdate()
    {
        dalCreate.yrManUpdate(this);
    }

    public void yrRmUpdate()
    {
        dalCreate.yrRmUpdate(this);
    }



    // Delete

    public void yrGmDelete()
    {
        dalCreate.yrGmDelete(this);
    }



}