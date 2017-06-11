<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="AdjustStationaryStockDetail.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.AdjustStationaryStockDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
        <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Adjustment Voucher</h2>
        </div>
    </div>

    <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4 class="panel-title text-center">Adjustment Voucher Details</h4>
                    </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <fieldset class="well">
                                <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1 text-center">
                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-4">
                                        <label id="labVoucherText" class="control-label">Voucher#:&nbsp;</label>
                                        <asp:Label ID="lblVoucher" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-7 col-xs-8">
                                        <label id="lblDateIssueText" class="control-label">Date Issued:&nbsp;</label>
                                        <asp:Label ID="lblDateIssue" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-4">
                                        <label id="lblAuthoriseText" class="control-label">Approved By:&nbsp;</label>
                                        <asp:Label ID="lblAuthorise" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-5 col-md-5 col-sm-5 col-xs-8">
                                        <label id="lblStt" class="control-label">Status:&nbsp;</label>
                                        <asp:Label ID="lblStatus" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </fieldset>  
                        </div>
                        <div class="form-group">
                            <asp:GridView ID="gvwAdjustDetailList" runat="server" AllowPaging="true"
                                AutoGenerateColumns="false" CssClass="table table-striped table-bordered"
                                OnPageIndexChanging="gvwAdjustDetailList_PageIndexChanging">
                                <HeaderStyle CssClass="info" />
                                <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                                <PagerSettings Mode="Numeric" PageButtonCount="15" />
                                <Columns>
                                    <asp:BoundField DataField="ItemId" HeaderText="Item Code" Visible="true"></asp:BoundField>
                                    <asp:BoundField DataField="Quantity_Adjusted" HeaderText="Quantity Adjusted" Visible="true"></asp:BoundField>
                                    <asp:BoundField DataField="Reason" HeaderText="Reason" Visible="true">
                                        <HeaderStyle Width="200px"/>
                                        <ItemStyle Width="200px"/>
                                    </asp:BoundField>
                                </Columns>
                            </asp:GridView>
                            <div class="text-center">
                                <div class="col-lg-3 col-lg-offset-4">
                                    <asp:Button ID="btnApprove" CssClass="btn btn-primary" runat="server" Text="Approve" OnClick="btnApprove_Click" />
                                    <asp:Button ID="btnReject" runat="server" CssClass="btn btn-danger" Text="Reject" OnClick="btnReject_Click" OnClientClick = "return confirm('Are you sure you want to reject this adjustment?');"/>
                                </div>
                                <div class="col-lg-3 col-lg-offset-4">
                                    <asp:PlaceHolder ID="phRemark" runat="server"></asp:PlaceHolder>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
 