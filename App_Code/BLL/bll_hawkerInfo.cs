using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for bll_hawkerInfo
/// </summary>
public class bll_hawkerInfo
{
    dal_hawkerInfo dalhkrInfo = new dal_hawkerInfo();

    #region Data Member

    private string _hkrID = "";
    private string _hkrType = "";
    private string _hkrNameBangla = "";
    private string _hkrNameEng = "";
    private string _fatherName = "";
    private string _agentName = "";
    private string _agentArea = "";
    private string _salesDuration = "";
    private float _SORTINGORDER;
    private DateTime _marigeDay;
    private string _floatingCopy;
    private string _regularCopy;
    private string _corporateCopy;
    private string _billTo = "";
    private string _imagePath = "";
    private string _salesArea = "";
    private DateTime _birthDay;
    private string _mobileNumber = "";
    private int _status;
    private DateTime _CREATEDATE;
    private string _AUDUSER = "";

    #endregion

    #region Properties

    public string HkrID
    {
        get { return _hkrID; }
        set { _hkrID = value; }
    }
    public string HkrType
    {
        get { return _hkrType; }
        set { _hkrType = value; }
    }
    public string HkrNameBangla
    {
        get { return _hkrNameBangla; }
        set { _hkrNameBangla = value; }
    }
    public string HkrNameEng
    {
        get { return _hkrNameEng; }
        set { _hkrNameEng = value; }
    }

    public string FatherName
    {
        get { return _fatherName; }
        set { _fatherName = value; }
    }
    public string AgentName
    {
        get { return _agentName; }
        set { _agentName = value; }
    }
    public string AgentArea
    {
        get { return _agentArea; }
        set { _agentArea = value; }
    }

    public string SalesDuration
    {
        get { return _salesDuration; }
        set { _salesDuration = value; }
    }

    public float SORTINGORDER
    {
        get { return _SORTINGORDER; }
        set { _SORTINGORDER = value; }
    }

    public DateTime MarigeDay
    {
        get { return _marigeDay; }
        set { _marigeDay = value; }
    }

    public string FloatingCopy
    {
        get { return _floatingCopy; }
        set { _floatingCopy = value; }
    }

    public string RegularCopy
    {
        get { return _regularCopy; }
        set { _regularCopy = value; }
    }

    public string CorporateCopy
    {
        get { return _corporateCopy; }
        set { _corporateCopy = value; }
    }

    public string BillTo
    {
        get { return _billTo; }
        set { _billTo = value; }
    }

    public string ImagePath
    {
        get { return _imagePath; }
        set { _imagePath = value; }
    }

    public string SalesArea
    {
        get { return _salesArea; }
        set { _salesArea = value; }
    }

    public DateTime BirthDay
    {
        get { return _birthDay; }
        set { _birthDay = value; }
    }

    public string MobileNumber
    {
        get { return _mobileNumber; }
        set { _mobileNumber = value; }
    }
    public int Status
    {
        get { return _status; }
        set { _status = value; }
    }
    public DateTime CREATEDATE
    {
        get { return _CREATEDATE; }
        set { _CREATEDATE = value; }
    }

    public string AUDUSER
    {
        get { return _AUDUSER; }
        set { _AUDUSER = value; }
    }

    #endregion

    #region Member Functions

    public void Insert()
    {
        dalhkrInfo.Insert(this);

    }


    #endregion
}