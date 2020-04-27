using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckWait : System.Web.UI.Page
{
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
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
             
            if (e.ButtonID.Equals("Check"))
            {
                pcLogin.ShowOnPageLoad=true;
                lblID.Text = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "ID").ToString();
                lblIDD.Text = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "IDD").ToString();
                lblIOTYPE.Text = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "Type").ToString();
              
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
    static void insertToLog(string IOType, int IDD, string Cm)
    {
        string query = @"INSERT INTO [tblLogData] ([AIDI],[IDD],[Comments],[Alarm],[Time],[Date],[Success])
                        values (@AIDI,@IDD,@Comments,@Alarm,@Time,@Date,@Success)";

        using (var dbconn = new SqlConnection(strcon))
        using (var dbcm = new SqlCommand(query, dbconn))
        {
            dbcm.Parameters.AddWithValue("@AIDI", IOType);
            dbcm.Parameters.AddWithValue("@IDD", IDD);
            dbcm.Parameters.AddWithValue("@Comments","Check Alarm: " + Cm);
            dbcm.Parameters.AddWithValue("@Alarm", "0");
            DateTime dt = DateTime.Now;
            String strDate = "";
            dbcm.Parameters.AddWithValue("@Time",  dt.ToString("HH:mm:ss"));
            dbcm.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            dbcm.Parameters.AddWithValue("@Success", "1");
            dbconn.Open();
            dbcm.ExecuteNonQuery();
            
        }
    }
    protected void btOK_Click(object sender, EventArgs e)
    {
        insertToLog(lblIOTYPE.Text, Convert.ToInt32(lblIDD.Text), txtComment.Text);
        txtComment.Text = "";
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblDeviceIO set WaittoCheck=0 where ID=@ID";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@ID", lblID.Text);
                    conn.Open();
                    comm.ExecuteNonQuery();
                    griddevice.DataBind();
                    ShowPopUpMsg("Checked!");
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void BTNclearcheck_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = @"select * from tblDeviceIO where WaittoCheck=1";
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            string query = @"INSERT INTO [tblLogData] ([AIDI],[IDD],[Comments],[Alarm],[Time],[Date],[Success])
                        values (@AIDI,@IDD,@Comments,@Alarm,@Time,@Date,@Success)";

                            using (var dbconn = new SqlConnection(strcon))
                            using (var dbcm = new SqlCommand(query, dbconn))
                            {
                                dbcm.Parameters.AddWithValue("@AIDI", sdr["Type"].ToString());
                                dbcm.Parameters.AddWithValue("@IDD", sdr["IDD"].ToString());
                                dbcm.Parameters.AddWithValue("@Comments", "Check Alarm: Group Checked" );
                                dbcm.Parameters.AddWithValue("@Alarm", "0");
                                DateTime dt = DateTime.Now;
                                String strDate = "";
                                dbcm.Parameters.AddWithValue("@Time", dt.ToString("HH:mm:ss"));
                                dbcm.Parameters.AddWithValue("@Date", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
                                dbcm.Parameters.AddWithValue("@Success", "1");
                                dbconn.Open();
                                dbcm.ExecuteNonQuery();
                                dbconn.Close();
                                string _query = @"update tblDeviceIO set WaittoCheck=0 where ID=@ID";
                                using (SqlConnection conn = new SqlConnection(strcon))
                                {
                                    using (SqlCommand comm = new SqlCommand())
                                    {
                                        comm.Connection = conn;
                                        comm.CommandText = _query;
                                        comm.Parameters.AddWithValue("@ID", sdr["ID"].ToString());
                                        conn.Open();
                                        comm.ExecuteNonQuery();
                                        griddevice.DataBind();
                                        
                                    }
                                }
                            }
                        }
                    }
                }
            }
            ShowPopUpMsg("Checked!");
        }
        catch (Exception ex) 
        {
            ShowPopUpMsg("Unsuccessfull!!!");
        }
    }
}