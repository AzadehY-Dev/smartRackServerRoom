using DevExpress.Export;
using DevExpress.XtraPrinting;
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

public partial class Enterance : System.Web.UI.Page
{
     static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (string.IsNullOrEmpty((string)Session["username"]))
        //{
        //   // Response.Redirect("logIn.aspx");
        //}
        //else

        //{
        if (string.IsNullOrEmpty((string)Session["role"]))
        {
            Response.Redirect("logIn.aspx");
        }
        else
        {
            string username = Session["role"].ToString();
            string role = Session["role"].ToString();
            if (role != "Ad" || role != "op")
            {
                Response.Redirect("logIn.aspx");
            }
        }
     
            string x = Request.QueryString["id"];
            if (x != null)
            {
                lbliddevice.Text = x;
                // lbliddevice.Text = "2";
                //Response.Write("   id detected");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        //}
        //lbliddevice.Text = "2";
     

    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
       // gridExport.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
    }
    protected void btnword_Click(object sender, EventArgs e)
    {
      //  gridExport.WritePdfToResponse();
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
            object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idud");
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
    protected void griddevice_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
    {
        int id = Convert.ToInt32(e.GetValue("idud"));
        string sql = "select * from tblEntrance where statusdoor='None' and idud=" + id;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data = new DataTable();
        adapter.Fill(data);
        if (data.Rows.Count > 0)
        {
            e.Row.BackColor = System.Drawing.Color.Orange;
        }

        //sql = "select * from tblEntrance where statusdoor='None' and idud=" + id;
        //SqlDataAdapter adapter2 = new SqlDataAdapter(sql, strcon);
        //DataTable data2 = new DataTable();
        //adapter2.Fill(data2);
        //if (data2.Rows.Count > 0)
        //{
        //    e.Row.BackColor = System.Drawing.Color.Orange;
        //}
        // int id = Convert.ToInt32(e.GetValue("idud"));
        // string sql = "select * from tblEntrance where iduser not in (select e.iduser from tblEntrance e inner join tblDeviceUser d on e.iduser=d.iduser) and iddevice=" + Convert.ToInt32(lbliddevice.Text) + " and idud=" + id ;
        //SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        //DataTable data = new DataTable();
        //adapter.Fill(data);
        //if (data.Rows.Count > 0)
        //{
        //    e.Row.BackColor = System.Drawing.Color.Orange;
        //}

        //sql = "select * from tblEntrance where iduser is null and idud=" + id ;
        //SqlDataAdapter adapter2 = new SqlDataAdapter(sql, strcon);
        //DataTable data2 = new DataTable();
        //adapter2.Fill(data2);
        //if (data2.Rows.Count > 0)
        //{
        //    e.Row.BackColor = System.Drawing.Color.Orange;
        //}
    }
}