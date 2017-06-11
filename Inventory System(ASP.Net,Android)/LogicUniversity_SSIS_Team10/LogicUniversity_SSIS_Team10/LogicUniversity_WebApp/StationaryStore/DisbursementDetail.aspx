<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="DisbursementDetail.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.DisbursementDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Disbursement</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h4 class="panel-title text-center">Disbursement Details</h4>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gvDisbursementDetailList" runat="server" CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="False"
                        DataKeyNames="DisbursementId">
                        <HeaderStyle CssClass="info" />
                        <Columns>
                            <asp:BoundField DataField="DisbursementId" HeaderText="DisbursementId" Visible="true"></asp:BoundField>
                            <asp:BoundField DataField="ItemName" HeaderText="Item" Visible="true"></asp:BoundField>
                            <asp:BoundField DataField="ActualQuantity" HeaderText="Quantity" Visible="true"></asp:BoundField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
