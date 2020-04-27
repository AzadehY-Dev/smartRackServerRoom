<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default4.aspx.cs" Inherits="Default4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:Timer ID="Timer2" runat="server" OnTick="Timer2_Tick" Interval="100000">
    </asp:Timer>
    <table>
            <tr>
                <td>
                    ip:
                </td>
                <td>
                     <asp:TextBox ID="txtip" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    port:
                </td>
                <td>
                    <asp:TextBox ID="txtport" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    text:
                </td>
                <td>
                    <asp:TextBox ID="txtmessage" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    reply:
                </td>
                <td>
                    <asp:TextBox ID="txtreply" runat="server" Height="500px" TextMode="MultiLine" Width="560px"></asp:TextBox>
                </td>
            </tr>
        </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

