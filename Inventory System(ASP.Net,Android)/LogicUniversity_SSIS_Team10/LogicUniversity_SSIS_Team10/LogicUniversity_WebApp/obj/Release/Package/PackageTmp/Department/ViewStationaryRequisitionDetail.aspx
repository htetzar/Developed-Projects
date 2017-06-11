<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ViewStationaryRequisitionDetail.aspx.cs" Inherits="LogicUniversity_WebApp.Department.ViewStationaryRequisitionDetail" %>

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
                    <h3 class="panel-title text-center">Stationery Requisition Details</h3>
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
                    <div class="col-lg-8 col-lg-offset-2">
                        <asp:GridView ID="gv_List" runat="server" Width="100%" AutoGenerateColumns="false" CssClass="table table-bordered table-striped">
                            <HeaderStyle CssClass="info"/>
                            <Columns>
                                <asp:TemplateField HeaderText="Item Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblItemNameValue" runat="server" Text='<%# Bind("ItemName")%>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity">
                                    <HeaderStyle Width="140px"/>
                                    <ItemStyle Width="140px"/>
                                    <ItemTemplate>
                                        <asp:TextBox ID="txtQuantityID" runat="server" Text='<%# Eval("Quantity") %>' CssClass="form-control" MaxLength="5" placeholder="(1-500)"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" CssClass="label label-danger overlaytext" ErrorMessage="Cannot be empty" ControlToValidate="txtQuantityID" ValidationGroup="detail"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtQuantityID" ErrorMessage="Out of range" CssClass="label label-danger overlaytext" MinimumValue="1" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="detail"></asp:RangeValidator>
                                        <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext" ControlToValidate="txtQuantityID" ValidationGroup="detail" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="lblQuantityValue" runat="server" Text='<%# Eval("Quantity")%>' CssClass="form-control" MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" CssClass="label label-danger overlaytext" ErrorMessage="Cannot be empty" ControlToValidate="lblQuantityValue" ValidationGroup="detail"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext" ControlToValidate="lblQuantityValue" ValidationGroup="detail" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="detail"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
