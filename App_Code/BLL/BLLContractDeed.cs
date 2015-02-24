using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BLLContractDeed
/// </summary>
public class BLLContractDeed
{
    DALContractDeed dalDeedObj = null;

    #region Attributes
    private string hawkerId;
    private string hawkerName;
    private DateTime issueDate;
    private string deedType;
    private DateTime expDate;
    private string bank;
    private int depositeTk;
    private string imgName;
    private string AUDITUSER;
    private DateTime CREATEDATE;
    #endregion

    #region Properties
    public string auditUser
    {
        get { return AUDITUSER; }
        set { AUDITUSER = value; }
    }

    public DateTime createDate
    {
        get { return CREATEDATE; }
        set { CREATEDATE = value; }
    }
    public string ImgName
    {
        get { return imgName; }
        set { imgName = value; }
    }
    public string Bank
    {
        get { return bank; }
        set { bank = value; }
    }
    public int DepositeTk
    {
        get { return depositeTk; }
        set { depositeTk = value; }
    }
    public DateTime ExpDate
    {
        get { return expDate; }
        set { expDate = value; }
    }
    public DateTime IssueDate
    {
        get { return issueDate; }
        set { issueDate = value; }
    }
    public string DeedType
    {
        get { return deedType; }
        set { deedType = value; }
    }
    public string HawkerName
    {
        get { return hawkerName; }
        set { hawkerName = value; }
    }
    public string HawkerId
    {
        get { return hawkerId; }
        set { hawkerId = value; }
    }
    #endregion

    #region Constructor
    public BLLContractDeed()
	{
        dalDeedObj = new DALContractDeed();
    }
    #endregion

    #region BLLMethods
    public void Save(BLLContractDeed contractDeedObj)
    {
        dalDeedObj.Save(contractDeedObj);
    }

    public DataTable Display()
    {
        DataTable dt = dalDeedObj.DisplayHawker();
        return dt;
    }

    public DataTable Search(string id, string name)
    {
        DataTable dt = dalDeedObj.Search(id, name);
        return dt;
    }
    #endregion

    public void Update(string HawkerId, string hawkerName, DateTime issueDate, string DeedType, DateTime expDate, string bank, int deposit, string auditUser, DateTime createDate)
    {
        dalDeedObj.Update(HawkerId,hawkerName, issueDate, DeedType, expDate, bank, deposit, auditUser, createDate);
    }
}