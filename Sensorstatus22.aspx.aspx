<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Sensorstatus.aspx.cs" Inherits="Sensorstatus" %>

<%@ Register Assembly="DevExpress.XtraCharts.v16.1.Web, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
    
    <asp:Panel ID="pnlsensorsshow" runat="server">
          <h4 class="title">Assigned Sensors</h4>
    <p class="category">The below list are the sensors that assigned to the choosen device

    </p>
    </asp:Panel>
      <asp:Panel ID="pnlsensorh" runat="server" Visible="false">
          <h4 class="title">Sensor Status</h4>
    <p class="category">
        The below chart contain 5 last status of this sensor.
    </p>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Panel ID="pnlds" runat="server">
           <dx:ASPxGridView ID="gridDS" runat="server" KeyFieldName="idds"
          EnableCallBacks="False"
            Theme="Office2003Blue" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
          OnCustomButtonCallback="gridDS_CustomButtonCallback">
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
         <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
    <Columns>
          <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px">
        <custombuttons>
            <dx:GridViewCommandColumnCustomButton 
            ID="chart"><image tooltip="chart" 
            url="assets/img/chart.png" />
            </dx:GridViewCommandColumnCustomButton>
        </custombuttons></dx:GridViewCommandColumn>
        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idds" ReadOnly="True" Visible="false" VisibleIndex="5">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NameS" Caption="Sensor Name"  VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="unitS" Caption="Unit of Sensor" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="pin" Caption="pin number" VisibleIndex="14">
        </dx:GridViewDataTextColumn>
    </Columns>
   </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
            SelectCommand="select * from tblsensorTodevice sd  inner join tblDevice d  on 
            d.idD=sd.iddevice inner join tblSensor s on sd.idsensor=s.idS
            WHERE (d.idD = 2)">
        <SelectParameters>
            <asp:ControlParameter ControlID="lbliddevice" Name="idD" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
      <asp:Label ID="lbliddevice" runat="server" Text="" Visible="false"></asp:Label>
           &nbsp;</asp:Panel>
    <asp:Panel ID="pnlchart" runat="server" Visible="false">
        <dx:WebChartControl ID="WebChartControl3" runat="server" 
            CrosshairEnabled="True" DataSourceID="SqlDataSource1" Height="500px" Width="500px"></dx:WebChartControl>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
            SelectCommand="select * from [tblStatusSensorDevice] where idSd not in (select top((select COUNT(*) from [tblStatusSensorDevice] ) -5 )idSd from [tblStatusSensorDevice])">
        </asp:SqlDataSource>
        <br />
        <dx:ASPxButton ID="btnback" runat="server" Text="Go Back" OnClick="btnback_Click" 
            Theme="Moderno"></dx:ASPxButton>
    </asp:Panel> 
    <asp:Label ID="lblsensor" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>