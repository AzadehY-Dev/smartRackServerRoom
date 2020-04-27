<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">

    </script>--%>
    <script src="Scripts/jquery.min.js"></script>
    <style type="text/css">
         th, td {
   /*border: 1px solid black;*/
   padding:5px;
   margin:5px;
}
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Menu" Runat="Server">
    <ul class="nav">
                 <%-- <li class="active">--%>
                <li  class="active">
                    <a href="Default.aspx">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
          <li>
                    <a href="Last.aspx">
                        <i class="pe-7s-news-paper"></i>
                        <p>Log</p>
                    </a>
                </li>
                  <li>
                    <a href="ChangeReq.aspx">
                        <i class="pe-7s-note"></i>
                        <p>Change Request</p>
                    </a>
                </li>
                <li>
                    <a href="Device.aspx">
                        <i class="pe-7s-airplay"></i>
                        <p>Devices</p>
                    </a>
                </li>
            <%--    <li>
                    <a href="sensor.aspx">
                        <i class="pe-7s-target"></i>
                        <p>Sensors</p>
                    </a>
                </li>--%>
                <li>
                    <a href="users.aspx">
                        <i class="pe-7s-add-user"></i>
                        <p>Users</p>
                    </a>
                </li>
             <%--   <li>
                    <a href="StoD.aspx">
                        <i class="pe-7s-network"></i>
                        <p>Device/Sensor</p>
                    </a>
                </li>--%>
        <%--        <li id="DeviceUsers" runat="server">
                    <a href="usertoDevice.aspx">
                        <i class="pe-7s-id"></i>
                        <p>Device Users</p>
                    </a>
                </li>--%>
                   <li>
                    <a href="Groups.aspx">
                        <i class="pe-7s-users"></i>
                        <p>Groups</p>
                    </a>
                </li>
                   <li>
                    <a href="GroupToDevice.aspx">
                        <i class="pe-7s-network"></i>
                        <p>Groups To Devices</p>
                    </a>
                </li>
                    <li>
                    <a href="Outputs.aspx">
                        <i class="pe-7s-help2"></i>
                        <p>Outputs</p>
                    </a>
                </li>
                  <li>
                    <a href="Maininfo.aspx">
                        <i class="pe-7s-note2"></i>
                        <p>Main info</p>
                    </a>
                </li>
                <li>
                    <a href="Reports.aspx">
                        <i class="pe-7s-news-paper"></i>
                        <p>Reports</p>
                    </a>
                </li>
                 
			<%--	<li class="active-pro">--%>
                  <li>
                    <a href="">
                        <i class="pe-7s-help2"></i>
                        <p>Help</p>
                    </a>
                </li>
            </ul>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
    <p>
       </p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">

<asp:ScriptManager runat="server" ID="ScriptManager1" />

<asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick">
</asp:Timer>
<%--    <asp:Timer ID="Timer2" runat="server" Interval="360000" OnTick="Timer2_Tick">
</asp:Timer>--%>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
     <Triggers>
            <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
     </Triggers>
     <ContentTemplate>
         
<asp:DataList ID="dlSample" CellPadding="10" 
            runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
            OnItemDataBound="dlSample_ItemDataBound">
            <ItemTemplate>
               <%-- background-image:url(assets/img/p/close.png);--%>
                <div id="backofrack" style="background-repeat:no-repeat;
                                    background-image:url('<%# GetImagePath( Convert.ToString( Eval("LastResult") ) ) %>'); display:block; height:600px; "> 
                 <%--   <asp:Image ID="imgback" runat="server" />--%>
              <table style="width:265px; margin-left:22px;  ">
                  <tr>
                      <td colspan="3" style="text-align:left;  border: 0px solid black;">
                         <asp:Label ID="Label2" runat="server" Text='<%# Eval("NameD") %>'>

                         </asp:Label>
                          <br /><br /> <br />
                      </td>
                      </tr>

          
        <tr>
            <td>
                <asp:Image ID="ImgD1" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD2" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD3" runat="server" />
            </td>
        </tr>
           <tr>
            <td>
                <asp:Image ID="ImgD4" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD5" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD6" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD7" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD8" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD9" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD10" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD11" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD12" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD13" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD14" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD15" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD16" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD17" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD18" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD19" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD20" runat="server" />
            </td>
        </tr>
 <tr>
            <td>
                <asp:Image ID="ImgD21" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD22" runat="server" />
            </td>
        </tr>
                   <tr>
            <td>
                <asp:Image ID="ImgD23" runat="server" />
            </td>
        </tr>

    </table>
                </div>
            </ItemTemplate>
        </asp:DataList>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
        SelectCommand="select * from tblDevice d inner join tblLastData l on d.idD=l.IDD">

   </asp:SqlDataSource>
     </ContentTemplate>
</asp:UpdatePanel>

     
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

