using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Groups : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            Tab1.CssClass = "Clicked";
            MainView.ActiveViewIndex = 0;
        }
    }
    protected void gridGroups_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridGroups.FocusedRowIndex != -1)
        {
            object ID = this.gridGroups.GetRowValues(this.gridGroups.FocusedRowIndex, "ID");
            lblID.Text = ID.ToString();
            if (e.ButtonID.Equals("Users"))
            {
                pnlgroup.Visible = false;
                pnlUsers.Visible = true;
            }
            else if (e.ButtonID.Equals("EmailSMS"))
            {
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = "select * from tblEmailSMS where IDGroup=" + lblID.Text;
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {
                                string type = sdr["Type"].ToString();
                                if (type== "EN")
                                {
                                    htmlEditorEmailEnter.Html = sdr["EMessage"].ToString(); ;
                                    txtEenterSubject.Text = sdr["Subject"].ToString();
                                    txtentersms.Text = sdr["SMSMessage"].ToString();
                                }
                                if (type == "EX")
                                {
                                    HtmlEditorexit.Html = sdr["EMessage"].ToString(); ;
                                    txtexitsubject.Text = sdr["Subject"].ToString();
                                    txtexitsms.Text = sdr["SMSMessage"].ToString();
                                }
                                if (type == "AI")
                                {
                                    HtmlEditorai.Html = sdr["EMessage"].ToString(); ;
                                    txtaisubject.Text = sdr["Subject"].ToString();
                                    txtaisms.Text = sdr["SMSMessage"].ToString();
                                }
                                if (type == "DI")
                                {
                                    htmlEditorDi.Html = sdr["EMessage"].ToString(); ;
                                    txtdiemailsubject.Text = sdr["Subject"].ToString();
                                    txtdisms.Text = sdr["SMSMessage"].ToString();
                                }
                            }
                        }
                        con.Close();
                    }
                }
                pnlgroup.Visible = false;
                pnlEmailsms.Visible = true;
            }
        }
    }
    protected void btnaddusers_Click(object sender, EventArgs e)
    {
        pnlAddUsers.Visible = true;
        pnlUsers.Visible = false;
    }
    private bool insertToEmail(string Type, int ID)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblAlarm] (Type, Enable, IDD) values (@Type, @Enable, @IDD)";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@Type", Type);
                    comm.Parameters.AddWithValue("@Enable", false);
                    comm.Parameters.AddWithValue("@IDD", ID);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    protected void RegisterUsers_Click(object sender, EventArgs e)
    {
        int i =GridAddUsers.GetSelectedFieldValues(GridAddUsers.KeyFieldName).Count;
        int id;
        List<Object> selectItems = GridAddUsers.GetSelectedFieldValues("idUser");
        foreach (object selectItemId in selectItems)
        {
            id = Convert.ToInt32(selectItemId);
            string _query = @"INSERT INTO [tblUsersGroups] (IDg,IDu) 
values (@IDg,@IDu)";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDg", lblID.Text);
                    comm.Parameters.AddWithValue("@IDu", id);
                  
                    try
                    {
                        conn.Open();
                        comm.ExecuteNonQuery();
                        ShowPopUpMsg("Users added to the group!" + "\r\n");
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
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void btnRegSMS_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblSMS where IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblSMS] (SMessage, IDGroup) values (@SMessage, @IDGroup)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@SMessage", "");
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblSMS set SMessage=@SMessage where IDGroup=@IDGroup";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@SMessage", "");
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void btnRegEmail_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblEmail where IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblEmail] (EMessage, Subject, IDGroup) values (@EMessage, @Subject, @IDGroup)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage","");
                        comm.Parameters.AddWithValue("@Subject", "");
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblEmail set EMessage=@EMessage, Subject=@Subject where IDGroup=@IDGroup";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", "");
                        comm.Parameters.AddWithValue("@Subject", "");
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void Tab1_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Clicked";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Initial";
        Tab4.CssClass = "Initial";
        MainView.ActiveViewIndex = 0;
    }
    protected void Tab2_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Clicked";
        Tab3.CssClass = "Initial";
        Tab4.CssClass = "Initial";
        MainView.ActiveViewIndex = 1;
    }
    protected void Tab3_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Clicked";
        Tab4.CssClass = "Initial";
        MainView.ActiveViewIndex = 2;
    }
    protected void Tab4_Click(object sender, EventArgs e)
    {
        Tab1.CssClass = "Initial";
        Tab2.CssClass = "Initial";
        Tab3.CssClass = "Initial";
        Tab4.CssClass = "Clicked";
        MainView.ActiveViewIndex = 3;
    }
    protected void btnEnterreg_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblEmailSMS where Type='EN' and IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblEmailSMS] (EMessage, Subject, IDGroup,SMSMessage, Type) 
                    values (@EMessage, @Subject, @IDGroup,@SMSMessage, @Type)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", htmlEditorEmailEnter.Html);
                        comm.Parameters.AddWithValue("@Subject", txtEenterSubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtentersms.Text);
                        comm.Parameters.AddWithValue("@Type", "EN");
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblEmailSMS set EMessage=@EMessage, Subject=@Subject, SMSMessage=@SMSMessage where IDGroup=@IDGroup and Type='EN'";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", htmlEditorEmailEnter.Html);
                        comm.Parameters.AddWithValue("@Subject", txtEenterSubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtentersms.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void btnexitreg_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblEmailSMS where Type='EX' and IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblEmailSMS] (EMessage, Subject, IDGroup,SMSMessage, Type) 
                    values (@EMessage, @Subject, @IDGroup,@SMSMessage, @Type)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", HtmlEditorexit.Html);
                        comm.Parameters.AddWithValue("@Subject", txtexitsubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtexitsms.Text);
                        comm.Parameters.AddWithValue("@Type", "EX");
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblEmailSMS set EMessage=@EMessage, Subject=@Subject, SMSMessage=@SMSMessage where IDGroup=@IDGroup and Type='EX'";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", HtmlEditorexit.Html);
                        comm.Parameters.AddWithValue("@Subject", txtexitsubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtexitsms.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void btnaireg_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblEmailSMS where Type='AI' and IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblEmailSMS] (EMessage, Subject, IDGroup,SMSMessage, Type) 
                    values (@EMessage, @Subject, @IDGroup,@SMSMessage, @Type)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", HtmlEditorai.Html);
                        comm.Parameters.AddWithValue("@Subject", txtaisubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtaisms.Text);
                        comm.Parameters.AddWithValue("@Type", "AI");
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblEmailSMS set EMessage=@EMessage, Subject=@Subject, SMSMessage=@SMSMessage where IDGroup=@IDGroup and Type='AI'";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", HtmlEditorai.Html);
                        comm.Parameters.AddWithValue("@Subject", txtaisubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtaisms.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
    protected void btndireg_Click(object sender, EventArgs e)
    {
        string sql = "select * from tblEmailSMS where Type='DI' and IDGroup=" + lblID.Text;
        SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
        DataTable data2 = new DataTable();
        adapter.Fill(data2);
        if (data2.Rows.Count <= 0)
        {
            try
            {
                SqlConnection conn;
                SqlCommand comm;
                string _query;
                _query = @"INSERT INTO [tblEmailSMS] (EMessage, Subject, IDGroup,SMSMessage, Type) 
                    values (@EMessage, @Subject, @IDGroup,@SMSMessage, @Type)";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", htmlEditorDi.Html);
                        comm.Parameters.AddWithValue("@Subject", txtdiemailsubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtdisms.Text);
                        comm.Parameters.AddWithValue("@Type", "DI");
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        else
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"update tblEmailSMS set EMessage=@EMessage, Subject=@Subject, SMSMessage=@SMSMessage where IDGroup=@IDGroup and Type='DI'";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@EMessage", htmlEditorDi.Html);
                        comm.Parameters.AddWithValue("@Subject", txtdiemailsubject.Text);
                        comm.Parameters.AddWithValue("@IDGroup", lblID.Text);
                        comm.Parameters.AddWithValue("@SMSMessage", txtdisms.Text);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}