<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:ScriptManager runat="server" ID="ScriptManager1" />
<asp:Timer ID="Timer1" runat="server" Interval="1200" OnTick="Timer1_Tick">
</asp:Timer>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
     </Triggers>
     <ContentTemplate>
               <table>
        <tr>
            <td>
                D1
            </td>
            <td>
                <asp:Label ID="D1" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>

     </ContentTemplate>
</asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
