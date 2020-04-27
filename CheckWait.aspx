<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CheckWait.aspx.cs" Inherits="CheckWait" %>
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
<asp:Content ID="Content3" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Content" Runat="Server">
     <dx:ASPxGridView ID="griddevice" runat="server" AutoGenerateColumns="False"
        KeyFieldName="ID" DataSourceID="SqlDataSource1" EnableCallBacks="False"
            OnCustomButtonCallback="griddevice_CustomButtonCallback"
         Theme="Office2003Blue">
            <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                    AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn"  />
                <Settings ShowFilterRow="True" ShowFilterRowMenu="true" />
                        <SettingsBehavior AllowFocusedRow="True" AllowSelectByRowClick="True" 
                            AllowSelectSingleRowOnly="True" ColumnResizeMode="NextColumn">
                        </SettingsBehavior>
    <Columns>
 
         <dx:GridViewCommandColumn ButtonType="Image" VisibleIndex="24" Width="170px">
        <custombuttons>
           <dx:GridViewCommandColumnCustomButton 
            ID="Check"><image tooltip="Checked!" 
            url="assets/img/check.png" />
            </dx:GridViewCommandColumnCustomButton>
        </custombuttons></dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="DeviceName" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="name" Caption="Unit Name" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Type" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="ShouldExist" VisibleIndex="3">
                     <PropertiesCheckEdit UseDisplayImages="true" ValueChecked="False" ValueUnchecked="True"></PropertiesCheckEdit>
                </dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="MACAddress" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="10" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
          <dx:GridViewDataTextColumn FieldName="IDD" VisibleIndex="12" Visible="false" ReadOnly="true">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>"
             SelectCommand="select dio.ID,dio.IDD, d.NameD as DeviceName,dio.name,dio.Type,dio.Exist as ShouldExist, dio.MACAddress from tblDeviceIO dio inner join tblDevice d on dio.IDD=d.idD where dio.WaittoCheck=1"></asp:SqlDataSource>
     <dx:ASPxPopupControl ID="pcLogin" runat="server" CloseAction="CloseButton" CloseOnEscape="true" Modal="True" 
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcLogin"
        HeaderText="Enter Comment" AllowDragging="True" Width="800px" PopupAnimationType="None" EnableViewState="False" Theme="iOS">
        <ClientSideEvents PopUp="function(s, e) { ASPxClientEdit.ClearGroup('entryGroup'); txtComment.Focus(); }" />
        <ContentCollection>
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="Panel1" runat="server" DefaultButton="btOK">
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <table>
                                <tr>
                                    <td rowspan="4">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                    <td class="pcmCellCaption">
                                        <dx:ASPxLabel ID="Comment" runat="server" Text="Reason:" >
                                        </dx:ASPxLabel>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    </td>
                                    <td class="pcmCellText">
                     <asp:TextBox ID="txtComment" runat="server" TextMode="MultiLine" Height="100px" Width="600px"></asp:TextBox>
                                      <%--  <dx:ASPxMemo ID="txtComment" runat="server" Height="71px" Width="600px">
                                      
                                            <ValidationSettings EnableCustomValidation="True" ValidationGroup="entryGroup" SetFocusOnError="True"
                                                ErrorDisplayMode="Text" ErrorTextPosition="Bottom" CausesValidation="True">
                                                <RequiredField ErrorText="Comments required" IsRequired="True" />
                                                <RegularExpression ErrorText="Comments required" />
                                                <ErrorFrameStyle Font-Size="10px">
                                                    <ErrorTextPaddings PaddingLeft="0px" />
                                                </ErrorFrameStyle>
                                            </ValidationSettings>
                                     </dx:ASPxMemo>--%>
                                        <br />    <br />
                                    </td>
                                    <td rowspan="4">
                                        <div class="pcmSideSpacer">
                                        </div>
                                    </td>
                                </tr>
                                
                                
                                <tr>
                                    <td colspan="2">
                                        <div class="pcmButton">
                                            <dx:ASPxButton ID="btOK" runat="server" Theme="iOS" Text="OK" Width="80px" OnClick="btOK_Click" AutoPostBack="False" style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                            </dx:ASPxButton>
                                            <dx:ASPxButton ID="btCancel" runat="server" Theme="iOS" Text="Cancel" Width="80px" AutoPostBack="False" style="float: left; margin-right: 8px">
                                                <ClientSideEvents Click="function(s, e) { pcLogin.Hide(); }" />
                                            </dx:ASPxButton>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
                <div>
                  <%--  <a href="javascript:ShowCreateAccountWindow();" id="hl1" style="float: right; margin: 14px 0 10px 0;">
                        Create Account</a>--%>
                </div>
           
            </dx:PopupControlContentControl>
        </ContentCollection>
        <ContentStyle>
            <Paddings PaddingBottom="5px" />
        </ContentStyle>
    </dx:ASPxPopupControl>
    <asp:Label ID="lblIDD" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblID" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblIOTYPE" runat="server" Text="" Visible="false"></asp:Label>
         <br />   
            <dx:ASPxButton ID="BTNclearcheck" runat="server" Text="Check all" OnClick="BTNclearcheck_Click" Theme="iOS"></dx:ASPxButton>
            <br />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

