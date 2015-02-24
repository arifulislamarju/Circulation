using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_vehicle
/// </summary>
public class bll_vehicle
{
    dal_vehicle dalCreate = new dal_vehicle();


    private int _VEHICLEID;
    private string _VEHICLECODE;
    private string _VEHICLENAME;
    private string _VEHICLENAMEBAN;
    private string _REGNO;
    private string _CAPACITY;
    private int _RATEPERTRIP;
    private string _OWNERNAME;
    private string _DRIVERNAME;
    private string _LICENSENO;
    private string _ROUTE;
    private string _SUBROUTE;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int VEHICLEID
    {
        get { return _VEHICLEID; }
        set { _VEHICLEID = value; }
    }

    public string VEHICLECODE
    {
        get { return _VEHICLECODE; }
        set { _VEHICLECODE = value; }
    }

    public string VEHICLENAMEBAN
    {
        get { return _VEHICLENAMEBAN; }
        set { _VEHICLENAMEBAN = value; }
    }

    public string VEHICLENAME
    {
        get { return _VEHICLENAME; }
        set { _VEHICLENAME = value; }
    }

    public string DRIVERNAME
    {
        get { return _DRIVERNAME; }
        set { _DRIVERNAME = value; }
    }

    public string REGNO
    {
        get { return _REGNO; }
        set { _REGNO = value; }
    }

    public string CAPACITY
    {
        get { return _CAPACITY; }
        set { _CAPACITY = value; }
    }

    public int RATEPERTRIP
    {
        get { return _RATEPERTRIP; }
        set { _RATEPERTRIP = value; }
    }

    public string OWNERNAME
    {
        get { return _OWNERNAME; }
        set { _OWNERNAME = value; }
    }

    public string LICENSENO
    {
        get { return _LICENSENO; }
        set { _LICENSENO = value; }
    }

    public string ROUTE
    {
        get { return _ROUTE; }
        set { _ROUTE = value; }
    }

    public string SUBROUTE
    {
        get { return _SUBROUTE; }
        set { _SUBROUTE = value; }
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



    public void Insert()
    {
        dalCreate.Insert(this);

    }


    public void Update()
    {
        dalCreate.Update(this);
    }


    public void Delete()
    {
        dalCreate.Delete(this);
    }



}