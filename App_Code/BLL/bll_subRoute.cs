using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_subRoute
/// </summary>
public class bll_subRoute
{
	dal_subRoute dalCreate = new dal_subRoute();


    private int _SUBROUTEID;
    private string _SUBROUTECODE;
    private string _SUBROUTENAME;
    private string _SUBROUTENAMEBAN;
    private string _ROUTENAME;
    private string _PRESS;
    private string _SORTINGORDER;
    private string _STARTPOINT;   
    private string _ENDPOINT;
    private string _DEPARTTIME;
    private string _ARRIVTIME;
    private string _LOCATION;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int SUBROUTEID
    {
        get { return _SUBROUTEID; }
        set { _SUBROUTEID = value; }
    }

    public string SUBROUTECODE
    {
        get { return _SUBROUTECODE; }
        set { _SUBROUTECODE = value; }
    }

    public string SUBROUTENAMEBAN
    {
        get { return _SUBROUTENAMEBAN; }
        set { _SUBROUTENAMEBAN = value; }
    }

    public string SUBROUTENAME
    {
        get { return _SUBROUTENAME; }
        set { _SUBROUTENAME = value; }
    }

    public string ROUTENAME
    {
        get { return _ROUTENAME; }
        set { _ROUTENAME = value; }
    }

    public string PRESS
    {
        get { return _PRESS; }
        set { _PRESS = value; }
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

    public string LOCATION
    {
        get { return _LOCATION; }
        set { _LOCATION = value; }
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