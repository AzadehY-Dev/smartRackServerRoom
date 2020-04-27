<%@ Page Language="C#" AutoEventWireup="true" CodeFile="logIn.aspx.cs" Inherits="logIn" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
 <html>
<head>
<meta charset="utf-8">
<title>NG</title>
<style type="text/css">
body {
background-color: #f4f4f4;
background-image:url('assets/img/BACK.jpg');
background-repeat:repeat;
color: #5a5656;
font-family: 'Open Sans', Arial, Helvetica, sans-serif;
font-size: 16px;
line-height: 1.5em;
}
a { text-decoration: none; }
h1 { font-size: 1em; }
h1, p {
margin-bottom: 10px;
}
strong {
font-weight: bold;
}
.uppercase { text-transform: uppercase; }

/* ---------- LOGIN ---------- */
#login {
    margin: 50px auto;
    width: 330px;

}
.txt {
    background-color: #e5e5e5;
    border: none;
    border-radius: 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    color: #5a5656;
    font-family: 'Open Sans', Arial, Helvetica, sans-serif;
    font-size: 14px;
    height: 50px;
    outline: none;
    padding: 0px 10px;
    width: 280px;
    -webkit-appearance:none;
}
form fieldset input[type="submit"] {
    background-color: #008dde;
    border: none;
    border-radius: 3px;
    -moz-border-radius: 3px;
    -webkit-border-radius: 3px;
    color: #f4f4f4;
    cursor: pointer;
    font-family: 'Open Sans', Arial, Helvetica, sans-serif;
    height: 50px;
    text-transform: uppercase;
    width: 300px;
    -webkit-appearance:none;
}
form fieldset a {
    color: #5a5656;
    font-size: 10px;
}
form fieldset a:hover { text-decoration: underline; }
.btn-round {
    background-color: #5a5656;
    border-radius: 50%;
    -moz-border-radius: 50%;
    -webkit-border-radius: 50%;
    color: #f4f4f4;
    display: block;
    font-size: 12px;
    height: 50px;
    line-height: 50px;
    margin: 30px 125px;
    text-align: center;
    text-transform: uppercase;
    width: 50px;
}
.facebook-before {
    background-color: #0064ab;
    border-radius: 3px 0px 0px 3px;
    -moz-border-radius: 3px 0px 0px 3px;
    -webkit-border-radius: 3px 0px 0px 3px;
    color: #f4f4f4;
    display: block;
    float: left;
    height: 50px;
    line-height: 50px;
    text-align: center;
    width: 50px;
}
.facebook {
    background-color: #0079ce;
    border: none;
    border-radius: 0px 3px 3px 0px;
    -moz-border-radius: 0px 3px 3px 0px;
    -webkit-border-radius: 0px 3px 3px 0px;
    color: #f4f4f4;
    cursor: pointer;
    height: 50px;
    text-transform: uppercase;
    width: 250px;
}
.twitter-before {
    background-color: #189bcb;
    border-radius: 3px 0px 0px 3px;
    -moz-border-radius: 3px 0px 0px 3px;
    -webkit-border-radius: 3px 0px 0px 3px;
    color: #f4f4f4;
    display: block;
    float: left;
    height: 50px;
    line-height: 50px;
    text-align: center;
    width: 50px;
}
.twitter {
    background-color: #1bb2e9;
    border: none;
    border-radius: 0px 3px 3px 0px;
    -moz-border-radius: 0px 3px 3px 0px;
    -webkit-border-radius: 0px 3px 3px 0px;
    color: #f4f4f4;
    cursor: pointer;
    height: 50px;
    text-transform: uppercase;
    width: 250px;
}
</style>
</head>
<body>
    <div id="login">
    <h1 style="color:#fff; text-align:center"><strong>NGIED  </strong> <br />Please login.</h1>
    <form runat="server">
       <table style="background-color:#e5e5e5;  padding:10px;  border-radius: 10px; -moz-border-radius: 10px; -webkit-border-radius: 10px;">
           <tr>
               <td style="margin: 30px; padding:30px;">
  <p>
      Username:
          <dx:ASPxTextBox ID="txtusername" CssClass="txt" runat="server" Width="300" Theme="Aqua"></dx:ASPxTextBox>
        </p>
        <p>
           Password:
          <dx:ASPxTextBox ID="txtpassword" CssClass="txt" runat="server" Width="300" Theme="Aqua" Password="True"></dx:ASPxTextBox>
        </p>
    <%--<p><input type="text" required value="Username" onBlur="if(this.value=='')this.value='Username'" onFocus="if(this.value=='Username')this.value='' "></p>
    <p><input type="password" required value="Password" onBlur="if(this.value=='')this.value='Password'" onFocus="if(this.value=='Password')this.value='' "></p>--%>
<%--    <p><a href="#">Forgot Password?</a></p>--%>
                   <br />
    <p>
     <%--   <asp:Button ID="btnlogin" runat="server" Text="LOGIN" OnClick="btnlogin_Click" /></p>--%>
<%--                   <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Button" />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                   <dx:ASPxButton ID="btnlogin" runat="server" 
                       Text="LOGIN" OnClick="btnlogin_Click" Height="47px" Theme="Moderno" Width="300px"></dx:ASPxButton>
               </td>
           </tr>
       </table>
<%--    <fieldset >
      
    </fieldset>--%>
    </form>
    <%--<p><span class="btn-round">or</span></p>
    <p>
    <a class="facebook-before"></a>
    <button class="facebook">Login Using Facbook</button>
    </p>
    <p>
    <a class="twitter-before"></a>
    <button class="twitter">Login Using Twitter</button>
    </p>--%>
    </div> <!-- end login -->
</body>
</html>