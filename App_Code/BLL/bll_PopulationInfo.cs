using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_PopulationInfo
/// </summary>
public class bll_PopulationInfo
{
    dal_PopulationInfo dalCreate = new dal_PopulationInfo();
    
    private int _PIID;
    private string _STATIONNAME;
    private string _POPULATION;
    private string _LITERATE;
    private string _TAKEPALO;
    private int _REGULAR;
    private int _FLOATING;    
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int PIID
    {
        get { return _PIID; }
        set { _PIID = value; }
    }

    public string STATIONNAME
    {
        get { return _STATIONNAME; }
        set { _STATIONNAME = value; }
    }

    public string POPULATION
    {
        get { return _POPULATION; }
        set { _POPULATION = value; }
    }

    public string LITERATE
    {
        get { return _LITERATE; }
        set { _LITERATE = value; }
    }

    public string TAKEPALO
    {
        get { return _TAKEPALO; }
        set { _TAKEPALO = value; }
    }
    public int FLOATING
    {
        get { return _FLOATING; }
        set { _FLOATING = value; }
    }
    public int REGULAR
    {
        get { return _REGULAR; }
        set { _REGULAR = value; }
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