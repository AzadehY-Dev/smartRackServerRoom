using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Last : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsCallback)
        {
           // Request.Redirect("url");
            if (string.IsNullOrEmpty((string)Session["role"]))
            {
                Server.Transfer("logIn.aspx");
                //Response.Redirect();
            }
            else
            {
                //string username = Session["role"].ToString();
                string role = Session["role"].ToString();
                if (role == "Ad" || role == "op")
                {

                }
                else
                    Server.Transfer("logIn.aspx");
                // Response.Redirect("logIn.aspx");
            }
        }
        if (!IsPostBack)
        {
          //  Tab2.CssClass = "Clicked";
           // MainView.ActiveViewIndex = 1;
        }

    }

    protected void btnClearlog_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"delete from tblLogData";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
        }
        catch(Exception ex)
        {

        }
    }
    protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
    {
        if (e.RowType == GridViewRowType.Data)
        {
            bool alarm = Convert.ToBoolean(e.GetValue("Alarm"));
            if (alarm) e.Row.BackColor = System.Drawing.Color.Red;
            else e.Row.BackColor = System.Drawing.Color.LightGreen;
            if (e.GetValue("Comments").ToString().Contains("Check Alarm:"))
                e.Row.BackColor = System.Drawing.Color.Orange;
            if (e.GetValue("Comments").ToString().Contains("Illegal RFID used"))
                e.Row.BackColor = System.Drawing.Color.Yellow;
        }
 

     
    }
}