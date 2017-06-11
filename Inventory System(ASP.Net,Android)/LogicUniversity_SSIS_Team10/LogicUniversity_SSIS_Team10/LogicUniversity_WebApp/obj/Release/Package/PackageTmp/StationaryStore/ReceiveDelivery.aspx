<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ReceiveDelivery.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.ReceiveDelivery" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <h1 class="page-header text-center">Delivery Information</h1>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Receive Delivery</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-4 col-xs-4">
                                <label class="control-label">Order No:&nbsp;</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-5 col-xs-8">
                                <asp:DropDownList ID="ddlOrderNo" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderNo_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-6 col-md-6 col-sm-9">
                                <label class="control-label">Supplier Name:&emsp;&emsp;&emsp;&emsp;&emsp;</label>
                                <asp:Label runat="server" ID="lblSupplierName"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="grv_ReceivedOrder" runat="server" AutoGenerateColumns="False" OnRowEditing="grv_ReceivedOrder_RowEditing"
                        OnRowCancelingEdit="grv_ReceivedOrder_RowCancelingEdit" OnRowUpdating="grv_ReceivedOrder_RowUpdating" CssClass="table table-bordered table-striped">
                        <HeaderStyle CssClass="info" />
                        <Columns>
                            <asp:TemplateField HeaderText="Order No">
                                <EditItemTemplate>
                                    <asp:Label ID="lblOrderId" runat="server" Text='<%# Bind("OrderId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderId" runat="server" Text='<%# Eval("OrderId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Item Id">
                                <EditItemTemplate>
                                    <asp:Label ID="lblItemId" runat="server" Text='<%# Bind("ItemId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblItemId" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Name">
                                <HeaderStyle CssClass="hidden-sm hidden-xs"/>
                                <ItemStyle CssClass="hidden-sm hidden-xs"/>
                                <EditItemTemplate>
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                </ItemTemplate>
                                <ControlStyle Width="110px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order Date">
                                <HeaderStyle CssClass="hidden-xs"/>
                                <ItemStyle CssClass="hidden-xs"/>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("OrderDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderDate" runat="server" Text='<%# Eval("OrderDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Order Quantity">
                                <EditItemTemplate>
                                    <asp:Label ID="lblOrderQty" runat="server" Text='<%# Bind("OrderQuantity") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderQty" runat="server" Text='<%# Eval("OrderQuantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Received Quantity">
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtReceivedQty" runat="server" Text='<%# Bind("ReceivedQuantity") %>' CssClass="form-control" MaxLength="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtReceivedQty" ErrorMessage="Cannot be empty" ValidationGroup="receive"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtReceivedQty" ErrorMessage="Out of range" MinimumValue="10" MaximumValue="500" CssClass="label label-danger overlaytext" Display="Dynamic" Type="Integer" ValidationGroup="receive"></asp:RangeValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                        ControlToValidate="txtReceivedQty"
                                        ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                        ValidationExpression="^[0-9]*$" ValidationGroup="receive"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="txtReceivedQty" runat="server" Text='<%# Eval("ReceivedQuantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <HeaderStyle CssClass="hidden-xs"/>
                                <ItemStyle CssClass="hidden-xs"/>
                                <EditItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="lblPrice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="text-center" Width="130px" />
                                <ItemStyle Width="130px" />
                                <HeaderTemplate>
                                    <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                </HeaderTemplate>
                                <ItemStyle CssClass="text-center" />
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LnkBtnUpdate" runat="server" CausesValidation="True" Font-Size="8pt" ToolTip="Update"
                                        CommandName="Update" CssClass="btn btn-circle btn-success glyphicon glyphicon-check" ValidationGroup="receive"></asp:LinkButton>
                                    <asp:LinkButton ID="LnkBtnCancel" runat="server" CausesValidation="False" ToolTip="Cancel" Font-Size="8pt"
                                        CommandName="Cancel" CssClass="btn btn-circle btn-warning glyphicon glyphicon-remove-circle"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="False" Font-Size="8pt" ToolTip="EDIT"
                                        CommandName="Edit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
