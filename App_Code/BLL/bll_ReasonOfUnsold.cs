using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_ReasonOfUnsold
/// </summary>
public class bll_ReasonOfUnsold
{
    dal_ReasonOfUnsold dalCreate = new dal_ReasonOfUnsold();
    
    public bll_ReasonOfUnsold()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private int _REASONID;
    private string _REASONDETAILS;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;
    private string _REASONTYPE;

    

    public int REASONID
    {
        get { return _REASONID; }
        set { _REASONID = value; }
    }

    public string REASONDETAILS
    {
        get { return _REASONDETAILS; }
        set { _REASONDETAILS = value; }
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
    public string REASONTYPE
    {
        get { return _REASONTYPE; }
        set { _REASONTYPE = value; }
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