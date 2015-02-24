using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DALPaperTransaction
/// </summary>
public class DALPaperTransaction
{
    clsConnection XMLConnection = null;
    SqlConnection con = new SqlConnection();
    clsDataProvider dataProvider = new clsDataProvider();

	public DALPaperTransaction()
	{
        XMLConnection = new clsConnection();
        con = XMLConnection.ConnectByXML();
	}

    public void IdInsert(int autoId)
    {
        string query = "Select Max(AutoId) from TRANSACTIONPAPER";
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            int id = Convert.ToInt32(reader[0].ToString());
        }
    }

    public int IdInsert()
    {
        string count = "select count(*) from TRANSACTIONPAPER";
        int countRow =Convert.ToInt32(dataProvider.getResultString(count));
        int id = 0;
        if (countRow != 0)
        {

            string query = "Select Max(AutoId) from TRANSACTIONPAPER";
            string strid = dataProvider.getResultString(query);
             id = Convert.ToInt32(strid);
            //con.Open();
            //SqlCommand cmd = new SqlCommand(query, con);
            //int id = (Int32)cmd.ExecuteScalar();
            return id;
        }
        else
        {
          return  id = 1;
        }
    }

    public int IncremenrId()
    {
        string query = "Select Max(AutoId) from TRANSACTIONPAPER";
        con.Open();

        SqlCommand cmd = new SqlCommand(query, con);
        int id = (Int32)cmd.ExecuteScalar();
        return id;
    }

    public DataTable BindPaper(int transactionId)
    {
        string query = "SELECT * from TRANSACTIONPAPER where AutoId='"+transactionId+"'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public void Save(BllPaperTransaction transactionObj)
    {
        SqlCommand cmd = new SqlCommand("spTransactionPaper",con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();

        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value = 1;
        cmd.Parameters.Add("@AutoId", SqlDbType.Int).Value = transactionObj.TransactionNo;
        cmd.Parameters.Add("@PAPERNAME", SqlDbType.VarChar).Value = transactionObj.PaperName;
        cmd.Parameters.Add("@TRADATE", SqlDbType.Date).Value = transactionObj.Date;
        cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = transactionObj.Station;
        cmd.Parameters.Add("@TRAAMOUNT", SqlDbType.Int).Value = transactionObj.Amount;
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataTable PreData(int tranId)
    {
        string query = "select * from TRANSACTIONPAPER where AutoId='" + tranId + "'";
        SqlCommand cmd = new SqlCommand(query, con);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public void UpdateTransaction(int tranId, string pName, DateTime tranDate, string Station, int amount)
    {
        SqlCommand cmd = new SqlCommand("spTransactionPaper", con);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();
        
        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value = 2;
        cmd.Parameters.Add("@AutoId", SqlDbType.Int).Value = tranId;
        cmd.Parameters.Add("@PAPERNAME", SqlDbType.VarChar).Value = pName;
        cmd.Parameters.Add("@TRADATE", SqlDbType.DateTime).Value = tranDate;
        cmd.Parameters.Add("@station", SqlDbType.VarChar).Value = Station;
        cmd.Parameters.Add("@TRAAMOUNT", SqlDbType.Int).Value = amount;

        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void SearchById(int tranId)
    {
        SqlCommand cmd = new SqlCommand("spTransactionPaper", con);
        cmd.CommandType = CommandType.StoredProcedure;

        con.Open();

        cmd.Parameters.AddWithValue("@Flag", 3);
        cmd.Parameters.AddWithValue("@AutoId", tranId);
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public DataTable SearchByDate(DateTime date)
    {
        SqlCommand cmd = new SqlCommand("spTransactionPaper", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Flag", 3);
        cmd.Parameters.AddWithValue("@TRADATE", date);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}