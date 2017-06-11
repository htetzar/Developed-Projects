<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="PreparePurchaseOrderDetail.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.PreparePurchaseOrderDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <h1 class="page-header">Stationery Purchase Order Form</h1>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">Stationery Purchase Order</h3>
                    </div>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-1">
                                    <div class="pull-left">
                                        <label id="lblPo" class="control-label">PO Number:&nbsp;</label>
                                        <asp:Label ID="lblPONumber" runat="server"></asp:Label>
                                    </div>
                                    <div class="pull-right">
                                        <label id="lblDeliver" class="control-label">Deliver to:&nbsp;</label>
                                        <asp:Label ID="lblDeliverTo" runat="server" Text="LOGIC University"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-1">
                                    <div class="pull-right">
                                        <label id="lblatt" class="control-label">Attn:&nbsp;</label>
                                        <asp:Label ID="lblAttn" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-4">
                                    <label class="control-label">Supplier:&nbsp;</label>
                                    <asp:Label ID="lblSupplier" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-5">
                                    <label class="control-label">Expected Delivery Date:&nbsp;</label>
                                    <asp:Label ID="lblSupplyDate" runat="server" Text=""></asp:Label>
                                </div>
                                <div class="col-lg-4">
                                    <label class="control-label">Order Date:&nbsp;</label>
                                    <asp:Label ID="LblOrderDate" runat="server" Text="" ></asp:Label>
                                </div>
                                <div class="col-lg-3">
                                    <label class="control-label">Ordered by:&nbsp;</label>
                                    <asp:Label ID="lblOrderBy" runat="server" Text=""></asp:Label>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-horizontal">
                        <asp:GridView ID="GridView_Detail" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False">
                            <HeaderStyle CssClass="info" />
                            <Columns>
                                <asp:BoundField DataField="ItemName" HeaderText="Item Name" />
                                <asp:BoundField DataField="ItemId" HeaderText="Item No." />
                                <asp:BoundField DataField="ReorderQty" HeaderText="Quantity" />
                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" />
                                <asp:BoundField DataField="Amount" HeaderText="Amount" />
                            </Columns>
                        </asp:GridView>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-4">
                                <label class="control-label">Total Price:&nbsp;</label>
                                <asp:Label ID="lblTotalPrice" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                            </div>
                        </div>
                        </div>
                    <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-1">
                                    <label class="control-label">Reason:&nbsp;</label>
                                </div>
                                <div class="col-lg-5">
                                    <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="20" Rows="4" placeholder="(Option)" style="resize:none;"></asp:TextBox>
                                </div>
                            </div>
                    </div>
                    <div class="text-center">
                        <asp:UpdatePanel ID="updPnl1" runat="server">
                            <ContentTemplate>
                                <asp:Button ID="Btn_Approve" runat="server" CssClass="btn btn-primary" Text="Approve" OnClick="Btn_Approve_Click" />
                                <asp:Button ID="Btn_Reject" runat="server" CssClass="btn btn-danger" data-toggle="modal"
                                    data-dismiss="modal" data-target="#rejectModal" Text="Reject" OnClick="Btn_Reject_Click" OnClientClick = "return confirm('Are you sure you want to reject this order?');"/>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
