using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_AgentFamInfo
/// </summary>
public class bll_AgentFamInfo
{
	public bll_AgentFamInfo()
	{
		//
		// TODO: Add constructor logic here
		//
	}


    dal_AgentFamInfo dalCreate = new dal_AgentFamInfo();

    private string _AGNTID;
    private string _CHILDNAME;
    private string _EDUCATION;
    private DateTime _BIRTHDATE;
    private string _TAKEPALO;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public string AGNTID
    {
        get { return _AGNTID; }
        set { _AGNTID = value; }
    }

    public string CHILDNAME
    {
        get { return _CHILDNAME; }
        set { _CHILDNAME = value; }
    }

    public string EDUCATION
    {
        get { return _EDUCATION; }
        set { _EDUCATION = value; }
    }

    public DateTime BIRTHDATE
    {
        get { return _BIRTHDATE; }
        set { _BIRTHDATE = value; }
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
