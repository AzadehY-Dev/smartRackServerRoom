using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
public partial class Default4 : System.Web.UI.Page
{
    int i = 0;
    static string ds2;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = "SELECT TOP 1 * FROM tblEntrance where iddevice=2 ORDER BY idud DESC";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    string ds = sdr["statusdoor"].ToString();
                   // Session["statusdoor"] = ds;
                    ds2 = Session["statusdoor"].ToString();
                }
                con.Close();
            }
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
       
    }
    protected void Timer2_Tick(object sender, EventArgs e)
    {
        //Connect3("192.168.0.23", "A", 1024);
        Connect("192.168.0.23", "L", 1024, txtreply);
        Connect2("192.168.0.23", "T", 1024, txtreply);
     //   Connect2("192.168.0.23", "D", 1024, txtreply);
        //Connect("192.168.0.23", "A", 1024, txtreply);
        //Connect("192.168.0.23", "B", 1024, txtreply);
    }

    public static void Connect(String server, String message, int port, TextBox rchtxt)
    {
        
        try
        {
            TcpClient client = new TcpClient(server, port);
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);
            NetworkStream stream = client.GetStream();
            stream.Write(data, 0, data.Length);
            data = new Byte[256];
            String responseData = String.Empty;
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            rchtxt.Text = rchtxt.Text + "Received: {0}" + responseData;

            string temp = responseData;
            string pat = @"\d{10}";
            Regex r = new Regex(pat, RegexOptions.IgnoreCase);
            Match m = r.Match(temp);
            if(m.Success)
            {
                string sql = "select * from tblDeviceUser du inner join tblusers u on du.iduser=u.idUser where RFID='" + m+"'";
                SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
                DataTable data2 = new DataTable();
                adapter.Fill(data2);
                if (data2.Rows.Count > 0)
                {
                    if(ds2.Equals("OPEN"))
                    {
                        Connect3("192.168.0.23", "B", 1024);
                        string _query = @"INSERT INTO [tblEntrance] (iddevice,time,statusdoor,date) 
                values (@iddevice,@time,@statusdoor,@date)";
                        using (SqlConnection conn = new SqlConnection(strcon))
                        {
                            using (SqlCommand comm = new SqlCommand())
                            {
                                comm.Connection = conn;
                                comm.CommandType = CommandType.Text;
                                comm.CommandText = _query;
                                comm.Parameters.AddWithValue("@iddevice", 2);
                                comm.Parameters.AddWithValue("@time", DateTime.Now.ToString("HH:mm"));
                                comm.Parameters.AddWithValue("@statusdoor", "CLOSE");
                                comm.Parameters.AddWithValue("@date", DateTime.Now.ToString("MM/dd/yyyy"));
                                try
                                {
                                    conn.Open();
                                    comm.ExecuteNonQuery();
                                    ds2 = "CLOSE";
                                }
                                catch (SqlException ex)
                                {

                                }
                            }
                        }
                    }
                    else if (ds2.Equals("CLOSE"))
                    {
                        Connect3("192.168.0.23", "A", 1024);
                        string _query = @"INSERT INTO [tblEntrance] (iddevice,time,statusdoor,date) 
                values (@iddevice,@time,@statusdoor,@date)";
                        using (SqlConnection conn = new SqlConnection(strcon))
                        {
                            using (SqlCommand comm = new SqlCommand())
                            {
                                comm.Connection = conn;
                                comm.CommandType = CommandType.Text;
                                comm.CommandText = _query;
                                comm.Parameters.AddWithValue("@iddevice", 2);
                                comm.Parameters.AddWithValue("@time", DateTime.Now.ToString("HH:mm"));
                                comm.Parameters.AddWithValue("@statusdoor", "OPEN");
                                comm.Parameters.AddWithValue("@date", DateTime.Now.ToString("MM/dd/yyyy"));
                                try
                                {
                                    conn.Open();
                                    comm.ExecuteNonQuery();
                                    ds2 = "OPEN";
                                }
                                catch (SqlException ex)
                                {

                                }
                            }
                        }
                    }
                }
           
            }
            stream.Close();
            client.Close();
        }
        catch (ArgumentNullException e)
        {
            rchtxt.Text = rchtxt.Text + "ArgumentNullException: {0}" + e;
        }
        catch (SocketException e)
        {
            rchtxt.Text = rchtxt.Text + "SocketException: {0}" + e;
        }


    }
    public static void Connect2(String server, String message, int port, TextBox rchtxt)
    {
        try
        {
            TcpClient client = new TcpClient(server, port);
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);
            NetworkStream stream = client.GetStream();
            stream.Write(data, 0, data.Length);
            data = new Byte[256];
            String responseData = String.Empty;
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            rchtxt.Text = rchtxt.Text + "Received: {0}" + responseData;
          
                string temp = responseData;
                string pat = @"\d*\.\d";
                Regex r = new Regex(pat, RegexOptions.IgnoreCase);
                Match m = r.Match(temp);
                if (m.Success)
                {
                    string _query = @"INSERT INTO [tblStatusSensorDevice] (idDevice,Date,Mount) 
                values (@idDevice,@Date,@Mount)";
                    using (SqlConnection conn = new SqlConnection(strcon))
                    {
                        using (SqlCommand comm = new SqlCommand())
                        {
                            comm.Connection = conn;
                            comm.CommandType = CommandType.Text;
                            comm.CommandText = _query;
                            comm.Parameters.AddWithValue("@idDevice", 2);
                            comm.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
                            comm.Parameters.AddWithValue("@Mount", Convert.ToDouble(m.ToString()));
                            try
                            {
                                conn.Open();
                                comm.ExecuteNonQuery();
                            }
                            catch (SqlException ex)
                            {

                            }
                        }
                    }
                }
 
            string pat3 = @"OPEN";
            string pat2 = @"CLOSE";
            // Instantiate the regular expression object.
            Regex r3 = new Regex(pat3, RegexOptions.IgnoreCase);
            string rs = r3.ToString();
            Regex r2 = new Regex(pat2, RegexOptions.IgnoreCase);
            string rs2;
            rs2 = r2.ToString();
            // Match the regular expression pattern against a text string.
            MatchCollection m3 = r3.Matches(responseData);
            MatchCollection m2 = r2.Matches(responseData);
            if (m3.Count >= 1)
            {
                if (ds2.Equals(rs))
                {
                }
                else
                {
                   string  _query = @"INSERT INTO [tblEntrance] (iddevice,time,statusdoor,date) 
                values (@iddevice,@time,@statusdoor,@date)";
                    using (SqlConnection conn = new SqlConnection(strcon))
                    {
                        using (SqlCommand comm = new SqlCommand())
                        {
                            comm.Connection = conn;
                            comm.CommandType = CommandType.Text;
                            comm.CommandText = _query;
                            comm.Parameters.AddWithValue("@iddevice", 2);
                            comm.Parameters.AddWithValue("@time", DateTime.Now.ToString("HH:mm"));
                            comm.Parameters.AddWithValue("@statusdoor", rs);
                            comm.Parameters.AddWithValue("@date", DateTime.Now.ToString("MM/dd/yyyy"));
                            try
                            {
                                conn.Open();
                                comm.ExecuteNonQuery();
                            }
                            catch (SqlException ex)
                            {

                            }
                        }
                    }
                }
            }
            if (m2.Count >= 1)
            {
                if (ds2.Equals(rs2))
                {
                }
                else
                {
                  string  _query = @"INSERT INTO [tblEntrance] (iddevice,time,statusdoor,date) 
                values (@iddevice,@time,@statusdoor,@date)";
                    using (SqlConnection conn = new SqlConnection(strcon))
                    {
                        using (SqlCommand comm = new SqlCommand())
                        {
                            comm.Connection = conn;
                            comm.CommandType = CommandType.Text;
                            comm.CommandText = _query;
                            comm.Parameters.AddWithValue("@iddevice", 2);
                            comm.Parameters.AddWithValue("@time", DateTime.Now.ToString("HH:mm"));
                            comm.Parameters.AddWithValue("@statusdoor", rs2);
                            comm.Parameters.AddWithValue("@date", DateTime.Now.ToString("MM/dd/yyyy"));
                            try
                            {
                                conn.Open();
                                comm.ExecuteNonQuery();
                            }
                            catch (SqlException ex)
                            {

                            }
                        }
                    }
                }
            }
            stream.Close();
            client.Close();
        }
        catch (ArgumentNullException e)
        {
            rchtxt.Text = rchtxt.Text + "ArgumentNullException: {0}" + e;
        }
        catch (SocketException e)
        {
            rchtxt.Text = rchtxt.Text + "SocketException: {0}" + e;
        }


    }

    public static void Connect3(String server, String message, int port)
    {
        try
        {
            TcpClient client = new TcpClient(server, port);
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);
            NetworkStream stream = client.GetStream();
            stream.Write(data, 0, data.Length);
            data = new Byte[256];
            String responseData = String.Empty;
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            stream.Close();
            client.Close();
        }
        catch (ArgumentNullException e)
        {
          //  rchtxt.Text = rchtxt.Text + "ArgumentNullException: {0}" + e;
        }
        catch (SocketException e)
        {
           // rchtxt.Text = rchtxt.Text + "SocketException: {0}" + e;
        }


    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }

}