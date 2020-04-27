<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Report2.aspx.cs" Inherits="Report2" %>

<%@ Register Assembly="Stimulsoft.Report.Web, Version=2015.1.0.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <cc1:StiWebViewer ID="StiWebViewer1" runat="server" RenderMode="AjaxWithCache" />
    </div>
   
    </form>
</body>
</html>
