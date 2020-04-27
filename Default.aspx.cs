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
public partial class Default : System.Web.UI.Page
{
    static int counta = 0;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    static string status;
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
    protected string GetImagePath(string result)
    {
        string[] SResult = result.Split(';');
       string status = SResult[5].ToString();
       if (status.Substring(23, 1)=="0")
        return "assets/img/p/close.png";
       else
           return "assets/img/p/open.png";
    }
    protected void dlSample_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType != null)
            {
                var currentItem = e.Item.DataItem;

                string result = ((DataRowView)e.Item.DataItem).Row.ItemArray[10].ToString();
                int id = Convert.ToInt32(((DataRowView)e.Item.DataItem).Row.ItemArray[0]);
                string[] SResult = result.Split(';');
                status = SResult[5].ToString();
                string Value;
                //Image imageback = (Image)e.Item.FindControl("imgback");
                //imageback.Style["z-index"] = "-9";
                //imageback.Style["z-index"] = "-9";
                //imageback.ImageUrl = "~/assets/img/p/close.png";
              //  e.Item.Attributes.Add("onmouseover", "this.style.background-color='#ccsdcc'"); ; ;
                string statusmac, unitsize;
                //back.Style["background-image"] = Page.ResolveUrl("~/pathrelativetoapproot/yourimage.jpg");
                for (int i = 0; i < 23; i++)
                {
                    //if (i == 9)
                    //{
                    //    int gggg = 0;
                    //}
                    var pair = FindStatus(id, i + 1);
                    statusmac = pair.Key; unitsize = pair.Value;
                  
                    //string statusmac = FindStatusMac(id, i + 1);
                    // statusmac;
                    Value = ReturnResult(status.Substring(i, 1));
                    Image ImageData = (Image)e.Item.FindControl("ImgD" + ((i + 1).ToString()));
                    //((Label)e.Item.FindControl("D" + (i + 1).ToString())).Text = Value;

                    //if (Value == "ON") { ((Label)e.Item.FindControl("D" + (i + 1))).BackColor = System.Drawing.Color.LightGreen; }
                    //else if (Value == "OFF") { ((Label)e.Item.FindControl("D" + (i + 1))).BackColor = System.Drawing.Color.Red; }
                    //else ((Label)e.Item.FindControl("D" + (i + 1))).BackColor = System.Drawing.Color.Orange;

                    if (Value == "ON" && statusmac == "True")
                    {
                     //   ImageData.ImageUrl = "~/assets/img/p/1c.png";
                        switch (unitsize)
                        {
                            case "0":
                                ImageData.ImageUrl = "~/assets/img/p/0.png";
                                break;
                            case "1":
                                ImageData.ImageUrl = "~/assets/img/p/1c.png";
                                break;
                            case "2":
                                ImageData.ImageUrl = "~/assets/img/p/2c.png";
                                break;
                            case "3":
                                ImageData.ImageUrl = "~/assets/img/p/3c.png";
                                break;
                            case "4":
                                ImageData.ImageUrl = "~/assets/img/p/4c.png";
                                break;
                        }
                     }
                    else if ((Value == "ON" && statusmac == "False") || (Value == "OFF" && statusmac == "True"))
                    {
                        //((Label)e.Item.FindControl("Status" + (i + 1))).BackColor = System.Drawing.Color.Orange;
                        //((Label)e.Item.FindControl("Status" + (i + 1))).Text = "Unmatch";
                        switch (unitsize)
                        {
                            case "0":
                                ImageData.ImageUrl = "~/assets/img/p/0.png";
                                break;
                            case "1":
                                ImageData.ImageUrl = "~/assets/img/p/1d.png";
                                break;
                            case "2":
                                ImageData.ImageUrl = "~/assets/img/p/2d.png";
                                break;
                            case "3":
                                ImageData.ImageUrl = "~/assets/img/p/3d.png";
                                break;
                            case "4":
                                ImageData.ImageUrl = "~/assets/img/p/4d.png";
                                break;
                        }
                        // ImageData.ImageUrl = "~/assets/img/aD.png";
                    }
                            //((Label)e.Item.FindControl("Status" + (i + 1))).BackColor = System.Drawing.Color.LightGreen;
                            //((Label)e.Item.FindControl("Status" + (i + 1))).Text = "Match";
                           
                           /// ImageData.ImageUrl = "~/assets/img/aC.png";
                    else if (Value == "OFF" && statusmac == "False")
                        {
                           // ImageData.ImageUrl = "~/assets/img/p/1e.png";
                            switch (unitsize)
                            {
                                case "0":
                                    ImageData.ImageUrl = "~/assets/img/p/0.png";
                                    break;
                                case "1":
                                    ImageData.ImageUrl = "~/assets/img/p/1e.png";
                                    break;
                                case "2":
                                    ImageData.ImageUrl = "~/assets/img/p/2e.png";
                                    break;
                                case "3":
                                    ImageData.ImageUrl = "~/assets/img/p/3e.png";
                                    break;
                                case "4":
                                    ImageData.ImageUrl = "~/assets/img/p/4e.png";
                                    break;
                            }
                           
                            //ImageData.ImageUrl = "~/assets/img/aE.png";
                        }
                   
                   
                }
            }
        }
        catch (Exception ex)
        { }
    }
                    //try
                    //{
                    //    switch (statusmac)
                    //    {
                    //        case "Empty":
                    //            { ((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color.Yellow;
                    //             ((Label)e.Item.FindControl("macadress" + (i + 1))).Text ="Not Found";}
                    //            break;
                    //        case "True":
                    //            {((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color.LightGreen;
                    //            ((Label)e.Item.FindControl("macadress" + (i + 1))).Text = "Connect";
                    //            }
                    //            break;
                    //        case "False":
                    //            {((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color.Red;
                    //            ((Label)e.Item.FindControl("macadress" + (i + 1))).Text = "Disconnect";
                    //            }
                    //            break;
                    //    }
                        //if (s != "Empty")
                        //{
                        //    var ipinfo = IPInfo.GetIPInfo(s);
                        //    if (ipinfo == null)
                        //    {
                        //        ((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color.Yellow;
                        //    }
                        //    else
                        //    {
                        //        string r = (ipinfo.IPAddress).ToString();
                        //        bool ch = CheckIP(r);
                        //        if (ch)
                        //        {
                        //            ((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color.LightGreen;
                        //        }
                        //        else
                        //        {
                        //            ((Label)e.Item.FindControl("macadress" + (i + 1))).BackColor = System.Drawing.Color. ;
                        //        }
                        //    }
                        //}
                //    }
                //    catch (Exception ex) { }
                //}
             //   GetARPResult();
    //    }
        
    //}
    //    catch (Exception ex)
    //    {
    //        throw;
    //    }
    //}
    static public string ReturnResult(string value)
    {
        if (value == "0") return "ON";
        else if (value == "1") return "OFF";
        else return "NO status";
    }
    private KeyValuePair<string, string> FindStatus(int IDD, int TypeNumber)
    {
        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = @"SELECT Status,untiSize FROM tblDeviceIO where IDD=" + IDD + " and Type='D" + TypeNumber + "'";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    string status, unitsize;
                    status = sdr["Status"].ToString();
                    unitsize=sdr["untiSize"].ToString();
                    return new KeyValuePair<string, string>(status, unitsize);
                }

            }
        }
    }
    //static public string FindunitSize(int IDD, int TypeNumber)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand();
    //        using (SqlConnection con = new SqlConnection(strcon))
    //        {
    //            using (cmd = new SqlCommand())
    //            {
    //                cmd.CommandText = @"SELECT Status FROM tblDeviceIO d  where d.IDD=" + IDD + " and d.Type='D" + TypeNumber + "'";
    //                cmd.Connection = con;
    //                con.Open();
    //                using (SqlDataReader sdr = cmd.ExecuteReader())
    //                {
    //                    while (sdr.Read())
    //                    {
    //                        // CheckIP(sdr["IP"].ToString());
    //                        string s = sdr["Status"].ToString();
    //                        return s;
    //                    }
    //                }
    //            }
    //        }
    //    }
    //    catch (Exception ex) { }
    //    return "Empty";
    //}
    //static public string FindStatusMac(int IDD,int TypeNumber)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand();
    //        using (SqlConnection con = new SqlConnection(strcon))
    //        {
    //            using (cmd = new SqlCommand())
    //            {
    //                cmd.CommandText = @"SELECT Status FROM tblDeviceIO d  where d.IDD=" + IDD + " and d.Type='D" + TypeNumber + "'";
    //                cmd.Connection = con;
    //                con.Open();
    //                using (SqlDataReader sdr = cmd.ExecuteReader())
    //                {
    //                    while (sdr.Read())
    //                    {
    //                       // CheckIP(sdr["IP"].ToString());
    //                        string s = sdr["Status"].ToString();
    //                        return s;
    //                    }
    //                }
    //            }
    //        }
    //    }
    //    catch (Exception ex) { }
    //    return "Empty";
    //}


    //static public string MacAdress(int IDD, int TypeNumber)
    //{
    //    try
    //    {
    //        SqlCommand cmd = new SqlCommand();
    //        using (SqlConnection con = new SqlConnection(strcon))
    //        {
    //            using (cmd = new SqlCommand())
    //            {
    //                cmd.CommandText = @"SELECT MACAddress, IP FROM tblDeviceIO d  where d.IDD=" + IDD + " and d.Type='D" + TypeNumber + "'";
    //                cmd.Connection = con;
    //                con.Open();
    //                using (SqlDataReader sdr = cmd.ExecuteReader())
    //                {
    //                    while (sdr.Read())
    //                    {
    //                        CheckIP(sdr["IP"].ToString());
    //                        string s = sdr["MACAddress"].ToString();
    //                        return s;
    //                    }
    //                }
    //            }
    //        }
    //    }
    //    catch (Exception ex) { }
    //    return "Empty";
    //}
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        dlSample.DataSource = SqlDataSource1;
        dlSample.DataBind();
    }
    static public bool CheckIP(string IP)
    {
        Ping ping = new Ping();
        PingReply reply = ping.Send(IP);
        switch (reply.Status)
        {
            case IPStatus.Success:
                return true;
                break;
            default:
                return false;
                break;
        }
    }
    private static string GetARPResult()
    {
        Process p = null;
        string output = string.Empty;

        try
        {

            p = Process.Start(new ProcessStartInfo("arp", "-a")
            {
                CreateNoWindow = true,
                UseShellExecute = false,
                RedirectStandardOutput = true
            });

            output = p.StandardOutput.ReadToEnd();

            p.Close();
        }
        catch (Exception ex)
        {
            throw new Exception("IPInfo: Error Retrieving 'arp -a' Results", ex);
        }
        finally
        {
            if (p != null)
            {
                p.Close();
            }
        }

        return output;
    }
}