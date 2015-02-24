using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.IO;
using System.Configuration;

public partial class importData : System.Web.UI.Page
{
    clsDataProvider dataProvider = new clsDataProvider();
    clsConnection connection = new clsConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

    }


    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (xlsFile.HasFile)
    {
        if (System.IO.Path.GetExtension(xlsFile.FileName) == ".xls" || System.IO.Path.GetExtension(xlsFile.FileName) == ".xlsx")
        {
            xlsFile.SaveAs(Server.MapPath("~/UploadFiles/sample.xlsx"));
        }
    }


        string sSourceConstr = @"Provider=Microsoft.ACE.OLEDB.12.0; Data Source=E:\Ofc\Circulation\Circul\NEW\Circulation 12\UploadFiles\sample.xlsx; Extended Properties=""Excel 12.0;HDR=YES;""";
        //string sDestConstr = ConfigurationManager.ConnectionStrings["connection"].ConnectionString;
        

        //OleDbConnection sSourceConnection = new OleDbConnection(sSourceConstr);
        //using (sSourceConnection)
        //{
        //    string sql = string.Format("Select [ID],[Name],[Designation] FROM [{0}]", "sample$");
        //    OleDbCommand command = new OleDbCommand(sql, sSourceConnection);
        //    sSourceConnection.Open();
        //    using (OleDbDataReader dr = command.ExecuteReader())
        //    {
        //        using (SqlBulkCopy bulkCopy = new SqlBulkCopy(sDestConstr))
        //        {
        //            bulkCopy.DestinationTableName = "hawkerInformation";
        //            //You can mannualy set the column mapping by the following way.
        //            //bulkCopy.ColumnMappings.Add("MSISDN", "MSISDN");
        //            bulkCopy.WriteToServer(dr);
        //        }
        //    }
        //}

        //------------------------------
        //OleDbConnection con = null;
        //DataTable dt = null;
        //con = new OleDbConnection(sSourceConstr);
        //con.Open();
        //dt = con.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, new object[] { null, null, "hawkerInformation", null });

        //String[] excelSheetNames = new String[dt.Rows.Count];
        //int i = 0;

        //foreach (DataRow row in dt.Rows)
        //{
        //    excelSheetNames[i] = row.Table.Columns["[hkrNameEng"].ToString();
        //    i++;
        //}

        //--------------------------------------

        //string excelConnectionString = "";
        //string strFileType = System.IO.Path.GetExtension(xlsFile.FileName).ToString().ToLower();
        //xlsFile.SaveAs(Server.MapPath("~/Import/" + strFileType));
        //string strNewPath = Server.MapPath("~/Import/" + strFileType);
        ////Connection String to Excel Workbook
        //if (strFileType.Trim() == ".xls")
        //{
        //    excelConnectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + strNewPath + ";Extended Properties=Excel 8.0;Persist Security Info=False";
        //}
        //else if (strFileType.Trim() == ".xlsx")
        //{
        //    excelConnectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + strNewPath + ";Extended Properties=Excel 12.0;Persist Security Info=False";
        //}

        ////Create Connection to Excel work book
        //OleDbConnection excelConnection = new OleDbConnection(excelConnectionString);
        ////Create OleDbCommand to fetch data from Excel
        //OleDbCommand cmd = new OleDbCommand("Select [CustomerName] from [Sheet1$]", excelConnection);
        //excelConnection.Open();
        //OleDbDataReader dReader;
        //dReader = cmd.ExecuteReader();
        //SqlBulkCopy sqlBulk = new SqlBulkCopy(strConnection);
        ////Give your Destination table name
        //sqlBulk.DestinationTableName = "hawkerInformation";

        //sqlBulk.WriteToServer(dReader);

        //lblMessages.Text = "Record update";

    }



}