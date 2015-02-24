using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_CreateDistribution
/// </summary>
public class bll_CreateDistribution
{
	public bll_CreateDistribution()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    dal_CreateDistribution dalCreate = new dal_CreateDistribution();

    private int _DSID;
    private string _RMID;
    private string _RM;
    private string _CUSTID;
    private string _CUSTOMER;
    private string _STATID;
    private string _STATION;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int DSID
    {
        get { return _DSID; }
        set { _DSID = value; }
    }

    public string RMID
    {
        get { return _RMID; }
        set { _RMID = value; }
    }
    
    public string RM
    {
        get { return _RM; }
        set { _RM = value; }
    }

    public string CUSTID
    {
        get { return _CUSTID; }
        set { _CUSTID = value; }
    }

    public string CUSTOMER
    {
        get { return _CUSTOMER; }
        set { _CUSTOMER = value; }
    }

    public string STATID
    {
        get { return _STATID; }
        set { _STATID = value; }
    }
    
    public string STATION
    {
        get { return _STATION; }
        set { _STATION = value; }
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




    public void insert()
    {
        dalCreate.insert(this);
    }


    public void update()
    {
        dalCreate.update(this);
    }


    public void delete()
    {
        dalCreate.delete(this);
    }



}