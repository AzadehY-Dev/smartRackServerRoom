<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Last.aspx.cs" Inherits="Last" %>

<%@ Register Assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var timeout;
        function scheduleGridUpdate(grid) {
            window.clearTimeout(timeout);
            timeout = window.setTimeout(
                function () { grid.Refresh(); },
                2000
            );
        }
        function grid_Init(s, e) {
            scheduleGridUpdate(s);
        }
        function grid_BeginCallback(s, e) {
            window.clearTimeout(timeout);
        }
        function grid_EndCallback(s, e) {
            scheduleGridUpdate(s);
        }
    </script>
    <style type="text/css">
.Initial
{
  display: block;
  padding: 4px 10px 4px 10px;
  float: left;
  background: url("assets/img/InitialImage.png") no-repeat right top;
  color: Black;
  
}
.Initial:hover
{
  color: White;
  background: url("assets/img/SelectedButton.png") no-repeat right top;
}
.Clicked
{
  float: left;
  display: block;
  background: url("assets/img/SelectedButton.png") no-repeat right top;
  padding: 4px 18px 4px 18px;
  color: Black;
  color: White;
}
</style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Menu" Runat="Server">
    <ul class="nav">
                 <%-- <li class="active">--%>
                <li >
                    <a href="Default.aspx">
                        <i class="pe-7s-graph"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
          <li class="active">
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
<%--                <li id="DeviceUsers" runat="server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    
     <table width="100%" align="center">
      <tr>
        <td>
              <div style="padding:10px;">
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource4"
        Width="100%" AutoGenerateColumns="False" Theme="Office2003Blue" OnHtmlRowPrepared="ASPxGridView1_HtmlRowPrepared">
        <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
        <Columns>
         <dx:GridViewDataTextColumn FieldName="AIDI" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Alarm" VisibleIndex="1">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Time" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Success" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="NameD" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
         
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center" />
        </Styles>
        <Settings GridLines="Vertical" />
        <SettingsBehavior AllowDragDrop="false"  />
        <SettingsPager Mode="ShowPager"/>
        <SettingsLoadingPanel Mode="ShowOnStatusBar" />
    </dx:ASPxGridView>
       <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
           SelectCommand="SELECT DISTINCT ID, tblLogData.AIDI, tblLogData.Alarm, tblLogData.Date, tblLogData.Time, tblLogData.Success, tblDevice.NameD, tblDevice.IP, tblLogData.Comments 
FROM tblLogData Left JOIN tblDevice ON tblLogData.IDD = tblDevice.idD order by ID desc"></asp:SqlDataSource>

    </div><%--<br />   
            <dx:ASPxButton ID="btnClearlog" runat="server" Text="Clear Log" OnClick="btnClearlog_Click" Theme="iOS"></dx:ASPxButton>
            <br />--%>
         
            <%--<div style="padding:10px;">
         <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource8"
        Width="100%" AutoGenerateColumns="False" Theme="Office2003Blue">
        <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
        <Columns>
         <dx:GridViewDataTextColumn FieldName="NameD" Caption="Device Name" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" Caption="User name" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="lastName" Caption="User last name" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="time" Caption="Time" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="date" Caption="Date" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="statusdoor" Caption="Status" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
         
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center" />
        </Styles>
        <Settings GridLines="Vertical" />
        <SettingsBehavior AllowDragDrop="false" />
        <SettingsPager Mode="ShowAllRecords" />
        <SettingsLoadingPanel Mode="ShowOnStatusBar" />
    </dx:ASPxGridView>
       <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
           SelectCommand="select Top 10 * from tblEntrance e inner join tblDevice d on e.iddevice=d.idD
inner join tblusers u on u.RFID=e.rfid order by idud desc"></asp:SqlDataSource>

    </div>--%>
        <%--  <asp:Button Text="Enter/Exit" BorderStyle="None" ID="Tab1" Width="152" Height="52"
               CssClass="Initial" runat="server" OnClick="Tab1_Click" />--%>
    
          <%--<asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="   border-radius: 15px 50px;width:100%;  border:1px solid #42b2f3; ">
                <tr>
                  <td>
    
                  </td>
                </tr>
              </table>
            </asp:View>
            <%--<asp:View ID="View2" runat="server">
         <%--       background-image:url('assets/img/backtable.jpg');background-repeat:repeat-x; 
              <table style="border-radius: 15px 50px; width:100%; border:1px solid #42b2f3; ">
                <tr>
                  <td>

                  <div style="padding:10px;">
         <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="SqlDataSource4"
        Width="100%" AutoGenerateColumns="False" Theme="Office2003Blue">
        <ClientSideEvents Init="grid_Init" BeginCallback="grid_BeginCallback" EndCallback="grid_EndCallback" />
        <Columns>
         <dx:GridViewDataTextColumn FieldName="AIDI" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Alarm" VisibleIndex="1">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="2">
            </dx:GridViewDataDateColumn>
            <dx:GridViewDataTextColumn FieldName="Time" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Success" VisibleIndex="4">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="NameD" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
         
        </Columns>
        <Styles>
            <Header HorizontalAlign="Center" />
        </Styles>
        <Settings GridLines="Vertical" />
        <SettingsBehavior AllowDragDrop="false" />
        <SettingsPager Mode="ShowAllRecords" />
        <SettingsLoadingPanel Mode="ShowOnStatusBar" />
    </dx:ASPxGridView>
       <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
           ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
           SelectCommand="SELECT ID, tblLogData.AIDI, tblLogData.Alarm, tblLogData.Date, tblLogData.Time, tblLogData.Success, tblDevice.NameD, tblDevice.IP, tblLogData.Comments 
FROM tblLogData Left JOIN tblDevice ON tblLogData.IDD = tblDevice.idD order by ID desc"></asp:SqlDataSource>

    </div>

                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>--%>
        </td>
      </tr>
    </table>
    

</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    
</asp:Content>

