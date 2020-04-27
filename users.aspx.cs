using DevExpress.Export;
using DevExpress.Web;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

public partial class users : System.Web.UI.Page
{
    string strcon = System.Configuration.ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;

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
       // if (!IsPostBack)
           // gridusers.StartEdit(0);
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
        }
    }
    private string CreateMD5(string textin)
    {
        MD5 newmd5 = MD5.Create();
        byte[] input = Encoding.ASCII.GetBytes(textin);
        byte[] result = newmd5.ComputeHash(input);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < result.Length; i++)
        {
            sb.Append(result[i].ToString("X2"));

        }
        return sb.ToString();
    }
    protected void sds_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        SetParameterDbType(e);
        if (e.Command.Parameters[1].Value != null)
        {
            e.Command.Parameters[1].Value = CreateMD5(e.Command.Parameters[1].Value.ToString());
        }

    }
    protected void sds_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        SetParameterDbType(e);
        if (e.Command.Parameters[1].Value != null)
        {
            e.Command.Parameters[1].Value = CreateMD5(e.Command.Parameters[1].Value.ToString());
        }
        
    }
    private void SetParameterDbType(SqlDataSourceCommandEventArgs e)
    {
        SqlParameter binaryImageParameter = (SqlParameter)e.Command.Parameters[0];
        binaryImageParameter.SqlDbType = SqlDbType.VarBinary;
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridusers.FocusedRowIndex != -1)
        {
            object ID = this.gridusers.GetRowValues(this.gridusers.FocusedRowIndex, "idUser");
            if (e.ButtonID.Equals("reset"))
            {
                SqlConnection con = new SqlConnection(strcon);
                String st = "UPDATE tblusers SET password='MTIzNDU2Nzg5' WHERE idUser=" + ID;

                SqlCommand sqlcom = new SqlCommand(st, con);
                try
                {
                    con.Open();
                    sqlcom.ExecuteNonQuery();
                    con.Close();
                    gridusers.DataBind();
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
    protected void sds_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {
        //e.Command.Parameters[8] = "2";
    }
    protected void gridusers_CustomColumnDisplayText(object sender, ASPxGridViewColumnDisplayTextEventArgs e)
    {
        //if (e.Column.FieldName == "password")
        //{
        //    string s = e.DisplayText;
        //    if(s != null)
        //             e.DisplayText = Decrypt(e.DisplayText);
        //}
        //string s=Encrypt("123456789");
        //s = Decrypt(s);
        //if (e.Column.FieldName == "password")
        //{
        //    e.DisplayText = Decrypt(e.Value.ToString());
        //}
    }
    private string Encrypt(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
    }
    private string Decrypt(string encryptpwd)
    {
        string decryptpwd = string.Empty;
        UTF8Encoding encodepwd = new UTF8Encoding();
        Decoder Decode = encodepwd.GetDecoder();
        byte[] todecode_byte = Convert.FromBase64String(encryptpwd);
        int charCount = Decode.GetCharCount(todecode_byte, 0, todecode_byte.Length);
        char[] decoded_char = new char[charCount];
        Decode.GetChars(todecode_byte, 0, todecode_byte.Length, decoded_char, 0);
        decryptpwd = new String(decoded_char);
        return decryptpwd;
        // string _result = string.Empty;
        // if (cipherText != null)
        // {

        //     char[] temp = cipherText.ToCharArray();
        //     foreach (var _singleChar in temp)
        //     {
        //         var i = (int)_singleChar;
        //         i = i + 2;
        //         _result += (char)i;
        //     }
        // }
        //return _result;
    }
    protected void gridusers_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
    {


           object rowObj = gridusers.GetRow(gridusers.EditingRowVisibleIndex);
        DataRowView row = rowObj as DataRowView;
        if (row != null)
            row["password"] = "*****";
        //string s=gridusers.GetRowValuesByKeyValue(e.EditingKeyValue, "password").ToString();

      //  e.Command.Parameters[1].Value = Decrypt(e.Command.Parameters[1].Value.ToString());
        //int i;
    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        gridExport.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
    }
    protected void btnword_Click(object sender, EventArgs e)
    {
        gridExport.WritePdfToResponse();
    }

}