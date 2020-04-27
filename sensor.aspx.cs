using DevExpress.Export;
using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sensor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty((string)Session["username"]))
        {
            Response.Redirect("logIn.aspx");
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
    protected void btnExcel_Click(object sender, EventArgs e)
    {
        gridExport.WriteXlsToResponse(new XlsExportOptionsEx { ExportType = ExportType.WYSIWYG });
    }
    protected void btnword_Click(object sender, EventArgs e)
    {
        gridExport.WritePdfToResponse();
    }
}