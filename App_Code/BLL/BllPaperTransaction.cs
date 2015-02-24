using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BllPaperTransaction
/// </summary>
public class BllPaperTransaction
{
    DALPaperTransaction transactionDALObj = null;
    #region Attributes
    private int transactionNo;
    private string paperName;
    private DateTime date;
    private string station;
    private int amount;
    #endregion

    #region Properties
    public int Amount
    {
        get { return amount; }
        set { amount = value; }
    }
    public string PaperName
    {
        get { return paperName; }
        set { paperName = value; }
    }
    public string Station
    {
        get { return station; }
        set { station = value; }
    }
    public DateTime Date
    {
        get { return date; }
        set { date = value; }
    }
    public int TransactionNo
    {
        get { return transactionNo; }
        set { transactionNo = value; }
    }
    #endregion

    #region Constructor
    public BllPaperTransaction()
	{
        transactionDALObj = new DALPaperTransaction();
	}
    #endregion

    #region BLL Method
 
    public int IdInsert()
    {
        int id = transactionDALObj.IdInsert();
        return id;
    }

    public int IncremenrId()
    {
        int id = transactionDALObj.IncremenrId();
        id = id + 1;
        return id;
    }

    public DataTable BindPaper(int transactionId)
    {
        DataTable dt = transactionDALObj.BindPaper(transactionId);
        return dt;
    }

    public void Save(BllPaperTransaction transactionObj)
    {
        transactionDALObj.Save(transactionObj);
    }

    public DataTable PreDate(int tranId)
    {
        DataTable dt = transactionDALObj.PreData(tranId);
        return dt;
    }
    #endregion


    public void UpdateTransaction(int tranId, string pName, DateTime tranDate, string Station, int amount)
    {
        transactionDALObj.UpdateTransaction(tranId, pName, tranDate, Station, amount);
    }

    public void SearchById(int tranId)
    {
        transactionDALObj.SearchById(tranId);
    }

    public DataTable SearchByDate(DateTime date)
    {
        DataTable dt= transactionDALObj.SearchByDate(date);
        return dt;
    }
}