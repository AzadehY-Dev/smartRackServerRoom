using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Sockets;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text.RegularExpressions;
using System.Net.Mail;
using System.Text;

public partial class Default2 : System.Web.UI.Page
{
    static string ds2;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
       
    }
     protected void Button1_Click(object sender, EventArgs e)
    {
        //string s = this.ASPxHtmlEditor1.Html;
        string EmailMessage, SMSMessage;
        //string[] SResult = Temp.data.Split(';');
        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                cmd.CommandText = @"select d.NameD, d.lat, d.long, d.IP, EMessage, Subject, SMessage,
                                u.Name+ ' ' +u.lastName AS FullName,
		                        u.Cell, u.Email, a.Type, a.IDD , dg.AnnouncingType
		                        from tblDeviceGroup dg inner join tblGroup g on dg.IDGroup=g.ID left join tblEmail e 
		                        on e.IDGroup=g.ID left join tblSMS s on s.IDGroup=g.ID left join tblUsersGroups ug 
		                        on ug.IDg=g.ID left join tblusers u
		                        on u.idUser=ug.IDu left join tblDeviceIO a on dg.IDDevice=a.IDD inner join tblDevice d on 
		                        a.IDD=d.idD where a.Type=@Type 
                                and dg.IDDevice=@IDD";
                cmd.Connection = con;
                con.Open();
                cmd.Parameters.AddWithValue("@Type", "RFID");
                cmd.Parameters.AddWithValue("@IDD", 32);
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    while (sdr.Read())
                    {
                        if (sdr["AnnouncingType"].ToString() == "ES")
                        {

                            EmailMessage = sdr["EMessage"].ToString();
                            EmailMessage = EmailMessage.Replace("%DeviceName%", sdr["NameD"].ToString());
                            EmailMessage = EmailMessage.Replace("%Name%", sdr["FullName"].ToString());

                            SMSMessage = sdr["SMessage"].ToString();
                            SMSMessage = SMSMessage.Replace("%DeviceName%", sdr["NameD"].ToString());
                            SMSMessage = SMSMessage.Replace("%Name%", sdr["FullName"].ToString());

                            SendEmail(sdr["Email"].ToString(), sdr["Subject"].ToString(), EmailMessage);
                            SendSMS(sdr["Cell"].ToString(), SMSMessage);
                        }
                        else if (sdr["AnnouncingType"].ToString() == "SMS")
                        {
                            SMSMessage = sdr["SMessage"].ToString();
                            SMSMessage = SMSMessage.Replace("%DeviceName%", sdr["NameD"].ToString());
                            SMSMessage = SMSMessage.Replace("%Name%", sdr["FullName"].ToString());
                            SendSMS(sdr["Cell"].ToString(), SMSMessage);
                        }
                        else if (sdr["AnnouncingType"].ToString() == "Email")
                        {

                            EmailMessage = sdr["EMessage"].ToString();
                            EmailMessage = EmailMessage.Replace("%DeviceName%", sdr["NameD"].ToString());
                            EmailMessage = EmailMessage.Replace("%Name%", sdr["FullName"].ToString());
                            SendEmail(sdr["Email"].ToString(), sdr["Subject"].ToString(), EmailMessage);
                        }
                    }
                }
            }
            con.Close();
        }
    }
      private static void SendSMS(string ToNumber, string smsText)
        {
           WebService.Send sms = new WebService.Send();
        string returnValue = sms.SendSimpleSMS2("9354188516", "2641", ToNumber, "50001060008959 ", smsText, true);

            //SMSService.SendSoapClient sms = new SMSService.SendSoapClient();
            //sms.SendSimpleSMS2(MainInfos.SMSUsername, MainInfos.SMSPassword,
            //    ToNumber, MainInfos.SMSNumber, smsText, true);

        }
        private static void SendEmail(string to, string subject, string body)
        {
            try
            {
                SmtpClient client = new SmtpClient("mail.westpowerco.ir");
                //client.Port = 25;
                //client.Host = "mail.westpowerco.ir";
                //client.EnableSsl = true;
                client.Timeout = 10000;
                //client.DeliveryMethod = SmtpDeliveryMethod.Network;
                client.UseDefaultCredentials = false;
                client.Credentials = new System.Net.NetworkCredential("a.yousefi@westpowerco.ir", "a.y20213");
                MailMessage mm = new MailMessage("a.yousefi@westpowerco.ir", to, subject, body);
                mm.BodyEncoding = UTF8Encoding.UTF8;
                mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
                client.Send(mm);
            }
            catch (Exception ex)
            {
                //ShowPopUpMsg(ex.ToString());
            }
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            WebService.Send sms = new WebService.Send();
            string returnValue = sms.SendSimpleSMS2("9354188516", "2641", "09902609901", "50001060008959 ", "test2", true);

        }
}