<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="batterystatus.aspx.cs" Inherits="batterystatus" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v16.1, Version=16.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="headermatn" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" Runat="Server">
    
    <dx:ASPxGaugeControl ID="ASPxGaugeControl2" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="12" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="12" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl1" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl3" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl4" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl5" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl6" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl7" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl8" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl9" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl10" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl11" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>
        <dx:ASPxGaugeControl ID="ASPxGaugeControl12" runat="server" Height="185px" Width="182px" BackColor="Transparent" Value="0">
        <Gauges>
            <dx:CircularGauge Bounds="0, 0, 260, 260" Name="cGauge1">
                <scales>
                    <dx:ArcScaleComponent AcceptOrder="0" 
                        AppearanceTickmarkText-Font="Tahoma, 9pt" 
                        AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" 
                        Center="125, 125" 
                        EndAngle="60" MajorTickCount="4" 
                        MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-10" 
                        MajorTickmark-ShapeType="Circular_Style20_1" 
                        MajorTickmark-TextOffset="-18" MajorTickmark-TextOrientation="LeftToRight" 
                        MaxValue="3" MinorTickCount="1" MinorTickmark-ShapeType="Circular_Style20_2" Name="scale1" 
                        RadiusX="97" RadiusY="97" StartAngle="-240" Appearance-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" Appearance-Width="1.5" AppearanceScale-Brush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#3A3832&quot;/&gt;" AppearanceScale-Width="1.5" AppearanceTickmarkText-Spacing="2, 2, 2, 2" MinorTickmark-ShapeOffset="-6">
                    </dx:ArcScaleComponent>
                </scales>
                <backgroundlayers>
                    <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" 
                        Name="bg1" ScaleID="scale1" ShapeType="CircularFull_Style20" ZOrder="1000" />
                </backgroundlayers>
                <needles>
                    <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" 
                        EndOffset="-2" Name="needle1" ScaleID="scale1" ShapeType="CircularFull_Style20"
                         StartOffset="-39.5" ZOrder="-50" />
                </needles>
                <spindlecaps>
                    <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" 
                        Name="cap1" ScaleID="scale1" ShapeType="CircularFull_Style20" 
                        Size="10, 10" ZOrder="-100" />
                </spindlecaps>
            </dx:CircularGauge>
        </Gauges>
<LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
    </dx:ASPxGaugeControl>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

