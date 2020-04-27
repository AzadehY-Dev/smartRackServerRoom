<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Enterance.aspx.cs" Inherits="Enterance" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
        Theme="Office2003Blue" OnCustomButtonCallback="griddevice_CustomButtonCallback">
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
            <dx:GridViewDataTextColumn FieldName="RFID" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
           <dx:GridViewDataTextColumn FieldName="Name" VisibleIndex="1">
   
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="lastName" VisibleIndex="2">

        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="time" VisibleIndex="3">
   
        </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="time" VisibleIndex="3">
   
        </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="time" VisibleIndex="3">
   
        </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="IP"  VisibleIndex="7">
             </dx:GridViewDataTextColumn>
             <dx:GridViewDataTextColumn FieldName="Port" VisibleIndex="8">
             </dx:GridViewDataTextColumn>
        </Columns>

    </dx:ASPxGridView>

     <asp:SqlDataSource ID="SqlDataSource1" runat="server"
       ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
         SelectCommand="select e.idud, u.RFID, u.Name, u.lastName, e.time, e.day, e.statusdoor, d.IP , sd.port from tblDevice d left join tblEntrance e on d.idD=e.iddevice left join tblsensorTodevice sd on sd.iddevice=d.idD left join tblusers u on u.idUser=e.iduser where e.iddevice=2 order by idud desc">
         <SelectParameters>
             <asp:ControlParameter ControlID="lbliddevice" Name="iddevice" PropertyName="Text" />
         </SelectParameters>
    </asp:SqlDataSource>

    <asp:Label ID="lbliddevice" runat="server" Text="" Visible="false"></asp:Label>
     

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

