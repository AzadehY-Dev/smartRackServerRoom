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

public partial class Enterance : System.Web.UI.Page
{
     static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
        }
        else
        { 
           // lbliddevice.Text = "2";
            string x = Request.QueryString["id"];
            if (x != null)
            {
                lbliddevice.Text = x;
                //lbliddevice.Text = "2";
                ////Response.Write("   id detected");
            }
        }
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
            object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idud");
            object IP = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "ip");
            object PORT = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idud");
            if (e.ButtonID.Equals("dclose"))
            {
                SqlConnection con = new SqlConnection(strcon);
                String st = "UPDATE tblEntrance SET statusdoor='close' WHERE idud=" + ID;
                SqlCommand sqlcom = new SqlCommand(st, con);
                try
                {
                    con.Open();
                    sqlcom.ExecuteNonQuery();
                    con.Close();
                    griddevice.DataBind();
                 //   Connect(txtip.Text, txtmessage.Text, Convert.ToInt32(txtport.Text), txtreply);
                   // ShowPopUpMsg("choose your device please" + "\r\n");
                    //  MessageBox.Show("update successful");
                }
                catch (SqlException ex)
                {
                    ShowPopUpMsg(ex.ToString() + "\r\n");
                    //MessageBox.Show(ex.Message);
                }

            }
            if (e.ButtonID.Equals("dopen"))
            {
                SqlConnection con = new SqlConnection(strcon);
                String st = "UPDATE tblEntrance SET statusdoor='open' WHERE idud=" + ID;

                SqlCommand sqlcom = new SqlCommand(st, con);
                try
                {
                    con.Open();
                    sqlcom.ExecuteNonQuery();
                    con.Close();
                    griddevice.DataBind();
                    // ShowPopUpMsg("choose your device please" + "\r\n");
                    //  MessageBox.Show("update successful");
                }
                catch (SqlException ex)
                {
                    ShowPopUpMsg(ex.ToString() + "\r\n");
                    //MessageBox.Show(ex.Message);
                }
            }
            if (e.ButtonID.Equals("erase"))
            {
                SqlConnection con = new SqlConnection(strcon);
                String st = "UPDATE tblEntrance SET statusdoor='' WHERE idud=" + ID;
                SqlCommand sqlcom = new SqlCommand(st, con);
                try
                {
                    con.Open();
                    sqlcom.ExecuteNonQuery();
                    con.Close();
                    griddevice.DataBind();
                    // ShowPopUpMsg("choose your device please" + "\r\n");
                    //  MessageBox.Show("update successful");
                }
                catch (SqlException ex)
                {
                    ShowPopUpMsg(ex.ToString() + "\r\n");
                    //MessageBox.Show(ex.Message);
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
    public static void Connect(String server, String message, int port, TextBox rchtxt)
    {
        try
        {
            TcpClient client = new TcpClient(server, port);
            Byte[] data = System.Text.Encoding.ASCII.GetBytes(message);
            NetworkStream stream = client.GetStream();
            stream.Write(data, 0, data.Length);
            rchtxt.Text = rchtxt.Text + "Sent: {0}" + message;
            data = new Byte[256];
            String responseData = String.Empty;
            Int32 bytes = stream.Read(data, 0, data.Length);
            responseData = System.Text.Encoding.ASCII.GetString(data, 0, bytes);
            rchtxt.Text = rchtxt.Text + "Received: {0}" + responseData;
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
}