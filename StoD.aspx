<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StoD.aspx.cs" Inherits="StoD" %>
<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
    <asp:Panel ID="pnlhd" runat="server">
          <h4 class="title">Choose The Device</h4>
    <p class="category">Please choose the device from the below list</p>

    </asp:Panel>
    <asp:Panel ID="pnlsensorsshow" runat="server" Visible="false">
          <h4 class="title">Assigned Sensors</h4>
    <p class="category">The below list are the sensors that assigned to: 
        <asp:Label ID="lblnamedevice" runat="server" Text=""></asp:Label>

    </p>

    </asp:Panel>

    <asp:Panel ID="pnlhs" runat="server" Visible="false">
          <h4 class="title">Choose The Sensor</h4>
    <p class="category">Please choose The sensor from the below list</p>
    </asp:Panel>

       <asp:Panel ID="pnlhDetail" runat="server" Visible="false">
          <h4 class="title">Enter the details The Sensor</h4>
    <p class="category">Please enter the below information to complete this action</p>

    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    <%--    //////***************** grid Device********************///////////////////////--%>
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
        <dx:GridViewDataTextColumn FieldName="lat" Caption="Latitude" VisibleIndex="3">
                  <EditFormSettings VisibleIndex="2"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="long" Caption="Longitude" VisibleIndex="4">
                    <EditFormSettings VisibleIndex="3"/>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="comment" VisibleIndex="5" Visible="false">
            <EditFormSettings Visible="True" ColumnSpan="3" VisibleIndex="100"/>
        </dx:GridViewDataTextColumn>
    </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblDevice WHERE (idD = @idD)" InsertCommand="INSERT INTO tblDevice(NameD, lat, long, comment) VALUES (@NameD, @lat, @long, @comment)" SelectCommand="SELECT * FROM [tblDevice]" UpdateCommand="UPDATE tblDevice SET NameD = @NameD, lat = @lat, long = @long, comment = @comment where idD=@idD">
                            <DeleteParameters>
                                <asp:Parameter Name="idD" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="NameD" />
                                <asp:Parameter Name="lat" />
                                <asp:Parameter Name="long" />
                                <asp:Parameter Name="comment" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="NameD" />
                                <asp:Parameter Name="lat" />
                                <asp:Parameter Name="long" />
                                <asp:Parameter Name="comment" />
                                <asp:Parameter Name="idD" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
        <br /><br />
        <dx:ASPxButton ID="btnchoosedevice" runat="server" Text="Submit the device" Theme="Moderno" OnClick="btnchoosedevice_Click"></dx:ASPxButton>
    </asp:Panel>
<%--    //////***************** grid Devicesensor********************///////////////////////--%>
    <asp:Panel ID="pnlshowsensor" runat="server" Visible="false">
        <dx:ASPxGridView ID="gridDS" runat="server" KeyFieldName="idds"
            Theme="Office2003Blue" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idds" ReadOnly="True" VisibleIndex="5">
            <EditFormSettings Visible="False" />
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NameS" Caption="Sensor Name"  VisibleIndex="11">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="unitS" Caption="Unit of Sensor" VisibleIndex="12">
        </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="port" Caption="port number" VisibleIndex="9">
        </dx:GridViewDataTextColumn>
    </Columns>
                        </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblsensorTodevice WHERE (idds = @idds)" 
                             SelectCommand="select * from tblsensorTodevice sd  inner join tblDevice d  on 
                                d.idD=sd.iddevice inner join tblSensor s on sd.idsensor=s.idS
                                WHERE (d.idD = @idD)" >
                            <DeleteParameters>
                                <asp:Parameter Name="idds" />
                            </DeleteParameters>
                            <SelectParameters>
                                <asp:ControlParameter ControlID="lbliddevice" Name="idD" PropertyName="Text" />
                            </SelectParameters>
                        </asp:SqlDataSource>
           <br /><br />
        <dx:ASPxButton ID="btnshowsensors" runat="server" Text="Add a new sensor" Theme="Moderno" OnClick="btnshowsensors_Click" ></dx:ASPxButton>

    </asp:Panel>

        <%--    //////***************** grid Sensor********************///////////////////////--%>
    <asp:Panel ID="pnlCs" runat="server" Visible="false">
        
<dx:ASPxGridView ID="GridSensor" runat="server" KeyFieldName="idS"
     AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  Theme="Office2003Blue" >
    <Settings ShowFilterRow="True" /> <SettingsBehavior AllowFocusedRow="True" />
    <Columns>
        <dx:GridViewCommandColumn VisibleIndex="0">
        </dx:GridViewCommandColumn>
        <dx:GridViewDataTextColumn FieldName="idS" VisibleIndex="1" ReadOnly="True" Visible="false">
    
            <EditFormSettings Visible="False" />
    
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="NameS" Caption="Sensor Name" VisibleIndex="2">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="unitS" Caption="Unit of Sensor" VisibleIndex="3">
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn FieldName="commnet" VisibleIndex="4">
            <EditFormSettings Visible="True" ColumnSpan="3" VisibleIndex="100"/>
        </dx:GridViewDataTextColumn>
    </Columns>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                            DeleteCommand="DELETE FROM tblSensor WHERE (idS = @idS)" InsertCommand="INSERT INTO tblSensor(NameS, unitS, commnet) VALUES (@NameS, @unitS, @commnet)" SelectCommand="SELECT * FROM [tblSensor]" UpdateCommand="UPDATE tblSensor SET NameS = @NameS, unitS = @unitS, commnet = @commnet WHERE (idS = @idS)">
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
        <dx:ASPxButton ID="btnSubSen" runat="server" Text="Submit the sensor" Theme="Moderno" OnClick="btnSubSen_Click"></dx:ASPxButton>

    </asp:Panel>

        <%--    //////***************** grid Detail********************///////////////////////--%>
    <asp:Panel ID="pnldetailds" runat="server" Visible="false">
        <br />
        <table border="0">
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Port:"></asp:Label>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <br />   <br />
                </td>
                <td>
                    <asp:TextBox ID="txtport" runat="server"></asp:TextBox>
                    <br />   <br />
                </td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="Comments:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtcomment" Height="100px" Width="500px" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
        </table>
           <br /><br />
        <dx:ASPxButton ID="btninserttodb" runat="server" Text="Submit the parametres" Theme="Moderno" OnClick="btninserttodb_Click"></dx:ASPxButton>


    </asp:Panel>
    <asp:Label ID="lbliddevice" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblidsensor" runat="server" Text="" Visible="false"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

