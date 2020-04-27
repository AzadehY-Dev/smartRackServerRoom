  <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ChangeReq.aspx.cs" Inherits="ChangeReq" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
 
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--       <script type="text/javascript">
           function gridusers_SelectionChanged(s, e) {
               s.GetSelectedFieldValues("Name", GetSelectedFieldValuesCallback);
           }
           function GetSelectedFieldValuesCallback(values) {
               selList.BeginUpdate();
               try {
                   selList.ClearItems();
                   for (var i = 0; i < values.length; i++) {
                       selList.AddItem(values[i]);
                   }
               } finally {
                   selList.EndUpdate();
               }
               document.getElementById("selCount").innerHTML = gridusers.GetSelectedRowCount();
           }
    </script>--%>
    <%--<script type="text/javascript">
        function gridusers2_SelectionChanged(s, e) {
            s.GetSelectedFieldValues("Name", GetSelectedFieldValuesCallback);
        }
        function GetSelectedFieldValuesCallback(values) {
            selList2.BeginUpdate();
            try {
                selList2.ClearItems();
                for (var i = 0; i < values.length; i++) {
                    selList2.AddItem(values[i]);
                }
            } finally {
                selList2.EndUpdate();
            }
            document.getElementById("selCount2").innerHTML = gridusers2.GetSelectedRowCount();
        }
    </script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

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
                  <li class="active">
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
            ID="CR"><image tooltip="Change Request" 
            url="assets/img/change.png" />
            </dx:GridViewCommandColumnCustomButton>
              <dx:GridViewCommandColumnCustomButton 
            ID="ListCR"><image tooltip="List of CRs" 
            url="assets/img/list.png" />
            </dx:GridViewCommandColumnCustomButton>
                 <dx:GridViewCommandColumnCustomButton 
            ID="ListDCR"><image tooltip="List of done CRs" 
            url="assets/img/donechange.png" />
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



    <asp:Panel ID="pnlDonecr" runat="server" Visible="false" ><%--Visible="false"--%>
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource9" EnableCallBacks="False"
            OnCustomButtonCallback="gridCRs_CustomButtonCallback"
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
         <dx:GridViewDataTextColumn FieldName="Issue" VisibleIndex="1">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="digitals" VisibleIndex="2">
         </dx:GridViewDataTextColumn>
          <dx:GridViewDataDateColumn FieldName="Date" VisibleIndex="3">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Time" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="5">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Destenation" ReadOnly="True" VisibleIndex="6">
         </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="Source" ReadOnly="True" VisibleIndex="7">
         </dx:GridViewDataTextColumn>
      
    </Columns>
        <SettingsPager Mode="ShowAllRecords" />
        </dx:ASPxGridView>
                   <asp:SqlDataSource ID="SqlDataSource9" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"  OnDeleting="SqlDataSource7_Deleting"
    SelectCommand="SELECT d.NameD, cr.Issue, cr.digitals, cr.MACAddress, (SELECT NameD FROM tblDevice WHERE (idD = cr.IDDest)) AS Destenation, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDSource)) AS Source, cr.id, cr.Date, cr.Time FROM tblChangeReq AS cr INNER JOIN tblDevice AS d ON cr.IDD = d.idD WHERE (cr.IDD = @IDD) AND (cr.Done = 1) ORDER BY cr.id DESC">
                       <SelectParameters>
                           <asp:ControlParameter ControlID="lblID" Name="IDD" PropertyName="Text" />
                       </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="Label1" runat="server" Text="" Visible="false"></asp:Label>
    </asp:Panel>

    <asp:Panel ID="pnlManageCR" runat="server" Visible="false" ><%--Visible="false"--%>
            <dx:ASPxGridView ID="gridCRs" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource7" EnableCallBacks="False"
            OnCustomButtonCallback="gridCRs_CustomButtonCallback" KeyFieldName="id"
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
             ShowDeleteButton="True"
            ShowNewButtonInHeader="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
                     <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24">
        <custombuttons>
           <dx:GridViewCommandColumnCustomButton 
            ID="users"><image tooltip="Change Request's users" 
            url="assets/img/users.png" />
            </dx:GridViewCommandColumnCustomButton>
        </custombuttons></dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="TimeStart" VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="DateStart" VisibleIndex="12">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="TimeFinish" VisibleIndex="13">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataDateColumn FieldName="DateFinish" VisibleIndex="14">
        </dx:GridViewDataDateColumn>
        <dx:GridViewDataTextColumn FieldName="Issue" VisibleIndex="15">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="digitals" VisibleIndex="16">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="17">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Destenation" ReadOnly="True" VisibleIndex="18">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Source" ReadOnly="True" VisibleIndex="19">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="20" Visible="false">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
        <SettingsPopup>
            <EditForm Width="600" />
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />
        </dx:ASPxGridView>
                   <asp:SqlDataSource ID="SqlDataSource7" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
    DeleteCommand="DELETE FROM tblChangeReq WHERE (id = @id) and ([Done] is null or [Done]=0)"  OnDeleting="SqlDataSource7_Deleting"
    SelectCommand="SELECT d.NameD, cr.TimeStart, cr.DateStart, cr.TimeFinish, cr.DateFinish, cr.Issue, cr.digitals, cr.MACAddress, (SELECT NameD FROM tblDevice WHERE (idD = cr.IDDest)) AS Destenation, (SELECT NameD FROM tblDevice AS tblDevice_1 WHERE (idD = cr.IDSource)) AS Source, cr.id FROM tblChangeReq AS cr INNER JOIN tblDevice AS d ON cr.IDD = d.idD WHERE (cr.IDD = @IDD) and cr.Done=0 order by id desc">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
                       <SelectParameters>
                           <asp:ControlParameter ControlID="lblID" Name="IDD" PropertyName="Text" />
                       </SelectParameters>
        </asp:SqlDataSource>
        <asp:Label ID="lblcrid" runat="server" Text="" Visible="false"></asp:Label>
    </asp:Panel>
    <asp:Panel ID="pnlusers" runat="server" Visible="false" ><%--Visible="false"--%>
            <dx:ASPxGridView ID="gridCrusers" runat="server" AutoGenerateColumns="False"
                 DataSourceID="SqlDataSource8" EnableCallBacks="False" KeyFieldName="id"
        
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
         <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
         </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" VisibleIndex="4" Visible="false">
             <EditFormSettings Visible="False" />
         </dx:GridViewDataTextColumn>
    </Columns>
    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
        <SettingsPopup>
            <EditForm Width="600" />
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />
        </dx:ASPxGridView>
                   <asp:SqlDataSource ID="SqlDataSource8" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
    DeleteCommand="DELETE FROM tblCrUser WHERE (id = @id)" 
    SelectCommand="SELECT u.Name, u.lastName, u.RFID, cu.id FROM tblCrUser AS cu INNER JOIN tblusers AS u ON u.idUser = cu.idUser WHERE (cu.idCr = @idCr)">
        <DeleteParameters>
            <asp:Parameter Name="id" />
        </DeleteParameters>
                       <SelectParameters>
                           <asp:ControlParameter ControlID="lblcrid" Name="idCr" PropertyName="Text" />
                       </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlcr" runat="server" Visible="false" >
        <table>
            <tr>
                <td>
                    Issue:
                </td>
                <td colspan="4">
                    <dx:ASPxComboBox ID="cmbissue" runat="server" AutoPostBack="true" ValueType="System.String" 
                        OnSelectedIndexChanged="cmbissue_SelectedIndexChanged">
                        <Items>
                            <dx:ListEditItem Text="Clean up" Selected="true" Value="c" ImageUrl="assets/img/userother.png" />
                            <dx:ListEditItem Text="Move" Value="m" ImageUrl="assets/img/userservice.png" />
                            <dx:ListEditItem Text="Remove" Value="r" ImageUrl="assets/img/userservice.png" />
                            <dx:ListEditItem Text="Add" Value="p" ImageUrl="assets/img/userservice.png" />
                        </Items>
                    </dx:ASPxComboBox>
               <%--     <asp:TextBox ID="txtIssue" runat="server" TextMode="MultiLine" Width="700px"
                         Height="70px"></asp:TextBox>--%>
                </td>
            </tr>
            
            
            <tr><td><br /></td></tr>
               <tr>
                <td>
                    Start time:
                </td>
                  <td>
                      <asp:DropDownList ID="ddpsHour" runat="server"><asp:ListItem Text="0"></asp:ListItem>
                          <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                                   <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  
                      </asp:DropDownList>
                      :
                       <asp:DropDownList ID="ddpsminutes" runat="server">
                           <asp:ListItem Text="0"></asp:ListItem> 
                                <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                           <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  <asp:ListItem Text="24"></asp:ListItem>
                              <asp:ListItem Text="25"></asp:ListItem>  <asp:ListItem Text="26"></asp:ListItem>  <asp:ListItem Text="27"></asp:ListItem>
                            <asp:ListItem Text="28"></asp:ListItem>  <asp:ListItem Text="29"></asp:ListItem>  <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="31"></asp:ListItem>  <asp:ListItem Text="32"></asp:ListItem>  <asp:ListItem Text="33"></asp:ListItem>
                           <asp:ListItem Text="34"></asp:ListItem>  <asp:ListItem Text="35"></asp:ListItem>  <asp:ListItem Text="36"></asp:ListItem>
                           <asp:ListItem Text="37"></asp:ListItem>  <asp:ListItem Text="38"></asp:ListItem> 
                           <asp:ListItem Text="39"></asp:ListItem> <asp:ListItem Text="40"></asp:ListItem>
                           <asp:ListItem Text="41"></asp:ListItem>  <asp:ListItem Text="42"></asp:ListItem>  <asp:ListItem Text="43"></asp:ListItem>
                             <asp:ListItem Text="44"></asp:ListItem>  <asp:ListItem Text="45"></asp:ListItem>  <asp:ListItem Text="46"></asp:ListItem>
                             <asp:ListItem Text="47"></asp:ListItem>  <asp:ListItem Text="48"></asp:ListItem>   <asp:ListItem Text="49"></asp:ListItem> 
                            <asp:ListItem Text="50"></asp:ListItem>
                             <asp:ListItem Text="51"></asp:ListItem>  <asp:ListItem Text="52"></asp:ListItem>  <asp:ListItem Text="53"></asp:ListItem>
                            <asp:ListItem Text="54"></asp:ListItem>  <asp:ListItem Text="55"></asp:ListItem>  <asp:ListItem Text="56"></asp:ListItem>
                            <asp:ListItem Text="57"></asp:ListItem>  <asp:ListItem Text="58"></asp:ListItem>  <asp:ListItem Text="59"></asp:ListItem>
                       </asp:DropDownList>
                </td>
                      
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                  <td>
                    End time:
                </td>
                  <td>
                       <asp:DropDownList ID="ddpEhour" runat="server">
                         <asp:ListItem Text="0"></asp:ListItem>
                          <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                                  <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem> 
                           </asp:DropDownList> 
                      :
                       <asp:DropDownList ID="ddpEMinutes" runat="server">
                           <asp:ListItem Text="0"></asp:ListItem> 
                                <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                           <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  <asp:ListItem Text="24"></asp:ListItem>
                              <asp:ListItem Text="25"></asp:ListItem>  <asp:ListItem Text="26"></asp:ListItem>  <asp:ListItem Text="27"></asp:ListItem>
                            <asp:ListItem Text="28"></asp:ListItem>  <asp:ListItem Text="29"></asp:ListItem>  <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="31"></asp:ListItem>  <asp:ListItem Text="32"></asp:ListItem>  <asp:ListItem Text="33"></asp:ListItem>
                           <asp:ListItem Text="34"></asp:ListItem>  <asp:ListItem Text="35"></asp:ListItem>  <asp:ListItem Text="36"></asp:ListItem>
                           <asp:ListItem Text="37"></asp:ListItem>  <asp:ListItem Text="38"></asp:ListItem> 
                           <asp:ListItem Text="39"></asp:ListItem> <asp:ListItem Text="40"></asp:ListItem>
                           <asp:ListItem Text="41"></asp:ListItem>  <asp:ListItem Text="42"></asp:ListItem>  <asp:ListItem Text="43"></asp:ListItem>
                             <asp:ListItem Text="44"></asp:ListItem>  <asp:ListItem Text="45"></asp:ListItem>  <asp:ListItem Text="46"></asp:ListItem>
                             <asp:ListItem Text="47"></asp:ListItem>  <asp:ListItem Text="48"></asp:ListItem>   <asp:ListItem Text="49"></asp:ListItem> 
                            <asp:ListItem Text="50"></asp:ListItem>
                             <asp:ListItem Text="51"></asp:ListItem>  <asp:ListItem Text="52"></asp:ListItem>  <asp:ListItem Text="53"></asp:ListItem>
                            <asp:ListItem Text="54"></asp:ListItem>  <asp:ListItem Text="55"></asp:ListItem>  <asp:ListItem Text="56"></asp:ListItem>
                            <asp:ListItem Text="57"></asp:ListItem>  <asp:ListItem Text="58"></asp:ListItem>  <asp:ListItem Text="59"></asp:ListItem>
                       </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>
            <tr>
                <td>
                    Start Date:
                </td>
                  <td>
                      <dx:ASPxCalendar ID="calfrom" runat="server" Theme="Office2003Blue" ></dx:ASPxCalendar>
                </td>
                      
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                  <td>
                    End Date:
                </td>
                  <td>
                      <dx:ASPxCalendar ID="calto" runat="server" Theme="Office2003Blue"></dx:ASPxCalendar>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
                
            </tr>
            <tr>
            <%--  <td colspan="2">
