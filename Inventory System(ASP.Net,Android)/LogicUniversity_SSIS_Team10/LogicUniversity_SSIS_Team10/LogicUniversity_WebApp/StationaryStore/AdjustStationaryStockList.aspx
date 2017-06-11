<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AdjustStationaryStockList.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.AdjustStationaryStockList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Stock Adjustment</h2>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Stock Adjustment List</h1>
                </div>
                <div class="panel-body">
                    <div class="form-group text-left">
                        <asp:LinkButton ID="btnAdjustmentNew" runat="server" CssClass="btn btn-primary" OnClick="btnAdjustmentNew_Click"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;New Stock Adjustment</asp:LinkButton>
                    </div>
                    <asp:GridView CssClass="table table-striped table-bordered" ID="gvwList" runat="server" AutoGenerateColumns="false" AllowPaging="True"
                        OnPageIndexChanging="gvwList_PageIndexChanging" OnRowCreated="gvwList_RowCreated" OnSelectedIndexChanged="gvwList_SelectedIndexChanged"
                         DataKeyNames="VoucherId" OnRowDataBound="gvwList_RowDataBound">
                        <HeaderStyle CssClass="info" />
                        <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                        <PagerSettings Mode="Numeric" PageButtonCount="15" />
                        <Columns>
                            <asp:BoundField DataField="VoucherId" HeaderText="VoucherId" Visible="true" HeaderStyle-HorizontalAlign="Center">
                            </asp:BoundField>
                            <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" DataFormatString="{0:yyyy/MM/dd}" Visible="true">
                            </asp:BoundField>
                            <asp:BoundField DataField="Status" HeaderText="Status" Visible="true">
                                <HeaderStyle CssClass="text-center" Width="120px" />
                                <ItemStyle CssClass="text-center" Width="120px"/>
                            </asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
