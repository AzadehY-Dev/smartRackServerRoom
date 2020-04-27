
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


public partial class Default3 : System.Web.UI.Page
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
                 //   /= ds;
                    ds2 = Session["statusdoor"].ToString();
                }
                con.Close();
            }
        }
    }
    protected void Timer2_Tick(object sender, EventArgs e)
    {
        Connect("192.168.0.23", "", 1024, txtreply);

    }
   
    public static void Connect(String server, String message, int port, TextBox rchtxt)
    {
        try
        {
            // Create a TcpClient.
            // Note, for this client to work you need to have a TcpServer 
            // connected to the same address as specified by the server, port
            // combination.
            // Int32 port = 13000;
            TcpClient client = new TcpClient(server, port);

            // Translate the passed message into ASCII and store it as a Byte array.
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);

            // Get a client stream for reading and writing.
            //  Stream stream = client.GetStream();

            NetworkStream stream = client.GetStream();

            // Send the message to the connected TcpServer. 
            stream.Write(data, 0, data.Length);

            //////////important////////////////rchtxt.Text = rchtxt.Text + "Sent: {0}" + message;
            // Console.WriteLine("Sent: {0}", message);

            // Receive the TcpServer.response.

            // Buffer to store the response bytes.
            data = new Byte[256];

            // String to store the response ASCII representation.
            String responseData = String.Empty;

            // Read the first batch of the TcpServer response bytes.


            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            rchtxt.Text = rchtxt.Text + "Received: {0}" + responseData;
            if (responseData.Contains('*'))
            {
                string temp = responseData;
                string pat = @"\d*\.\d";
                Regex r = new Regex(pat, RegexOptions.IgnoreCase);
                Match m = r.Match(temp);
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
            string pat3 = @"open";
            string pat2 = @"close";
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

    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
}