using DevExpress.Export;
using DevExpress.XtraCharts;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sensorstatus : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        lbliddevice.Text = "2";
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
        }
        else
        {
            string x = Request.QueryString["id"];
            if (x != null)
            {
               // lbliddevice.Text = x;
                 lbliddevice.Text = "2";
                //Response.Write("   id detected");
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    protected void gridDS_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridDS.FocusedRowIndex != -1)
        {
            object ID = this.gridDS.GetRowValues(this.gridDS.FocusedRowIndex, "idds");
            if (e.ButtonID.Equals("chart"))
            {
                string chRT = this.gridDS.GetRowValues(this.gridDS.FocusedRowIndex, "chart").ToString();
                lblsensor.Text = ID.ToString();
                gridDS.DataBind();
                pnlchart.Visible = true;
                pnlds.Visible = false;
                pnlsensorh.Visible = true;
                pnlsensorsshow.Visible = false;
                WebChartControl3.DataSourceID = "SqlDataSource1";
                WebChartControl3.SeriesDataMember = "idDevice";
                WebChartControl3.SeriesTemplate.ArgumentDataMember = "Date";
                WebChartControl3.SeriesTemplate.ValueDataMembers.AddRange(new string[] { "Mount" });
                switch (chRT)
                {
                    case "line":
                        WebChartControl3.SeriesTemplate.View = new LineSeriesView();
                        break;
                    case "area":
                        WebChartControl3.SeriesTemplate.View = new AreaSeriesView();
                        break;
                    case "side":
                         WebChartControl3.SeriesTemplate.View = new SideBySideBarSeriesView();
                        break;
                    default:
                        WebChartControl3.SeriesTemplate.View = new SideBySideBarSeriesView();
                        break;
                }
           
                WebChartControl3.SeriesTemplate.LabelsVisibility = DevExpress.Utils.DefaultBoolean.True;
                WebChartControl3.SeriesTemplate.View.Color = Color.Orange;
                //WebChartControl3.SeriesTemplate.Legend = new Legend();
                WebChartControl3.DataBind();
            }
            else if (e.ButtonID.Equals("erase"))
            {
               
                SqlConnection con = new SqlConnection(strcon);
                String st = "UPDATE tblStatusSensorDevice SET alarm='' WHERE alarm='yes'";

                SqlCommand sqlcom = new SqlCommand(st, con);
                try
                {
                    con.Open();
                    sqlcom.ExecuteNonQuery();
                    con.Close();
                    gridDS.DataBind();
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
    protected void btnback_Click(object sender, EventArgs e)
    {
        pnlchart.Visible = false;
        pnlds.Visible = true;
        pnlsensorh.Visible = false;
        pnlsensorsshow.Visible = true;
    }
    protected void btnExcel_Click(object sender, EventArgs e)
    {
       // gridExport.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
    }
    protected void btnword_Click(object sender, EventArgs e)
    {
       // gridExport.WritePdfToResponse();
    }
}