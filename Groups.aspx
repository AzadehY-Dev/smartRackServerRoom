<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Groups.aspx.cs" Inherits="Groups" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpellChecker.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpellChecker" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .Initial {
            display: block;
            padding: 4px 10px 4px 10px;
            float: left;
            background: url("assets/img/InitialImage.png") no-repeat right top;
            color: Black;
        }

            .Initial:hover {
                color: White;
                background: url("assets/img/SelectedButton.png") no-repeat right top;
            }

        .Clicked {
            float: left;
            display: block;
            background: url("assets/img/SelectedButton.png") no-repeat right top;
            padding: 4px 18px 4px 18px;
            color: Black;
            color: White;
        }
    </style>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="Menu" runat="Server">
    <ul class="nav">
        <%-- <li class="active">--%>
        <li>
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
        <%--      <li id="DeviceUsers" runat="server">
                    <a href="usertoDevice.aspx">
                        <i class="pe-7s-id"></i>
                        <p>Device Users</p>
                    </a>
                </li>--%>
        <li class="active">
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
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" runat="Server">
    <h4 class="title">Groups of users</h4>
    <p class="category">You can manage users, sms and emails in groups</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="Server">
    <asp:Panel ID="pnlgroup" runat="server">
        <dx:ASPxGridView ID="gridGroups"
            KeyFieldName="ID" runat="server"
            Font-Size="Small" EnableCallBacks="False"
            AutoGenerateColumns="False"
            DataSourceID="SqlDataSource1" Theme="Office2003Blue"
            OnCustomButtonCallback="gridGroups_CustomButtonCallback">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"
                AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn"
                ConfirmDelete="True" />
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>
            <Columns>
                <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="150px">
                    <CustomButtons>
                        <dx:GridViewCommandColumnCustomButton
                            ID="Users">
                            <Image ToolTip="Add users"
                                Url="assets/img/Users.png" />
                        </dx:GridViewCommandColumnCustomButton>
                        <dx:GridViewCommandColumnCustomButton
                            ID="EmailSMS">
                            <Image ToolTip="Add Email and SMS"
                                Url="assets/img/email-sms.png" />
                        </dx:GridViewCommandColumnCustomButton>

                    </CustomButtons>
                </dx:GridViewCommandColumn>
                <dx:GridViewCommandColumn ShowDeleteButton="True" Width="90px"
                    ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="Name" Width="100px" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comments" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="3">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" DeleteCommand="DELETE FROM tblGroup WHERE (ID = @ID)" InsertCommand="INSERT INTO tblGroup(Name, Comments) VALUES (@Name, @Comments)" SelectCommand="SELECT Name, Comments, ID FROM tblGroup" UpdateCommand="UPDATE tblGroup SET Name = @Name, Comments = @Comments where ID=@ID">
            <DeleteParameters>
                <asp:Parameter Name="ID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Comments" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Name" />
                <asp:Parameter Name="Comments" />
                <asp:Parameter Name="ID" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlUsers" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridselectedusers" runat="server" KeyFieldName="ID" EnableCallBacks="False"
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
        <asp:SqlDataSource ID="SqlDataSource3" runat="server"
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
            DeleteCommand="DELETE FROM tblUsersGroups WHERE (ID = @ID)"
            SelectCommand="SELECT tblUsersGroups.ID, tblusers.Name, tblusers.lastName, tblusers.Photo, tblusers.Email, tblusers.Cell, tblusers.BEmail, tblusers.BCell FROM tblUsersGroups INNER JOIN tblGroup ON tblUsersGroups.IDg = tblGroup.ID INNER JOIN tblusers ON tblUsersGroups.IDu = tblusers.idUser where IDg=@IDg">
            <DeleteParameters>
                <asp:Parameter Name="ID" />
            </DeleteParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="lblID" Name="IDg" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <dx:ASPxButton ID="btnaddusers" runat="server" Text="Add users"
            OnClick="btnaddusers_Click"
            Theme="Moderno">
        </dx:ASPxButton>
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
            DataSourceID="SqlDataSource2" Theme="Office2003Blue"
            OnCustomButtonCallback="gridGroups_CustomButtonCallback">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"
                ColumnResizeMode="NextColumn"
                ConfirmDelete="True" />
            <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True"
                ColumnResizeMode="NextColumn" ConfirmDelete="True"></SettingsBehavior>
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
            </Columns>
            <%--<ClientSideEvents SelectionChanged="grid_SelectionChanged" />--%>
        </dx:ASPxGridView>
        <br />
        <dx:ASPxButton ID="RegisterUsers" runat="server" Text="Register selected users"
            OnClick="RegisterUsers_Click"
            Theme="Moderno">
        </dx:ASPxButton>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server"
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
            SelectCommand="SELECT Name, lastName, Photo, Email, Cell, BEmail, BCell, idUser FROM tblusers where username<>'host' and idUser not in
