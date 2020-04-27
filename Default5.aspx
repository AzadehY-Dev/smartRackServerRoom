<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default5.aspx.cs" Inherits="Default5" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<script runat="server"></script>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">

    <asp:Panel ID="pnlGroups" runat="server" Visible="True">
        <dx:ASPxGridView ID="gridselectedGroup" runat="server" KeyFieldName="ID"  EnableCallBacks="False"
             AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Theme="Office2003Blue">

            <Settings ShowFilterRow="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="ID" VisibleIndex="1" Visible="false" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDGroup" VisibleIndex="2" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="IDDevice" VisibleIndex="3" Visible="false">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Name" Caption="Group Name" VisibleIndex="4" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Comments"  VisibleIndex="5" ReadOnly="true">
                </dx:GridViewDataTextColumn>
                  <dx:GridViewDataComboBoxColumn FieldName="AnnouncingType" VisibleIndex="4" Width="150">
                    <PropertiesComboBox TextField="TypetName" ValueField="TypetID" ValueType="System.String">
                        <Items>
                             <dx:ListEditItem ImageUrl="assets/img/email-sms.png" Text="Email & SMS" Selected="true" Value="ES" />
                            <dx:ListEditItem ImageUrl="assets/img/sms.png" Text="SMS" Value="SMS" />
                            <dx:ListEditItem ImageUrl="assets/img/email.png" Text="Email" Value="Email" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
            </Columns>

        </dx:ASPxGridView>
             <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                 ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
     DeleteCommand="DELETE FROM tblDeviceGroup WHERE (ID = @ID)" 
   SelectCommand="SELECT dg.AnnouncingType, Comments, dg.ID, dg.IDGroup, dg.IDDevice, g.Name FROM tblDeviceGroup AS
                  dg INNER JOIN tblDevice AS d ON dg.IDDevice = d.idD LEFT OUTER JOIN tblGroup AS g
                  ON dg.IDGroup = g.ID WHERE (dg.IDDevice = @idD)" 
                 UpdateCommand="UPDATE tblDeviceGroup SET AnnouncingType = @AnnouncingType WHERE (ID = @ID)">
                 <DeleteParameters>
                     <asp:Parameter Name="ID" />  
                 </DeleteParameters>
                 <SelectParameters>
                     <asp:ControlParameter ControlID="lblDID" Name="idD" PropertyName="Text" />
                 </SelectParameters>
                 <UpdateParameters>
                     <asp:Parameter Name="AnnouncingType" />
                     <asp:Parameter Name="ID" />
                 </UpdateParameters>
        </asp:SqlDataSource><br />
          <%--   <dx:ASPxButton ID="btnaddGroup" runat="server" Text="Define Group"
                  OnClick="btnaddGroup_Click"
            Theme="Moderno"></dx:ASPxButton>--%>
    </asp:Panel>
      <p>
  <label for="amount">Time donation amount (1 increments):</label>

            <asp:TextBox ID="amount" runat="server" Width="50px" ></asp:TextBox>
<%--  <input type="text" id="amount2" readonly style="border:0; color:#f6931f; font-weight:bold;"/>--%>
</p>
   <asp:Label ID="lblDID" runat="server" Text="30" Visible="false"></asp:Label>
<div id="slider"></div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

