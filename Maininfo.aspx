<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Maininfo.aspx.cs" Inherits="Maininfo" %>

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
            <%--    <li id="DeviceUsers" runat="server">
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
                  <li  class="active">
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

     <dx:ASPxGridView ID="gridusers" KeyFieldName="ID" runat="server" DataSourceID="sds"
                EnableCallBacks="False" AutoGenerateColumns="False" Theme="Office2003Blue" >
              <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True">
                        </SettingsBehavior>
                <Columns>
                     <dx:GridViewCommandColumn ShowEditButton="True"  VisibleIndex="0">
        </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="1">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                       <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Email"> 
                        <Columns>
            <dx:GridViewDataTextColumn FieldName="EmailHost" Caption="Host" VisibleIndex="2">
                    <EditFormSettings  Caption="Email Host" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmailUsername" Caption="Username" VisibleIndex="3">
                    <EditFormSettings  Caption="Email Username" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="EmailPassword" Visible="false" VisibleIndex="4">
                <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn></Columns>
           </dx:GridViewBandColumn>
                      <dx:GridViewBandColumn Caption="SMS"> 
                        <Columns> 
                            <dx:GridViewDataTextColumn FieldName="SMSNumber" Caption="Number" VisibleIndex="5">
               <EditFormSettings  Caption="SMS Number" />
                                 </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SMSUsername" Caption="Username" VisibleIndex="6">
                 <EditFormSettings  Caption="SMS Username" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="SMSPassword" VisibleIndex="7"  Visible="false">
                 <EditFormSettings Visible="True" />
            </dx:GridViewDataTextColumn>
           </Columns>
           </dx:GridViewBandColumn>
               <%--       <dx:GridViewBandColumn Caption="Time"> 
                        <Columns> 
                        <dx:GridViewDataTextColumn FieldName="TimeToCheck" Caption="Check items" VisibleIndex="7">
               <EditFormSettings  Caption="Time to Check items(Mili Seconds)" />
                              </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TimeToSaveInfo" Caption="Save info" VisibleIndex="7">
                <EditFormSettings  Caption="Time To Save Info(Minutes)" />
                        </dx:GridViewDataTextColumn> 
                             <dx:GridViewDataTextColumn FieldName="TimeToAlarm" Caption="Send Alarm" VisibleIndex="8">
                <EditFormSettings  Caption="Time To Send Alarm(Minutes)" />
                        </dx:GridViewDataTextColumn> 
                        </Columns>
           </dx:GridViewBandColumn>--%>
                        <dx:GridViewDataBinaryImageColumn FieldName="Logo" VisibleIndex="1" Width="100">
                        <PropertiesBinaryImage ImageHeight="100" ImageWidth="100" EnableServerResize="True">
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:GridViewDataBinaryImageColumn>
                </Columns>
                    <SettingsEditing EditFormColumnCount="2" Mode="PopupEditForm" />
        <SettingsPopup>
            <EditForm Width="800" />
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />

    </dx:ASPxGridView>

    <asp:SqlDataSource ID="sds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
            DeleteCommand="DELETE FROM tblMaininfo WHERE (ID = @ID)" 
          InsertCommand="INSERT INTO tblMaininfo(EmailHost, EmailUsername, EmailPassword, SMSUsername, SMSPassword, SMSNumber, Logo, Name) VALUES (@EmailHost, @EmailUsername, @EmailPassword, @SMSUsername, @SMSPassword, @SMSNumber, @Logo, @Name)" 
            SelectCommand="SELECT Top(1) * FROM tblMaininfo" 
        UpdateCommand="UPDATE tblMaininfo SET  Name = @Name, EmailHost = @EmailHost, EmailUsername = @EmailUsername, EmailPassword = @EmailPassword, SMSUsername = @SMSUsername, SMSPassword = @SMSPassword, SMSNumber = @SMSNumber, Logo = @Logo WHERE (ID = @ID)"
            OnInserting="sds_Inserting" OnUpdating="sds_Updating">
                <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32"/>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Logo" Type="Object" />
            <asp:Parameter Name="EmailHost" />
            <asp:Parameter Name="EmailUsername" />
            <asp:Parameter Name="EmailPassword" />
            <asp:Parameter Name="SMSUsername" />
            <asp:Parameter Name="SMSPassword" />
            <asp:Parameter Name="SMSNumber" />
            <asp:Parameter Name="Name" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Logo" Type="Object"/>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="EmailHost" />
            <asp:Parameter Name="EmailUsername" />
            <asp:Parameter Name="EmailPassword" />
            <asp:Parameter Name="SMSUsername" />
            <asp:Parameter Name="SMSPassword" />
            <asp:Parameter Name="SMSNumber" />
            <asp:Parameter Name="ID" Type="Int32"/>
        </UpdateParameters>
        </asp:SqlDataSource>
      
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

