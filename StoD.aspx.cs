using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class StoD : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
        }
    }
    protected void btnchoosedevice_Click(object sender, EventArgs e)
    {
        if (this.GridDevice.FocusedRowIndex != -1)
        {
            object ID = this.GridDevice.GetRowValues(this.GridDevice.FocusedRowIndex, "idD");
            object Name = this.GridDevice.GetRowValues(this.GridDevice.FocusedRowIndex, "NameD");
            lblnamedevice.Text = Name.ToString();
            lbliddevice.Text = ID.ToString();
            pnlsensorsshow.Visible = true;
            pnlshowsensor.Visible = true;
            pnlCd.Visible = false;
            pnlhd.Visible = false;
        }
        else
        {
            ShowPopUpMsg("choose your device please" + "\r\n");
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
    protected void btnSubSen_Click(object sender, EventArgs e)
    {
        if (this.GridSensor.FocusedRowIndex != -1)
        {
            object ID = this.GridSensor.GetRowValues(this.GridSensor.FocusedRowIndex, "idS");
            lblidsensor.Text = ID.ToString();
            pnlCs.Visible = false;
            pnlCd.Visible = false;
            pnlhs.Visible = false;
            pnlhd.Visible = false;
            pnldetailds.Visible = true;
            pnlhDetail.Visible = true;
        }
        else
        {
            ShowPopUpMsg("choose your sensor please" + "\r\n");
        }
    }
    protected void btninserttodb_Click(object sender, EventArgs e)
    {
        string _query = @"INSERT INTO [tblsensorTodevice] (iddevice,idsensor,commnets,port) 
values (@iddevice,@idsensor,@commnets,@port)";
        using (SqlConnection conn = new SqlConnection(strcon))
        {
            using (SqlCommand comm = new SqlCommand())
            {
                comm.Connection = conn;
                comm.CommandType = CommandType.Text;
                comm.CommandText = _query;
                comm.Parameters.AddWithValue("@iddevice", lbliddevice.Text);
                comm.Parameters.AddWithValue("@idsensor", lblidsensor.Text);
                comm.Parameters.AddWithValue("@commnets", txtcomment.Text);
                comm.Parameters.AddWithValue("@port", txtport.Text);
                try
                {
                    conn.Open();
                    comm.ExecuteNonQuery();
                    ShowPopUpMsg("This Sensor assigned to the choosen device" + "\r\n");
                }
                catch (SqlException ex)
                {
                    ShowPopUpMsg(ex.ToString());
                    // other codes here
                    // do something with the exception
                    // don't swallow it.
                }
            }
        }
    }
    protected void btnshowsensors_Click(object sender, EventArgs e)
    {
        pnlCs.Visible = true;
        pnlhs.Visible = true;
        pnlsensorsshow.Visible = false;
        pnlshowsensor.Visible = false;

    }
}