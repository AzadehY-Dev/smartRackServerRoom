
<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Device.aspx.cs" Inherits="Device" %>


<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       table td, table td * {
    vertical-align: top;
}
       .corner {
    float:left;
    margin-right:2%;
    border:3px solid #D6D6C2;
    background:#E0E9F8;
    padding: 10px;
    -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;

}

    .corner2 {
    float:left;
    margin-right:2%;
    border:3px solid #D6D6C2;
    background:#f27e7e;
    padding: 10px;

     -moz-border-radius: 10px;
    -webkit-border-radius: 10px;
    border-radius: 10px;

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
                <li class="active">
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
         <%--       <li id="DeviceUsers" runat="server">
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
    <h4 class="title">Device</h4>
    <p class="category">The list of devices is on below gridview. You can add new one, edit or delete devices.</p>
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
        <dx:GridViewCommandColumn
             ShowDeleteButton="True" ShowEditButton="True" 
            ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
         <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px">
        <custombuttons>
           <dx:GridViewCommandColumnCustomButton 
            ID="sensor"><image tooltip="Sensors" 
            url="assets/img/sensor.png" />
            </dx:GridViewCommandColumnCustomButton>
            <%--   <dx:GridViewCommandColumnCustomButton 
            ID="alarm"><image tooltip="Alarm" 
            url="assets/img/alarm.png" />
            </dx:GridViewCommandColumnCustomButton>--%>
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
        <dx:ASPxButton ID="btnSaveAll" runat="server" Text="Save all the changes"
      OnClick="btnSaveAll_Click" Theme="Moderno"></dx:ASPxButton>
    <asp:ImageButton ID="btnExcel" ToolTip="Export to excel" ImageUrl="~/assets/img/excel.png" runat="server" OnClick="btnExcel_Click" />
    <asp:ImageButton ID="btnword" ToolTip="Export to pdf" ImageUrl="~/assets/img/pdf.png" runat="server" OnClick="btnword_Click" />
    
          <dx:ASPxGridViewExporter ID="gridExport" GridViewID="griddevice" runat="server">
           </dx:ASPxGridViewExporter>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
            OnDeleting="SqlDataSource1_Deleting" OnInserted="SqlDataSource1_Inserted"
    DeleteCommand="DELETE FROM tblDevice WHERE (idD = @idD)"
        InsertCommand="INSERT INTO tblDevice(NameD, lat, long, comment,IP,Port) VALUES (@NameD, @lat, @long, @comment,@IP,@Port) SELECT @NewProductID = SCOPE_IDENTITY()" 
    SelectCommand="SELECT * FROM [tblDevice]" 
    UpdateCommand="UPDATE tblDevice SET Port=@Port, NameD = @NameD, lat = @lat, long = @long, comment = @comment, IP=@IP where idD=@idD">
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
        <asp:Parameter Direction="Output" Name="NewProductID" Type="Int32" />
             <%--  <asp:Parameter Name="EmpID" Direction="Output" Type="Int32" Exist="0" />--%>
<%--            <asp:Parameter Name="AnnouncingType" />--%>
        </InsertParameters>
        <UpdateParameters>
            <%--             <asp:Parameter Name="AnnouncingType" />--%>
            <asp:Parameter Name="Port" />
            <asp:Parameter Name="NameD" />
            <asp:Parameter Name="lat" />
            <asp:Parameter Name="long" />
            <asp:Parameter Name="comment" />
            <asp:Parameter Name="IP" />
            <asp:Parameter Name="idD" />
        </UpdateParameters>
        </asp:SqlDataSource>
       <%-- <dx:ASPxLoadingPanel ID="loading" runat="server" Modal="True" 
            Theme="MetropolisBlue"></dx:ASPxLoadingPanel>--%>
        <asp:Label ID="lblInsertid" runat="server" Text="" Visible="false"></asp:Label>
     </asp:Panel>
    <asp:Panel ID="pnlDeviceIO" runat="server" Visible="false">

                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="sds"
                AutoGenerateColumns="False" Theme="Office2003Blue"
                ClientInstanceName="grid" KeyFieldName="ID" >
                        <%--  <SettingsPopup>
            <EditForm Width="600" />
        </SettingsPopup>--%>
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True" />
                        <ClientSideEvents EndCallback="grid_EndCallback" FocusedRowChanged="grid_FocusedRowChanged" RowDblClick="grid_RowDblClick" />
                        <SettingsPager Mode="ShowAllRecords" />
                        <SettingsEditing EditFormColumnCount="3" Mode="Inline" />
                        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
              <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True" />
                <Columns>
                    <dx:GridViewCommandColumn ShowEditButton="True" VisibleIndex="0" Width="85px">
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1" Visible="false">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Type" Width="85px" VisibleIndex="2" ReadOnly="true">
                    </dx:GridViewDataTextColumn>
                     
                     <dx:GridViewDataTextColumn FieldName="Name"  VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="MACAddress" Width="120px" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="IP" Width="89px" VisibleIndex="5">
                     </dx:GridViewDataTextColumn>
                       <dx:GridViewDataComboBoxColumn FieldName="untiSize" VisibleIndex="6" Width="70">
                             <PropertiesComboBox TextField="unitName" ValueField="unitID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem Text="0" Value="0" />
                             <dx:ListEditItem Text="1" Value="1" />
                            <dx:ListEditItem Text="2" Value="2" />
                            <dx:ListEditItem Text="3" Value="3" />
                            <dx:ListEditItem Text="4" Value="4" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                     <dx:GridViewDataCheckColumn FieldName="Exist" Caption="Exist" Width="85px" VisibleIndex="7">
                         <PropertiesCheckEdit UseDisplayImages="true" ValueChecked="False" ValueUnchecked="True"></PropertiesCheckEdit>
                     </dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Checking" Caption="Checking" Width="55px" VisibleIndex="8">
                     </dx:GridViewDataCheckColumn>
                     <dx:GridViewDataCheckColumn FieldName="Alarm" Width="50px" VisibleIndex="9">
                     </dx:GridViewDataCheckColumn>
                      <dx:GridViewDataComboBoxColumn FieldName="OnAction" VisibleIndex="10" Width="100">
                             <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output1 On" Selected="true" Value="1o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output1 Off" Value="1f" />
                           
                            <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output2 On" Selected="true" Value="2o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output2 Off" Value="2f" />
                    
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output3 On" Selected="true" Value="3o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output3 Off" Value="3f" />
                    
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output4 On" Selected="true" Value="4o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output4 Off" Value="4f" />

                            <dx:ListEditItem ImageUrl="assets/img/yc.png" Text="No Action" Selected="true" Value="" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                      <dx:GridViewDataComboBoxColumn FieldName="OffAction" VisibleIndex="11" Width="100">
                           <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output1 On" Selected="true" Value="1o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output1 Off" Value="1f" />
                           
                            <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output2 On" Selected="true" Value="2o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output2 Off" Value="2f" />
                    
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output3 On" Selected="true" Value="3o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output3 Off" Value="3f" />
                    
                             <dx:ListEditItem ImageUrl="assets/img/on.png" Text="Output4 On" Selected="true" Value="4o" />
                            <dx:ListEditItem ImageUrl="assets/img/off.png" Text="Output4 Off" Value="4f" />

                              <dx:ListEditItem ImageUrl="assets/img/yc.png" Text="No Action" Selected="true" Value="" />
                    
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                </Columns>

    </dx:ASPxGridView>
        <asp:SqlDataSource ID="sds" runat="server" OnUpdating="sds_Updating" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
            SelectCommand="SELECT untiSize,OffAction,OnAction, ID, Name, Type, Checking, Alarm, MACAddress, Exist, IP FROM tblDeviceIO WHERE (IDD = @idD)" 
            UpdateCommand="UPDATE tblDeviceIO SET untiSize=@untiSize, OffAction=@OffAction,OnAction=@OnAction, IP=@IP, MACAddress=@MACAddress, Name = @Name, Type = @Type, Checking = @Checking, Alarm = @Alarm, Exist=@Exist, [Status]=@Status WHERE (ID = @ID)" >
            <UpdateParameters>
                <asp:Parameter Name="IP" />
                <asp:Parameter Name="MACAddress" />
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Type" />
                <asp:Parameter Name="Checking" />
                <asp:Parameter Name="Alarm" />
                <asp:Parameter Name="Exist" />
                 <asp:Parameter Name="OffAction" />
                <asp:Parameter Name="untiSize" />
                <asp:Parameter Name="OnAction" />
                   <asp:Parameter Name="ID" />
                 <asp:Parameter Name="Status" />
            </UpdateParameters>
              <SelectParameters>
                     <asp:ControlParameter ControlID="lblDid" Name="idD" PropertyName="Text" />
                 </SelectParameters>
        </asp:SqlDataSource>
         <br /><br />
        <table>
           <%-- <tr>
                <td> Output1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> ON:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txton1on" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td> Output2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> ON:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto2on" runat="server"></asp:TextBox></td>
            </tr>
           <tr>
                <td></td>
                <td> OFF:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto1off" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td></td>
                <td> OFF:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto2off" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><br /></td></tr>
               <tr>
                <td> Output3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> ON:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto3on" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Output4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> ON:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto4on" runat="server"></asp:TextBox></td>
            </tr>
           <tr>
                <td> </td>
                <td> OFF:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto3off" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td></td>
                <td> OFF:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txto4off" runat="server"></asp:TextBox> </td>
            </tr>--%>
         <%--     <tr><td><br /><br /></td></tr>--%>
                        <tr>
                <td> Analog Input1&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Min:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta1min" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td> Analog Input2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Min:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta2min" runat="server"></asp:TextBox></td>
            </tr>
           <tr>
                <td></td>
                <td> Max:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta1max" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td></td>
                <td> Max:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta2max" runat="server"></asp:TextBox></td>
            </tr>
            <tr><td><br /></td></tr>
               <tr>
                <td> Analog Input3&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Min:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta3min" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Analog Input4&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Min:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta4min" runat="server"></asp:TextBox></td>
            </tr>
           <tr>
                <td> </td>
                <td> Max:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta3max" runat="server"></asp:TextBox></td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td></td>
                <td> Max:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txta4max" runat="server"></asp:TextBox> </td>
            </tr>
         <tr><td><br /></td></tr>
                       <tr>
                <td> Internal Temp&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td> Min:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txtinternalmin" runat="server"></asp:TextBox></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
           <tr>
                <td> </td>
                <td> Max:&nbsp;&nbsp;&nbsp;</td>
                <td><asp:TextBox ID="txtinternalmax" runat="server"></asp:TextBox></td>
                <td></td>
                <td></td>
                <td> </td>
                <td></td>
            </tr>
             <tr><td><br /></td></tr>
        <tr><td><dx:ASPxButton ID="btnSave" runat="server" Text="Save" Theme="Moderno" OnClick="btnSave_Click"></dx:ASPxButton></td></tr>
           
        </table>
    </asp:Panel>
    
     <asp:Label ID="lblDid" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

