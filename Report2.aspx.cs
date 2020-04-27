using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Report2 : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        string x = Request.QueryString["id"];
        if (x != null)
        {
            Stimulsoft.Report.StiReport report1 = new Stimulsoft.Report.StiReport();
            report1.Load((Server.MapPath("azad.mrt")));
            SqlConnection Conn = new SqlConnection(strcon);
            Conn.Open();
            SqlDataAdapter DA = new SqlDataAdapter();
            DA.SelectCommand = new SqlCommand();
            DA.SelectCommand.Connection = Conn;
            DA.SelectCommand.CommandType = CommandType.Text;
            DA.SelectCommand.CommandText = @"select  u.Name+'  '+u.lastName as name, NameD,date,time,statusdoor from tblDevice d inner join tblEntrance e on d.idD=e.iddevice inner join tblusers u 
            on u.RFID=e.rfid where e.rfid=@id";
            DA.SelectCommand.Parameters.AddWithValue("@id", x);
            DataTable dt = new DataTable("iSite");
            DA.Fill(dt);
            Conn.Close();
            DataSet dss = new DataSet();

            dss.Tables.Add(dt.Copy());
            report1.RegData(dss);
            report1.Compile();
            report1.Render();
            StiWebViewer1.Report = report1;
            // lbliddevice.Text = "2";
            //Response.Write("   id detected");
        }
        else
        {
            Response.Redirect("Default.aspx");
        }
    }
  
}