<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="users.aspx.cs" Inherits="users" %>

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
                <li  class="active">
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
     <h4 class="title">Users</h4>
    <p class="category">The list of Users is on  gridview. You can add new one, edit or delete users.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">

            <div>
            <dx:ASPxGridView ID="gridusers" KeyFieldName="idUser" runat="server" DataSourceID="sds"
                EnableCallBacks="False" AutoGenerateColumns="False" Theme="Office2003Blue" 
        OnCustomButtonCallback="griddevice_CustomButtonCallback"  
                OnStartRowEditing="gridusers_StartRowEditing">
              <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" 
                    ConfirmDelete="True" />
                <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True">
                        </SettingsBehavior>
                <Columns>
                     <dx:GridViewCommandColumn Width="80"
             ShowDeleteButton="True" ShowEditButton="True" 
            ShowNewButtonInHeader="True" VisibleIndex="0" >
        </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn FieldName="idUser" ReadOnly="True" Visible="false" VisibleIndex="23">
                        <EditFormSettings Visible="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="4" Visible="false">
                          <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                     <dx:GridViewDataTextColumn FieldName="password" VisibleIndex="5" Visible="false">
                    <EditFormSettings Visible="True" />
                    </dx:GridViewDataTextColumn>
                              <dx:GridViewDataTextColumn FieldName="username" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Email" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Cell" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                  <%--  <dx:GridViewDataTextColumn FieldName="BEmail" Caption="Email2" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BCell" Caption="Cell2" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>--%>
                      <dx:GridViewDataComboBoxColumn FieldName="role" VisibleIndex="12" Width="140">
                             <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem ImageUrl="assets/img/useradmin.png" Text="Administrator" Selected="true" Value="Ad" />
                            <dx:ListEditItem ImageUrl="assets/img/userop.png" Text="Usual Operator" Value="Op" />
                            <dx:ListEditItem ImageUrl="assets/img/userservice.png" Text="Service Man" Value="S" />
                             <dx:ListEditItem ImageUrl="assets/img/userother.png" Text="Others"  Value="Ot" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataBinaryImageColumn FieldName="Picture" VisibleIndex="2" Width="120">
                        <PropertiesBinaryImage ImageHeight="120" ImageWidth="120" EnableServerResize="True">
                            <EditingSettings Enabled="True">
                            </EditingSettings>
                        </PropertiesBinaryImage>
                    </dx:GridViewDataBinaryImageColumn>
                </Columns>
                    <SettingsEditing EditFormColumnCount="3" Mode="PopupEditForm" />
        <SettingsPopup>
            <EditForm Width="600" />
        </SettingsPopup>
        <SettingsPager Mode="ShowAllRecords" />

    </dx:ASPxGridView>
                 <br />
         <asp:ImageButton ID="btnExcel" ToolTip="Export to excel" ImageUrl="~/assets/img/excel.png" runat="server" OnClick="btnExcel_Click" />
      <asp:ImageButton ID="btnword" ToolTip="Export to pdf" ImageUrl="~/assets/img/pdf.png" runat="server" OnClick="btnword_Click" />
              <dx:ASPxGridViewExporter ID="gridExport" GridViewID="griddevice" runat="server">
           </dx:ASPxGridViewExporter>
    
        </div>

      

        <asp:SqlDataSource ID="sds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
             DeleteCommand="DELETE FROM [tblusers] WHERE [idUser] = @idUser and idUser not in(select idUser from tblCrUser) and idUser <> (select idUser from tblusers where username='host') " 
            InsertCommand="INSERT INTO tblusers(Picture,password,username, role, RFID, Name, lastName, Email, Cell)  VALUES (@Picture, @password, @username, @role, @RFID, @Name, @lastName, @Email, @Cell)" 
            SelectCommand="SELECT password,role, idUser, Picture, RFID, Name,username, lastName, Email, Cell FROM tblusers " 
            UpdateCommand="UPDATE tblusers SET Picture = @Picture, password=@password,username=@username, role=@role, RFID = @RFID, Name = @Name, lastName = @lastName, Email = @Email, Cell = @Cell WHERE (idUser = @idUser)" 
            OnInserting="sds_Inserting" OnUpdating="sds_Updating" OnSelecting="sds_Selecting">
            <DeleteParameters>
                <asp:Parameter Name="idUser" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Picture" Type="Object" />
                <asp:Parameter Name="password" />
                <asp:Parameter Name="RFID" />
                <asp:Parameter Name="username" />
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="lastName" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Cell" />
                 <asp:Parameter Name="role" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Picture" Type="Object" />
                <asp:Parameter Name="password" />
                <asp:Parameter Name="RFID" />
                <asp:Parameter Name="username" />
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="lastName" />
                <asp:Parameter Name="Email" />
                <asp:Parameter Name="Cell" />
                   <asp:Parameter Name="role" />
                <asp:Parameter Name="idUser" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>


    
     
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

