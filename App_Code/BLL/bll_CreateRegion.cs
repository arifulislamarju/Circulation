using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_CreateRegion
/// </summary>
public class bll_CreateRegion
{
    dal_CreateRegion dalCreate = new dal_CreateRegion();

    private int _DIVISIONID;
    private int _DISTRICTID;
    private int _PSID;
    private int _POID;
    private int _STATIONID;

    
    private string _DIVISION;
    private string _DISTRICT;
    private string _POLICESTATION;
    private string _POSTOFFICE;
    private string _UNION;   
    private string _STATIONBAN;
    private string _STATIONENG;
    private int _DEFAULTCOPY;
    private string _PACKTYPE;
    private string _SUBROUTENAME;
    private float _SORTINGORDER;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;

    private string _POCODE;

    

    public int DIVISIONID
    {
        get { return _DIVISIONID; }
        set { _DIVISIONID = value; }
    }

    public int DISTRICTID
    {
        get { return _DISTRICTID; }
        set { _DISTRICTID = value; }
    }

    public int PSID
    {
        get { return _PSID; }
        set { _PSID = value; }
    }

    public int POID
    {
        get { return _POID; }
        set { _POID = value; }
    }

    public int STATIONID
    {
        get { return _STATIONID; }
        set { _STATIONID = value; }
    }




    public string DIVISION
    {
        get { return _DIVISION; }
        set { _DIVISION = value; }
    }

    public string DISTRICT
    {
        get { return _DISTRICT; }
        set { _DISTRICT = value; }
    }

    public string POLICESTATION
    {
        get { return _POLICESTATION; }
        set { _POLICESTATION = value; }
    }

    public string POSTOFFICE
    {
        get { return _POSTOFFICE; }
        set { _POSTOFFICE = value; }
    }
    public string UNION
    {
        get { return _UNION; }
        set { _UNION = value; }
    }
    public string STATIONBAN
    {
        get { return _STATIONBAN; }
        set { _STATIONBAN = value; }
    }

    public string STATIONENG
    {
        get { return _STATIONENG; }
        set { _STATIONENG = value; }
    }

    public int DEFAULTCOPY
    {
        get { return _DEFAULTCOPY; }
        set { _DEFAULTCOPY = value; }
    }

    public string PACKTYPE
    {
        get { return _PACKTYPE; }
        set { _PACKTYPE = value; }
    }

    public string SUBROUTENAME
    {
        get { return _SUBROUTENAME; }
        set { _SUBROUTENAME = value; }
    }

    public float SORTINGORDER
    {
        get { return _SORTINGORDER; }
        set { _SORTINGORDER = value; }
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

    public string POCODE
    {
        get { return _POCODE; }
        set { _POCODE = value; }
    }

    // insert

    public void divInsert()
    {
        dalCreate.divInsert(this);

    }

    public void distInsert()
    {
        dalCreate.distInsert(this);

    }

    public void psInsert()
    {
        dalCreate.psInsert(this);

    }

    public void poInsert()
    {
        dalCreate.poInsert(this);

    }

    public void stationInsert()
    {
        dalCreate.stationInsert(this);

    }




    //Update

    public void divUpdate()
    {
        dalCreate.divUpdate(this);
    }

    public void distUpdate()
    {
        dalCreate.distUpdate(this);
    }

    public void psUpdate()
    {
        dalCreate.psUpdate(this);
    }

    public void poUpdate()
    {
        dalCreate.poUpdate(this);
    }

    public void stationUpdate()
    {
        dalCreate.stationUpdate(this);
    }


    //Delete

    public void divDelete()
    {
        dalCreate.divDelete(this);
    }

    public void distDelete()
    {
        dalCreate.distDelete(this);
    }

    public void psDelete()
    {
        dalCreate.psDelete(this);
    }

    public void poDelete()
    {
        dalCreate.poDelete(this);
    }

    public void stationDelete()
    {
        dalCreate.stationDelete(this);
    }



}