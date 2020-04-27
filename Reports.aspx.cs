using Stimulsoft.Report;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    static string EmailHost, EmailUsername, EmailPassword;
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
    protected void btnuserEnter_Click(object sender, EventArgs e)
    {

        pnlDateandButton.Visible = false;
        pnlusers.Visible = true;

    }
    protected void getEnterandExitreport_Click(object sender, EventArgs e)
    {
        if (this.GridSensor.FocusedRowIndex != -1)
        {
            object RFID = this.GridSensor.GetRowValues(this.GridSensor.FocusedRowIndex, "RFID");
            if (!(RFID is DBNull))
            {
                string from = CalFrom.SelectedDate.ToString();
                string[] f = from.Split('/');
                if (f[0].Length == 1) f[0] = "0" + f[0];
                if (f[1].Length == 1) f[1] = "0" + f[1];
                from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
                string to = CalTo.SelectedDate.ToString();
                string[] t = to.Split('/');
                if (t[0].Length == 1) t[0] = "0" + t[0];
                if (t[1].Length == 1) t[1] = "0" + t[1];
                to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

                pnlDateandButton.Visible = false;
                Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
                report1.Load((Server.MapPath("Stimulsoft/enter.mrt")));
                SqlConnection Conn = new SqlConnection(strcon);
                Conn.Open();
                SqlDataAdapter DA = new SqlDataAdapter();
                DA.SelectCommand = new SqlCommand();
                DA.SelectCommand.Connection = Conn;
                DA.SelectCommand.CommandType = CommandType.Text;
                DA.SelectCommand.CommandText = @"select  u.Name+'  '+u.lastName as name, NameD,date,time,statusdoor from tblDevice d inner join tblEntrance e on d.idD=e.iddevice inner join tblusers u 
            on u.RFID=e.rfid where e.rfid=@id and date>=@from and date<=@to";
                DA.SelectCommand.Parameters.AddWithValue("@id", RFID);
                DA.SelectCommand.Parameters.AddWithValue("@from", from);
                DA.SelectCommand.Parameters.AddWithValue("@to", to);
                DataTable dt = new DataTable("iSite");
                DA.Fill(dt);
                Conn.Close();
                DataSet dss = new DataSet();
                SqlDataAdapter DA2 = new SqlDataAdapter();
                DA2.SelectCommand = new SqlCommand();
                DA2.SelectCommand.Connection = Conn;
                DA2.SelectCommand.CommandType = CommandType.Text;
                DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
                DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
                DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
                DataTable dt2 = new DataTable("info");
                DA2.Fill(dt2);

                SqlDataAdapter DA3 = new SqlDataAdapter();
                DA3.SelectCommand = new SqlCommand();
                DA3.SelectCommand.Connection = Conn;
                DA3.SelectCommand.CommandType = CommandType.Text;
                DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
                DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
                DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
                DataTable dt3 = new DataTable("User");
                DA3.Fill(dt3);
                Conn.Close();




                dss.Tables.Add(dt.Copy());
                dss.Tables.Add(dt2.Copy());
                dss.Tables.Add(dt3.Copy());

                report1.RegData(dss);
                //dss.Tables.Add(dt.Copy());
                //report1.RegData(dss);
                report1.Compile();
                report1.Render();
                StiWebViewer1.Report = report1;
                pnlusers.Visible = false;
                pnlReport.Visible = true;

                //string pageurl = "Report2.aspx?id=" + RFID;
                //Response.Write("<script> window.open('" + pageurl + "','_blank'); </script>");
            }
        }
    }
    protected void btnAuthorized_Click(object sender, EventArgs e)
    {
        pnlDevice.Visible = true;
        pnlDateandButton.Visible = false;
        pnlReport.Visible = false;
        pnlusers.Visible = false;
        lbltype.Text = "A";
    }
    protected void btnunAuthorized_Click(object sender, EventArgs e)
    {
        pnlDevice.Visible = true;
        pnlDateandButton.Visible = false;
        pnlReport.Visible = false;
        pnlusers.Visible = false;
        lbltype.Text = "Un";
    }
    protected void btnreportDevice_Click(object sender, EventArgs e)
    {
        pnlDevice.Visible = false;
        object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idD");
        if (!(ID is DBNull))
        {

            Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
            //  report1.Load((Server.MapPath("Stimulsoft/test.mrt")));
            //             SqlConnection Conn = new SqlConnection(strcon);
            //             Conn.Open();
            //             SqlDataAdapter DA = new SqlDataAdapter();
            //             DA.SelectCommand = new SqlCommand();
            //             DA.SelectCommand.Connection = Conn;
            //             DA.SelectCommand.CommandType = CommandType.Text;
            //             DA.SelectCommand.CommandText = @"select CONVERT(VARCHAR(10), e.date, 103) as date ,u.Name,u.lastName,d.NameD,e.time,e.statusdoor from
            //        tblEntrance e inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on d.idD=e.iddevice
            //        where date>=10-11-2017
            //        ";
            //             //DA.SelectCommand.Parameters.AddWithValue("@id", x);
            //             DataTable dt = new DataTable("iSite");
            //             DA.Fill(dt);
            //             Conn.Close();
            //             DataSet dss = new DataSet();

            //             dss.Tables.Add(dt.Copy());
            //             report1.RegData(dss);
            //             report1.Compile();
            //             report1.Render();
            //             StiWebViewer1.Report = report1;


            SqlConnection Conn = new SqlConnection(strcon);
            Conn.Open();
            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = new SqlCommand();
            DA.SelectCommand.Connection = Conn;
            DA.SelectCommand.CommandType = CommandType.Text;
            if (lbltype.Text == "Un")
            {
                DA.SelectCommand.CommandText = @"select CONVERT(VARCHAR(10), e.date, 103) as date ,u.Name,u.lastName,d.NameD,e.time,e.statusdoor from
        tblEntrance e inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on d.idD=e.iddevice
        where date>=@from and date<=@to and statusdoor='Not allowed' and d.idD=" + ID;
                report1.Load((Server.MapPath("Stimulsoft/Runathurized.mrt")));
            }
            if (lbltype.Text == "A")
            {
                DA.SelectCommand.CommandText = @"select CONVERT(VARCHAR(10), e.date, 103) as date ,u.Name,u.lastName,d.NameD,e.time,e.statusdoor from
        tblEntrance e inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on d.idD=e.iddevice
        where date>=@from and date<=@to and (statusdoor='OPEN' or statusdoor='CLOSE') and d.idD=" + ID;
                report1.Load((Server.MapPath("Stimulsoft/Rathorized.mrt")));
            }
            string from = CalFrom.SelectedDate.ToString();
            string[] f = from.Split('/');
            if (f[0].Length == 1) f[0] = "0" + f[0];
            if (f[1].Length == 1) f[1] = "0" + f[1];
            from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
            string to = CalTo.SelectedDate.ToString();
            string[] t = to.Split('/');
            if (t[0].Length == 1) t[0] = "0" + t[0];
            if (t[1].Length == 1) t[1] = "0" + t[1];
            to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";
            DA.SelectCommand.Parameters.AddWithValue("@from", from);
            DA.SelectCommand.Parameters.AddWithValue("@to", to);
            DataTable dt = new DataTable("iSite");
            DA.Fill(dt);

            SqlDataAdapter DA2 = new SqlDataAdapter();
            DA2.SelectCommand = new SqlCommand();
            DA2.SelectCommand.Connection = Conn;
            DA2.SelectCommand.CommandType = CommandType.Text;
            DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
            DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
            DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
            DataTable dt2 = new DataTable("info");
            DA2.Fill(dt2);

            SqlDataAdapter DA3 = new SqlDataAdapter();
            DA3.SelectCommand = new SqlCommand();
            DA3.SelectCommand.Connection = Conn;
            DA3.SelectCommand.CommandType = CommandType.Text;
            DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
            DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
            DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
            DataTable dt3 = new DataTable("User");
            DA3.Fill(dt3);
            Conn.Close();
            // PersianDateConverter.ToPersianDate(DateTime.UtcNow);

            DataSet dss = new DataSet();

            dss.Tables.Add(dt.Copy());
            dss.Tables.Add(dt2.Copy());
            dss.Tables.Add(dt3.Copy());

            report1.RegData(dss);
            report1.Compile();

            report1.Render();
            StiWebViewer1.Report = report1;


            pnlReport.Visible = true;
        }
    }
    protected void btnenalbeitems_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/listitem.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select d.NameD,i.Name,i.Type,i.MACAddress from tblDevice d inner join
                                            tblDeviceIO i on d.idD=i.IDD where i.Enable=1 ";
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;

    }
    protected void btnListmac_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/listmac2.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select * from  tblLastData l inner join tblDeviceIO dio on l.IDD=dio.IDD 
                    inner join tblDevice d  on d.idD=dio.IDD where dio.MACAddress<>'' and dio.Type<>'SDCard'";
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
        //        pnlDateandButton.Visible = false;
        //        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        //        report1.Load((Server.MapPath("Stimulsoft/listmac.mrt")));
        //        SqlConnection Conn = new SqlConnection(strcon);
        //        Conn.Open();
        //        SqlDataAdapter DA = new SqlDataAdapter();
        //        DA.SelectCommand = new SqlCommand();
        //        DA.SelectCommand.Connection = Conn;
        //        DA.SelectCommand.CommandType = CommandType.Text;
        //        DA.SelectCommand.CommandText = @"select d.NameD,i.Name,i.Type,i.MACAddress,i.Enable from tblDevice d inner join tblDeviceIO i on d.idD=i.IDD
        //                                        where i.MACAddress is not null ";
        //        DataTable dt = new DataTable("iSite");
        //        DA.Fill(dt);

        //        SqlDataAdapter DA2 = new SqlDataAdapter();
        //        DA2.SelectCommand = new SqlCommand();
        //        DA2.SelectCommand.Connection = Conn;
        //        DA2.SelectCommand.CommandType = CommandType.Text;
        //        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        //        DataTable dt2 = new DataTable("info");
        //        DA2.Fill(dt2);

        //        SqlDataAdapter DA3 = new SqlDataAdapter();
        //        DA3.SelectCommand = new SqlCommand();
        //        DA3.SelectCommand.Connection = Conn;
        //        DA3.SelectCommand.CommandType = CommandType.Text;
        //        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        //        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        //        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        //        DataTable dt3 = new DataTable("User");
        //        DA3.Fill(dt3);
        //        Conn.Close();

        //        DataSet dss = new DataSet();

        //        dss.Tables.Add(dt.Copy());
        //        dss.Tables.Add(dt2.Copy());
        //        dss.Tables.Add(dt3.Copy());

        //        report1.RegData(dss);
        //        report1.Compile();

        //        report1.Render();
        //        StiWebViewer1.Report = report1;


        //        pnlReport.Visible = true;

    }
    protected void btnMoveDone_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/MoveDone.mrt")));
        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, 'Azad' as NameD,(u.Name +' ' + u.lastName) as fullnameRemover,cr.MACAddress, cr.Date as RemoveDate,cr.Time as RemoveTime,
