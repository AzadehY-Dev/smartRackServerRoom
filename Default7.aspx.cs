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

public partial class _Default7 : System.Web.UI.Page
{
    static int counta = 0;
    static string strcon = ConfigurationManager.ConnectionStrings["ngDBConnectionString"].ConnectionString;
    static string status;
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void dlSample_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        try
        {
            if (e.Item.ItemType !=null)
            {
                var currentItem = e.Item.DataItem;
                string resule = ((DataRowView)e.Item.DataItem).Row.ItemArray[10].ToString();
                string[] SResult = resule.Split(';');
                status = SResult[5].ToString();
                string Value;
                for (int i = 0; i < 24;i++)
                {
                    Value= ReturnResult(status.Substring(i, 1));
                    ((Label)e.Item.FindControl("D" + (i + 1).ToString())).Text = Value;
                    if (Value == "ON") { ((Label)e.Item.FindControl("D" + (i + 1))).ForeColor = System.Drawing.Color.Green; }
                    else if (Value == "OFF") { ((Label)e.Item.FindControl("D" + (i + 1))).ForeColor = System.Drawing.Color.Red; }
                    else ((Label)e.Item.FindControl("D" + (i + 1))).ForeColor = System.Drawing.Color.Orange; 
                }
            }
        }
        catch (Exception ex)
        {
            throw;
        }
    }
    static public string ReturnResult(string value)
    {
        if (value == "0") return "ON";
        else if (value == "1") return "OFF";
        else return "NO status";
    }
}