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

public partial class Outputs : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["role"]))
        {
            Response.Redirect("logIn.aspx");
        }
        else
        {
            string username = Session["role"].ToString();
            string role = Session["role"].ToString();
            if (role != "Ad")
            {
                Response.Redirect("logIn.aspx");
            }
        }
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
            object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idD");
            lblID.Text = ID.ToString();
            lblIP.Text = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "IP").ToString();
            lblPort.Text = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "Port").ToString();
            if (e.ButtonID.Equals("Output"))
            {
                try
                {
                    pnldevice.Visible = false;
                    pnlOutput.Visible = true;

                }
                catch (Exception ex)
                { 

                }
            }
        }
    }
    protected void gridOutput_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridOutput.FocusedRowIndex != -1)
        {
            //object ID = this.gridOutput.GetRowValues(this.gridOutput.FocusedRowIndex, "ID");
            //lblID.Text = ID.ToString();
            if (e.ButtonID.Equals("On"))
            {
                try
                {
                    string on = this.gridOutput.GetRowValues(this.gridOutput.FocusedRowIndex, "ONchar").ToString()+"\r";
                    try
                    {
                        SqlConnection conn;
                        SqlCommand comm;
                        string _query;
                        _query = @"INSERT INTO [tblOutAction] (Command, IP) 
                            values (@Command,@IP) ";
                        using (conn = new SqlConnection(strcon))
                        {
                            using (comm = new SqlCommand())
                            {
                                comm.Connection = conn;
                                comm.CommandText = _query;
                                comm.Parameters.AddWithValue("@Command", on);
                                comm.Parameters.AddWithValue("@IP", lblIP.Text);
                                conn.Open();
                                comm.ExecuteNonQuery();
                                conn.Close();
                            }
                        }
  
                    }
                    catch (Exception ex)
                    {

                    }
           
                }
                catch (Exception ex)
                {
                   // ShowPopUpMsg("Error!");
                }
            }
            if (e.ButtonID.Equals("Off"))
            {
                try
                {
                    string off = this.gridOutput.GetRowValues(this.gridOutput.FocusedRowIndex, "OFFchar").ToString() + "\r";
                    try
                    {
                        SqlConnection conn;
                        SqlCommand comm;
                        string _query;
                        _query = @"INSERT INTO [tblOutAction] (Command, IP) 
                            values (@Command,@IP) ";
                        using (conn = new SqlConnection(strcon))
                        {
                            using (comm = new SqlCommand())
                            {
                                comm.Connection = conn;
                                comm.CommandText = _query;
                                comm.Parameters.AddWithValue("@Command", off);
                                comm.Parameters.AddWithValue("@IP", lblIP.Text);
                                conn.Open();
                                comm.ExecuteNonQuery();
                                conn.Close();
                            }
                        }

                    }
                    catch (Exception ex)
                    {

                    }
           
                }
                catch (Exception ex)
                {
                   // ShowPopUpMsg("Error!");
                }
            }
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
    public static void Connect(String server, String message, int port)
    {
        try
        {
            TcpClient client = new TcpClient(server, port);
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);
            NetworkStream stream = client.GetStream();
            stream.Write(data, 0, data.Length);
            //data = new Byte[256];
            //String responseData = String.Empty;
            //Int32 bytes = stream.Read(data, 0, data.Length);
            //responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
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

    //private static void NewDataRec(TCPServerSocket.ClientHandler client, byte[] data, int len)
    //{
    //    Console.WriteLine("Data Received {0} :{1}", client.IpEndPoint.Address.ToString(), Encoding.ASCII.GetString(data, 0, len));
    //    foreach (var device in QDevices)
    //    {
    //        if (device.Ip == client.IpEndPoint.Address.ToString())
    //        {
    //            string result = Encoding.ASCII.GetString(data, 0, len);
    //            ProccessInputData PIData = new ProccessInputData();
    //            PIData.Device = device;
    //            PIData.InputData = result; ;
    //            QProccessIData.Enqueue(PIData);

    //            ProccessInputData last = new ProccessInputData();
    //            last.Device = device;
    //            last.InputData = result; ;
    //            Qlast.Enqueue(last);
    //            break;
    //        }
    //    }
    //}
}
// Connect(lblIP.Text, on, Convert.ToInt32(lblPort.Text));

//clients = new List<TCPServerSocket.ClientHandler>();
//server = new TCPServerSocket.TcpServer()
//{
//    ListenPort = 3020,
//    RecvNewClientAction = NewConnection,
//    LostClientAction = LostConnection,
//    //RecvClientDataAction = NewDataRec

//};
//server.StartListen();
//  SendCommand(lblIP.Text, on);
//  ShowPopUpMsg("Done!");

//clients = new List<TCPServerSocket.ClientHandler>();
//server = new TCPServerSocket.TcpServer()
//{
//    ListenPort = 3020,
//    RecvNewClientAction = NewConnection,
//    LostClientAction = LostConnection,
//    //RecvClientDataAction = NewDataRec

//};
//server.StartListen();
//SendCommand(lblIP.Text, off);
// ShowPopUpMsg("Done!");