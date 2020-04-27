using DevExpress.Export;
using DevExpress.XtraPrinting;
using Microsoft.AspNet.SignalR.Messaging;
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

public partial class Device : System.Web.UI.Page
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
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        gridExport.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
    }
    protected void btnword_Click(object sender, EventArgs e)
    {
        gridExport.WritePdfToResponse();
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
            object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idD");
            lblDid.Text = ID.ToString();
            int id = Convert.ToInt32(ID);
            if (e.ButtonID.Equals("sensor"))
            {
                try
                {
                   string sql = "select * from tblDeviceIO where idD=" + ID;
                    SqlDataAdapter adapter = new SqlDataAdapter(sql, strcon);
                    DataTable data2 = new DataTable();
                    adapter.Fill(data2);
                    if (data2.Rows.Count <= 0)
                    {
                       
                  
                    }
                    else
                    {
                        string a, b;
                        var pair = printAnalogMinMax("A1", id);
                        a = pair.Key; b = pair.Value;
                        txta1min.Text = a; txta1max.Text = b;

                        pair = printAnalogMinMax("A2", id);
                        a = pair.Key; b = pair.Value;
                        txta2min.Text = a; txta2max.Text = b;

                        pair = printAnalogMinMax("A3", id);
                        a = pair.Key; b = pair.Value;
                        txta3min.Text = a; txta3max.Text = b;

                        pair = printAnalogMinMax("A4", id);
                        a = pair.Key; b = pair.Value;
                        txta4min.Text = a; txta4max.Text = b;

                        pair = printAnalogMinMax("InternalTemp", id);
                        a = pair.Key; b = pair.Value;
                        txtinternalmin.Text = a; txtinternalmax.Text = b;
                    }

                    pnlDeviceIO.Visible = true;
                    pnldevice.Visible = false;
                }
                catch(Exception ex)
                {
                   
                }
              
            }
        }
    }
    private bool insertTotblLastData(int ID)
    {
        string _query = @"INSERT INTO [tblLastData] (IDD,LastResult) values (@IDD,'**********;0;0;0;0;8888888888888888888888888;99;00:00:00;2018-1-29;0;') ";
                                                                                 
        using (SqlConnection conn = new SqlConnection(strcon))
        {
            using (SqlCommand comm = new SqlCommand())
            {
                comm.Connection = conn;
                comm.CommandText = _query;
                comm.CommandText = _query;
                comm.Parameters.AddWithValue("@IDD", ID);
                try
                {
                    conn.Open();
                    comm.ExecuteNonQuery();
                    comm.Parameters.Clear();
                    return true;
                }
                catch (SqlException ex)
                {
                    return false;
                }

            }
        }
    }
    private bool insertTotblAlarm(string Type, int ID)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblAlarm] (Type, Checking, IDD) values (@Type, @Checking, @IDD)";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@Type", Type);
                    comm.Parameters.AddWithValue("@Checking", false);
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
   private string printDigitalInput(string DINumber, int ID)
    {

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = @"SELECT Exist FROM tblDigitalInput where IDD=" + ID + " and DINumber='" + DINumber + "'";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    return sdr["Exist"].ToString();
                }
              
            }
        }
    }
   private KeyValuePair<string, string> printAnalogMinMax(string AINumber, int ID)
   {
       try
       {
           using (SqlConnection con = new SqlConnection(strcon))
           {
               using (SqlCommand cmd = new SqlCommand())
               {//update [gozaresh2G] set t=@Pic where ID2g
                   cmd.CommandText = @"SELECT MIN,MAX FROM tblAnalogMinMax where IDD=" + ID + " and AINumber='" + AINumber + "'";
                   cmd.Connection = con;
                   con.Open();
                   using (SqlDataReader sdr = cmd.ExecuteReader())
                   {
                       sdr.Read();
                       return new KeyValuePair<string, string>(sdr["MIN"].ToString(),
                           sdr["MAX"].ToString());
                   }

               }
           }
       }
       catch (Exception ex) { }
       return new KeyValuePair<string, string>("-1", "100");
   }
    private KeyValuePair<string, string> printoutput(string OutputNumber, int ID)
    {

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = @"SELECT ONchar,OFFchar FROM tblOutput where IDD=" + ID + " and OutputNumber='" + OutputNumber + "'";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    return new KeyValuePair<string, string>(sdr["ONchar"].ToString(),
                        sdr["OFFchar"].ToString());
                }
               
            }
        }
    }
    private  string ErorocheckToboxes(string chbx, int ID)
    {

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = @"SELECT Checking FROM tblAlarm where IDD=" + ID + " and Type='" + chbx + "'";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    return sdr["Checking"].ToString();
                }

            }
        }
    }
    private KeyValuePair<string, string> checkToboxes(string chbx, int ID)
    {

        using (SqlConnection con = new SqlConnection(strcon))
        {
            using (SqlCommand cmd = new SqlCommand())
            {//update [gozaresh2G] set t=@Pic where ID2g
                cmd.CommandText = @"SELECT Checking,Name FROM tblDeviceIO where IDD="+ID+ " and Type='" +chbx+"'";
                cmd.Connection = con;
                con.Open();
                using (SqlDataReader sdr = cmd.ExecuteReader())
                {
                    sdr.Read();
                    return new KeyValuePair<string, string>(sdr["Checking"].ToString(), sdr["Name"].ToString());
                }
                
            }
        }
    }
    private bool insertTotbltblAnalogMinMax(int ID,string AINumber,double Min, double Max)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblAnalogMinMax] (AINumber, IDD,MIN,MAX) 
                            values (@AINumber, @IDD,@MIN,@MAX) ";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@AINumber", AINumber);
                    comm.Parameters.AddWithValue("@IDD", ID);
                    comm.Parameters.AddWithValue("@MIN", Min);
                    comm.Parameters.AddWithValue("@MAX", Max);
                    conn.Open();
                    comm.ExecuteNonQuery();
                    conn.Close();
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    private bool insertTotblOutput(string OutputNumber, int ID, string ONchar, string OFFchar)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblOutput] (OutputNumber, IDD, ONchar, OFFchar) 
                            values (@OutputNumber, @IDD, @ONchar, @OFFchar) ";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@OutputNumber", OutputNumber);
                    comm.Parameters.AddWithValue("@IDD", ID);
                    comm.Parameters.AddWithValue("@ONchar", ONchar);
                    comm.Parameters.AddWithValue("@OFFchar", OFFchar);
                    conn.Open();
                    comm.ExecuteNonQuery();
                    conn.Close();
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
    private bool insertTotblDigitalInput(string DefaultTime, int ID, string DInumber)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblDigitalInput] (Exist, IDD, DINumber) 
                            values (@Exist, @IDD, @DINumber)";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@Exist", DefaultTime);
                    comm.Parameters.AddWithValue("@IDD", ID);
                    comm.Parameters.AddWithValue("@DINumber", DInumber);
                    conn.Open();
                    comm.ExecuteNonQuery();
                    conn.Close();
                }
            }
            return true;
        }
        catch (Exception ex)
        {
            return false;
        }
    }
