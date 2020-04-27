<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Enterance.aspx.cs" Inherits="Enterance" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Menu" Runat="Server">
    <ul class="nav">
                 <%-- <li class="active">--%>
                <li class="active">
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
                <li >
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
          <%--      <li id="DeviceUsers" runat="server">
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
     <h4 class="title">Door Status</h4>
    <p class="category">You can visit and manage the enter and exit</p>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server" >
    <dx:ASPxGridView ID="griddevice" runat="server"
         AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
            ClientInstanceName="griddevice"
             EnableCallBacks="False"
        Font-Size="Small"  KeyFieldName="idud"
        Theme="Office2003Blue" OnCustomButtonCallback="griddevice_CustomButtonCallback" 
        OnHtmlRowPrepared="griddevice_HtmlRowPrepared">
        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
            ConfirmDelete="True" />
        <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True">
                </SettingsBehavior>
        <Columns>
             <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px">
        <custombuttons>
            <dx:GridViewCommandColumnCustomButton 
            ID="dclose"><image tooltip="keep door close" 
            url="assets/img/dclose.png" />
            </dx:GridViewCommandColumnCustomButton>
            <dx:GridViewCommandColumnCustomButton 
            ID="dopen"><image tooltip="open the door" 
            url="assets/img/dopen.png" />
            </dx:GridViewCommandColumnCustomButton>

             <dx:GridViewCommandColumnCustomButton 
            ID="erase"><image tooltip="erase the status" 
            url="assets/img/eras.png" />
            </dx:GridViewCommandColumnCustomButton>
        </custombuttons></dx:GridViewCommandColumn>
             <dx:GridViewDataTextColumn FieldName="idud" VisibleIndex="0" Visible="false">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="rfid" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="2">

        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="time" VisibleIndex="3">
   
        </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="date" Caption="date" VisibleIndex="4">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="statusdoor" VisibleIndex="5">
             </dx:GridViewDataTextColumn>
        </Columns>

    </dx:ASPxGridView>
    <br />
         <asp:ImageButton ID="btnExcel" ToolTip="Export to excel" ImageUrl="~/assets/img/excel.png" runat="server" OnClick="btnExcel_Click" />
      <asp:ImageButton ID="btnword" ToolTip="Export to pdf" ImageUrl="~/assets/img/pdf.png" runat="server" OnClick="btnword_Click" />
              <dx:ASPxGridViewExporter ID="gridExport" GridViewID="griddevice" runat="server">
           </dx:ASPxGridViewExporter>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server"
       ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" SelectCommand="SELECT e.idud, e.rfid, u.Name, u.lastName, e.time, e.date, e.statusdoor FROM tblEntrance AS e LEFT OUTER JOIN tblusers AS u ON e.rfid = u.RFID where e.iddevice=@iddevice order by idud desc">
         <SelectParameters>
             <asp:ControlParameter ControlID="lbliddevice" Name="iddevice" PropertyName="Text" />
         </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="lbliddevice" runat="server" Text="" Visible="false"></asp:Label>
     

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

