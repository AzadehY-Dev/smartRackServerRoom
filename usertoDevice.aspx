<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="usertoDevice.aspx.cs" Inherits="usertoDevice" %>
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
                <li class="active">
                    <a href="usertoDevice.aspx">
                        <i class="pe-7s-id"></i>
                        <p>Device Users</p>
                    </a>
                </li>
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
    <asp:Panel ID="pnlhd" runat="server">
          <h4 class="title">Choose The Device</h4>
    <p class="category">Please choose the device from the below list</p>

    </asp:Panel>
    <asp:Panel ID="pnlsensorsshow" runat="server" Visible="false">
          <h4 class="title">Assigned Users</h4>
    <p class="category">The below list are the Users that assigned to: 
        <asp:Label ID="lblnamedevice" runat="server" Text=""></asp:Label>

    </p>

    </asp:Panel>

    <asp:Panel ID="pnlhs" runat="server" Visible="false">
          <h4 class="title">Choose The User</h4>
    <p class="category">Please choose The user from the below list</p>
    </asp:Panel>

       </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <%--////////////***************** grid Device********************/////////////////--%>
    <asp:Panel ID="pnlCd" runat="server">
        <dx:ASPxGridView ID="GridDevice" runat="server" AutoGenerateColumns="False"
    KeyFieldName="idD" DataSourceID="SqlDataSource1" Theme="Office2003Blue">
            <Settings ShowFilterRow="True" />
              <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewCommandColumn SelectAllCheckboxMode="Page" VisibleIndex="0" ShowClearFilterButton="True">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idD" VisibleIndex="1" Visible="false">
    
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NameD" Caption="Device Name" VisibleIndex="2">
             <EditFormSettings VisibleIndex="0"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="IP" Caption="IP" VisibleIndex="3">
                  <EditFormSettings VisibleIndex="2"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="Port" Caption="Port" VisibleIndex="4">
                    <EditFormSettings VisibleIndex="3"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="comment" VisibleIndex="5" Visible="false">
            <EditFormSettings Visible="True" ColumnSpan="3" VisibleIndex="100"/>
        </dx:GridViewDataTextColumn>
    </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblDevice WHERE (idD = @idD)" InsertCommand="INSERT INTO tblDevice(NameD, IP, Port, comment) VALUES (@NameD, @IP, @Port, @comment)" SelectCommand="SELECT * FROM [tblDevice]" UpdateCommand="UPDATE tblDevice SET NameD = @NameD, IP = @IP, Port = @Port, comment = @comment where idD=@idD">
                            <DeleteParameters>
                                <asp:Parameter Name="idD" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NameD" />
                                <asp:Parameter Name="IP" />
                                <asp:Parameter Name="Port" />
                                <asp:Parameter Name="comment" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="NameD" />
                                <asp:Parameter Name="IP" />
                                <asp:Parameter Name="Port" />
                                <asp:Parameter Name="comment" />
                                <asp:Parameter Name="idD" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
        <br /><br />
        <dx:ASPxButton ID="btnchoosedevice" runat="server" Text="Submit the device" Theme="Moderno" OnClick="btnchoosedevice_Click"></dx:ASPxButton>
    </asp:Panel>
<%--////////***************** grid Devicesensor********************///////////////////////--%>
    <asp:Panel ID="pnlshowsensor" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridDS" runat="server" KeyFieldName="idud"
            Theme="Office2003Blue" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idud" ReadOnly="True" Visible="false" VisibleIndex="1">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lastName" Caption="Last Name" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="statusud"  VisibleIndex="5">
        </dx:GridViewDataTextColumn>
     </Columns>
     </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblDeviceUser WHERE (idud = @idud)" 
                             SelectCommand="SELECT du.idud, du.statusud, u.RFID, u.Name, u.lastName FROM tblDeviceUser AS du INNER JOIN tblDevice AS d ON du.iddevice = d.idD INNER JOIN tblusers AS u ON du.iduser = u.idUser WHERE (d.idD = @idd)" >
                            <DeleteParameters>
                                <asp:Parameter Name="idud" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lbliddevice" Name="idD" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
           <br /><br />
        <dx:ASPxButton ID="btnshowsensors" runat="server" Text="Add another user" Theme="Moderno" OnClick="btnshowsensors_Click" ></dx:ASPxButton>

    </asp:Panel>

        <%--////////////***************** grid user********************///////////////////////--%>
    <asp:Panel ID="pnlCs" runat="server" Visible="false">
        
<dx:ASPxGridView ID="GridSensor" runat="server" KeyFieldName="idUser" 
     AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  Theme="Office2003Blue" >
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewDataTextColumn FieldName="idUser" Visible="false" VisibleIndex="0" ReadOnly="True">
    
            <EditFormSettings Visible="False" />
    
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="1">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
       
        <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="4">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="5">
        </dx:GridViewDataTextColumn>
         <dx:GridViewDataTextColumn FieldName="statusu" VisibleIndex="6">
        </dx:GridViewDataTextColumn>
    </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblSensor WHERE (idS = @idS)" InsertCommand="INSERT INTO tblSensor(NameS, unitS, commnet) VALUES (@NameS, @unitS, @commnet)" SelectCommand="SELECT idUser, RFID, username, statusu, Name, lastName FROM tblusers" UpdateCommand="UPDATE tblSensor SET NameS = @NameS, unitS = @unitS, commnet = @commnet WHERE (idS = @idS)">
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
           <br /><br />
        <dx:ASPxButton ID="btnSubSen" runat="server" Text="Submit the user" Theme="Moderno" OnClick="btnSubSen_Click"></dx:ASPxButton>

    </asp:Panel>

        <%--////////////***************** grid Detail********************///////////////////////--%>
    
    <asp:Label ID="lbliddevice" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblidsensor" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
