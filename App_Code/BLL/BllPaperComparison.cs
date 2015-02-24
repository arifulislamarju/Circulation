using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

/// <summary>
/// Summary description for BllPaperComparison
/// </summary>
public class BllPaperComparison
{
    DalPaperComparison paperComapre = null;

    #region Attributes
    
    private int id;
    private string name;
    private string paperType;
    private string paperPrice;
    private DateTime date;
    private string auditor;
    private int status;
    private int sortOrder;
    
    #endregion

    #region Constuctor
    public BllPaperComparison()
    {
        paperComapre = new DalPaperComparison();
    }
    #endregion

    #region Properties

    public int Status
    {
        get { return status; }
        set { status = value; }
    }
    public string PaperPrice
    {
        get { return paperPrice; }
        set { paperPrice = value; }
    }
    public string PaperType
    {
        get { return paperType; }
        set { paperType = value; }
    }
    //public string Auditor
    //{
    //    get { return auditor; }
    //    set { auditor = value; }
    //}
    //public DateTime Date
    //{
    //    get { return date; }
    //    set { date = value; }
    //}
    public string Name
    {
        get { return name; }
        set { name = value; }
    }
    public int Id
    {
        get { return id; }
        set { id = value; }
    }
    public int SortOrder
    {
        get { return sortOrder; }
        set { sortOrder = value; }
    }
    #endregion

    #region BLL Method
    public void Save(BllPaperComparison paperObj, string user, DateTime Date)
    {
        paperComapre = new DalPaperComparison();
        paperComapre.Save(paperObj,user,Date);
    }
    
    public DataTable DisplayData()
    {
        paperComapre = new DalPaperComparison();
        DataTable dt = paperComapre.DisplayData();
        return dt;
    }
    #endregion



    public void Update(int pId, string pName, string PaperType, string PaperPrice, int status, int sortOrder)
    {
        paperComapre = new DalPaperComparison();
        paperComapre.Update(pId, pName, PaperType, PaperPrice, status, sortOrder);
    }
}