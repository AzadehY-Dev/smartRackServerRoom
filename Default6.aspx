<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default6.aspx.cs" Inherits="Default6" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />

       <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource8"
        Width="100%" AutoGenerateColumns="False" Theme="PlasticBlue">
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
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

</asp:Content>

