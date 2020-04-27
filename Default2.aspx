 <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<!DOCTYPE html>
<script runat="server"></script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="utf-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1"/>
  <title>jQuery UI Slider - Snap to increments</title>
<%--  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>--%>
<%--  <link rel="stylesheet" href="/resources/demos/style.css"/>--%>
    <link href="css/jquery-ui.css" rel="stylesheet" />
<%--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>--%>
    <script src="Scripts/jquery-1.12.4.js"></script>
    <script src="Scripts/jquery-ui.js"></script>
<%--  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>--%>
  <script>
      $(function () {
          $("#slider").slider({
              value: 1,
              min: 1,
              max: 60,
              step: 1,
              slide: function (event, ui) {
                  $("#amount").val(ui.value);
              }
          });
          $("#amount").val($("#slider").slider("value"));
      });
  </script>
</head>
<body>
    <form id="form1" runat="server">

    <div>


   

    </div>
    </form>
</body>
</html>
