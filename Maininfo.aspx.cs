using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Maininfo : System.Web.UI.Page
{
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
    protected void sds_Inserting(object sender, SqlDataSourceCommandEventArgs e)
    {
        SetParameterDbType(e);
    }
    protected void sds_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        SetParameterDbType(e);
    }
    private void SetParameterDbType(SqlDataSourceCommandEventArgs e)
    {
        SqlParameter binaryImageParameter = (SqlParameter)e.Command.Parameters[0];
        binaryImageParameter.SqlDbType = SqlDbType.VarBinary;
    }
}