//    private bool insertTotblAnalogInput(string DefaultTime, int ID, string AInumber)
//    {
//        try
//        {
//            SqlConnection conn;
//            SqlCommand comm;
//            string _query;
//            _query = @"INSERT INTO [tblAnalogInput] (DefaultTime, IDD, AINumber) 
//                            values (@DefaultTime, @IDD, @AINumber)";
//            using (conn = new SqlConnection(strcon))
//            {
//                using (comm = new SqlCommand())
//                {
//                    comm.Connection = conn;
//                    comm.CommandText = _query;
//                    comm.Parameters.AddWithValue("@DefaultTime", DefaultTime);
//                    comm.Parameters.AddWithValue("@IDD", ID);
//                    comm.Parameters.AddWithValue("@AINumber", AInumber);
//                    conn.Open();
//                    comm.ExecuteNonQuery();
//                    conn.Close();
//                }
//            }
//            return true;
//        }
//        catch (Exception ex)
//        {
//            return false;
//        }
//    }
    private void ShowPopUpMsg(string msg)
    {
        StringBuilder sb = new StringBuilder();
        sb.Append("alert('");
        sb.Append(msg.Replace("\n", "\\n").Replace("\r", "").Replace("'", "\\'"));
        sb.Append("');");
        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "showalert", sb.ToString(), true);
    }
    //protected void SqlDataSource2_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    //{
    //    if (e.Command.Parameters["Type"].Value.ToString() == "")
    //    {

    //    }
    //    //if(sender.)
    //}
    //protected void btnSave_Click(object sender, EventArgs e)
    //{
    //    int idD=Convert.ToInt32(lblDid.Text);
    //    try
    //    {
    //        if (RFID.SelectedValue == "True")
    //        { updateDBIO(1, idD, "RFID", "RFID"); }
    //        else
    //        { updateDBIO(0, idD, "RFID", "RFID"); }

    //        if (SDCard.SelectedValue == "True")
    //        { updateDBIO(1, idD, "SDCard", "SDCard"); }
    //        else
    //        { updateDBIO(0, idD, "SDCard", "SDCard"); }

    //        if (InternalTemp.SelectedValue == "True")
    //        { updateDBIO(1, idD, "InternalTemp", "InternalTemp"); } //updateDBAnalogI(5, idD, txtinternaltempT.Text); }
    //        else
    //        { updateDBIO(0, idD, "InternalTemp", "InternalTemp"); } //updateDBAnalogI(5, idD, txtinternaltempT.Text); }
    //        if (A1.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtAI1.Text, "A1");
    //      //  updateDBAnalogI(1, idD, txtai1t.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtAI1.Text, "A1");
    //      //  updateDBAnalogI(1, idD, txtai1t.Text);
    //        }
         
    //        if (A2.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtAI2.Text, "A2");
    //       // updateDBAnalogI(2, idD, txtai2t.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtAI2.Text, "A2");
    //      //  updateDBAnalogI(2, idD, txtai2t.Text);
    //        }
           
    //        if (A3.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtAI3.Text, "A3");
    //     //   updateDBAnalogI(3, idD, txtai3t.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtAI3.Text, "A3");
    //   //     updateDBAnalogI(3, idD, txtai3t.Text);
    //        }
          
    //        if (A4.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtAI4.Text, "A4");
    //     //   updateDBAnalogI(4, idD, txtai4t.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtAI4.Text, "A4");
    //    //    updateDBAnalogI(4, idD, txtai4t.Text);
    //        }
       
    //        if (O1.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtOut1.Text, "O1");
    //        updateDBOut(1, idD, 1+txton1.Text, 1+txtoff1.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtOut1.Text, "O1");
    //        updateDBOut(1, idD, 1 + txton1.Text, 1 + txtoff1.Text);
    //        }
                    
    //        if (O2.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtOut2.Text, "O2");
    //        updateDBOut(2, idD, 2+txton2.Text, 2+txtoff2.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtOut2.Text, "O2");
    //        updateDBOut(2, idD, 2 + txton2.Text, 2 + txtoff2.Text);
    //        }
          
    //        if (O3.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtout3.Text, "O3");
    //        updateDBOut(3, idD, 3+txton3.Text, 3+txtoff3.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtout3.Text, "O3");
    //        updateDBOut(3, idD, 3 + txton3.Text, 3 + txtoff3.Text);
    //        }
           
    //        if (O4.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtout4.Text, "O4");
    //        updateDBOut(4, idD, 4+txton4.Text, 4+txtoff4.Text);
    //        }
    //        else
    //        { updateDBIO(0, idD, txtout4.Text, "O4");
    //        updateDBOut(4, idD, 4 + txton4.Text, 4 + txtoff4.Text);
    //        }
           
    //        if (D1.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi1.Text, "D1");updateDBDigitalI(1, idD, txtdv1.Text);}
    //        else
    //        { updateDBIO(0, idD, txtdi1.Text, "D1");updateDBDigitalI(1, idD, txtdv1.Text);}
        
    //        if (D2.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi2.Text, "D2");updateDBDigitalI(2, idD, txtdv2.Text);}
    //        else
    //        { updateDBIO(0, idD, txtdi2.Text, "D2");updateDBDigitalI(2, idD, txtdv2.Text);}
           
    //        if (D3.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi3.Text, "D3"); updateDBDigitalI(3, idD, txtdv3.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi3.Text, "D3"); updateDBDigitalI(3, idD, txtdv3.Text); }
           
    //        if (D4.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi4.Text, "D4"); updateDBDigitalI(4, idD, txtdv4.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi4.Text, "D4"); updateDBDigitalI(4, idD, txtdv4.Text); }
          

    //        if (D5.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi5.Text, "D5"); updateDBDigitalI(5, idD, txtdv5.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi5.Text, "D5"); updateDBDigitalI(5, idD, txtdv5.Text); }
           
    //        if (D6.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi6.Text, "D6"); updateDBDigitalI(6, idD, txtdv6.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi6.Text, "D6"); updateDBDigitalI(6, idD, txtdv6.Text); }
          
    //        if (D7.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi7.Text, "D7"); updateDBDigitalI(7, idD, txtdv7.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi7.Text, "D7"); updateDBDigitalI(7, idD, txtdv7.Text); }
           
    //        if (D8.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi8.Text, "D8"); updateDBDigitalI(8, idD, txtdv8.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi8.Text, "D8"); updateDBDigitalI(8, idD, txtdv8.Text); }
            
    //        if (D9.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi9.Text, "D9"); updateDBDigitalI(9, idD, txtdv9.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi9.Text, "D9"); updateDBDigitalI(9, idD, txtdv9.Text); }
           
    //        if (D10.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi10.Text, "D10"); updateDBDigitalI(10, idD, txtdv10.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi10.Text, "D10"); updateDBDigitalI(10, idD, txtdv10.Text); }

    //        if (D11.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi11.Text, "D11"); updateDBDigitalI(11, idD, txtdv11.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi11.Text, "D11"); updateDBDigitalI(11, idD, txtdv11.Text); }

    //        if (D12.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi12.Text, "D12"); updateDBDigitalI(12, idD, txtdv12.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi12.Text, "D12"); updateDBDigitalI(12, idD, txtdv12.Text); }

    //        if (D13.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi13.Text, "D13"); updateDBDigitalI(13, idD, txtdv13.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi13.Text, "D13"); updateDBDigitalI(13, idD, txtdv13.Text); }

    //        if (D14.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi14.Text, "D14"); updateDBDigitalI(14, idD, txtdv14.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi14.Text, "D14"); updateDBDigitalI(14, idD, txtdv14.Text); }

    //        if (D15.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi15.Text, "D15"); updateDBDigitalI(15, idD, txtdv15.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi15.Text, "D15"); updateDBDigitalI(15, idD, txtdv15.Text); }

    //        if (D16.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi16.Text, "D16"); updateDBDigitalI(16, idD, txtdv16.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi16.Text, "D16"); updateDBDigitalI(16, idD, txtdv16.Text); }

    //        if (D17.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi17.Text, "D17"); updateDBDigitalI(17, idD, txtdv17.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi17.Text, "D17"); updateDBDigitalI(17, idD, txtdv17.Text); }

    //        if (D18.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi18.Text, "D18"); updateDBDigitalI(18, idD, txtdv18.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi18.Text, "D18"); updateDBDigitalI(18, idD, txtdv18.Text); }

    //        if (D19.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi19.Text, "D19"); updateDBDigitalI(19, idD, txtdv19.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi19.Text, "D19"); updateDBDigitalI(19, idD, txtdv19.Text); }

    //        if (D20.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi20.Text, "D20"); updateDBDigitalI(20, idD, txtdv20.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi20.Text, "D20"); updateDBDigitalI(20, idD, txtdv20.Text); }

    //        if (D21.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi21.Text, "D21"); updateDBDigitalI(21, idD, txtdv21.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi21.Text, "D21"); updateDBDigitalI(21, idD, txtdv21.Text); }

    //        if (D22.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi22.Text, "D22"); updateDBDigitalI(22, idD, txtdv22.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi22.Text, "D22"); updateDBDigitalI(22, idD, txtdv22.Text); }

    //        if (D23.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi23.Text, "D23"); updateDBDigitalI(23, idD, txtdv23.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi23.Text, "D23"); updateDBDigitalI(23, idD, txtdv23.Text); }

    //        if (D24.SelectedValue == "True")
    //        { updateDBIO(1, idD, txtdi24.Text, "D24"); updateDBDigitalI(24, idD, txtdv24.Text); }
    //        else
    //        { updateDBIO(0, idD, txtdi24.Text, "D24"); updateDBDigitalI(24, idD, txtdv24.Text); }
            
    //    }
    //    catch (Exception ex)
    //    {

    //    }
     
    //}
    private bool insertToDeviceIO(string Type, int ID)
    {
        try
        {
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            _query = @"INSERT INTO [tblDeviceIO] (Name, Type, IDD) values (@Name, @Type, @IDD)";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@Name", "");
                    comm.Parameters.AddWithValue("@Type", Type);
                    comm.Parameters.AddWithValue("@IDD", ID);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
    private bool updateDBIO(int Checking,int idD, string Name, string Type)
    {
          SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblDeviceIO set Checking=@Checking, Name=@Name where IDD=@IDD and Type=@Type";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", idD);
                    comm.Parameters.AddWithValue("@Name", Name);
                    comm.Parameters.AddWithValue("@Type", Type);
                    comm.Parameters.AddWithValue("@Checking", Checking);
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
            return true;
        }
        catch(Exception ex)
        {
            return false;
        }
    }
    //private bool updateDBAnalogI(int AINumber, int idD, string DefaultTime)
    //{
    //    SqlConnection conn;
    //    SqlCommand comm;
    //    string _query;
    //    try
    //    {
    //        _query = @"update tblAnalogInput set DefaultTime=@DefaultTime where IDD=@IDD and AINumber=@AINumber";
    //        using (conn = new SqlConnection(strcon))
    //        {
    //            using (comm = new SqlCommand())
    //            {
    //                comm.Connection = conn;
    //                comm.CommandText = _query;
    //                comm.Parameters.AddWithValue("@IDD", idD);
    //                comm.Parameters.AddWithValue("@DefaultTime", DefaultTime);
    //                comm.Parameters.AddWithValue("@AINumber", AINumber);
    //                conn.Open();
    //                comm.ExecuteNonQuery();
    //            }
    //        }
    //        return true;
    //    }
    //    catch (Exception ex)
    //    {
    //        return false;
    //    }
    //}
    private bool updateDBDigitalI(int DINumber, int idD, string Exist)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblDigitalInput set Exist=@Exist where IDD=@IDD and DINumber=@DINumber";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", idD);
                    comm.Parameters.AddWithValue("@Exist", Exist);
                    comm.Parameters.AddWithValue("@DINumber", DINumber);
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
    private bool updateDBOut(int output, int idD, string ONchar, string OFFchar)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblOutput set ONchar=@ONchar, OFFchar=@OFFchar where IDD=@IDD and OutputNumber=@OutputNumber";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", idD);
                    comm.Parameters.AddWithValue("@ONchar", ONchar);
                    comm.Parameters.AddWithValue("@OFFchar", OFFchar);
                    comm.Parameters.AddWithValue("@OutputNumber", output);
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
    protected void SqlDataSource1_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
          if (this.griddevice.FocusedRowIndex != -1)
        {
                object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idD");
            int id = Convert.ToInt32(ID);
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"delete from tblDeviceIO where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
                _query = @"delete from tblLastData where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
                _query = @"delete from tblOutput where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
                _query = @"delete from tblDigitalInput where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
                _query = @"delete from tblAlarm where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }

                _query = @"delete from tblAnalogMinMax where IDD=@IDD";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@IDD", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex) { }
        }
        
    }
    private bool updateDBAlarm(int Checking, int idD, string Type)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblAlarm set Checking=@Checking where IDD=@IDD and Type=@Type";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", idD);
                    comm.Parameters.AddWithValue("@Type", Type);
                    comm.Parameters.AddWithValue("@Checking", Checking);
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
    //protected void btnSaveAlarm_Click(object sender, EventArgs e)
    //{
    //    int idD = Convert.ToInt32(lblDid.Text);
    //    try
    //    {
    //        if (ERFID.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "RFID"); }
    //        else
    //        { updateDBAlarm(0, idD, "RFID"); }

    //        if (ESDCARD.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "SDCard"); }
    //        else
    //        { updateDBAlarm(0, idD, "SDCard"); }

    //        if (EInternalTemp.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "InternalTemp"); updateAMinMax("InternalTemp", idD, txtITmin.Text, txtITmax.Text);} 
    //        else
    //        { updateDBAlarm(0, idD, "InternalTemp"); updateAMinMax("InternalTemp", idD, txtITmin.Text, txtITmax.Text); } 
    //        if (EA1.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "A1"); updateAMinMax("1", idD, txta1min.Text, txta1max.Text); } 
    //        else
    //        { updateDBAlarm(0, idD, "A1"); updateAMinMax("1", idD, txta1min.Text, txta1max.Text); } 
    //        if (EA2.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "A2"); updateAMinMax("2", idD, txta2min.Text, txta2max.Text); }
    //        else
    //        { updateDBAlarm(0, idD, "A2"); updateAMinMax("2", idD, txta2min.Text, txta2max.Text); }
    //        if (EA3.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "A3"); updateAMinMax("3", idD, txta3min.Text, txta3max.Text); }
    //        else
    //        { updateDBAlarm(0, idD, "A3"); updateAMinMax("3", idD, txta3min.Text, txta3max.Text); }
    //        if (EA4.SelectedValue == "True")
    //        {updateDBAlarm(1, idD, "A4"); updateAMinMax("4", idD, txta4min.Text, txta4max.Text);}
    //        else
    //        { updateDBAlarm(0, idD, "A4"); updateAMinMax("4", idD, txta4min.Text, txta4max.Text); }
           
    //        if (ED1.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D1");  }
    //        else
    //        { updateDBAlarm(0, idD, "D1");  }

    //        if (ED2.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D2");  }
    //        else
    //        { updateDBAlarm(0, idD, "D2");  }

    //        if (ED3.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D3");  }
    //        else
    //        { updateDBAlarm(0, idD, "D3");  }

    //        if (ED4.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D4"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D4");}


    //        if (ED5.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D5"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D5");  }

    //        if (ED6.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D6");}
    //        else
    //        { updateDBAlarm(0, idD, "D6"); }

    //        if (ED7.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D7"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D7");  }

    //        if (ED8.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D8");  }
    //        else
    //        { updateDBAlarm(0, idD, "D8");  }

    //        if (ED9.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D9"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D9");}

    //        if (ED10.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D10"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D10"); }

    //        if (ED11.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D11");  }
    //        else
    //        { updateDBAlarm(0, idD, "D11"); }

    //        if (ED12.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D12"); }
    //        else
    //        { updateDBAlarm(0, idD, "D12"); }

    //        if (ED13.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D13"); }
    //        else
    //        { updateDBAlarm(0, idD, "D13");  }

    //        if (ED14.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D14"); }
    //        else
    //        { updateDBAlarm(0, idD, "D14");  }

    //        if (ED15.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D15");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D15");  }

    //        if (ED16.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D16");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D16");  }

    //        if (ED17.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D17"); }
    //        else
    //        { updateDBAlarm(0, idD,  "D17"); }

    //        if (ED18.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D18");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D18"); }

    //        if (ED19.SelectedValue == "True")
    //        { updateDBAlarm(1, idD, "D19");}
    //        else
    //        { updateDBAlarm(0, idD,  "D19");  }

    //        if (ED20.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D20");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D20");  }

    //        if (ED21.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D21");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D21");  }

    //        if (ED22.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D22");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D22");  }

    //        if (ED23.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D23");  }
    //        else
    //        { updateDBAlarm(0, idD,  "D23"); }

    //        if (ED24.SelectedValue == "True")
    //        { updateDBAlarm(1, idD,  "D24");  }
    //        else
    //        { updateDBAlarm(0, idD, "D24"); }

    //    }
    //    catch (Exception ex)
    //    {

    //    }
    //}
    private bool updateAMinMax(string AINumber, int idD, string MIN, string MAX)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblAnalogMinMax set MIN=@MIN, MAX=@MAX where IDD=@IDD and AINumber=@AINumber";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", idD);
                    comm.Parameters.AddWithValue("@MIN", MIN);
                    comm.Parameters.AddWithValue("@MAX", MAX);
                    comm.Parameters.AddWithValue("@AINumber", AINumber);
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
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int id = Convert.ToInt32(lblDid.Text);
        updateAMinMax("A1", id, txta1min.Text, txta1max.Text);
        updateAMinMax("A2", id, txta2min.Text, txta2max.Text);
        updateAMinMax("A3", id, txta3min.Text, txta3max.Text);
        updateAMinMax("A4", id, txta4min.Text, txta4max.Text);
        updateAMinMax("InternalTemp", id, txtinternalmin.Text, txtinternalmax.Text);
    }
    protected void btnSaveAll_Click(object sender, EventArgs e)
    {
        SqlConnection conn;
        SqlCommand comm;
        string _query;
        try
        {
            _query = @"update tblMaininfo set changed=1";
            using (conn = new SqlConnection(strcon))
            {
                using (comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandText = _query;
                    conn.Open();
                    comm.ExecuteNonQuery();
                }
            }
        }
        catch (Exception ex)
        {
        }
    }
    protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        try
        {
           
            int id = Convert.ToInt32(e.Command.Parameters["@NewProductID"].Value);
          //  int id = (int)e.Command.Parameters["@idD"].Value;
            insertToDeviceIO("RFID", id); insertToDeviceIO("InternalTemp", id);
            insertToDeviceIO("SDCard", id); insertToDeviceIO("A1", id);
            insertToDeviceIO("A2", id); insertToDeviceIO("A3", id); insertToDeviceIO("A4", id);
            insertToDeviceIO("D1", id);
            insertToDeviceIO("D2", id); insertToDeviceIO("D3", id); insertToDeviceIO("D4", id);
            insertToDeviceIO("D5", id); insertToDeviceIO("D6", id); insertToDeviceIO("D7", id);
            insertToDeviceIO("D8", id); insertToDeviceIO("D9", id); insertToDeviceIO("D10", id);
            insertToDeviceIO("D11", id); insertToDeviceIO("D12", id); insertToDeviceIO("D13", id);
            insertToDeviceIO("D14", id); insertToDeviceIO("D15", id); insertToDeviceIO("D16", id);
            insertToDeviceIO("D17", id); insertToDeviceIO("D18", id); insertToDeviceIO("D19", id);
            insertToDeviceIO("D20", id); insertToDeviceIO("D21", id); insertToDeviceIO("D22", id);
            insertToDeviceIO("D23", id); insertToDeviceIO("D24", id);

            insertTotblOutput("1", id, "1o", "1f"); insertTotblOutput("2", id, "2o", "2f");
            insertTotblOutput("3", id, "3o", "3f"); insertTotblOutput("4", id, "4o", "4f");

            insertTotbltblAnalogMinMax(id, "A1", -1, 100); insertTotbltblAnalogMinMax(id, "A2", -1, 100);
            insertTotbltblAnalogMinMax(id, "A3", -1, 100); insertTotbltblAnalogMinMax(id, "A4", -1, 100);
            insertTotbltblAnalogMinMax(id, "InternalTemp", -1, 100);

            insertTotblLastData(id);

        }
        catch (SqlException ex)
        {

        }
    }

    protected void sds_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        e.Command.Parameters["@Status"].Value = "False";
        //if (e.Command.Parameters["@Type"].Value.ToString() == "RFID")
        //{
        //    if (e.Command.Parameters["@Exist"].Value.ToString() == "True")
        //    {

        //    }
        //}
     //   string s = sds.UpdateParameters["Exist"].Exist.ToString();
       //if( e.Command.Parameters["@Exist"].Value.ToString()=="True")
       //{
       //    e.Command.Parameters["@Status"].Value = "False";
       //    e.Command.Parameters["@Status"].Value = "False";
       //}
       //else
       //{

       //    if (!(e.Command.Parameters["@MACAddress"].Value == null))
       //    {
       //        if (e.Command.Parameters["@MACAddress"].Value.ToString() == "" || e.Command.Parameters["@MACAddress"].Value.ToString() == null)
       //            e.Command.Parameters["@Status"].Value = "False";
       //        else
       //            e.Command.Parameters["@Status"].Value = "True";
       //    }
       //    else
       //    {
       //        e.Command.Parameters["@Status"].Value = "False";
       //    }
          
       //}
      //  string s = e.Command.Parameters["Exist"].Value.ToString();
        //if (e.Command.Parameters["Exist"].Value.ToString() == "0")
        // {

        // }
    }
    protected void SqlDataSource1_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        try
        {

            int id = Convert.ToInt32(e.Command.Parameters["@NewProductID"].Value);
            //  int id = (int)e.Command.Parameters["@idD"].Value;
            insertToDeviceIO("RFID", id); insertToDeviceIO("InternalTemp", id);
            insertToDeviceIO("SDCard", id); insertToDeviceIO("A1", id);
            insertToDeviceIO("A2", id); insertToDeviceIO("A3", id); insertToDeviceIO("A4", id);
            insertToDeviceIO("D1", id);
            insertToDeviceIO("D2", id); insertToDeviceIO("D3", id); insertToDeviceIO("D4", id);
            insertToDeviceIO("D5", id); insertToDeviceIO("D6", id); insertToDeviceIO("D7", id);
            insertToDeviceIO("D8", id); insertToDeviceIO("D9", id); insertToDeviceIO("D10", id);
            insertToDeviceIO("D11", id); insertToDeviceIO("D12", id); insertToDeviceIO("D13", id);
            insertToDeviceIO("D14", id); insertToDeviceIO("D15", id); insertToDeviceIO("D16", id);
            insertToDeviceIO("D17", id); insertToDeviceIO("D18", id); insertToDeviceIO("D19", id);
            insertToDeviceIO("D20", id); insertToDeviceIO("D21", id); insertToDeviceIO("D22", id);
            insertToDeviceIO("D23", id); insertToDeviceIO("D24", id);

            insertTotblOutput("1", id, "1o", "1f"); insertTotblOutput("2", id, "2o", "2f");
            insertTotblOutput("3", id, "3o", "3f"); insertTotblOutput("4", id, "4o", "4f");

            insertTotbltblAnalogMinMax(id, "A1", -1, 100); insertTotbltblAnalogMinMax(id, "A2", -1, 100);
            insertTotbltblAnalogMinMax(id, "A3", -1, 100); insertTotbltblAnalogMinMax(id, "A4", -1, 100);
            insertTotbltblAnalogMinMax(id, "InternalTemp", -1, 100);

            insertTotblLastData(id);

        }
        catch (SqlException ex)
        {

        }
    }
}




