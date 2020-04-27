<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Reports" %>

<%@ Register Assembly="Stimulsoft.Report.Web, Version=2015.1.0.0, Culture=neutral, PublicKeyToken=ebe6666cba19647a" Namespace="Stimulsoft.Report.Web" TagPrefix="cc1" %>
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
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">


        <asp:Panel ID="pnlDateandButton" runat="server">
  <table>
      <tr>
          <td>
              &nbsp;&nbsp; From :&nbsp;&nbsp;&nbsp;
          </td>
          <td>
               <dx:ASPxCalendar ID="CalFrom" runat="server"></dx:ASPxCalendar>
          </td>
         <td>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To :&nbsp;&nbsp;&nbsp;
          </td>
          <td>
               <dx:ASPxCalendar ID="CalTo" runat="server"></dx:ASPxCalendar>
          </td>
      </tr>
  </table>
            <table>
                <tr><td> <br /></td></tr>
                <tr>
                       <td>
                             <dx:ASPxButton ID="btnreportschedule" runat="server"
       Text="Schedule of Reports" Width="210px" Theme="Moderno"
        OnClick="btnreportschedule_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                      <td>
                             <dx:ASPxButton ID="BtnAlarms" runat="server"
       Text="Alarms" Width="210px" Theme="Moderno"
        OnClick="BtnAlarms_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                             <dx:ASPxButton ID="btnEnterExit" runat="server"
       Text="Enter and exit" Width="210px" Theme="Moderno"
        OnClick="btnEnterExit_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                 <tr><td> <br /></td></tr>
                <tr>
                    <td>
                           <dx:ASPxButton ID="btnuserEnter" runat="server"
       Text="Enter and exit by users" Width="210px" Theme="Moderno"
        OnClick="btnuserEnter_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                             <dx:ASPxButton ID="btnAuthorized" runat="server"
       Text="Authorized enter and exit" Width="210px" Theme="Moderno"
        OnClick="btnAuthorized_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                         <dx:ASPxButton ID="btnunAuthorized" runat="server"
       Text="Unauthorized enter and exit" Width="210px" Theme="Moderno"
        OnClick="btnunAuthorized_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    
                </tr>
 <tr><td> <br /></td></tr>

                                <tr>
                    <td>
                           <dx:ASPxButton ID="btnenalbeitems" runat="server"
       Text="List of items" Width="210px" Theme="Moderno"
        OnClick="btnenalbeitems_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                             <dx:ASPxButton ID="btnListmac" runat="server"
       Text="List of Mac addresses" Width="210px" Theme="Moderno"
        OnClick="btnListmac_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
               <td>
                             <dx:ASPxButton ID="btnListOfinvertory" runat="server"
       Text="List of invertory" Width="210px" Theme="Moderno"
        OnClick="btnListOfinvertory_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                                   
                </tr>
                <tr><td> <br /></td></tr>

                                <tr>
                    <td>
                           <dx:ASPxButton ID="btnRemove" runat="server"
       Text="Remove items" Width="210px" Theme="Moderno"
        OnClick="btnRemove_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                             <dx:ASPxButton ID="BtnAdd" runat="server"
       Text="Add items" Width="210px" Theme="Moderno"
        OnClick="BtnAdd_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
               <td>
                             <dx:ASPxButton ID="BtncleanUp" runat="server"
       Text="Clean up racks" Width="210px" Theme="Moderno"
        OnClick="BtncleanUp_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                                   
                </tr>
              <tr><td> <br /></td></tr>
