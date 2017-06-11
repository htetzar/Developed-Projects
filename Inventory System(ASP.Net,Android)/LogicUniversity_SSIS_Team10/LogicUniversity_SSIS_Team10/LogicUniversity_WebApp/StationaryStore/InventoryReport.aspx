<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="InventoryReport.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.InventoryReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="panel panel-default">
            <div class="panel-heading">
                <h1 class="panel-title text-center">Inventory Status Report</h1>
            </div>
            <div class="panel-body"  style="height:900px">
    <asp:ToolkitScriptManager runat="server"></asp:ToolkitScriptManager>
    <rsweb:reportviewer runat="server" ID="reportViewer1" Font-Names="Verdana" Font-Size="8pt" style="margin-top: 0px" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="1144px" Height="900px">
        <localreport reportpath="Inventory.rdlc">
            <datasources>
                <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
            </datasources>
        </localreport>
    </rsweb:reportviewer>
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="LogicUniversity_WebApp.DataSetReorderBySupplierTableAdapters."></asp:ObjectDataSource>
                </div></div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
<%--ID="ctl30"--%>