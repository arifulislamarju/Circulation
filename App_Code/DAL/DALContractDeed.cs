using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

/// <summary>
/// Summary description for DALContractDeed
/// </summary>
public class DALContractDeed
{
    clsConnection XMLConnection = null;
    SqlConnection con = new SqlConnection();

    #region Constuctors
    public DALContractDeed()
	{
        XMLConnection = new clsConnection();
        con = XMLConnection.ConnectByXML();
	}
    #endregion

    public void Save(BLLContractDeed contractDeedObj)
    {
        SqlCommand cmd = new SqlCommand("spAgentDeed", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();

        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value = 1;
        cmd.Parameters.Add("@HawkerId", SqlDbType.VarChar).Value = contractDeedObj.HawkerId;
        cmd.Parameters.Add("@HawkerName", SqlDbType.VarChar).Value = contractDeedObj.HawkerName;
        cmd.Parameters.Add("@IssueDate", SqlDbType.DateTime).Value = contractDeedObj.IssueDate;
        cmd.Parameters.Add("@deedType", SqlDbType.VarChar).Value = contractDeedObj.DeedType;
        cmd.Parameters.Add("@ExpDate", SqlDbType.DateTime).Value = contractDeedObj.ExpDate;
        cmd.Parameters.Add("@bank", SqlDbType.VarChar).Value = contractDeedObj.Bank;
        cmd.Parameters.Add("@DepositTk", SqlDbType.Int).Value = contractDeedObj.DepositeTk;
        cmd.Parameters.Add("@ImgName", SqlDbType.VarChar).Value = contractDeedObj.ImgName;
        cmd.Parameters.Add("@auditUser", SqlDbType.VarChar).Value = contractDeedObj.auditUser;
        cmd.Parameters.Add("@createDate", SqlDbType.Date).Value = contractDeedObj.createDate;
        //cmd.Parameters.AddWithValue("@ImgName", contractDeedObj.ImgName);
        cmd.ExecuteNonQuery();

        con.Close();
    }

    public DataTable DisplayHawker()
    {
        SqlCommand cmd = new SqlCommand("spAgentDeed", con);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.AddWithValue("@Flag", 3);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public DataTable Search(string id, string name)
    {
        SqlCommand cmd = new SqlCommand("spAgentDeed", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@Flag", 2);
        cmd.Parameters.AddWithValue("@HawkerId", id);
        cmd.Parameters.AddWithValue("@HawkerName", name);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    public void Update(string HawkerId, string hawkerName, DateTime issueDate, string DeedType, DateTime expDate, string bank, int deposit, string auditUser, DateTime createDate)
    {
        SqlCommand cmd = new SqlCommand("spAgentDeed", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();

        cmd.Parameters.Add("@Flag", SqlDbType.TinyInt).Value = 4;
        cmd.Parameters.Add("@HawkerId", SqlDbType.VarChar).Value =HawkerId;
        cmd.Parameters.Add("@HawkerName", SqlDbType.VarChar).Value = hawkerName;
        cmd.Parameters.Add("@IssueDate", SqlDbType.DateTime).Value = issueDate;
        cmd.Parameters.Add("@deedType", SqlDbType.VarChar).Value = DeedType;
        cmd.Parameters.Add("@ExpDate", SqlDbType.DateTime).Value = expDate;
        cmd.Parameters.Add("@bank", SqlDbType.VarChar).Value = bank;
        cmd.Parameters.Add("@DepositTk", SqlDbType.Int).Value = deposit;
        cmd.Parameters.Add("@auditUser", SqlDbType.VarChar).Value = auditUser;
        cmd.Parameters.Add("@createDate", SqlDbType.Date).Value = createDate;

        cmd.ExecuteNonQuery();
        con.Close();
    }
}