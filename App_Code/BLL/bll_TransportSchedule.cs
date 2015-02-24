using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_TransportSchedule
/// </summary>
public class bll_TransportSchedule
{
    dal_TransportSchedule dalCreate = new dal_TransportSchedule();


    private int _TSID;
    private DateTime _TRANSACTIONDATE;
    private string _ROUTE;
    private string _SUBROUTE;
    private string _SORTINGORDER;
    private string _VEHICLENAME;
    private string _OWNERNAME;
    private string _DRIVERNAME;
    private string _LICENSENO;
    private string _DEPARTTIME;
    private string _ARRIVTIME;
    private string _CAPACITY;
    private int _ACTUALCOPY;
    private string _ACTDEPARTURE;
    private string _ACTUALARRIVAL;
    private string _PAPERNAME;
    private string _PIONNAME;
    private string _DELAYREASON;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int TSID
    {
        get { return _TSID; }
        set { _TSID = value; }
    }

    public DateTime TRANSACTIONDATE
    {
        get { return _TRANSACTIONDATE; }
        set { _TRANSACTIONDATE = value; }
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

    public string SORTINGORDER
    {
        get { return _SORTINGORDER; }
        set { _SORTINGORDER = value; }
    }

    public string VEHICLENAME
    {
        get { return _VEHICLENAME; }
        set { _VEHICLENAME = value; }
    }

    public string OWNERNAME
    {
        get { return _OWNERNAME; }
        set { _OWNERNAME = value; }
    }

    public string DRIVERNAME
    {
        get { return _DRIVERNAME; }
        set { _DRIVERNAME = value; }
    }

    public string LICENSENO
    {
        get { return _LICENSENO; }
        set { _LICENSENO = value; }
    }

    public string DEPARTTIME
    {
        get { return _DEPARTTIME; }
        set { _DEPARTTIME = value; }
    }

    public string ARRIVTIME
    {
        get { return _ARRIVTIME; }
        set { _ARRIVTIME = value; }
    }

    public string CAPACITY
    {
        get { return _CAPACITY; }
        set { _CAPACITY = value; }
    }

    public int ACTUALCOPY
    {
        get { return _ACTUALCOPY; }
        set { _ACTUALCOPY = value; }
    }

    public string ACTDEPARTURE
    {
        get { return _ACTDEPARTURE; }
        set { _ACTDEPARTURE = value; }
    }

    public string ACTUALARRIVAL
    {
        get { return _ACTUALARRIVAL; }
        set { _ACTUALARRIVAL = value; }
    }

    public string PAPERNAME
    {
        get { return _PAPERNAME; }
        set { _PAPERNAME = value; }
    }

    public string PIONNAME
    {
        get { return _PIONNAME; }
        set { _PIONNAME = value; }
    }

    public string DELAYREASON
    {
        get { return _DELAYREASON; }
        set { _DELAYREASON = value; }
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