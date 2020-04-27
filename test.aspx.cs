using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class test : System.Web.UI.Page
{
    static int i = 0;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    static string status;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = @"SELECT * FROM tblLastData where IDD=" + 43;
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        // SResult[5].ToString().Substring(0, 1)
                        string resule = sdr["LastResult"].ToString();
                        string[] SResult = resule.Split(';');
                        status = SResult[5].ToString();
                        D1.Text = ReturnResult(status.Substring(0, 1));
                    }
                }
            }
        }
    }
    static public string ReturnResult(string value)
    {
        if (value == "0") return "ON";
        else if (value == "1") return "OFF";
        else return "NO status";
    }
}