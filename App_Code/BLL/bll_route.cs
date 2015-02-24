using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_route
/// </summary>
public class bll_route
{
    dal_route dalCreate = new dal_route();


    private int _ROUTEID;
    private string _ROUTECODE;
    private string _ROUTENAMEBAN;
    private string _ROUTENAME;
    private string _SORTINGORDER;
    private string _STARTPOINT;
    private string _DEPARTTIME;
    private string _ENDPOINT;
    private string _ARRIVTIME;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;
    private int _DISTANCE;
   


    public int ROUTEID
    {
        get { return _ROUTEID; }
        set { _ROUTEID = value; }
    }

    public string ROUTECODE
    {
        get { return _ROUTECODE; }
        set { _ROUTECODE = value; }
    }

    public string ROUTENAMEBAN
    {
        get { return _ROUTENAMEBAN; }
        set { _ROUTENAMEBAN = value; }
    }

    public string ROUTENAME
    {
        get { return _ROUTENAME; }
        set { _ROUTENAME = value; }
    }

    public string SORTINGORDER
    {
        get { return _SORTINGORDER; }
        set { _SORTINGORDER = value; }
    }

    public string STARTPOINT
    {
        get { return _STARTPOINT; }
        set { _STARTPOINT = value; }
    }

    public string ENDPOINT
    {
        get { return _ENDPOINT; }
        set { _ENDPOINT = value; }
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
    public int DISTANCE
    {
        get { return _DISTANCE; }
        set { _DISTANCE = value; }
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