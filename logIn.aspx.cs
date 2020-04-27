using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Cryptography;
using System.Data;


public partial class logIn : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
   
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
    private string Encrypt(string password)
    {
        string strmsg = string.Empty;
        byte[] encode = new byte[password.Length];
        encode = Encoding.UTF8.GetBytes(password);
        strmsg = Convert.ToBase64String(encode);
        return strmsg;
        //string EncryptionKey = "azad";
        //byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
        //using (Aes encryptor = Aes.Create())
        //{
        //    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        //    encryptor.Key = pdb.GetBytes(32);
        //    encryptor.IV = pdb.GetBytes(16);
        //    using (MemoryStream ms = new MemoryStream())
        //    {
        //        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
        //        {
        //            cs.Write(clearBytes, 0, clearBytes.Length);
        //            cs.Close();
        //        }
        //        clearText = Convert.ToBase64String(ms.ToArray());
        //    }
        //}
        //return clearText;
    }
    private string Decrypt(string cipherText)
    {
        string _result = string.Empty;
        char[] temp = cipherText.ToCharArray();
        foreach (var _singleChar in temp)
        {
            var i = (int)_singleChar;
            i = i + 2;
            _result += (char)i;
        }
        return _result;
        //string EncryptionKey = "azad";
        //byte[] cipherBytes = Convert.FromBase64String(cipherText);
        //using (Aes encryptor = Aes.Create())
        //{
        //    Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
        //    encryptor.Key = pdb.GetBytes(32);
        //    encryptor.IV = pdb.GetBytes(16);
        //    using (MemoryStream ms = new MemoryStream())
        //    {
        //        using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateDecryptor(), CryptoStreamMode.Write))
        //        {
        //            cs.Write(cipherBytes, 0, cipherBytes.Length);
        //            cs.Close();
        //        }
        //        cipherText = Encoding.Unicode.GetString(ms.ToArray());
        //    }
        //}
        //return cipherText;
    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        try
        {
          //  Response.Redirect("Default.aspx");
            string pass = CreateMD5(txtpassword.Text);
            bool flag = false;
         //  // string pass = Encrypt(txtpassword.Text);
         //   string _query = @"SELECT COUNT(*) FROM tblusers WHERE username=N'" + txtusername.Text
         //   + "' and password=N'" + pass + "'";
         //   SqlDataAdapter adapter = new SqlDataAdapter(_query, strcon);
         //   DataTable data2 = new DataTable();
         //   adapter.Fill(data2);
         //   if (data2.Rows.Count > 0)
         //   {
                  
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = @"SELECT * FROM tblusers WHERE username=N'" + txtusername.Text
            + "' and password=N'" + pass + "'";
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            while (sdr.Read())
                            {

                                
                                if (sdr["role"] == null) { }
                                else {
                                    string role =  sdr["role"].ToString();
                                    if(role=="Ad" || role=="Op")
                                        flag = true;
                                    Session["role"] = role;
                                }
                            }
                        }
                    }
                    con.Close();
                }
                if (flag)
                {
                    Session["username"] = txtusername.Text;
                    Response.Redirect("Default.aspx");
                }
            }
        catch (Exception k)
        {
            // lblStatus.Text = k.Message;
        }

            //SqlConnection myConnection = new SqlConnection();
            //myConnection.ConnectionString = strcon;
            //myConnection.Open();
        
            ////  string strSql = "SELECT COUNT(*) FROM Users WHERE userName=N' " + ddpusername.SelectedItem.Text + "' AND pass=N'" + txtpassword.Text + "'";
            //string strSql = "SELECT COUNT(*) FROM tblusers WHERE username=N'" + txtusername.Text
            //    + "' and password=N'" + pass + "'";
            //SqlCommand command = new SqlCommand(strSql, myConnection);
            //int count = Convert.ToInt32(command.ExecuteScalar());
            ////   myConnection.Close();
            //if (count == 1)
            //{
                //Session["username"] = txtusername.Text;
                //Response.Redirect("Default.aspx");
               // strSql = "SELECT id FROM userTbl WHERE username=N'" + txtusername.Text + "' and pass=N'" + Encrypt(txtpassword.Text) + "'";
               // command = new SqlCommand(strSql, myConnection);
               // string id = (command.ExecuteScalar()).ToString();
               //// Session["id"] = id;
             //  Label1.Text = "qA";
               // Response.Redirect("file.aspx");
            //}
            //else
            //    Label1.Text = Convert.ToString(count);
       // }
       
    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //   // Label1.Text = Encrypt("123456789");
    //}
}