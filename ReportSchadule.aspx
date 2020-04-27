<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportSchadule.aspx.cs" Inherits="ReportSchadule" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="menu" Runat="Server">
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
                  <li>
                    <a href="Maininfo.aspx">
                        <i class="pe-7s-note2"></i>
                        <p>Main info</p>
                    </a>
                </li>
                <li  class="active">
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
<asp:Content ID="Content3" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
    <asp:Panel ID="pnlReports" runat="server">
    <dx:ASPxGridView ID="gridReports" runat="server" AutoGenerateColumns="False"
         DataSourceID="SqlDataSource1" Theme="Office2003Blue"
           OnCustomButtonCallback="gridReports_CustomButtonCallback"
        KeyFieldName="id"
         EnableCallBacks="False">
        <Settings ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="true" />
        <Columns>
               <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="150px">
        <custombuttons>
            <dx:GridViewCommandColumnCustomButton 
            ID="Users"><image tooltip="Add users" 
            url="assets/img/Users.png" />
            </dx:GridViewCommandColumnCustomButton>  
        </custombuttons></dx:GridViewCommandColumn>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="1" Visible="false">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
               <dx:GridViewDataComboBoxColumn FieldName="ReportName" VisibleIndex="2">
                    <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Alarms" Value="Alarms"  />
                             <dx:ListEditItem Text="Enter and exit" Value="Enter and exit"  />
                      <%--      <dx:ListEditItem  Text="Authorized enter and exit" Value="Authorized enter and exit" />
                            <dx:ListEditItem Text="Unauthorized enter and exit" Value="Unauthorized enter and exit"  />--%>
                               <dx:ListEditItem Text="Remove items"  Value="Remove items" />
                               <dx:ListEditItem Text="Add items" Value="Add items"  />
                              <dx:ListEditItem Text="Clean up racks"  Value="Clean up racks" />
                               <dx:ListEditItem Text="List of invertory" Value="List of invertory" />
                             <dx:ListEditItem  Text="List of items" Value="List of items" />
                            <dx:ListEditItem Text="List of Mac addresses"  Value="List of Mac addresses" />
                               <dx:ListEditItem Text="SuccessFull Replacment" Value="SuccessFull Replacment" />
                           <%--    <dx:ListEditItem Text="unuccessFull Replacment" Value="unuccessFull Replacment" />
                               <dx:ListEditItem Text="unuccessFull Replacment(done in source)" Value="unuccessFull Replacment(done in source)" />--%>
                            
                            
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataCheckColumn FieldName="Daily" VisibleIndex="3">
            </dx:GridViewDataCheckColumn>
            <dx:GridViewDataTextColumn FieldName="TimeForDaily" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataCheckColumn FieldName="Weekly" VisibleIndex="5">
            </dx:GridViewDataCheckColumn>
         <%--   <dx:GridViewDataCheckColumn FieldName="Mounthly" VisibleIndex="6">
            </dx:GridViewDataCheckColumn>--%>
               <dx:GridViewDataComboBoxColumn FieldName="DayOfWeek" VisibleIndex="7">
                    <PropertiesComboBox TextField="DayName" ValueField="DayID" ValueType="System.String">
                        <Items>
                            <dx:ListEditItem Text="Saturday" Value="Saturday" />
                            <dx:ListEditItem Text="Sunday" Value="Sunday" />
                            <dx:ListEditItem  Text="Monday" Value="Monday" />
                            <dx:ListEditItem Text="Tuesday" Value="Tuesday"  />
                            <dx:ListEditItem  Text="Wednesday" Value="Wednesday" /> 
                            <dx:ListEditItem Text="Thursday" Value="Thursday" />
                            <dx:ListEditItem  Text="Friday"  Value="Friday"/>
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
  
            <dx:GridViewDataTextColumn FieldName="TimeForWeekly" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" DeleteCommand="DELETE FROM tblReportSchedule WHERE (id = @id)" InsertCommand="INSERT INTO tblReportSchedule(ReportName, Daily, TimeForDaily, Weekly, Mounthly, DayOfWeek, TimeForWeekly) VALUES (@ReportName, @Daily, @TimeForDaily, @Weekly, @Mounthly, @DayOfWeek, @TimeForWeekly)" SelectCommand="SELECT id, ReportName, Daily, TimeForDaily, Weekly, Mounthly, DayOfWeek, TimeForWeekly FROM tblReportSchedule" UpdateCommand="UPDATE tblReportSchedule SET ReportName = @ReportName, Daily = @Daily, TimeForDaily = @TimeForDaily, Weekly = @Weekly, Mounthly = @Mounthly, DayOfWeek = @DayOfWeek, TimeForWeekly = @TimeForWeekly WHERE (id = @id)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="ReportName" />
            <asp:Parameter Name="Daily" />
            <asp:Parameter Name="TimeForDaily" />
            <asp:Parameter Name="Weekly" />
            <asp:Parameter Name="Mounthly" />
            <asp:Parameter Name="DayOfWeek" />
            <asp:Parameter Name="TimeForWeekly" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="ReportName" />
            <asp:Parameter Name="Daily" />
            <asp:Parameter Name="TimeForDaily" />
            <asp:Parameter Name="Weekly" />
            <asp:Parameter Name="Mounthly" />
            <asp:Parameter Name="DayOfWeek" />
            <asp:Parameter Name="TimeForWeekly" />
            <asp:Parameter Name="id" />
        </UpdateParameters>
    </asp:SqlDataSource>
        </asp:Panel>
     <asp:Panel ID="pnlUsers" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridselectedusers" runat="server" KeyFieldName="ID"  EnableCallBacks="False"
             AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="Office2003Blue">

            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowClearFilterButton="True" ShowDeleteButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cell" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BEmail" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="BCell" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>

        </dx:ASPxGridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" DeleteCommand="DELETE FROM tblUsersGroups WHERE (ID = @ID)" 
                 SelectCommand="SELECT ru.ID, u.Name, u.lastName, u.Photo, u.Email, u.Cell, u.BEmail, u.BCell FROM tblReportUsers ru INNER JOIN tblReportSchedule r on ru.IDr=r.id inner join tblusers u on u.idUser=ru.IDu where IDr=@IDr">
                 <DeleteParameters>
                     <asp:Parameter Name="ID" />  
                 </DeleteParameters>
                 <SelectParameters>
                     <asp:ControlParameter ControlID="lblID" Name="IDr" PropertyName="Text" />
                 </SelectParameters>
        </asp:SqlDataSource><br />
             <dx:ASPxButton ID="btnaddusers" runat="server" Text="Add users"
                  OnClick="btnaddusers_Click"></dx:ASPxButton>
    </asp:Panel>
    <asp:Panel ID="pnlAddUsers" runat="server" Visible="false">
         <%--  <br />
          <dx:ASPxListBox ID="ASPxListBox1" ClientInstanceName="selList" runat="server" Height="250px"
            Width="100%" />
        <div class="TopPadding">
            Selected count: <span id="selCount" style="font-weight: bold">0</span>
        </div><br />--%>
         <dx:ASPxGridView ID="GridAddUsers" EnableCallBacks="False" runat="server" 
         Font-Size="Small" KeyFieldName="idUser"
        AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource2" Theme="Office2003Blue" >
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
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Cell" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BEmail" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="BCell" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="idUser" ReadOnly="True" Visible="false" VisibleIndex="7">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns> <%--<ClientSideEvents SelectionChanged="grid_SelectionChanged" />--%>
    </dx:ASPxGridView>
        <br /> 
            <dx:ASPxButton ID="RegisterUsers" runat="server" Text="Register selected users"
                  OnClick="RegisterUsers_Click" 
            Theme="Moderno"></dx:ASPxButton>
         <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
             ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
              SelectCommand="SELECT Name, lastName, Photo, Email, Cell, BEmail, BCell, idUser FROM tblusers where idUser not in
(select IDu from tblReportUsers where IDr=@IDr)">
             <SelectParameters>
                 <asp:ControlParameter ControlID="lblID" Name="IDr" PropertyName="Text" />
             </SelectParameters>
         </asp:SqlDataSource>
    </asp:Panel>
        <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

