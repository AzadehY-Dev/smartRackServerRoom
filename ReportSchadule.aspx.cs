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

public partial class ReportSchadule : System.Web.UI.Page
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
    protected void gridReports_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridReports.FocusedRowIndex != -1)
        {
            object ID = this.gridReports.GetRowValues(this.gridReports.FocusedRowIndex, "id");
            lblID.Text = ID.ToString();
            if (e.ButtonID.Equals("Users"))
            {
                pnlReports.Visible = false;
                pnlUsers.Visible = true;
            }
        }
    }
    protected void RegisterUsers_Click(object sender, EventArgs e)
    {
        int i = GridAddUsers.GetSelectedFieldValues(GridAddUsers.KeyFieldName).Count;
        int id;
        List<Object> selectItems = GridAddUsers.GetSelectedFieldValues("idUser");
        foreach (object selectItemId in selectItems)
        {
            id = Convert.ToInt32(selectItemId);
            string _query = @"INSERT INTO [tblReportUsers] (IDr,IDu) 
values (@IDr,@IDu)";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDr", lblID.Text);
                    comm.Parameters.AddWithValue("@IDu", id);

                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                        ShowPopUpMsg("Users added in the list!" + "\r\n");
                        pnlUsers.Visible = true;
                        pnlAddUsers.Visible = false;
                        gridselectedusers.DataBind();
                    }
                    catch (SqlException ex)
                    {
                        ShowPopUpMsg(ex.ToString());
                    }
                }
            }
        }
        GridAddUsers.GetSelectedFieldValues(GridAddUsers.KeyFieldName);
    }
    protected void btnaddusers_Click(object sender, EventArgs e)
    {
        pnlAddUsers.Visible = true;
        pnlUsers.Visible = false;
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