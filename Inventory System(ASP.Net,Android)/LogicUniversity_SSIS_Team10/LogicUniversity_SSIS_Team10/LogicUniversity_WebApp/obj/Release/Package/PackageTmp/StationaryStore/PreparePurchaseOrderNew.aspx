<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="PreparePurchaseOrderNew.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.PreparePurchaseOrderNew" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Stationery Purchase Order Form</h2>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Stationery Purchase Order</h1>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
                                    <div class="pull-left">
                                        <label id="lblPo" class="control-label">PO Number:&nbsp;</label>
                                        <asp:Label ID="lblPONumber" runat="server"></asp:Label>
                                    </div>
                                    <div class="pull-right">
                                        <label id="lblDeliverto" class="control-label">Deliver to:&nbsp;</label>
                                        <asp:Label ID="lblDeliver" runat="server" Text="LOGIC University"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-10 col-lg-offset-1 col-md-10 col-md-offset-1">
                                    <div class="pull-right">
                                        <label id="lblAttn" class="control-label">Attn:&nbsp;</label>
                                        <asp:Label ID="lblAttnValue" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <label class="control-label">Supplier:&nbsp;</label>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-7">
                                <asp:DropDownList ID="ddLstSupplier" runat="server" CssClass="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddLstSupplier_SelectedIndexChanged">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator InitialValue="-1" ID="reqSup" Display="Dynamic" ValidationGroup="ordernew" CssClass="label label-danger"
                                    runat="server" ControlToValidate="ddLstSupplier" ErrorMessage="Select a supplier"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-4 col-md-4 col-sm-6">
                                <label class="control-label" style="text-align:left;">Please supply the following items by:&nbsp;</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-5">
                                <asp:TextBox ID="textDate" runat="server" CssClass="form-control" onkeydown="return false;" placeholder="Select a date">
                                </asp:TextBox>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="textDate"></asp:CalendarExtender>
                            </div>
                        </div>
                    </div>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit"
                        OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating"
                        OnRowDataBound="GridView1_RowDataBound" CssClass="table table-bordered table-striped">
                        <HeaderStyle CssClass="info" />
                        <Columns>
                            <asp:TemplateField HeaderText="ItemCode">
                                <ItemTemplate>
                                    <asp:Label ID="lblItemCode" runat="server" Text='<%# Eval("ItemId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblItemCode" runat="server" Text='<%# Bind("ItemId")%>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ItemName">
                                <ItemTemplate>
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblItemName" runat="server" Text='<%# Bind("ItemName")%>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Balance">
                                <ItemTemplate>
                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Eval("Balance") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblBalance" runat="server" Text='<%# Bind("Balance")%>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="ReOrderQty">
                                <ItemTemplate>
                                    <asp:Label ID="lblOrderQty" runat="server" Text='<%# Eval("ReorderQty") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtReorderQty" placeholder="(10-500)" runat="server" CssClass="form-control" Text='<%# Bind("ReorderQty")%>' MaxLength="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Cannot be empty" ValidationGroup="gridordernew"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Out of range" MinimumValue="10" MaximumValue="500" CssClass="label label-danger overlaytext" Display="Dynamic" Type="Integer" ValidationGroup="gridordernew"></asp:RangeValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                        ControlToValidate="txtReorderQty"
                                        ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                        ValidationExpression="^[0-9]*$" ValidationGroup="gridordernew"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Price">
                                <ItemTemplate>
                                    <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblUnitPrice" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Amount">
                                <ItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblAmount" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="text-center" Width="130px" />
                                <ItemStyle Width="130px" />
                                <HeaderTemplate>
                                    <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                </HeaderTemplate>
                                <ItemStyle CssClass="text-center" />
                                <EditItemTemplate>
                                    <asp:LinkButton ID="LnkBtnUpdate" runat="server" CausesValidation="True" ToolTip="Update" ValidationGroup="gridordernew"
                                        CommandName="Update" CssClass="btn btn-circle btn-success glyphicon glyphicon-check" Font-Size="8pt"></asp:LinkButton>
                                    <asp:LinkButton ID="LnkBtnCancel" runat="server" CausesValidation="False" CssClass="btn btn-circle btn-warning glyphicon glyphicon-remove-circle"
                                        CommandName="Cancel" Font-Size="8pt" ToolTip="Cancel"></asp:LinkButton>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LnkBtnEdit" runat="server" CausesValidation="False" Font-Size="8pt" ToolTip="EDIT"
                                        CommandName="Edit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit"></asp:LinkButton>
                                    <asp:LinkButton ID="LnkBtnDelete" runat="server" CausesValidation="False" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove"
                                        CommandName="Delete" ToolTip="DELETE" Font-Size="8pt"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <label>Total Price:&nbsp;</label>
                                <asp:Label ID="lblTotal" runat="server" ForeColor="Red" Font-Bold="true"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="text-left">
                        <asp:Button ID="Send" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="Send_Click" ValidationGroup="ordernew" />
                        <asp:Button ID="btnAddNewItem" runat="server" OnClick="btnAddNewItem_Click" Text="ADD" CssClass="btn btn-primary" ValidationGroup="ordernew" />
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <div class="modal fade" id="orderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header modalheader text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel" style="color: #ffffff;">Add new stationery</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                                <label id="lblItemName" class="control-label">ItemName:&nbsp;</label>
                            </div>
                            <div class="col-lg-4">
                                <asp:DropDownList ID="ddlItemName" runat="server" OnSelectedIndexChanged="ddlItemName_SelectedIndexChanged1" AutoPostBack="true" CssClass="form-control"></asp:DropDownList>
                                 
                                 <asp:RequiredFieldValidator ID="reqddl" runat="server" ControlToValidate="ddlItemName" InitialValue="Select Item" ErrorMessage="Please select an item" CssClass="label label-danger overlaytext"  ValidationGroup="modalordernew"></asp:RequiredFieldValidator>
             



                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                                <label id="lblBalance" class="control-label">Balance:&nbsp;</label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtBalance" runat="server" Enabled="false" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-1">
                                <label id="lblQUantity" class="control-label">Quantity:&nbsp;</label>
                            </div>
                            <div class="col-lg-4">
                                <asp:TextBox ID="txtReorderQty" runat="server" CssClass="form-control" MaxLength="5" placeholder="(10-500)"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Cannot be empty" ValidationGroup="modalordernew"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Out of range" MinimumValue="10" MaximumValue="500" CssClass="label label-danger overlaytext" Display="Dynamic" Type="Integer" ValidationGroup="modalordernew"></asp:RangeValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                    ControlToValidate="txtReorderQty"
                                    ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                    ValidationExpression="^[0-9]*$" ValidationGroup="modalordernew"></asp:RegularExpressionValidator>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnAdd" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click" ValidationGroup="modalordernew" />
                    <asp:Button runat="server" ID="btnClose" CssClass="btn btn-default" data-dismiss="modal" Text="Close" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <script>
        function rejectPopup() {
            $('#rejectModal').modal('show');
        }
    </script>
</asp:Content>
