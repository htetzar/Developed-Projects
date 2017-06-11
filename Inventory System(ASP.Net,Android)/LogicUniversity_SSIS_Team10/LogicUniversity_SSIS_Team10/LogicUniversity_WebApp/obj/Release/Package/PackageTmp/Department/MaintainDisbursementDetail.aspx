<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="MaintainDisbursementDetail.aspx.cs" Inherits="LogicUniversity_WebApp.Department.MaintainDisbursementDetail" %>
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
                    <h4 class="text-center panel-title">Maintain Disbursement Details</h4>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gvDisbursementDetail" runat="server" CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="false"
                        DataKeyNames="DisbursementId,ItemId"
                        OnRowCancelingEdit="gvDisbursementDetail_RowCancelingEdit"
                        OnRowEditing="gvDisbursementDetail_RowEditing" OnRowUpdating="gvDisbursementDetail_RowUpdating">
                        <HeaderStyle CssClass="info" />
                        <Columns>
                            <asp:BoundField DataField="DisbursementId" HeaderText="Item ID" ReadOnly="true" Visible="false" />
                            <asp:BoundField DataField="ItemId" HeaderText="Bin" ReadOnly="True" Visible="false" />
                            <asp:BoundField DataField="ItemName" HeaderText="Stationery" ReadOnly="True" />
                            <asp:BoundField DataField="NeededQuantity" HeaderText="Needed Quantity" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Actual Quantity">
                                <ItemTemplate>
                                    <%# Eval("ActualQuantity")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtActualQuantity" Text='<%# Eval("ActualQuantity")%>' CssClass="form-control" MaxLength="5" placeholder="(0-500)"/>
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtActualQuantity" ErrorMessage="Out of range" CssClass="label label-danger overlaytext" MinimumValue="0" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="disburse"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtActualQuantity" ValidationGroup="disburse" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="txtActualQuantity"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^[0-9]*$" ValidationGroup="disburse"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="text-center" Width="90px" />
                                <ItemStyle Width="90px" />
                                <HeaderTemplate>
                                    <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                </HeaderTemplate>
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit" runat="server" Font-Size="8pt" CommandName="Edit" ToolTip="EDIT" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-circle btn-success glyphicon glyphicon-check" Font-Size="8pt" CommandName="Update" ToolTip="Update" ValidationGroup="disburse"/>
                                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-circle btn-warning glyphicon glyphicon-remove-circle" Font-Size="8pt" CommandName="Cancel" ToolTip="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField ButtonType="Button" ShowEditButton="true" causesvalidation="false" ShowCancelButton="true" />--%>
                        </Columns>
                    </asp:GridView>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="text-left">
                                <div class="col-lg-1">
                                    <label id="Label1" class="control-label">Remark</label>
                                </div>
                                <div class="col-lg-5">
                                    <asp:TextBox ID="txtRemark" runat="server" CssClass="form-control" TextMode="MultiLine" Columns="20" Rows="5" Style="resize: none;"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="text-left">
                                <div class="col-lg-1">
                                    <asp:Button ID="btnAcknowledge" runat="server" CssClass="btn btn-primary" Text="Acknowledge" OnClick="btnAcknowledge_Click" ValidationGroup="disburse" Visible="false" />
                                </div>
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
