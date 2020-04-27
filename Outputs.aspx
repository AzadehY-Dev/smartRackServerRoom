<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Outputs.aspx.cs" Inherits="Outputs" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

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
                    <li  class="active">
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
    <asp:Panel ID="pnldevice" runat="server">
        <dx:ASPxGridView ID="griddevice" runat="server" AutoGenerateColumns="False"
        KeyFieldName="idD" DataSourceID="SqlDataSource1" EnableCallBacks="False"
         OnCustomButtonCallback="griddevice_CustomButtonCallback"
         Theme="Office2003Blue">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn"
                             ConfirmDelete="true">
                        </SettingsBehavior>
    <Columns>
         <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px">
        <custombuttons>
           <dx:GridViewCommandColumnCustomButton 
            ID="Output"><image tooltip="Outputs" 
            url="assets/img/output.png" />
            </dx:GridViewCommandColumnCustomButton>
            
        </custombuttons></dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idD" VisibleIndex="1" Visible="false">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NameD" Caption="Device Name" VisibleIndex="2">
             <EditFormSettings VisibleIndex="0"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lat" Caption="Latitude" VisibleIndex="8">
                  <EditFormSettings VisibleIndex="8"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="long" Caption="Longitude" VisibleIndex="9">
                    <EditFormSettings VisibleIndex="9"/>
        </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="6">
                    <EditFormSettings VisibleIndex="4"/>
        </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="Port" VisibleIndex="7">
                    <EditFormSettings VisibleIndex="4"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="comment" VisibleIndex="5" Visible="false">
            <EditFormSettings Visible="True" ColumnSpan="3" VisibleIndex="100"/>
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
        <SettingsPopup>
            <EditForm Width="600" />
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />
        </dx:ASPxGridView>
     <br /> 
                 <dx:ASPxGridViewExporter ID="gridExport" GridViewID="griddevice" runat="server">
           </dx:ASPxGridViewExporter>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
    SelectCommand="SELECT * FROM [tblDevice]">
        <DeleteParameters>
            <asp:Parameter Name="idD" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NameD" />
            <asp:Parameter Name="lat" />
            <asp:Parameter Name="long" />
            <asp:Parameter Name="comment" />
            <asp:Parameter Name="IP" />
            <asp:Parameter Name="Port" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NameD" />
            <asp:Parameter Name="lat" />
            <asp:Parameter Name="long" />
            <asp:Parameter Name="comment" />
            <asp:Parameter Name="idD" />
            <asp:Parameter Name="IP" />
            <asp:Parameter Name="Port" />
        </UpdateParameters>
        </asp:SqlDataSource>
       <%-- <dx:ASPxLoadingPanel ID="loading" runat="server" Modal="True" 
            Theme="MetropolisBlue"></dx:ASPxLoadingPanel>--%>
     </asp:Panel>
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
       <asp:Label ID="lblIP" runat="server" Text="" Visible="false"></asp:Label>
       <asp:Label ID="lblPort" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Panel ID="pnlOutput" runat="server" Visible="false">
          <dx:ASPxGridView ID="gridOutput" runat="server" AutoGenerateColumns="False"
        KeyFieldName="ID" DataSourceID="SqlDataSource2" EnableCallBacks="False"
         OnCustomButtonCallback="gridOutput_CustomButtonCallback"
         Theme="Office2003Blue">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn"
                             ConfirmDelete="true">
                        </SettingsBehavior>

            <Columns>
                  <dx:GridViewCommandColumn ShowEditButton="True"  VisibleIndex="0">
        </dx:GridViewCommandColumn>
                   <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px" ShowEditButton="True">
        <custombuttons>
           <dx:GridViewCommandColumnCustomButton 
            ID="On"><image tooltip="On this output" 
            url="assets/img/on.png" />
            </dx:GridViewCommandColumnCustomButton>
               <dx:GridViewCommandColumnCustomButton 
            ID="Off"><image tooltip="Off this output" 
            url="assets/img/off.png" />
            </dx:GridViewCommandColumnCustomButton>
        </custombuttons></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OutputNumber" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="ONchar" VisibleIndex="2" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="OFFchar" VisibleIndex="3" Visible="false">
                </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="4" Visible="false">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
            SelectCommand="SELECT ID, Name, OutputNumber, ONchar, OFFchar FROM tblOutput WHERE (IDD = @IDD)" UpdateCommand="UPDATE tblOutput SET Name = @Name WHERE (ID = @ID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblID" Name="IDD" PropertyName="Text" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