(u2.Name +' ' + u2.lastName) as fullnamePlacer
, (SELECT NameD FROM tblDevice WHERE (idD = cr.IDDest)) AS Destenation
  ,cr2.Date as PlaceDate, cr2.Time as PlaceTime
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblEntrance e inner join tblChangeReq cr on e.iddevice=cr.IDD 
inner join tblChangeReq cr2 on cr2.IDD=cr.IDDest 
 inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on e.iddevice=d.idD 
 inner join tblDeviceIO di on (di.IDD=d.idD and di.Type=cr.digitals)
 inner join tblEntrance e2 on e2.iddevice=cr2.IDD  inner join tblusers u2 on e2.rfid=u2.RFID
  where e.statusdoor='OPEN' and cr2.Done=1 and cr.Done=1 and e2.statusdoor='OPEN' and
				 ((cr.DateStart=cr.DateFinish and cr.DateStart=e.date and
				   cast(e.time as Time) between cr.TimeStart and cr.TimeFinish)
				   or
				(cr.DateStart=e.date and cr.DateFinish>e.date and 
				   cast(e.time as time) >= cr.TimeStart )
					or  
				(cr.DateStart<e.date and cr.DateFinish=e.date and 
				  cast(e.time as time) <= cr.TimeFinish )
				  or
				(cr.DateStart<e.date and cr.DateFinish>e.date ))
				and
					 ((cr2.DateStart=cr2.DateFinish and cr2.DateStart=e2.date and
				   cast(e2.time as Time) between cr2.TimeStart and cr2.TimeFinish)
				   or
				(cr2.DateStart=e2.date and cr2.DateFinish>e2.date and 
				   cast(e2.time as time) >= cr2.TimeStart )
					or  
				(cr2.DateStart<e2.date and cr2.DateFinish=e2.date and 
				  cast(e2.time as time) <= cr2.TimeFinish )
				  or
				(cr2.DateStart<e2.date and cr2.DateFinish>e.date ))
                and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;

    }
    protected void BtnunsucSource_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";
        report1.Load((Server.MapPath("Stimulsoft/unsucReplaceSource.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, (u.Name +' ' + u.lastName) as fullnameRemover,cr.MACAddress, cr.Date as RemoveDate,cr.Time as RemoveTime,'Azad' as NameD
, (SELECT NameD FROM tblDevice WHERE (idD = cr.IDDest)) AS Destenation
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblEntrance e inner join tblChangeReq cr on e.iddevice=cr.IDD 
inner join tblChangeReq cr2 on cr2.IDD=cr.IDDest 
 inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on e.iddevice=d.idD 
 inner join tblDeviceIO di on (di.IDD=d.idD and di.Type=cr.digitals)
  where e.statusdoor='OPEN' and cr2.Done=0 and cr.Done=1 and
				 ((cr.DateStart=cr.DateFinish and cr.DateStart=e.date and
				   cast(e.time as Time) between cr.TimeStart and cr.TimeFinish)
				   or
				(cr.DateStart=e.date and cr.DateFinish>e.date and 
				   cast(e.time as time) >= cr.TimeStart )
					or  
				(cr.DateStart<e.date and cr.DateFinish=e.date and 
				  cast(e.time as time) <= cr.TimeFinish )
				  or
				(cr.DateStart<e.date and cr.DateFinish>e.date ))  and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void Btnunsuc_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";
        report1.Load((Server.MapPath("Stimulsoft/unsucReplace.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, cr.MACAddress,'Azad' as NameD
, (SELECT NameD FROM tblDevice WHERE (idD = cr.IDDest)) AS Destenation
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblChangeReq cr inner join tblChangeReq cr2 on cr2.IDD=cr.IDDest 
  where  cr2.Done=0 and cr.Done=0  and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to); ;
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void BtnAlarms_Click(object sender, EventArgs e)
    {

        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        pnlDateandButton.Visible = false;
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;


        report1.Load((Server.MapPath("Stimulsoft/alarms.mrt")));

        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        DA.SelectCommand.CommandText = @"select * from tblLogData l inner join tblDevice d on d.idD=l.IDD 
where l.Alarm=1 and Date>=@from and Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
        DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
        DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();


        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;





        //try
        //{
        //      using (SqlConnection con = new SqlConnection(strcon))
        //{
        //    using (SqlCommand cmd = new SqlCommand())
        //    {
        //        cmd.CommandText = "select Top 1 * from tblMaininfo";
        //        cmd.Connection = con;
        //        con.Open();
        //        using (SqlDataReader sdr = cmd.ExecuteReader())
        //        {
        //            while (sdr.Read())
        //            {
        //                int TimeToCheck = Convert.ToInt32(sdr["TimeToCheck"]);
        //                int TimeToSaveInfo = Convert.ToInt32(sdr["TimeToSaveInfo"]);
        //                int TimeToAlarm = Convert.ToInt32(sdr["TimeToAlarm"]);
        //                TimeToSaveInfo = TimeToSaveInfo * 60 * 1000 / TimeToCheck;
        //                EmailHost=sdr["EmailHost"].ToString();
        //                EmailUsername=sdr["EmailUsername"].ToString();
        //                EmailPassword=sdr["EmailPassword"].ToString();
        //            }
        //        }
        //    }
        //    con.Close();
        //}

        //    SmtpClient client = new SmtpClient(EmailHost);
        //    client.Timeout = 10000;
        //    client.UseDefaultCredentials = false;
        //    client.Credentials = new System.Net.NetworkCredential(EmailUsername, EmailPassword);
        //    MailMessage mm = new MailMessage(EmailUsername, "azadeh.yousefim@gmail.com", "Report", "");
        //    MemoryStream ms = new MemoryStream();
        //    report1.ExportDocument(StiExportFormat.Pdf, ms);
        //    ms.Seek(0, SeekOrigin.Begin);
        //    System.Net.Mail.Attachment attachment = new System.Net.Mail.Attachment(ms, "Receipt.pdf", "application/pdf");
        //    mm.Attachments.Add(attachment);
        //    mm.BodyEncoding = UTF8Encoding.UTF8;
        //    mm.IsBodyHtml = true;
        //    mm.DeliveryNotificationOptions = DeliveryNotificationOptions.OnFailure;
        //    client.Send(mm);

        //    //MailMessage message = new MailMessage();
        //    //message2.To = "abc@domain.com";
        //    //message.From = "xyz@domain.com";
        //    //message.Subject = "mail with pdf";
        //    //message.Body = "your pdf attached";
        //    //message.Attachments.Add(new Attachment(@"c:\pdftoattach.pdf"));

        //    //SmtpMail.SmtpServer = "mail.domain.com";
        //    //SmtpMail.Send(message);
        //}
        //catch (Exception ex)
        //{
        //}

    }
    protected void Button1_Click(object sender, EventArgs e)
    {


    }
    protected void BtnConMAc_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/listmac2.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select * from  tblLastData l inner join tblDeviceIO dio on l.IDD=dio.IDD 
                                        inner join tblDevice d  on d.idD=dio.IDD where dio.MACAddress<>''";
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void btnRemove_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/remove.mrt")));

        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, 'Azad' as NameD,(u.Name +' ' + u.lastName) as fullnamePlacer,cr.MACAddress, cr.Date as PlaceDate,cr.Time as PlaceTime
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblEntrance e inner join tblChangeReq cr on e.iddevice=cr.IDD 
 inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on e.iddevice=d.idD 
  where e.statusdoor='OPEN' and cr.Issue='Remove' and
				 ((cr.DateStart=cr.DateFinish and cr.DateStart=e.date and
				   cast(e.time as Time) between cr.TimeStart and cr.TimeFinish)
				   or
				(cr.DateStart=e.date and cr.DateFinish>e.date and 
				   cast(e.time as time) >= cr.TimeStart )
					or  
				(cr.DateStart<e.date and cr.DateFinish=e.date and 
				  cast(e.time as time) <= cr.TimeFinish )
				  or
				(cr.DateStart<e.date and cr.DateFinish>e.date )) 
                and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
        DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
        DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/add.mrt")));

        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, 'Azad' as NameD,(u.Name +' ' + u.lastName) as fullnamePlacer,cr.MACAddress, cr.Date as PlaceDate,cr.Time as PlaceTime
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblEntrance e inner join tblChangeReq cr on e.iddevice=cr.IDD 
 inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on e.iddevice=d.idD 
  where e.statusdoor='OPEN' and cr.Issue='Add' and
				 ((cr.DateStart=cr.DateFinish and cr.DateStart=e.date and
				   cast(e.time as Time) between cr.TimeStart and cr.TimeFinish)
				   or
				(cr.DateStart=e.date and cr.DateFinish>e.date and 
				   cast(e.time as time) >= cr.TimeStart )
					or  
				(cr.DateStart<e.date and cr.DateFinish=e.date and 
				  cast(e.time as time) <= cr.TimeFinish )
				  or
				(cr.DateStart<e.date and cr.DateFinish>e.date )) 
                and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
        DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
        DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void BtncleanUp_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/cleanup.mrt")));

        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select DISTINCT cr.ID, 'Azad' as NameD,(u.Name +' ' + u.lastName) as fullnamePlacer,cr.MACAddress, cr.Date as PlaceDate,cr.Time as PlaceTime
, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDD)) AS Source
 from tblEntrance e inner join tblChangeReq cr on e.iddevice=cr.IDD 
 inner join tblusers u on e.rfid=u.RFID inner join tblDevice d on e.iddevice=d.idD 
  where e.statusdoor='OPEN' and cr.Issue='Clean up' and
				 ((cr.DateStart=cr.DateFinish and cr.DateStart=e.date and
				   cast(e.time as Time) between cr.TimeStart and cr.TimeFinish)
				   or
				(cr.DateStart=e.date and cr.DateFinish>e.date and 
				   cast(e.time as time) >= cr.TimeStart )
					or  
				(cr.DateStart<e.date and cr.DateFinish=e.date and 
				  cast(e.time as time) <= cr.TimeFinish )
				  or
				(cr.DateStart<e.date and cr.DateFinish>e.date )) 
                and cr.Date>=@from and cr.Date<=@to";
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
        DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
        DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;

    }
    protected void btnListOfinvertory_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/listinvertory.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select * from  tblLastData l inner join tblDeviceIO dio on l.IDD=dio.IDD 
 inner join tblDevice d  on d.idD=dio.IDD where dio.MACAddress<>'' and dio.Type<>'SDCard'";
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);

        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select Name from tblMaininfo";
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();

        DataSet dss = new DataSet();

        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        report1.Compile();

        report1.Render();
        StiWebViewer1.Report = report1;


        pnlReport.Visible = true;
    }
    protected void btnreportschedule_Click(object sender, EventArgs e)
    {
        Response.Redirect("ReportSchadule.aspx");
    }
    protected void btnEnterExit_Click(object sender, EventArgs e)
    {
        pnlDateandButton.Visible = false;
        string from = CalFrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = CalTo.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";

        pnlDateandButton.Visible = false;
        Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
        report1.Load((Server.MapPath("Stimulsoft/azad.mrt")));
        SqlConnection Conn = new SqlConnection(strcon);
        Conn.Open();
        SqlDataAdapter DA = new SqlDataAdapter();
        DA.SelectCommand = new SqlCommand();
        DA.SelectCommand.Connection = Conn;
        DA.SelectCommand.CommandType = CommandType.Text;
        DA.SelectCommand.CommandText = @"select  u.Name+'  '+u.lastName as name, NameD,date,time,statusdoor from tblDevice d inner join tblEntrance e on d.idD=e.iddevice inner join tblusers u 
            on u.RFID=e.rfid where date>=@from and date<=@to";
        //DA.SelectCommand.Parameters.AddWithValue("@id", RFID);
        DA.SelectCommand.Parameters.AddWithValue("@from", from);
        DA.SelectCommand.Parameters.AddWithValue("@to", to);
        DataTable dt = new DataTable("iSite");
        DA.Fill(dt);
        Conn.Close();
        DataSet dss = new DataSet();
        SqlDataAdapter DA2 = new SqlDataAdapter();
        DA2.SelectCommand = new SqlCommand();
        DA2.SelectCommand.Connection = Conn;
        DA2.SelectCommand.CommandType = CommandType.Text;
        DA2.SelectCommand.CommandText = @"select @fromd as fromd, @tod as tod, Name from tblMaininfo";
        DA2.SelectCommand.Parameters.AddWithValue("@fromd", from.Substring(0, 10));
        DA2.SelectCommand.Parameters.AddWithValue("@tod", to.Substring(0, 10));
        DataTable dt2 = new DataTable("info");
        DA2.Fill(dt2);

        SqlDataAdapter DA3 = new SqlDataAdapter();
        DA3.SelectCommand = new SqlCommand();
        DA3.SelectCommand.Connection = Conn;
        DA3.SelectCommand.CommandType = CommandType.Text;
        DA3.SelectCommand.CommandText = @"select Name,lastName,@date as Date from tblusers where username=@username";
        DA3.SelectCommand.Parameters.AddWithValue("@username", Session["username"].ToString());
        DA3.SelectCommand.Parameters.AddWithValue("@Date", DateTime.Now.ToString());
        DataTable dt3 = new DataTable("User");
        DA3.Fill(dt3);
        Conn.Close();




        dss.Tables.Add(dt.Copy());
        dss.Tables.Add(dt2.Copy());
        dss.Tables.Add(dt3.Copy());

        report1.RegData(dss);
        //dss.Tables.Add(dt.Copy());
        //report1.RegData(dss);
        report1.Compile();
        report1.Render();
        StiWebViewer1.Report = report1;
        //pnlusers.Visible = false;
        pnlReport.Visible = true;
    }
}