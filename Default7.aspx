<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default7.aspx.cs" Inherits="_Default7" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
     <h4 class="title">Device </h4>
    <p class="category">Choose the device from the below list</p>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server" >

<asp:DataList ID="dlSample" CellPadding="10" 
            runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
            OnItemDataBound="dlSample_ItemDataBound" DataSourceID="SqlDataSource1">
            <ItemTemplate>
              <table style="width:200px;">
                  <tr>
                      <td colspan="3" style="text-align:center;  border: 1px solid black;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("NameD") %>'></asp:Label>
                      </td>
                      </tr>
          
        <tr>
            <td>
               <asp:Label ID="lblD1" runat="server" Text="">D1</asp:Label>
            </td>
            <td>
                <asp:Label ID="D1" runat="server" Text=""></asp:Label>
            </td>
            <td> <asp:Label ID="macadress1" runat="server" Text=""></asp:Label> </td>
        </tr>
             <tr>
            <td>
               <asp:Label ID="lblD2" runat="server" Text="">D2</asp:Label>
            </td>
            <td>
                <asp:Label ID="D2" runat="server" Text=""></asp:Label>
            </td>

        <td> <asp:Label ID="macadress2" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD3" runat="server" Text="">D3</asp:Label>
            </td>
            <td>
                <asp:Label ID="D3" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress3" runat="server" Text=""></asp:Label> </td></tr>
            <tr>
            <td>
               <asp:Label ID="lblD4" runat="server" Text="">D4</asp:Label>
            </td>
            <td>
                <asp:Label ID="D4" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress4" runat="server" Text=""></asp:Label> </td></tr>
           <tr>
            <td>
               <asp:Label ID="lblD5" runat="server" Text="">D5</asp:Label>
            </td>
            <td>
                <asp:Label ID="D5" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress5" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD6" runat="server" Text="">D6</asp:Label>
            </td>
            <td>
                <asp:Label ID="D6" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress6" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD7" runat="server" Text="">D7</asp:Label>
            </td>
            <td>
                <asp:Label ID="D7" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress7" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD8" runat="server" Text="">D8</asp:Label>
            </td>
            <td>
                <asp:Label ID="D8" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress8" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD9" runat="server" Text="">D9</asp:Label>
            </td>
            <td>
                <asp:Label ID="D9" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress9" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD10" runat="server" Text="">D10</asp:Label>
            </td>
            <td>
                <asp:Label ID="D10" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress10" runat="server" Text=""></asp:Label> </td></tr>
                     <tr>
            <td>
               <asp:Label ID="lblD11" runat="server" Text="">D11</asp:Label>
            </td>
            <td>
                <asp:Label ID="D11" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress11" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD12" runat="server" Text="">D12</asp:Label>
            </td>
            <td>
                <asp:Label ID="D12" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress12" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD13" runat="server" Text="">D13</asp:Label>
            </td>
            <td>
                <asp:Label ID="D13" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress13" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD14" runat="server" Text="">D14</asp:Label>
            </td>
            <td>
                <asp:Label ID="D14" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress14" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD15" runat="server" Text="">D15</asp:Label>
            </td>
            <td>
                <asp:Label ID="D15" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress15" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD16" runat="server" Text="">D16</asp:Label>
            </td>
            <td>
                <asp:Label ID="D16" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress16" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD17" runat="server" Text="">D17</asp:Label>
            </td>
            <td>
                <asp:Label ID="D17" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress17" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD18" runat="server" Text="">D18</asp:Label>
            </td>
            <td>
                <asp:Label ID="D18" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress18" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD19" runat="server" Text="">D19</asp:Label>
            </td>
            <td>
                <asp:Label ID="D19" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress19" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD20" runat="server" Text="">D20</asp:Label>
            </td>
            <td>
                <asp:Label ID="D20" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress20" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD21" runat="server" Text="">D21</asp:Label>
            </td>
            <td>
                <asp:Label ID="D21" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress21" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD22" runat="server" Text="">D22</asp:Label>
            </td>
            <td>
                <asp:Label ID="D22" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress22" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD23" runat="server" Text="">D23</asp:Label>
            </td>
            <td>
                <asp:Label ID="D23" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress23" runat="server" Text=""></asp:Label> </td></tr>
                      <tr>
            <td>
               <asp:Label ID="lblD24" runat="server" Text="">D24</asp:Label>
            </td>
            <td>
                <asp:Label ID="D24" runat="server" Text=""></asp:Label>
            </td>
        <td> <asp:Label ID="macadress24" runat="server" Text=""></asp:Label> </td>
                          <td>
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                          </td>
                      </tr>
    </table>
                 <%-- <asp:Label ID="idDLabel" runat="server" Visible="false" 
                                   Text='<%# Eval("idD") %>'></asp:Label>
                    <asp:Label ID="Label1" runat="server" 
                                   Text='<%# Eval("NameD") %>'></asp:Label>
                    <asp:Label ID="lbl" runat="server" 
                                    Text='<%# Container.DataItem %>'></asp:Label>
                  <br />
                  <br />--%>

            </ItemTemplate>
        </asp:DataList>

<%--    <asp:Label ID="lbltest" runat="server" Text="Label"></asp:Label>--%>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
        SelectCommand="select * from tblDevice d inner join tblLastData l on d.idD=l.IDD"></asp:SqlDataSource>


</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>

