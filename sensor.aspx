<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sensor.aspx.cs" Inherits="sensor" %>

<%@ Register Assembly="DevExpress.Web.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
    <h4 class="title">Sensors</h4>
    <p class="category">The list of Sensors is on below gridview. You can add new one, edit or delete Sensors.</p>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    
<dx:ASPxGridView ID="ASPxGridView1" Theme="Office2003Blue" runat="server" 
    KeyFieldName="idS" AutoGenerateColumns="False" DataSourceID="SqlDataSource1">
    <Settings ShowFilterRow="True" />
    <Columns>
        <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" 
            ShowNewButtonInHeader="True" VisibleIndex="0">
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
          <dx:GridViewDataComboBoxColumn FieldName="chart" VisibleIndex="4">
    <PropertiesComboBox TextField="chartName" 
            ValueField="ChartID" ValueType="System.String">
        <Items>
            <dx:ListEditItem Text="Line mode" Value="line" ImageUrl="assets/img/chline.png" />
            <dx:ListEditItem Text="Area mode" Value="area" ImageUrl="assets/img/charea.png"/>
            <dx:ListEditItem Text="Side mode" Value="side" ImageUrl="assets/img/chside.png"/>
            <dx:ListEditItem Text="Digital mode" Value="digital" ImageUrl="assets/img/chnumber.png"/>
        </Items>
    </PropertiesComboBox>
</dx:GridViewDataComboBoxColumn>
    </Columns>
     </dx:ASPxGridView>

     <br />
         <asp:ImageButton ID="btnExcel" ToolTip="Export to excel" ImageUrl="~/assets/img/excel.png" runat="server" OnClick="btnExcel_Click" />
      <asp:ImageButton ID="btnword" ToolTip="Export to pdf" ImageUrl="~/assets/img/pdf.png" runat="server" OnClick="btnword_Click" />
              <dx:ASPxGridViewExporter ID="gridExport" GridViewID="griddevice" runat="server">
           </dx:ASPxGridViewExporter>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ngDBConnectionString %>" 
                DeleteCommand="DELETE FROM tblSensor WHERE (idS = @idS)" InsertCommand="INSERT INTO tblSensor(NameS, unitS, commnet, chart) VALUES (@NameS, @unitS, @commnet, @chart)" SelectCommand="SELECT * FROM [tblSensor]" UpdateCommand="UPDATE tblSensor SET NameS = @NameS, unitS = @unitS, commnet = @commnet, chart= @chart WHERE (idS = @idS)">
                <DeleteParameters>
                    <asp:Parameter Name="idS" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NameS" />
                    <asp:Parameter Name="unitS" />
                    <asp:Parameter Name="commnet" />
                    <asp:Parameter Name="chart" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NameS" />
                    <asp:Parameter Name="unitS" />
                    <asp:Parameter Name="commnet" />
                    <asp:Parameter Name="idS" />
                        <asp:Parameter Name="chart" />
                </UpdateParameters>
            </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