<div style="width:200px;">
        <div class="BottomPadding">
            Selected Users:
        </div>
        <dx:ASPxListBox ID="ASPxListBox1" ClientInstanceName="selList" runat="server" Height="300px"
            Width="100%" Theme="Office2003Blue" />
        <div class="TopPadding">
            Selected count: <span id="selCount" style="font-weight: bold">0</span>
        </div>
    </div>
              </td>--%>
             <td>
                 Legal Users:
             </td>
              <td colspan="4">

        <dx:ASPxGridView ID="gridusers" ClientInstanceName="gridusers" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource2" KeyFieldName="idUser" Theme="Office2003Blue">
            <SettingsBehavior AllowFocusedRow="True" />
            <Columns>
            <%--     <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>--%>
                <dx:GridViewDataTextColumn FieldName="idUser" ReadOnly="True" Visible="false" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="4" Width="100px">
                </dx:GridViewDataTextColumn>
              <%--  <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="6">
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
             <%--   <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="10">
                </dx:GridViewDataTextColumn>--%>
            </Columns>
          <%--  <ClientSideEvents SelectionChanged="gridusers_SelectionChanged" />--%>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
             ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
             SelectCommand="SELECT idUser, RFID, username, Name+' '+ lastName as Name FROM tblusers where username<>'host'"></asp:SqlDataSource>
              </td>
          </tr>
         <asp:Panel ID="pnlDeviceIO" runat="server" Visible="false" >
                <tr>
                <td>
                    <br />
                    Digital Input:
                </td>
                <td colspan="4">
                      <br />
                    <dx:ASPxGridView ID="gridDeviceIO" runat="server" KeyFieldName="ID" Width="600px"
                         AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="Office2003Blue">
                          <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                           <%-- <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>--%>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True"
                                 VisibleIndex="1" Visible="false">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                          <dx:GridViewDataCheckColumn FieldName="Exist" Caption="Exist" Width="85px" VisibleIndex="7">
                         <PropertiesCheckEdit UseDisplayImages="true" ValueChecked="False" ValueUnchecked="True"></PropertiesCheckEdit>
                     </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                        SelectCommand="SELECT ID, Name, Type, Exist, MACAddress FROM tblDeviceIO WHERE (IDD = @IDD) and (Type LIKE 'D%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblID" Name="IDD" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <asp:Panel ID="pnlMac" runat="server" Visible="false" >
             <tr>
                 <td>
                      <br />
                    Mac address:
                 </td>
                 <td>  <br />
                     <asp:TextBox ID="txtmacAddress" runat="server"></asp:TextBox>
                 </td>
                 
             </tr>
                </asp:Panel>
            </asp:Panel>
            <asp:Panel ID="pnlDevice2" runat="server" Visible="false">
                                       <asp:ScriptManager ID="ScriptManager1" runat="server" />
              <asp:UpdatePanel ID="UpdatePanel1" runat="server">
      <ContentTemplate>
                 <tr><td><br /></td></tr>
            <tr><td colspan="5" style="text-align:center;">
                <img src="assets/img/line.png" /></td></tr>
                  <tr><td><br /></td></tr>
                <tr>
                     <td>
                   Destnation:
                </td>
                  <td colspan="4">
                      <dx:ASPxGridView ID="gridDevice2" Width="600px" runat="server" AutoGenerateColumns="False"
        KeyFieldName="idD" DataSourceID="SqlDataSource5" EnableCallBacks="False"
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
    </Columns>
        <SettingsPager Mode="ShowAllRecords" />
        </dx:ASPxGridView>
                      <asp:SqlDataSource ID="SqlDataSource5" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
    SelectCommand="SELECT * FROM [tblDevice]" >
        </asp:SqlDataSource>
                      <asp:ImageButton ID="btnrefresh"  OnClick="btnrefresh_Click"
                          ImageUrl="~/assets/img/refresh.png" runat="server" />
           <%--           <img src="assets/img/refresh.png" />--%>
                      </td>
                </tr>
                  <tr><td><br /></td></tr>
               <tr>
                <td>
                    Start time:
                </td>
                  <td>
                      <asp:DropDownList ID="ddp2shour" runat="server"><asp:ListItem Text="0"></asp:ListItem>
                          <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                                   <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  
                      </asp:DropDownList>
                      :
                       <asp:DropDownList ID="ddp2sMin" runat="server">
                           <asp:ListItem Text="0"></asp:ListItem> 
                                <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                           <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  <asp:ListItem Text="24"></asp:ListItem>
                              <asp:ListItem Text="25"></asp:ListItem>  <asp:ListItem Text="26"></asp:ListItem>  <asp:ListItem Text="27"></asp:ListItem>
                            <asp:ListItem Text="28"></asp:ListItem>  <asp:ListItem Text="29"></asp:ListItem>  <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="31"></asp:ListItem>  <asp:ListItem Text="32"></asp:ListItem>  <asp:ListItem Text="33"></asp:ListItem>
                           <asp:ListItem Text="34"></asp:ListItem>  <asp:ListItem Text="35"></asp:ListItem>  <asp:ListItem Text="36"></asp:ListItem>
                           <asp:ListItem Text="37"></asp:ListItem>  <asp:ListItem Text="38"></asp:ListItem> 
                           <asp:ListItem Text="39"></asp:ListItem> <asp:ListItem Text="40"></asp:ListItem>
                           <asp:ListItem Text="41"></asp:ListItem>  <asp:ListItem Text="42"></asp:ListItem>  <asp:ListItem Text="43"></asp:ListItem>
                             <asp:ListItem Text="44"></asp:ListItem>  <asp:ListItem Text="45"></asp:ListItem>  <asp:ListItem Text="46"></asp:ListItem>
                             <asp:ListItem Text="47"></asp:ListItem>  <asp:ListItem Text="48"></asp:ListItem>   <asp:ListItem Text="49"></asp:ListItem> 
                            <asp:ListItem Text="50"></asp:ListItem>
                             <asp:ListItem Text="51"></asp:ListItem>  <asp:ListItem Text="52"></asp:ListItem>  <asp:ListItem Text="53"></asp:ListItem>
                            <asp:ListItem Text="54"></asp:ListItem>  <asp:ListItem Text="55"></asp:ListItem>  <asp:ListItem Text="56"></asp:ListItem>
                            <asp:ListItem Text="57"></asp:ListItem>  <asp:ListItem Text="58"></asp:ListItem>  <asp:ListItem Text="59"></asp:ListItem>
                       </asp:DropDownList>
                </td>
                      
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                  <td>
                    End time:
                </td>
                  <td>
                       <asp:DropDownList ID="ddp2Ehour" runat="server">
                         <asp:ListItem Text="0"></asp:ListItem>
                          <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                                  <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem> 
                           </asp:DropDownList> 
                      :
                       <asp:DropDownList ID="ddp2Emin" runat="server">
                           <asp:ListItem Text="0"></asp:ListItem> 
                                <asp:ListItem Text="1"></asp:ListItem>  <asp:ListItem Text="2"></asp:ListItem>  <asp:ListItem Text="3"></asp:ListItem>
                           <asp:ListItem Text="4"></asp:ListItem>  <asp:ListItem Text="5"></asp:ListItem>  <asp:ListItem Text="6"></asp:ListItem>
                             <asp:ListItem Text="7"></asp:ListItem>  <asp:ListItem Text="8"></asp:ListItem>  <asp:ListItem Text="9"></asp:ListItem>
                             <asp:ListItem Text="10"></asp:ListItem>  <asp:ListItem Text="11"></asp:ListItem>  <asp:ListItem Text="12"></asp:ListItem>
                           <asp:ListItem Text="13"></asp:ListItem>  <asp:ListItem Text="14"></asp:ListItem>  <asp:ListItem Text="15"></asp:ListItem>
                           <asp:ListItem Text="16"></asp:ListItem>  <asp:ListItem Text="17"></asp:ListItem>  <asp:ListItem Text="18"></asp:ListItem>
                             <asp:ListItem Text="19"></asp:ListItem>  <asp:ListItem Text="20"></asp:ListItem>  <asp:ListItem Text="21"></asp:ListItem>
                             <asp:ListItem Text="22"></asp:ListItem>  <asp:ListItem Text="23"></asp:ListItem>  <asp:ListItem Text="24"></asp:ListItem>
                              <asp:ListItem Text="25"></asp:ListItem>  <asp:ListItem Text="26"></asp:ListItem>  <asp:ListItem Text="27"></asp:ListItem>
                            <asp:ListItem Text="28"></asp:ListItem>  <asp:ListItem Text="29"></asp:ListItem>  <asp:ListItem Text="30"></asp:ListItem>
                            <asp:ListItem Text="31"></asp:ListItem>  <asp:ListItem Text="32"></asp:ListItem>  <asp:ListItem Text="33"></asp:ListItem>
                           <asp:ListItem Text="34"></asp:ListItem>  <asp:ListItem Text="35"></asp:ListItem>  <asp:ListItem Text="36"></asp:ListItem>
                           <asp:ListItem Text="37"></asp:ListItem>  <asp:ListItem Text="38"></asp:ListItem> 
                           <asp:ListItem Text="39"></asp:ListItem> <asp:ListItem Text="40"></asp:ListItem>
                           <asp:ListItem Text="41"></asp:ListItem>  <asp:ListItem Text="42"></asp:ListItem>  <asp:ListItem Text="43"></asp:ListItem>
                             <asp:ListItem Text="44"></asp:ListItem>  <asp:ListItem Text="45"></asp:ListItem>  <asp:ListItem Text="46"></asp:ListItem>
                             <asp:ListItem Text="47"></asp:ListItem>  <asp:ListItem Text="48"></asp:ListItem>   <asp:ListItem Text="49"></asp:ListItem> 
                            <asp:ListItem Text="50"></asp:ListItem>
                             <asp:ListItem Text="51"></asp:ListItem>  <asp:ListItem Text="52"></asp:ListItem>  <asp:ListItem Text="53"></asp:ListItem>
                            <asp:ListItem Text="54"></asp:ListItem>  <asp:ListItem Text="55"></asp:ListItem>  <asp:ListItem Text="56"></asp:ListItem>
                            <asp:ListItem Text="57"></asp:ListItem>  <asp:ListItem Text="58"></asp:ListItem>  <asp:ListItem Text="59"></asp:ListItem>
                       </asp:DropDownList>
                </td>
            </tr>
            <tr><td><br /></td></tr>
            <tr>
                <td>
                    Start Date:
                </td>
                  <td>
                      <dx:ASPxCalendar ID="calfrom2" runat="server" Theme="Office2003Blue" ></dx:ASPxCalendar>
                </td>
                      
                <td>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
                  <td>
                    End Date:
                </td>
                  <td>
                      <dx:ASPxCalendar ID="calto2" runat="server" Theme="Office2003Blue"></dx:ASPxCalendar>
                </td>
            </tr>
            <tr>
                <td>
                    <br />
                </td>
                
            </tr>
            <tr>
                  <td>
                 Legal Users:
             </td>