<%--                                                <tr>
                 
                    <td>
                             <dx:ASPxButton ID="BtnConMAc" runat="server"
       Text="List of Connected Mac addresses" Width="210px" Theme="Moderno"
        OnClick="BtnConMAc_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                  <td>
                             <dx:ASPxButton ID="ASPxButton3" runat="server"
       Text="SuccessFull Replacment" Width="210px" Theme="Moderno"
        OnClick="btnMoveDone_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                                       <td>
                             <dx:ASPxButton ID="ASPxButton4" runat="server"
       Text="unuccessFull Replacment" Width="210px" Theme="Moderno"
        OnClick="Btnunsuc_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                                     <td>
                             <dx:ASPxButton ID="ASPxButton5" runat="server"
       Text="Alarms" Width="210px" Theme="Moderno"
        OnClick="BtnAlarms_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
                  <tr>
                    <td>
                        <br />
                    </td>
                </tr>--%>
                  <tr>
                            <td>
                             <dx:ASPxButton ID="btnMoveDone" runat="server"
       Text="SuccessFull Replacment" Width="210px" Theme="Moderno"
        OnClick="btnMoveDone_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                                       <td>
                             <dx:ASPxButton ID="Btnunsuc" runat="server"
       Text="unuccessFull Replacment" Width="210px" Theme="Moderno"
        OnClick="Btnunsuc_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td colspan="2">
                           <dx:ASPxButton ID="BtnunsucSource" runat="server"
       Text="unuccessFull Replacment(done in source)" Width="210px" Theme="Moderno"
        OnClick="BtnunsucSource_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                 
                </tr>
                             <tr><td> <br /></td></tr>
              <%--   <tr>
                    <td>
                           <dx:ASPxButton ID="btnRemove" runat="server"
       Text="List of items report" Width="210px" Theme="Moderno"
        OnClick="btnenalbeitems_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                             <dx:ASPxButton ID="ASPxButton3" runat="server"
       Text="List of Mac addresses" Width="210px" Theme="Moderno"
        OnClick="btnListmac_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                  <td>
                             <dx:ASPxButton ID="ASPxButton4" runat="server"
       Text="SuccessFull Replacment" Width="210px" Theme="Moderno"
        OnClick="btnMoveDone_Click"></dx:ASPxButton>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>--%>
            </table>
            <br />
       
        </asp:Panel>
    <asp:Panel ID="pnlDevice" runat="server" Visible="false">
          <dx:ASPxGridView ID="griddevice" runat="server" AutoGenerateColumns="False"
        KeyFieldName="idD" DataSourceID="SqlDataSource1" EnableCallBacks="False"
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
        <br />
           <dx:ASPxButton ID="btnreportDevice" runat="server"
       Text="Get the device report" Theme="Moderno"
        OnClick="btnreportDevice_Click"></dx:ASPxButton>
    </asp:Panel>
    <asp:Panel ID="pnlusers" runat="server" Visible="false">
        Get report of enter and exit of users
        <br />
        <dx:ASPxGridView ID="GridSensor" runat="server" KeyFieldName="idUser" 
     AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  Theme="Office2003Blue" >
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewDataTextColumn FieldName="idUser" Visible="false" VisibleIndex="0" ReadOnly="True">
    
            <EditFormSettings Visible="False" />
    
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RFID" Caption="RFID Card Number" VisibleIndex="1">
        </dx:GridViewDataTextColumn>

       
        <dx:GridViewDataTextColumn FieldName="FullName" Caption="First Name & last Name" VisibleIndex="4">
        </dx:GridViewDataTextColumn>

    </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblSensor WHERE (idS = @idS)" 
                            InsertCommand="INSERT INTO tblSensor(NameS, unitS, commnet) VALUES (@NameS, @unitS, @commnet)" 
                            SelectCommand="SELECT idUser, RFID, username, statusu, Name+' '+ lastName as FullName FROM tblusers" UpdateCommand="UPDATE tblSensor SET NameS = @NameS, unitS = @unitS, commnet = @commnet WHERE (idS = @idS)">
                            <DeleteParameters>
                                <asp:Parameter Name="idS" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NameS" />
                                <asp:Parameter Name="unitS" />
                                <asp:Parameter Name="commnet" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="NameS" />
                                <asp:Parameter Name="unitS" />
                                <asp:Parameter Name="commnet" />
                                <asp:Parameter Name="idS" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
          <dx:ASPxButton ID="getEnterandExitreport" runat="server" Text="Get report" Theme="Mulberry"
        OnClick="getEnterandExitreport_Click"></dx:ASPxButton>
    </asp:Panel>
    <asp:Panel ID="pnlReport" runat="server" Visible="false">
          <cc1:StiWebViewer ID="StiWebViewer1" runat="server" RenderMode="AjaxWithCache" />
        <%--<asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />--%>
    </asp:Panel>
    <asp:Label ID="lbltype" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>


