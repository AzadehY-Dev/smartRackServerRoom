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

public partial class ChangeReq : System.Web.UI.Page
{
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       // label1.Visible = true;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      ///  label2.Visible = true;
    }
    protected void gridCRs_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.gridCRs.FocusedRowIndex != -1)
        {
            object ID = this.gridCRs.GetRowValues(this.gridCRs.FocusedRowIndex, "id");
            lblcrid.Text = ID.ToString();
          //  int id = Convert.ToInt32(ID);
            if (e.ButtonID.Equals("users"))
            {
                pnlManageCR.Visible = false;
                pnlusers.Visible = true;
            }
        }
    }
    protected void griddevice_CustomButtonCallback(object sender, DevExpress.Web.ASPxGridViewCustomButtonCallbackEventArgs e)
    {
        if (this.griddevice.FocusedRowIndex != -1)
        {
            object ID = this.griddevice.GetRowValues(this.griddevice.FocusedRowIndex, "idD");
            lblID.Text = ID.ToString();
            int id = Convert.ToInt32(ID);
            if (e.ButtonID.Equals("CR"))
            {
                try
                {
                    pnldevice.Visible = false;
                    pnlcr.Visible = true;
                    pnlManageCR.Visible = false;
                    pnlDonecr.Visible = false;
                    //string sql = "select * from tblDeviceIO ";
                }
                catch(Exception ex)
                {

                }
            }
            if (e.ButtonID.Equals("ListCR"))
            {
                try
                {
                    pnldevice.Visible = false;
                    pnlManageCR.Visible = true;
                    pnlDonecr.Visible = false;
                    pnlcr.Visible = false;
                    //string sql = "select * from tblDeviceIO ";
                }
                catch (Exception ex)
                {

                }
            }
            if (e.ButtonID.Equals("ListDCR"))
            {
                try
                {
                    pnldevice.Visible = false;
                    pnlDonecr.Visible = true;
                    pnlManageCR.Visible = false;
                    pnlcr.Visible = false;
                    //string sql = "select * from tblDeviceIO ";
                }
                catch (Exception ex)
                {

                }
            } 
        }
    }
    protected void cmbissue_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (cmbissue.SelectedItem.Text == "Clean up")
        {
            pnlDeviceIO.Visible = false;
           
        }
        else
        {
            pnlDeviceIO.Visible = true;
        }
        if (cmbissue.SelectedItem.Text == "Move")
        {
            pnlDevice2.Visible = true;
            pnlNameofdevice.Visible = true;
            pnlMac.Visible = false;
        }
        else if(cmbissue.SelectedItem.Text == "Add")
        {
            pnlMac.Visible = true;
            pnlNameofdevice.Visible = true;
        }
        else
        {
            pnlMac.Visible = false;
            pnlDevice2.Visible = false;
            pnlNameofdevice.Visible = false;
            txtmacAddress.Text = "";
            txtName.Text = "";
        }
    }
    protected void btnreg_Click(object sender, EventArgs e)
    {
        bool flagtoinsert1 = false;
        bool flagtoinsert2 = false;
        string from = calfrom.SelectedDate.ToString();
        string[] f = from.Split('/');
        if (f[0].Length == 1) f[0] = "0" + f[0];
        if (f[1].Length == 1) f[1] = "0" + f[1];
        from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
        string to = calto.SelectedDate.ToString();
        string[] t = to.Split('/');
        if (t[0].Length == 1) t[0] = "0" + t[0];
        if (t[1].Length == 1) t[1] = "0" + t[1];
        to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";
      
        try
        {
            string starttime = ddpsHour.SelectedItem.ToString() + ":" + ddpsminutes.SelectedItem.ToString();
            string endtime = ddpEhour.SelectedItem.ToString() + ":" + ddpEMinutes.SelectedItem.ToString();
            int IDuser = Convert.ToInt32(this.gridusers.GetRowValues(this.gridusers.FocusedRowIndex, "idUser"));
            string _query;
            _query = @"select * from tblChangeReq cr inner join tblCrUser u on cr.id=u.idCr where(('" + from + @"'< DateStart and '" + to + @"'> DateFinish) or ('" + from + @"' between DateStart and DateFinish) or ('" + to + @"' between DateStart and DateFinish) or ('" + from + @"'=DateStart and '" + starttime + @"' >=TimeStart and DateFinish<>'" + to + "') or ('" + to +@"'=DateFinish and '" + endtime + @"' <=TimeFinish and DateStart<>'" + from + "') or ( ('" + to + "'='" + from + "' and DateStart=DateFinish and DateStart='" + to + @"') and (('" + starttime + @"' between TimeStart and TimeFinish) or ('" + endtime + @"' between TimeStart and TimeFinish)or ('" + starttime + @"'< TimeStart and '" + endtime + @"'> TimeFinish)) ))and (IDD=" + lblID.Text +@") and (u.idUser<>" + IDuser + @")";
            using (SqlConnection con = new SqlConnection(strcon))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = _query;
                    //cmd.Parameters.AddWithValue("@startDate", from);
                    //cmd.Parameters.AddWithValue("@EndDate", to);
                    //cmd.Parameters.AddWithValue("@startTime", ddpsHour.SelectedItem.ToString() + ":" + ddpsminutes.SelectedItem.ToString());
                    //cmd.Parameters.AddWithValue("@endTime", ddpEhour.SelectedItem.ToString() + ":" + ddpEMinutes.SelectedItem.ToString());
                    //cmd.Parameters.AddWithValue("@IDD", lblID.Text);
                    //cmd.Parameters.AddWithValue("@idUser", IDuser);
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read()) flagtoinsert1 = false;
                        else flagtoinsert1 = true;
                    }
                }
            }
            if(cmbissue.SelectedItem.Text == "Move")
            {
                IDuser = Convert.ToInt32(this.gridusers2.GetRowValues(this.gridusers2.FocusedRowIndex, "idUser"));
                string starttime2 = ddp2shour.SelectedItem.ToString() + ":" + ddp2sMin.SelectedItem.ToString();
                string endtime2 = ddp2Ehour.SelectedItem.ToString() + ":" + ddp2Emin.SelectedItem.ToString();
                int IDuser2 = Convert.ToInt32(this.gridusers2.GetRowValues(this.gridusers2.FocusedRowIndex, "idUser"));
                string from2 = calfrom2.SelectedDate.ToString();
                string[] f2 = from2.Split('/');
                if (f2[0].Length == 1) f2[0] = "0" + f2[0];
                if (f2[1].Length == 1) f2[1] = "0" + f2[1];
                from2 = f2[2].Substring(0, 4) + "-" + f2[0] + "-" + f2[1] + " 00:00:00.000";
                string to2 = calto2.SelectedDate.ToString();
                string[] t2 = to2.Split('/');
                if (t2[0].Length == 1) t2[0] = "0" + t2[0];
                if (t2[1].Length == 1) t2[1] = "0" + t2[1];
                to2 = t2[2].Substring(0, 4) + "-" + t2[0] + "-" + t2[1] + " 00:00:00.000";
                object IDdevice = this.gridDevice2.GetRowValues(this.gridDevice2.FocusedRowIndex, "idD");
                _query = @"select * from tblChangeReq cr inner join tblCrUser u on cr.id=u.idCr where(('" + from2 + @"'< DateStart and '" + to2 + @"'> DateFinish) or ('" + from2 + @"' between DateStart and DateFinish) or ('" + to2 + @"' between DateStart and DateFinish) or ('" + from2 + @"'=DateStart and '" + starttime2 + @"' >=TimeStart and DateFinish<>'" + to2 + "') or ('" + to2 + @"'=DateFinish and '" + endtime2 + @"' <=TimeFinish and DateStart<>'" + from2 + "') or ( ('" + to2 + "'='" + from2 + "' and DateStart=DateFinish and DateStart='" + to2 + @"') and (('" + starttime2 + @"' between TimeStart and TimeFinish) or ('" + endtime2 + @"' between TimeStart and TimeFinish)or ('" + starttime2 + @"'< TimeStart and '" + endtime2 + @"'> TimeFinish)) ))and (IDD=" + IDdevice + @") and (u.idUser<>" + IDuser2 + @")";
            
                using (SqlConnection con = new SqlConnection(strcon))
                {
                    using (SqlCommand cmd = new SqlCommand())
                    {
                        cmd.CommandText = _query;
                        //cmd.Parameters.AddWithValue("@startDate", from2);
                        //cmd.Parameters.AddWithValue("@EndDate", to2);
                        //cmd.Parameters.AddWithValue("@startTime", ddp2shour.SelectedItem.ToString()+ ":" + ddp2sMin.SelectedItem.ToString());
                        //cmd.Parameters.AddWithValue("@endTime", ddp2Ehour.SelectedItem.ToString()+ ":" + ddp2Emin.SelectedItem.ToString());
                        //cmd.Parameters.AddWithValue("@IDD", ID);
                        //cmd.Parameters.AddWithValue("@idUser", IDuser);
                        cmd.Connection = con;
                        con.Open();
                        using (SqlDataReader sdr = cmd.ExecuteReader())
                        {
                            if (sdr.Read()) flagtoinsert2 = false;
                            else flagtoinsert2 = true;
                        }
                    }
                }
            }

        }
        catch (Exception ex)
        {
        }
        if (!(cmbissue.SelectedItem.Text == "Move") && flagtoinsert1)
         {
            //string digitals = "";
            //int ii = gridDeviceIO.GetSelectedFieldValues(gridDeviceIO.KeyFieldName).Count;
            //string digitalType;
            //List<Object> selectItemsD = gridDeviceIO.GetSelectedFieldValues("Type");
            //foreach (object selectItemType in selectItemsD)
            //{
            //    digitalType = selectItemType.ToString();
            //    digitals = digitals + digitalType.ToString() + ",";
            //}
            //gridDeviceIO.GetSelectedFieldValues(gridDeviceIO.KeyFieldName);

            string digitals = "";
            string MACAddress = "";
            int IDdigit = 0;
            if (this.gridDeviceIO.FocusedRowIndex != -1)
            {
                 digitals = this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "Type").ToString();
                 MACAddress = this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "MACAddress").ToString();
                 IDdigit = Convert.ToInt32(this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "ID"));
            }
            string _query = @"INSERT INTO [dbo].[tblChangeReq]
    (IDD,TimeStart,TimeFinish,DateStart,DateFinish,Issue,digitals,MACAddress, Name)
         VALUES
               (@IDD,@TimeStart,@TimeFinish,@DateStart,@DateFinish,@Issue,@digitals,@MACAddress, @Name); SELECT SCOPE_IDENTITY();";
            string insertedID = "";
            using (SqlConnection conn = new SqlConnection(strcon))
            {
                using (SqlCommand comm = new SqlCommand())
                {
                    comm.Connection = conn;
                    comm.CommandType = CommandType.Text;
                    comm.CommandText = _query;
                    comm.Parameters.AddWithValue("@IDD", lblID.Text);
                    comm.Parameters.AddWithValue("@TimeStart", ddpsHour.SelectedItem.ToString()
                        + ":" + ddpsminutes.SelectedItem.ToString());
                    comm.Parameters.AddWithValue("@TimeFinish", ddpEhour.SelectedItem.ToString()
                        + ":" + ddpEMinutes.SelectedItem.ToString());
                    comm.Parameters.AddWithValue("@DateStart", from);
                    comm.Parameters.AddWithValue("@DateFinish", to);
                    comm.Parameters.AddWithValue("@Issue", cmbissue.SelectedItem.Text);
                    comm.Parameters.AddWithValue("@digitals", digitals);
                    string Name = "";
                    if (cmbissue.SelectedItem.Text == "Add")
                    {
                        MACAddress = txtmacAddress.Text;
                        Name = txtName.Text;
                    }
                    comm.Parameters.AddWithValue("@MACAddress", MACAddress);
                    comm.Parameters.AddWithValue("@Name", Name);
                 
                    try
                    {
                        conn.Open();
                        insertedID = comm.ExecuteScalar().ToString();
                    
                       // comm.ExecuteNonQuery();

                        //ShowPopUpMsg("Group(s) added to the device!" + "\r\n");
                        //pnlGroups.Visible = true;
                        //pnlAddGroup.Visible = false;
                        //gridselectedGroup.DataBind();
                    }
                    catch (SqlException ex)
                    {
                      //  ShowPopUpMsg(ex.ToString());
                    }
                }
                if (this.gridDeviceIO.FocusedRowIndex != -1)
                {
                    _query = @"update tblDeviceIO set Checking=1 where ID=@ID";
                    using (SqlConnection con = new SqlConnection(strcon))
                    {
                        using (SqlCommand comm = new SqlCommand())
                        {
                            comm.Connection = con;
                            comm.CommandText = _query;
                            comm.Parameters.AddWithValue("@ID", IDdigit);
                            con.Open();
                            comm.ExecuteNonQuery();
                        }
                    }
                }
                if (this.gridusers.FocusedRowIndex != -1)
                {
                    string query = "INSERT INTO tblCrUser" +
                          " (idCr, idUser)" +
                          " VALUES (@idCr, @idUser);";
                    int IDuser = Convert.ToInt32(this.gridusers.GetRowValues(this.gridusers.FocusedRowIndex, "idUser"));
                    using (var dbconn = new SqlConnection(strcon))
                    using (var dbcm = new SqlCommand(query, dbconn))
                    {

                        dbcm.Parameters.AddWithValue("@idCr", insertedID);
                        dbcm.Parameters.AddWithValue("@idUser", IDuser);

                        dbconn.Open();
                        dbcm.ExecuteNonQuery();
                    }
                }
             
                //string users = "";
                //int i = gridusers.GetSelectedFieldValues(gridusers.KeyFieldName).Count;
                //int id;
                //List<Object> selectItems = gridusers.GetSelectedFieldValues("idUser");
                //foreach (object selectItemId in selectItems)
                //{
                //    id = Convert.ToInt32(selectItemId);
                //    //users = users + id.ToString() + ",";
                //    string query = "INSERT INTO tblCrUser" +
                //                     " (idCr, idUser)" +
                //                     " VALUES (@idCr, @idUser);";

                //    using (var dbconn = new SqlConnection(strcon))
                //    using (var dbcm = new SqlCommand(query, dbconn))
                //    {

                //        dbcm.Parameters.AddWithValue("@idCr", insertedID);
                //        dbcm.Parameters.AddWithValue("@idUser", id);

                //        dbconn.Open();
                //        dbcm.ExecuteNonQuery();
                //    }
                //}
                //gridusers.GetSelectedFieldValues(gridusers.KeyFieldName);
            }
            ShowPopUpMsg("The CR submitted successfully");
         }
        else if (cmbissue.SelectedItem.Text == "Move" && flagtoinsert1 && flagtoinsert2)
        {
            if (this.gridDevice2.FocusedRowIndex != -1)
            {
                object ID = this.gridDevice2.GetRowValues(this.gridDevice2.FocusedRowIndex, "idD");
                bool doit = false;
                bool Checking = false;
                string digitals = "";
                string MACAddress = "";
                string digitals2;
                int ID1 = 0;
                int ID2 = 0;
                if (this.gridDeviceIO.FocusedRowIndex != -1)
                {
                    digitals = this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "Type").ToString();
                    MACAddress = this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "MACAddress").ToString();
                    ID1 = Convert.ToInt32(this.gridDeviceIO.GetRowValues(this.gridDeviceIO.FocusedRowIndex, "ID"));
                    if (this.griddigital2.FocusedRowIndex != -1)
                    {
                        Checking = Convert.ToBoolean(this.griddigital2.GetRowValues(this.griddigital2.FocusedRowIndex, "Checking"));
                        ID2 = Convert.ToInt32(this.griddigital2.GetRowValues(this.griddigital2.FocusedRowIndex, "ID"));
                        if (Checking == true)
                        {
                            ShowPopUpMsg("You should select an empty unit for move!");
                        }
                        else
                        {
                            digitals2 = this.griddigital2.GetRowValues(this.griddigital2.FocusedRowIndex, "Type").ToString();
                            string _query = @"INSERT INTO [dbo].[tblChangeReq]
    (IDD,TimeStart,TimeFinish,DateStart,DateFinish,Issue,digitals,MACAddress,IDDest)
         VALUES
               (@IDD,@TimeStart,@TimeFinish,@DateStart,@DateFinish,@Issue,@digitals,@MACAddress,@IDDest); SELECT SCOPE_IDENTITY();";
                            string insertedID = "";
                            using (SqlConnection conn = new SqlConnection(strcon))
                            {
                                using (SqlCommand comm = new SqlCommand())
                                {
                                    comm.Connection = conn;
                                    comm.CommandType = CommandType.Text;
                                    comm.CommandText = _query;
                                    comm.Parameters.AddWithValue("@IDD", lblID.Text);
                                    comm.Parameters.AddWithValue("@TimeStart", ddpsHour.SelectedItem.ToString()
                                        + ":" + ddpsminutes.SelectedItem.ToString());
                                    comm.Parameters.AddWithValue("@TimeFinish", ddpEhour.SelectedItem.ToString()
                                        + ":" + ddpEMinutes.SelectedItem.ToString());
                                    comm.Parameters.AddWithValue("@DateStart", from);
                                    comm.Parameters.AddWithValue("@DateFinish", to);
                                    comm.Parameters.AddWithValue("@Issue", cmbissue.SelectedItem.Text);
                                    comm.Parameters.AddWithValue("@digitals", digitals);
                                    comm.Parameters.AddWithValue("@MACAddress", MACAddress);
                                    comm.Parameters.AddWithValue("@IDDest", ID);

                                    try
                                    {
                                        conn.Open();
                                        insertedID = comm.ExecuteScalar().ToString();
                                        // comm.ExecuteNonQuery();

                                        //ShowPopUpMsg("Group(s) added to the device!" + "\r\n");
                                        //pnlGroups.Visible = true;
                                        //pnlAddGroup.Visible = false;
                                        //gridselectedGroup.DataBind();
                                    }
                                    catch (SqlException ex)
                                    {
                                        //  ShowPopUpMsg(ex.ToString());
                                    }
                                }
                                if (this.gridDeviceIO.FocusedRowIndex != -1)
                                {
                                    _query = @"update tblDeviceIO set Checking=1 where ID=@ID";
                                    using (SqlConnection con = new SqlConnection(strcon))
                                    {
                                        using (SqlCommand comm = new SqlCommand())
                                        {
                                            comm.Connection = con;
                                            comm.CommandText = _query;
                                            comm.Parameters.AddWithValue("@ID", ID1);
                                            con.Open();
                                            comm.ExecuteNonQuery();
                                        }
                                    }
                                }
                                if (this.gridusers.FocusedRowIndex != -1)
                                {
                                    string query = "INSERT INTO tblCrUser" +
                                          " (idCr, idUser)" +
                                          " VALUES (@idCr, @idUser);";
                                    int IDuser = Convert.ToInt32(this.gridusers.GetRowValues(this.gridusers.FocusedRowIndex, "idUser"));
                                    using (var dbconn = new SqlConnection(strcon))
                                    using (var dbcm = new SqlCommand(query, dbconn))
                                    {

                                        dbcm.Parameters.AddWithValue("@idCr", insertedID);
                                        dbcm.Parameters.AddWithValue("@idUser", IDuser);

                                        dbconn.Open();
                                        dbcm.ExecuteNonQuery();
                                    }
                                }
                                //string users = "";
                                //int i = gridusers.GetSelectedFieldValues(gridusers.KeyFieldName).Count;
                                //int id;
                                //List<Object> selectItems = gridusers.GetSelectedFieldValues("idUser");
                                //foreach (object selectItemId in selectItems)
                                //{
                                //    id = Convert.ToInt32(selectItemId);
                                //    //users = users + id.ToString() + ",";
                                //    string query = "INSERT INTO tblCrUser" +
                                //                     " (idCr, idUser)" +
                                //                     " VALUES (@idCr, @idUser);";

                                //    using (var dbconn = new SqlConnection(strcon))
                                //    using (var dbcm = new SqlCommand(query, dbconn))
                                //    {

                                //        dbcm.Parameters.AddWithValue("@idCr", insertedID);
                                //        dbcm.Parameters.AddWithValue("@idUser", id);

                                //        dbconn.Open();
                                //        dbcm.ExecuteNonQuery();
                                //    }
                                //}
                                //gridusers.GetSelectedFieldValues(gridusers.KeyFieldName);
                            }

                            string from2 = calfrom2.SelectedDate.ToString();
                            string[] f2 = from2.Split('/');
                            if (f2[0].Length == 1) f2[0] = "0" + f2[0];
                            if (f2[1].Length == 1) f2[1] = "0" + f2[1];
                            from2 = f2[2].Substring(0, 4) + "-" + f2[0] + "-" + f2[1] + " 00:00:00.000";
                            string to2 = calto2.SelectedDate.ToString();
                            string[] t2 = to2.Split('/');
                            if (t2[0].Length == 1) t2[0] = "0" + t2[0];
                            if (t2[1].Length == 1) t2[1] = "0" + t2[1];
                            to2 = t2[2].Substring(0, 4) + "-" + t2[0] + "-" + t2[1] + " 00:00:00.000";
                            string _query2 = @"INSERT INTO [dbo].[tblChangeReq]
    (IDD,TimeStart,TimeFinish,DateStart,DateFinish,Issue,digitals,MACAddress,IDSource,Name)
         VALUES
               (@IDD,@TimeStart,@TimeFinish,@DateStart,@DateFinish,@Issue,@digitals,@MACAddress,@IDSource,@Name); SELECT SCOPE_IDENTITY();";
                            string insertedID2 = "";
                            using (SqlConnection conn2 = new SqlConnection(strcon))
                            {
                                using (SqlCommand comm2 = new SqlCommand())
                                {
                                    comm2.Connection = conn2;
                                    comm2.CommandType = CommandType.Text;
                                    comm2.CommandText = _query2;
                                    comm2.Parameters.AddWithValue("@IDD", ID);
                                    comm2.Parameters.AddWithValue("@TimeStart", ddp2shour.SelectedItem.ToString()
                                        + ":" + ddp2sMin.SelectedItem.ToString());
                                    comm2.Parameters.AddWithValue("@TimeFinish", ddp2Ehour.SelectedItem.ToString()
                                        + ":" + ddp2Emin.SelectedItem.ToString());
                                    comm2.Parameters.AddWithValue("@DateStart", from2);
                                    comm2.Parameters.AddWithValue("@DateFinish", to2);
                                    comm2.Parameters.AddWithValue("@Issue", cmbissue.SelectedItem.Text);
                                    comm2.Parameters.AddWithValue("@digitals", digitals2);
                                    comm2.Parameters.AddWithValue("@MACAddress", MACAddress);
                                    comm2.Parameters.AddWithValue("@IDSource", lblID.Text);
                                    string Name = "";
                                    Name = txtName.Text;
                                    comm2.Parameters.AddWithValue("@Name", Name);
                                    try
                                    {
                                        conn2.Open();
                                        insertedID2 = comm2.ExecuteScalar().ToString();
                                        // comm.ExecuteNonQuery();

                                        //ShowPopUpMsg("Group(s) added to the device!" + "\r\n");
                                        //pnlGroups.Visible = true;
                                        //pnlAddGroup.Visible = false;
                                        //gridselectedGroup.DataBind();
                                    }
                                    catch (SqlException ex)
                                    {
                                        //  ShowPopUpMsg(ex.ToString());
                                    }
                                }
                                if (this.griddigital2.FocusedRowIndex != -1)
                                {
                                    _query = @"update tblDeviceIO set Checking=1 where ID=@ID";
                                    using (SqlConnection con = new SqlConnection(strcon))
                                    {
                                        using (SqlCommand comm = new SqlCommand())
                                        {
                                            comm.Connection = con;
                                            comm.CommandText = _query;
                                            comm.Parameters.AddWithValue("@ID", ID2);
                                            con.Open();
                                            comm.ExecuteNonQuery();
                                        }
                                    }
                                }
                                if (this.gridusers2.FocusedRowIndex != -1)
                                {
                                    string query = "INSERT INTO tblCrUser" +
                                          " (idCr, idUser)" +
                                          " VALUES (@idCr, @idUser);";
                                    int IDuser2 = Convert.ToInt32(this.gridusers2.GetRowValues(this.gridusers2.FocusedRowIndex, "idUser"));
                                    using (var dbconn = new SqlConnection(strcon))
                                    using (var dbcm = new SqlCommand(query, dbconn))
                                    {

                                        dbcm.Parameters.AddWithValue("@idCr", insertedID2);
                                        dbcm.Parameters.AddWithValue("@idUser", IDuser2);

                                        dbconn.Open();
                                        dbcm.ExecuteNonQuery();
                                    }
                                }
                                //string users2 = "";
                                //int i2 = gridusers2.GetSelectedFieldValues(gridusers2.KeyFieldName).Count;
                                //int id2;
                                //List<Object> selectItems2 = gridusers2.GetSelectedFieldValues("idUser");
                                //foreach (object selectItemId in selectItems2)
                                //{
                                //    id2 = Convert.ToInt32(selectItemId);
                                //    //users = users + id.ToString() + ",";
                                //    string query2 = "INSERT INTO tblCrUser" +
                                //                     " (idCr, idUser)" +
                                //                     " VALUES (@idCr, @idUser);";

                                //    using (var dbconn = new SqlConnection(strcon))
                                //    using (var dbcm = new SqlCommand(query2, dbconn))
                                //    {

                                //        dbcm.Parameters.AddWithValue("@idCr", insertedID2);
                                //        dbcm.Parameters.AddWithValue("@idUser", id2);

                                //        dbconn.Open();
                                //        dbcm.ExecuteNonQuery();
                                //    }
                                //}
                                //gridusers.GetSelectedFieldValues(gridusers.KeyFieldName);
                                ShowPopUpMsg("The CR submitted successfully");
                            }
                        }
                    }
                 
                }
                else
                {
                    ShowPopUpMsg("You sould select the device you want to move!");
                }

            }
            else
            {
                ShowPopUpMsg("You sould select the destenation!");
            }
        

        }
        if (!flagtoinsert1 || !flagtoinsert2)
        {
            ShowPopUpMsg("Your choosen time has overlap with other change requests! you should change it!");
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
    //protected void cmbissue_TextChanged(object sender, EventArgs e)
    //{
    //    if (cmbissue.SelectedItem.Text == "Clean up")
    //    {
    //        pnlDeviceIO.Visible = false;
    //    }
    //    else
    //    {
    //        pnlDeviceIO.Visible = true;
    //    }
    //}
    //protected void cmbissue_ValueChanged(object sender, EventArgs e)
    //{

    //}


//        else
//            {
//                string Type = this.griddigital2.GetRowValues(this.griddigital2.FocusedRowIndex, "Type").ToString();
//                SqlConnection con = new SqlConnection(strcon);
//                String st = "UPDATE tblDeviceIO SET Type=@Type and MACAddress=@MACAddress WHERE alarm='yes'";

//                SqlCommand sqlcom = new SqlCommand(st, con);
//                sqlcom.Parameters.AddWithValue("@Type", Type);
//                try
//                {
//                    con.Open();
//                    sqlcom.ExecuteNonQuery();
//                    con.Close();
//                    gridDS.DataBind();
//                    // ShowPopUpMsg("choose your device please" + "\r\n");
//                    //  MessageBox.Show("update successful");
//                }
//                catch (SqlException ex)
//                {
//                    ShowPopUpMsg(ex.ToString() + "\r\n");
//                    //MessageBox.Show(ex.Message);
//                }
//                string from = calfrom.SelectedDate.ToString();
//                string[] f = from.Split('/');
//                if (f[0].Length == 1) f[0] = "0" + f[0];
//                if (f[1].Length == 1) f[1] = "0" + f[1];
//                from = f[2].Substring(0, 4) + "-" + f[0] + "-" + f[1] + " 00:00:00.000";
//                string to = calto.SelectedDate.ToString();
//                string[] t = to.Split('/');
//                if (t[0].Length == 1) t[0] = "0" + t[0];
//                if (t[1].Length == 1) t[1] = "0" + t[1];
//                to = t[2].Substring(0, 4) + "-" + t[0] + "-" + t[1] + " 00:00:00.000";
//                string _query = @"INSERT INTO [dbo].[tblChangeReq]
//(IDD,TimeStart,TimeFinish,DateStart,DateFinish,Issue,digitals,MACAddress)
//     VALUES
//           (@IDD,@TimeStart,@TimeFinish,@DateStart,@DateFinish,@Issue,@digitals,@MACAddress); SELECT SCOPE_IDENTITY();";
//                string insertedID = "";
//                using (SqlConnection conn = new SqlConnection(strcon))
//                {
//                    using (SqlCommand comm = new SqlCommand())
//                    {
//                        comm.Connection = conn;
//                        comm.CommandType = CommandType.Text;
//                        comm.CommandText = _query;
//                        comm.Parameters.AddWithValue("@IDD", lblID.Text);
//                        comm.Parameters.AddWithValue("@TimeStart", ddpsHour.SelectedItem.ToString()
//                            + ":" + ddpsminutes.SelectedItem.ToString());
//                        comm.Parameters.AddWithValue("@TimeFinish", ddpEhour.SelectedItem.ToString()
//                            + ":" + ddpEMinutes.SelectedItem.ToString());
//                        comm.Parameters.AddWithValue("@DateStart", from);
//                        comm.Parameters.AddWithValue("@DateFinish", to);
//                        comm.Parameters.AddWithValue("@Issue", cmbissue.SelectedItem.Text);
//                        comm.Parameters.AddWithValue("@digitals", digitals);
//                        comm.Parameters.AddWithValue("@MACAddress", MACAddress);
//                        try
//                        {
//                            conn.Open();
//                            insertedID = comm.ExecuteScalar().ToString();
//                            // comm.ExecuteNonQuery();

//                            //ShowPopUpMsg("Group(s) added to the device!" + "\r\n");
//                            //pnlGroups.Visible = true;
//                            //pnlAddGroup.Visible = false;
//                            //gridselectedGroup.DataBind();
//                        }
//                        catch (SqlException ex)
//                        {
//                            //  ShowPopUpMsg(ex.ToString());
//                        }
//                    }

//                    string users = "";
//                    int i = gridusers.GetSelectedFieldValues(gridusers.KeyFieldName).Count;
//                    int id;
//                    List<Object> selectItems = gridusers.GetSelectedFieldValues("idUser");
//                    foreach (object selectItemId in selectItems)
//                    {
//                        id = Convert.ToInt32(selectItemId);
//                        //users = users + id.ToString() + ",";
//                        string query = "INSERT INTO tblCrUser" +
//                                         " (idCr, idUser)" +
//                                         " VALUES (@idCr, @idUser);";

//                        using (var dbconn = new SqlConnection(strcon))
//                        using (var dbcm = new SqlCommand(query, dbconn))
//                        {

//                            dbcm.Parameters.AddWithValue("@idCr", insertedID);
//                            dbcm.Parameters.AddWithValue("@idUser", id);

//                            dbconn.Open();
//                            dbcm.ExecuteNonQuery();
//                        }
//                    }
//                    gridusers.GetSelectedFieldValues(gridusers.KeyFieldName);
//                }
//            }
    protected void btnrefresh_Click(object sender, ImageClickEventArgs e)
    {
        if (this.gridDevice2.FocusedRowIndex != -1)
        {
            object ID = this.gridDevice2.GetRowValues(this.gridDevice2.FocusedRowIndex, "idD");
            lblID2.Text = ID.ToString();
            griddigital2.DataBind();
        }
    }
    protected void btnpartial_Click(object sender, EventArgs e)
    {
        
 
    }

    protected void SqlDataSource7_Deleting(object sender, SqlDataSourceCommandEventArgs e)
    {
        if (this.gridCRs.FocusedRowIndex != -1)
        {
            object ID = this.gridCRs.GetRowValues(this.gridCRs.FocusedRowIndex, "id");
            int id = Convert.ToInt32(ID);
            SqlConnection conn;
            SqlCommand comm;
            string _query;
            try
            {
                _query = @"delete from tblCrUser where idCr=@idCr";
                using (conn = new SqlConnection(strcon))
                {
                    using (comm = new SqlCommand())
                    {
                        comm.Connection = conn;
                        comm.CommandText = _query;
                        comm.Parameters.AddWithValue("@idCr", id);
                        conn.Open();
                        comm.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            { }
        }
    }
}