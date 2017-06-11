<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="GenerateRequisitionTrendReport.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.GenerateRequisitionTrendReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>
<%--<%@ Register assembly="Microsoft.ReportViewer.WebForms, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" namespace="Microsoft.Reporting.WebForms" tagprefix="rsweb" %>--%>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
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
  <%--  <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Generate Report</h2>
        </div>
    </div>--%>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Generate Requisition Trend Report By Department</h1>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-2">
                                    <label id="lblMonth" class="control-label" style="text-align: left;">Month:&nbsp;</label>
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
                        <div class="text-center">
                            <asp:Button ID="btnGenerate" runat="server" CssClass="btn btn-primary" Text="Generate" OnClick="btnGenerate_Click" />
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Panel ID="pnlContents" runat="server" Visible="false">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h1 class="panel-title text-center">Comparison Requisition Trend Report By Department</h1>
            </div>
            <div class="panel-body" style="height:900px">
                <input id="btnPrint" type="button" class="btn btn-default" value="Print" onclick="PrintPanel()" />
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Font-Names="Verdana" Font-Size="8pt" WaitMessageFont-Names="Verdana" WaitMessageFont-Size="14pt" Width="100%" Height="900px">
                    <LocalReport ReportPath="ReportRequisitionByDepartment.rdlc">
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