(select IDu from tblUsersGroups where IDg=@IDg)">
            <SelectParameters>
                <asp:ControlParameter ControlID="lblID" Name="IDg" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </asp:Panel>
    <asp:Panel ID="pnlEmailsms" runat="server" Visible="false">
        <table width="100%" align="center">
            <tr>
                <td>
                    <asp:Button Text="Enter/Open" BorderStyle="None" ID="Tab1" Width="152" Height="52" CssClass="Initial" runat="server"
                        OnClick="Tab1_Click" />
                    <asp:Button Text="Exit/Close" BorderStyle="None" ID="Tab2" Width="152" Height="52" CssClass="Initial" runat="server"
                        OnClick="Tab2_Click" />
                    <asp:Button Text="Analog Input" BorderStyle="None" ID="Tab3" Width="152" Height="52" CssClass="Initial" runat="server"
                        OnClick="Tab3_Click" />
                    <asp:Button Text="Digital Input" BorderStyle="None" ID="Tab4" Width="152" Height="52" CssClass="Initial" runat="server"
                        OnClick="Tab4_Click" />
                    <asp:MultiView ID="MainView" runat="server">
                        <asp:View ID="View1" runat="server">
                            <table style="border-radius: 15px 50px; width: 100%; border: 1px solid #42b2f3;">
                                <tr>
                                    <td>
                                        <asp:Panel ID="pnlEmail" runat="server">

                                            <table style="padding: 10px; margin: 10px;">
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="assets/img/email.png" />
                                                        <asp:Label ID="Label1" runat="server" Text="">Email subject:</asp:Label>
                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="txtEenterSubject" runat="server" Width="630px"></asp:TextBox>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/email.png" />
                                                        Email text:
                    <dx:ASPxHtmlEditor ID="htmlEditorEmailEnter" runat="server" Theme="PlasticBlue"></dx:ASPxHtmlEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/sms.png" />SMS Text:<%--</td><td></td>
            </tr>
                <tr>--%><br />
                                                        <asp:TextBox ID="txtentersms" Width="650px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <br />
                                                        <dx:ASPxButton ID="btnEnterreg" runat="server" Text="Register" Theme="Moderno" OnClick="btnEnterreg_Click"></dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>
                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            <%--       background-image:url('assets/img/backtable.jpg');background-repeat:repeat-x; --%>
                            <table style="border-radius: 15px 50px; width: 100%; border: 1px solid #42b2f3;">
                                <tr>
                                    <td>

                                        <asp:Panel ID="Panel1" runat="server">

                                            <table style="padding: 10px; margin: 10px;">
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="assets/img/email.png" />
                                                        <asp:Label ID="Label2" runat="server" Text="">Email subject:</asp:Label>
                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="txtexitsubject" runat="server" Width="630px"></asp:TextBox>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/email.png" />
                                                        Email text:
                    <dx:ASPxHtmlEditor ID="HtmlEditorexit" runat="server" Theme="PlasticBlue"></dx:ASPxHtmlEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/sms.png" />SMS Text:<%--</td><td></td>
            </tr>
                <tr>--%><br />
                                                        <asp:TextBox ID="txtexitsms" Width="650px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <br />
                                                        <dx:ASPxButton ID="btnexitreg" runat="server" Text="Register" Theme="Moderno" OnClick="btnexitreg_Click"></dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>

                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            <table style="border-radius: 15px 50px; width: 100%; border: 1px solid #42b2f3;">
                                <tr>
                                    <td>

                                        <asp:Panel ID="Panel2" runat="server">

                                            <table style="padding: 10px; margin: 10px;">
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="assets/img/email.png" />
                                                        <asp:Label ID="Label3" runat="server" Text="">Email subject:</asp:Label>
                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="txtaisubject" runat="server" Width="630px"></asp:TextBox>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/email.png" />
                                                        Email text:
                    <dx:ASPxHtmlEditor ID="HtmlEditorai" runat="server" Theme="PlasticBlue"></dx:ASPxHtmlEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/sms.png" />SMS Text:<%--</td><td></td>
            </tr>
                <tr>--%><br />
                                                        <asp:TextBox ID="txtaisms" Width="650px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <br />
                                                        <dx:ASPxButton ID="btnaireg" runat="server" Text="Register" Theme="Moderno" OnClick="btnaireg_Click"></dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>

                                    </td>
                                </tr>
                            </table>
                        </asp:View>

                        <asp:View ID="View4" runat="server">
                            <table style="border-radius: 15px 50px; width: 100%; border: 1px solid #42b2f3;">
                                <tr>
                                    <td>

                                        <asp:Panel ID="Panel3" runat="server">

                                            <table style="padding: 10px; margin: 10px;">
                                                <tr>
                                                    <td>
                                                        <br />
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <img src="assets/img/email.png" />
                                                        <asp:Label ID="Label4" runat="server" Text="">Email subject:</asp:Label>
                                                    </td>
                                                    <td>

                                                        <asp:TextBox ID="txtdiemailsubject" runat="server" Width="630px"></asp:TextBox>
                                                    </td>
                                                    <td></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/email.png" />
                                                        Email text:
                    <dx:ASPxHtmlEditor ID="htmlEditorDi" runat="server" Theme="PlasticBlue"></dx:ASPxHtmlEditor>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <br />
                                                        <img src="assets/img/sms.png" />SMS Text:<%--</td><td></td>
            </tr>
                <tr>--%><br />
                                                        <asp:TextBox ID="txtdisms" Width="650px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>
                                                        <br />
                                                        <dx:ASPxButton ID="btndireg" runat="server" Text="Register" Theme="Moderno" OnClick="btndireg_Click"></dx:ASPxButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </asp:Panel>

                                    </td>
                                </tr>
                            </table>
                        </asp:View>
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <%--  <asp:Panel ID="pnlmessage" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridmessage" runat="server" KeyFieldName="ID" Width="900px"
             AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Theme="Office2003Blue" >
            <Settings ShowFilterRow="True" />
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
                <dx:GridViewCommandColumn Width="80" ShowClearFilterButton="True" ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" ReadOnly="True" Visible="false" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Message" VisibleIndex="6" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Type" VisibleIndex="4" Width="120">
                    <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                            <dx:ListEditItem ImageUrl="assets/img/sms.png" Text="SMS" Value="SMS" />
                            <dx:ListEditItem ImageUrl="assets/img/email.png" Text="Email" Value="Email" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
            DeleteCommand="DELETE FROM tblMessages WHERE (ID = @ID)" 
            InsertCommand="INSERT INTO tblMessages(Message, Type, GroupID) VALUES (@Message, @Type, @GroupID)" 
            SelectCommand="SELECT ID, Message, Type FROM tblMessages where GroupID=@GID" 
            UpdateCommand="UPDATE tblMessages SET Message = @Message, Type = @Type where ID=@ID">
            
              <DeleteParameters>
                <asp:Parameter Name="ID" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="Message" />
                <asp:Parameter Name="Type" />
                <asp:ControlParameter ControlID="lblID" Name="GroupID" PropertyName="Text" />
            </InsertParameters>
              <SelectParameters>
                  <asp:ControlParameter ControlID="lblID" Name="GID" PropertyName="Text" />
              </SelectParameters>
              <UpdateParameters>
                  <asp:Parameter Name="Message" />
                  <asp:Parameter Name="Type" />
                  <asp:Parameter Name="ID" />
              </UpdateParameters>
        </asp:SqlDataSource>
    </asp:Panel>--%>

    <%--    <asp:Panel ID="pnlEmail" runat="server" Visible="false">

        <table>
            <tr>
                <td><br /></td><td></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="">Subject:</asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtESubject" runat="server" Width="630px"></asp:TextBox>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="3">
                    <br />
                    <dx:ASPxHtmlEditor ID="htmlEditorEmail" runat="server" Theme="PlasticBlue"></dx:ASPxHtmlEditor>
                </td>
            </tr>
               <tr><td><br /> <dx:ASPxButton ID="btnRegEmail" runat="server" Text="Register" Theme="Moderno" OnClick="btnRegEmail_Click" ></dx:ASPxButton>
                </td></tr>
        </table>
    </asp:Panel>
    <asp:Panel ID="pnlsms" runat="server" Visible="false">
        <table>
            <tr>
                <td><br /></td><td></td>
            </tr>
          <tr>
                <td>SMS Text:</td><td></td>
            </tr>
           
            <tr>
                <td >
                    <br />
                    <asp:TextBox ID="txtSMS" Width="650px" Height="200px" TextMode="MultiLine" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr><td><br />
        <dx:ASPxButton ID="btnRegSMS" runat="server" Text="Register" Theme="Moderno" OnClick="btnRegSMS_Click" ></dx:ASPxButton>
              </td></tr>
        </table>
    </asp:Panel>--%>


<%--    <asp:Panel ID="pnlinfo" runat="server" Visible="True">
        info:<br />
        %DeviceName% = Device Name<br />

        %Latitude%= The latitude of device<br />
        %Longitude%= The Longitude of device<br />

    </asp:Panel>--%>

    <br />
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

