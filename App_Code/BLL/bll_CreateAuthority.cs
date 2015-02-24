using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_CreateAuthority
/// </summary>
public class bll_CreateAuthority
{
    dal_CreateAuthority dalCreate = new dal_CreateAuthority();


    private int _GMID;
    private int _MANAGERID;
    private int _RMID;
    private string _GM;
    private string _MANAGER;
    private string _RM;
    private string _AUDITUSER;
    private DateTime _CREATEDATE;


    public int GMID
    {
        get { return _GMID; }
        set { _GMID = value; }
    }

    public int MANAGERID
    {
        get { return _MANAGERID; }
        set { _MANAGERID = value; }
    }

    public int RMID
    {
        get { return _RMID; }
        set { _RMID = value; }
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

    public void gmInsert()
    {
        dalCreate.gmInsert(this);

    }

    public void managerInsert()
    {
        dalCreate.managerInsert(this);

    }

    public void rmInsert()
    {
        dalCreate.rmInsert(this);

    }



    //Update



    public void gmUpdate()
    {
        dalCreate.gmUpdate(this);
    }

    public void managerUpdate()
    {
        dalCreate.managerUpdate(this);
    }

    public void rmUpdate()
    {
        dalCreate.rmUpdate(this);
    }



    // Delete

    public void gmDelete()
    {
       dalCreate.gmDelete(this);
    }

    public void managerDelete()
    {
       dalCreate.managerDelete(this);
    }

    public void rmDelete()
    {
        dalCreate.rmDelete(this);
    }




}