<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ApproveStaffRequistion.aspx.cs" Inherits="LogicUniversity_WebApp.Department.ApproveStaffRequistion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-center">Stationery Requisition</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Stationery Requisition Approval</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="col-lg-6 col-lg-offset-3">
                            <div class="form-group">
                                <label id="lblRequisitionID" class="control-label">Requisition Form#:&nbsp;</label>
                                <asp:Label ID="lblRequisitionIDValue" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label id="lblDateID" class="control-label">Date:&nbsp;</label>
                                <asp:Label ID="lblDateValue" runat="server"></asp:Label>
                            </div>
                            <div class="form-group">
                                <label id="lblStatusId" runat="server" class="control-label">Status:&nbsp;</label>
                                <asp:Label ID="lblStatusValue" runat="server"></asp:Label>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-8 col-lg-offset-2">
                                <asp:GridView ID="grv_req_head" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                                    <HeaderStyle CssClass="info" />
                                    <Columns>
                                        <asp:BoundField DataField="ItemName" HeaderText="ItemName" />
                                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                    </Columns>
                                </asp:GridView>
                                <div class="col-lg-2">
                                    <asp:Label ID="lblRemark" runat="server" class="control-label" Font-Bold="true">Remark</asp:Label>
                                </div>
                                <div class="col-lg-7">
                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="50" Rows="4" Style="resize: none;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="text-center">
                                <asp:Button ID="btnApprove" runat="server" CssClass="btn btn-success" Text="Approve" OnClick="btnApprove_Click" />
                                <asp:Button ID="btnReject" runat="server" CssClass="btn btn-danger" Text="Reject" OnClick="btnReject_Click" OnClientClick = "return confirm('Are you sure you want to reject this Requisition?');"/>
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
