using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class MasterPage : System.Web.UI.MasterPage
{
    int counta = 0;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
        }
        else
        {
            lblusername.Text=(string)Session["username"];

            //try
            //{
            //    System.Int32 _ImgID = System.Convert.ToInt32(Request.QueryString["ImgID"]);
            //    System.Int32 _height = System.Convert.ToInt32(Request.QueryString["height"]);
            //    System.Int32 _width = System.Convert.ToInt32(Request.QueryString["width"]);
            //    System.Data.SqlClient.SqlConnection Con = new System.Data.SqlClient.SqlConnection(strcon);
            //    System.String SqlCmd = "SELECT * FROM tblusers WHERE username = @username";
            //    System.Data.SqlClient.SqlCommand SqlCmdObj = new System.Data.SqlClient.SqlCommand( SqlCmd, Con );
            //    SqlCmdObj.Parameters.AddWithValue("@username",)
            //    SqlCmdObj.Parameters.Add("@ImageID", System.Data.SqlDbType.Int).Value = _ImgID;
            //    Con.Open();
            //    System.Data.SqlClient.SqlDataReader SqlReader = SqlCmdObj.ExecuteReader();
            //    SqlReader.Read();
            //    System.Web.HttpContext.Current.Response.ContentType = "image/jpeg";
            //    System.Drawing.Image _image = System.Drawing.Image.FromStream( new System.IO.MemoryStream( (byte[])SqlReader["img_data"] ) );
            //    System.Drawing.Image _newimage = _image.GetThumbnailImage( _width, _height, null, new System.IntPtr() );
            //_newimage.Save( System.Web.HttpContext.Current.Response.OutputStream, System.Drawing.Imaging.ImageFormat.Jpeg );

 //               SqlConnection connect = null;

 //               string connectstring = strcon;
 //               connect = new SqlConnection(connectstring);
 //               connect.Open();

 //               string Scmd = "SELECT * FROM tblusers WHERE idUser = 1";;
 //               SqlCommand cmd = new SqlCommand(Scmd, connect);

 //               SqlDataReader reader = cmd.ExecuteReader();

 //               reader.Read();

 //               if (reader.HasRows)
 //               {
 //                   //Label1.Text = reader[0].ToString();    
                    

 //                   byte[] imagem = (byte[])(reader[1]);
 //                   string base64String = Convert.ToBase64String(imagem) ;


 //                   //byte[] imagem = (byte[])(reader[1]);

 //                   MemoryStream ms = new MemoryStream(imagem);

 //                   Image1.ImageUrl = String.Format("data:image/jpg;base64,{0}",base64String);

 //                  // Image1.ImageUrl = ms.FromStream(ms); //i tried this
 //               }
 //                 } 
 //           catch (System.Exception Ex) {

 //System.Web.HttpContext.Current.Trace.Write(Ex.Message.ToString());

 //}

            //SqlConnection con = new SqlConnection(strcon);
            //con.Open();
            //SqlCommand cmd = new SqlCommand("select * from tblImage where ID=2", con);
            //SqlDataReader dr = cmd.ExecuteReader();
            //while (dr.Read())
            //{
            //    byte[] b = new byte[0];
            //    b = (Byte[])(dr["ImgUrl"]);
            //    MemoryStream ms = new MemoryStream(b);
            //    pictureBox1.Image = Image.FromStream(ms);
            //    //pictureBox1.Image = Convert.ToSByte(dr["Url"].ToString());

            //}
            //con.Close();
        }
        //string page = "DeviceUsers";
       // DeviceUsers.Attributes.Add("class", "active");

        //foreach (MenuItem item in ((Menu)this.FindControl("NavigationMenu")).Items)
        //{
        //    if (Request.Url.AbsoluteUri.ToLower().Contains(item.NavigateUrl.ToLower().Substring(1)))
        //    {
        //        item.Selected = true;
        //    }
        //}
        //foreach (MenuItem item in mn.Items)
        //{
        //   if (Request.Url.AbsoluteUri.ToLower().Contains(Page.ResolveUrl(item.NavigateUrl.ToLower()))
        //   {
        //      item.Selected = true;
        //   }
        //}
        SqlConnection conn = new SqlConnection(strcon);
        conn.Open();
        SqlCommand comm = new SqlCommand("select COUNT(*) from tblDeviceIO where WaittoCheck=1", conn);
        Int32 count = Convert.ToInt32(comm.ExecuteScalar());
        //if (count > 0)
        //{
        //    counta += count;
        //}
        lblcount.Text = count.ToString();
        conn.Close();

        //conn.Open();
        //comm = new SqlCommand("select COUNT(*) from tblDeviceIO where WaittoCheck=1", conn);
        //count = Convert.ToInt32(comm.ExecuteScalar());
        //if (count > 0)
        //{
        //    counta += count;
        //}
        //conn.Close();


        ////using (SqlConnection con = new SqlConnection(strcon))
        ////{
        ////    using (SqlCommand cmd = new SqlCommand())
        ////    {
        ////        cmd.CommandText = "SELECT TOP 1 * FROM tblEntrance where iddevice=2 ORDER BY idud DESC";
        ////        cmd.Connection = con;
        ////        con.Open();
        ////        using (SqlDataReader sdr = cmd.ExecuteReader())
        ////        {
        ////            sdr.Read();
        ////            Session["statusdoor"] = sdr["statusdoor"].ToString(); ;
        ////        }
        ////        con.Close();
        ////    }
        ////}

        //lblcount.Text = counta.ToString();
    }
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["username"] = null;
        Response.Redirect("logIn.aspx");
    }
}