<%--              <td colspan="2">
<div style="width:200px;">
        <div class="BottomPadding">
            Selected Users:
        </div>
        <dx:ASPxListBox ID="ASPxListBox2" ClientInstanceName="selList2" runat="server" Height="300px"
            Width="100%" Theme="Office2003Blue" />
        <div class="TopPadding">
            Selected count: <span id="selCount2" style="font-weight: bold">0</span>
        </div>
    </div>
              </td>--%>
             
              <td colspan="4">
<div style="width:500px;">
        <dx:ASPxGridView ID="gridusers2" ClientInstanceName="gridusers2" runat="server" Width="100%" 
            AutoGenerateColumns="False" DataSourceID="SqlDataSource4" KeyFieldName="idUser" Theme="Office2003Blue">
                 <SettingsBehavior AllowFocusedRow="True" />
            <Columns>
               <%--  <dx:GridViewCommandColumn ShowSelectCheckbox="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>--%>
                <dx:GridViewDataTextColumn FieldName="idUser" ReadOnly="True" Visible="false" VisibleIndex="2">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
              <%--  <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="6">
                </dx:GridViewDataTextColumn>--%>
                <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
             <%--   <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="10">
                </dx:GridViewDataTextColumn>--%>
            </Columns>
    <%--        <ClientSideEvents SelectionChanged="gridusers2_SelectionChanged" />--%>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"
             ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
             SelectCommand="SELECT idUser, RFID, username, Name+' '+ lastName as Name FROM tblusers where username<>'host'"></asp:SqlDataSource>
    </div>
              </td>
          </tr>
        
                <tr>
                <td>
                    <br />
                    Digital Input:
                </td>
                <td colspan="4">
                      <br />

                    <dx:ASPxGridView ID="griddigital2" runat="server" KeyFieldName="ID" Width="600px"
                         AutoGenerateColumns="False" DataSourceID="SqlDataSource6" Theme="Office2003Blue">
                          <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
                        <Columns>
                           <%-- <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" ShowSelectCheckbox="True" VisibleIndex="0">
                            </dx:GridViewCommandColumn>--%>
                            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True"
                                 VisibleIndex="1" Visible="false">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                             <dx:GridViewDataCheckColumn FieldName="Exist" Caption="Exist" Width="85px" VisibleIndex="7">
                         <PropertiesCheckEdit UseDisplayImages="true" ValueChecked="False" ValueUnchecked="True"></PropertiesCheckEdit>
                     </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                       <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                        SelectCommand="SELECT ID, Name, Type, Exist, MACAddress FROM tblDeviceIO WHERE (IDD = @IDD) and (Type LIKE 'D%')">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lblID2" Name="IDD" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
           
                </td>
            </tr>
                              </ContentTemplate>
   </asp:UpdatePanel>
           </asp:Panel>
        
             <asp:Panel ID="pnlNameofdevice" runat="server" Visible="false" >
             <tr>
                 <td>
                      <br />
                    Name:
                 </td>
                 <td>  <br />
                     <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                 </td>
                 
             </tr>
                </asp:Panel>
          </table>
      <table>
          
      </table>
    <br />
        <dx:ASPxButton ID="btnreg" runat="server" Text="Submit" Theme="Moderno" OnClick="btnreg_Click"></dx:ASPxButton>
    </asp:Panel>
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
      <asp:Label ID="lblID2" runat="server" Text="" Visible="false"></asp:Label>
