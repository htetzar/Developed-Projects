<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="GenerateReorderReportBySupplier.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.GenerateReorderReportBySupplier" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%--<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>--%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function PrintPanel() {
            var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <%--<div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Generate Report</h2>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Generate Reorder Report By Supplier</h1>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-2">
                                    <label id="lblMonth" class="control-label" style="text-align: left;">No. of Month to compare:&nbsp;</label>
                                </div>
                                <div class="col-lg-2">
                                    <asp:DropDownList ID="ddlMonth" runat="server" OnSelectedIndexChanged="ddlMonth_SelectedIndexChanged" CssClass="form-control" AutoPostBack="True">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-8">
                                    <asp:PlaceHolder ID="phMonth" runat="server"></asp:PlaceHolder>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-2">
                                    <label id="lblUsage" class="control-label" style="text-align: left;">Usage of:&nbsp;</label>
                                </div>
                                <div class="col-lg-5">
                                    <asp:DropDownList ID="ddlItems" runat="server" class="chosen-select" CssClass="form-control" Style="width: 350px;" data-placeholder="Choose an Item">
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-primary" Text="Generate" OnClick="btnGenerate_Click" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="pnlContents" runat="server" Visible="false">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1 class="panel-title text-center">Comparison Reorder Report By Supplier</h1>
            </div>
            <div class="panel-body" style="height:900px">
                <input id="btnPrint" type="button" value="Print" class="btn btn-default" onclick="PrintPanel()" />
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="900px">
                    <LocalReport ReportPath="Report1.rdlc" ReportEmbeddedResource="LogicUniversity_WebApp.Report1.rdlc">
                        <DataSources>
                            <rsweb:ReportDataSource DataSourceId="ObjectDataSource1" Name="DataSet1" />
                        </DataSources>
                    </LocalReport>
                </rsweb:ReportViewer>
                
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" TypeName="LogicUniversity_WebApp.DataSetReorderBySupplierTableAdapters."></asp:ObjectDataSource>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
