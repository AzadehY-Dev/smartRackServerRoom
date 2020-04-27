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

public partial class GroupToDevice : System.Web.UI.Page
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
            lblDID.Text = ID.ToString();
            if (e.ButtonID.Equals("Groups"))
            {
               // try
               // {
                //    string sql = "select * from tblDeviceGroup where IDDevice=" + lblDID.Text;
                //    SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
                //    DataTable data2 = new DataTable();
                //    adapter.Fill(data2);
                //    if (data2.Rows.Count <= 0)
                //    {
                //        try
                //        {
                //            SqlConnection conn;
                //            SqlCommand comm;
                //            string _query;
                //            _query = @"INSERT INTO [tblDeviceGroup] (IDDevice) values (@IDDevice)";
                //            using (conn = new SqlConnection(strcon))
                //            {
                //                using (comm = new SqlCommand())
                //                {
                //                    comm.Connection = conn;
                //                    comm.CommandText = _query;
                //                    comm.Parameters.AddWithValue("@IDDevice", lblDID.Text);
                //                    conn.Open();
                //                    comm.ExecuteNonQuery();
                //                }
                //            }
                //        }
                //        catch (Exception ex)
                //        {
                //        }
                //    }
                //}
                //catch (Exception ex)
                //{ }
                pnlGroups.Visible = true;
                pnldevice.Visible = false;

            }
        }
    }
    protected void btnaddGroup_Click(object sender, EventArgs e)
    {
        pnlAddGroup.Visible = true;
        pnlGroups.Visible = false;
    }

    protected void RegisterGroup_Click(object sender, EventArgs e)
    {
        int i =GridGroups.GetSelectedFieldValues(GridGroups.KeyFieldName).Count;
        int id;
        List<Object> selectItems = GridGroups.GetSelectedFieldValues("ID");
        foreach (object selectItemId in selectItems)
        {
            id = Convert.ToInt32(selectItemId);
            string _query = @"INSERT INTO [tblDeviceGroup] (IDGroup,IDDevice) 
values (@IDg,@IDD)";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDg",id);
                    comm.Parameters.AddWithValue("@IDD",  lblDID.Text);
                  
                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                        ShowPopUpMsg("Group(s) added to the device!" + "\r\n");
                        pnlGroups.Visible = true;
                        pnlAddGroup.Visible = false;
                        gridselectedGroup.DataBind();
                    }
                    catch (SqlException ex)
                    {
                        ShowPopUpMsg(ex.ToString());
                    }
                }
            }
        }
        GridGroups.GetSelectedFieldValues(GridGroups.KeyFieldName);
    }
    //    if (this.GridGroups.FocusedRowIndex != -1)
    //    {
    //        object ID = this.GridGroups.GetRowValues(this.GridGroups.FocusedRowIndex, "ID");
    //        SqlConnection conn;
    //        SqlCommand comm;
    //        string _query;
    //        try
    //        {
    //            _query = @"update tblDeviceGroup set IDGroup=@IDGroup where IDDevice=@IDDevice";
    //            using (conn = new SqlConnection(strcon))
    //            {
    //                using (comm = new SqlCommand())
    //                {
    //                    comm.Connection = conn;
    //                    comm.CommandText = _query;
    //                    comm.Parameters.AddWithValue("@IDGroup", ID);
    //                    comm.Parameters.AddWithValue("@IDDevice", lblDID.Text);
    //                    conn.Open();
    //                    comm.ExecuteNonQuery();
    //                }
    //            }
    //        }
    //        catch (Exception ex)
    //        {
    //        }
    //    }
    //}
  private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
}