<%--                               <div class="row">
                                <div class="col-md-2 col-md-offset-3">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('top','left')">Top Left</button>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('top','center')">Top Center</button>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('top','right')">Top Right</button>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2 col-md-offset-3">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','left')">Bottom Left</button>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','center')">Bottom Center</button>
                                </div>
                                <div class="col-md-2">
                                    <button class="btn btn-default btn-block" onclick="demo.showNotification('bottom','right')">Bottom Right</button>
                                </div>
                            </div>--%>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

<%--<asp:Button ID="Button1" runat="server" Text="Refresh" OnClick="Button1_Click" />
    <asp:ScriptManager ID="ScriptManager1" runat="server"/>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="Button1" EventName="Click" />
  </Triggers>
  <ContentTemplate>
      <asp:Label runat="server" ID="label1" Text="" Visible="false">sadujgadfjhaf</asp:Label>
    <span><%= DateTime.Now %></span>
  </ContentTemplate>
</asp:UpdatePanel>
    <asp:Button ID="Button2" runat="server" Text="Refresh" OnClick="Button2_Click" />
    <dx:ASPxCalendar ID="ASPxCalendar1" runat="server"></dx:ASPxCalendar>
<asp:UpdatePanel ID="UpdatePanel2" runat="server">
  <Triggers>
    <asp:AsyncPostBackTrigger ControlID="Button2" EventName="Click" />
  </Triggers>
  <ContentTemplate>
      <asp:Label runat="server" ID="label2" Text="" Visible="false">45454454545454545</asp:Label>
    <span><%= DateTime.Now %></span>
  </ContentTemplate>
</asp:UpdatePanel>--%>
