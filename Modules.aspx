<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Modules.aspx.cs" Inherits="Modules" %>
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
        <dx:ASPxGridView ID="gridModules" runat="server" Width="700px"
         KeyFieldName="ID" AutoGenerateColumns="False" 
        EnableCallBacks="false"
        Theme="Office2003Blue" DataSourceID="SqlDataSource1">
        <Columns>
            <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IP" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="4">
                <EditFormSettings Visible="False" />
            </dx:GridViewDataTextColumn>
        </Columns>

    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" DeleteCommand="DELETE FROM tblModules WHERE (ID = @ID)" InsertCommand="INSERT INTO tblModules(Name, IP, MACAddress) VALUES (@Name, @IP, @MACAddress)" SelectCommand="SELECT Name, IP, MACAddress, ID FROM tblModules" UpdateCommand="UPDATE tblModules SET Name = @Name, IP = @IP, MACAddress = @MACAddress WHERE (ID = @ID)">
        <DeleteParameters>
            <asp:Parameter Name="ID" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="IP" />
            <asp:Parameter Name="MACAddress" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" />
            <asp:Parameter Name="IP" />
            <asp:Parameter Name="MACAddress" />
            <asp:Parameter Name="ID" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

