using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for DalPaperComparison
/// </summary>
public class DalPaperComparison
{
    clsConnection XMLConnection = null;
    SqlConnection con = new SqlConnection();
	public DalPaperComparison()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    public void Save(BllPaperComparison paperObj,string user,DateTime Date)
    {
        XMLConnection = new clsConnection();
        con = XMLConnection.ConnectByXML();
        SqlCommand cmd = new SqlCommand("spPCompare", con);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();
        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value =1 ;
        cmd.Parameters.Add("@PID", SqlDbType.Int).Value = paperObj.Id;
        cmd.Parameters.Add("@PAPERNAME", SqlDbType.VarChar).Value = paperObj.Name;
        cmd.Parameters.Add("@PAPERTYPE", SqlDbType.VarChar).Value = paperObj.PaperType;
        cmd.Parameters.Add("@PAPERPRICE", SqlDbType.VarChar).Value = paperObj.PaperPrice;
        cmd.Parameters.Add("@DATES", SqlDbType.Date).Value = Date;
        cmd.Parameters.Add("@AUDITOR", SqlDbType.VarChar).Value = user;
        cmd.Parameters.Add("@USTATUS", SqlDbType.Int).Value = paperObj.Status;
        cmd.Parameters.Add("@sortOrder", SqlDbType.Int).Value = paperObj.SortOrder;

        cmd.ExecuteNonQuery();
    }

    public DataTable DisplayData()
    {
        XMLConnection = new clsConnection();
        con=XMLConnection.ConnectByXML();
        SqlCommand cmd = new SqlCommand("spPCompare",con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Flag",2);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }



    public void Update(int pId, string pName, string PaperType, string PaperPrice, int status,int sortOrder)
    {
        XMLConnection = new clsConnection();
        con = XMLConnection.ConnectByXML();
        SqlCommand cmd = new SqlCommand("spPCompare", con);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();
        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value = 3;
        cmd.Parameters.Add("@PAPERNAME", SqlDbType.VarChar).Value = pName;
        cmd.Parameters.Add("@PAPERTYPE", SqlDbType.VarChar).Value = PaperType;
        cmd.Parameters.Add("@PAPERPRICE", SqlDbType.VarChar).Value = PaperPrice;
        //cmd.Parameters.Add("@AUDITOR", SqlDbType.VarChar).Value = auditor;
        cmd.Parameters.Add("@USTATUS", SqlDbType.Int).Value = status;
        cmd.Parameters.Add("@PID", SqlDbType.Int).Value = pId;
        cmd.Parameters.Add("@sortOrder", SqlDbType.Int).Value = sortOrder;

        cmd.ExecuteNonQuery();

    }
}