<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="GroupToDevice.aspx.cs" Inherits="GroupToDevice" %>

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
           <%--     <li id="DeviceUsers" runat="server">
                    <a href="usertoDevice.aspx">
                        <i class="pe-7s-id"></i>
                        <p>Device Users</p>
                    </a>
                </li>--%>
                   <li >
                    <a href="Groups.aspx">
                        <i class="pe-7s-users"></i>
                        <p>Groups</p>
                    </a>
                </li>
                   <li  class="active">
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
            ID="Groups"><image tooltip="Groups" 
            url="assets/img/Users.png" />
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
                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
    DeleteCommand="DELETE FROM tblDevice WHERE (idD = @idD)"
        InsertCommand="INSERT INTO tblDevice(NameD, lat, long, comment,IP,Port) 
    VALUES (@NameD, @lat, @long, @comment,@IP,@Port)" 
    SelectCommand="SELECT * FROM [tblDevice]" 
    UpdateCommand="UPDATE tblDevice SET Port=@Port,  NameD = @NameD, lat = @lat, long = @long, comment = @comment, IP=@IP where idD=@idD">
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
           </asp:Panel>
       <asp:Panel ID="pnlGroups" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridselectedGroup" runat="server" KeyFieldName="ID"  EnableCallBacks="False"
             AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="Office2003Blue">

            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Visible="false" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDGroup" VisibleIndex="2" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDDevice" VisibleIndex="3" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" Caption="Group Name" VisibleIndex="4" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comments"  VisibleIndex="5" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataComboBoxColumn FieldName="AnnouncingType" VisibleIndex="4" Width="150">
                    <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem ImageUrl="assets/img/email-sms.png" Text="Email & SMS" Selected="true" Value="ES" />
                            <dx:ListEditItem ImageUrl="assets/img/sms.png" Text="SMS" Value="SMS" />
                            <dx:ListEditItem ImageUrl="assets/img/email.png" Text="Email" Value="Email" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>

        </dx:ASPxGridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
     DeleteCommand="DELETE FROM tblDeviceGroup WHERE (ID = @ID)" 
   SelectCommand="SELECT dg.AnnouncingType, Comments, dg.ID, dg.IDGroup, dg.IDDevice, g.Name FROM tblDeviceGroup AS
                  dg INNER JOIN tblDevice AS d ON dg.IDDevice = d.idD LEFT OUTER JOIN tblGroup AS g
                  ON dg.IDGroup = g.ID WHERE (dg.IDDevice = @idD)" 
                 UpdateCommand="UPDATE tblDeviceGroup SET AnnouncingType = @AnnouncingType WHERE (ID = @ID)">
                 <DeleteParameters>
                     <asp:Parameter Name="ID" />   
                 </DeleteParameters>
                 <SelectParameters>
                     <asp:ControlParameter ControlID="lblDID" Name="idD" PropertyName="Text" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="AnnouncingType" />
                     <asp:Parameter Name="ID" />
                 </UpdateParameters>
        </asp:SqlDataSource><br />
             <dx:ASPxButton ID="btnaddGroup" runat="server" Text="Define Group"
                  OnClick="btnaddGroup_Click"
            Theme="Moderno"></dx:ASPxButton>
    </asp:Panel>

   
         <%--  <br />
          <dx:ASPxListBox ID="ASPxListBox1" ClientInstanceName="selList" runat="server" Height="250px"
            Width="100%" />
        <div class="TopPadding">
            Selected count: <span id="selCount" style="font-weight: bold">0</span>
        </div><br />--%>
    <asp:Panel ID="pnlAddGroup" runat="server" Visible="false">
            <dx:ASPxGridView ID="GridGroups" EnableCallBacks="False" runat="server" 
         Font-Size="Small" KeyFieldName="ID"
        AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Theme="Office2003Blue">
                <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
          ColumnResizeMode="NextColumn" 
            ConfirmDelete="True" />
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                <SettingsBehavior AllowFocusedRow="True"  AllowSelectByRowClick="True"  
                    ColumnResizeMode="NextColumn" ConfirmDelete="True">
                </SettingsBehavior>
        <Columns>
             <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="34" Visible="false" ReadOnly="True">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
        </Columns> 
    </dx:ASPxGridView>
        <br />
            <dx:ASPxButton ID="RegisterGroup" runat="server" Text="Register selected group"
                  OnClick="RegisterGroup_Click"
            Theme="Moderno"></dx:ASPxButton>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
              SelectCommand="SELECT ID, Name, Comments FROM tblGroup">
         </asp:SqlDataSource>

    </asp:Panel>


        <asp:Label ID="lblDID" runat="server" Text="" Visible="false"></asp:Label>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

