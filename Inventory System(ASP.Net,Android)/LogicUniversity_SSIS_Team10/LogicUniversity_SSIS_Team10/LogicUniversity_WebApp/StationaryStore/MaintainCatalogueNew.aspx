<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="MaintainCatalogueNew.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.MaintainCatalogueNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Page Heading -->
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-center">New Stationery Catalogue</h1>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title text-center">Add new stationery</h3>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1 col-sm-3">
                                <label id="Label1" class="control-label">Category</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <asp:DropDownList ID="DropDownListCategory" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-2">
                                <label id="lblitemid" class="control-label">Item ID</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-4">
                                <asp:TextBox ID="txtItemId" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:Label ID="lblidVal" runat="server" CssClass="label label-danger"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtItemId" Display="Dynamic" CssClass="label label-danger" ErrorMessage="Cannot be empty" ValidationGroup="UpdatePanel1"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-3">
                                <label id="lbldescription" class="control-label">Description</label>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-12">
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" MaxLength="150"></asp:TextBox>
                                <asp:Label ID="lblMsg" runat="server" CssClass="label label-danger"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtDescription" Display="Dynamic" ErrorMessage="Cannot be empty" CssClass="label label-danger" ValidationGroup="UpdatePanel2"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1 col-sm-3">
                                <label id="lblReorderLvl" class="control-label" style="text-align:left;">Reorder Level</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <asp:TextBox ID="txtReorderLev" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator20" runat="server"
                                            ControlToValidate="txtReorderLev"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtReorderLev" ErrorMessage="Out of range" CssClass="label label-danger" MinimumValue="10" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="UpdatePanel2"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtReorderLev" Display="Dynamic" ErrorMessage="Cannot be empty" CssClass="label label-danger" ValidationGroup="UpdatePanel2"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-3">
                                <label id="lblreorderqty" class="control-label" style="text-align:left;">Reorder Quantity</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <asp:TextBox ID="txtreorderqty" runat="server" CssClass="form-control" ViewStateMode="Enabled"></asp:TextBox>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidaton0" runat="server"
                                            ControlToValidate="txtreorderqty"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^[0-9]*$" ValidationGroup="NumericValidate"></asp:RegularExpressionValidator>
                                <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtreorderqty" ErrorMessage="Out of range" MinimumValue="10" MaximumValue="500" CssClass="label label-danger" Display="Dynamic" Type="Integer" ValidationGroup="UpdatePanel2"></asp:RangeValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtreorderqty" Display="Dynamic" ErrorMessage="Cannot be empty" CssClass="label label-danger" ValidationGroup="UpdatePanel2"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-4">
                                <label id="lbluom" class="control-label">Unit of Measure:</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <asp:DropDownList ID="DropDownListuom" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                            <div class="col-lg-1 col-md-1 col-sm-2">
                                <label id="lblbinno" class="control-label">BIN #</label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <asp:TextBox ID="txtbinno" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RegularExpressionValidator Display = "Dynamic" ControlToValidate = "txtbinno" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{0,4}$" CssClass="label label-danger" runat="server" ErrorMessage="Maximum 4 characters."></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorbinno" runat="server" ControlToValidate="txtbinno" ErrorMessage="Cannot be empty" CssClass="label label-danger" ValidationGroup="UpdatePanel2"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1 col-sm-4">
                                <label id="lblsupplier1" class="control-label">Supplier1</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6">
                                <asp:DropDownList ID="DropDownListsupplier1" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                                <asp:Label ID="lblchecksupplier1" runat="server" CssClass="label label-danger"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1 col-sm-4">
                                <label id="lblsupplier2" class="control-label">Supplier2</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6">
                                <asp:DropDownList ID="DropDownListsupplier2" runat="server" CssClass="form-control" ViewStateMode="Enabled">
                                </asp:DropDownList>
                                <asp:Label ID="lblchecksupplier2" runat="server" CssClass="label label-danger"></asp:Label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-1 col-md-1 col-sm-4">
                                <label id="lblsupplier3" class="control-label">Supplier3</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-6">
                                <asp:DropDownList ID="DropDownListsupplier3" runat="server" CssClass="form-control" ViewStateMode="Enabled">
                                </asp:DropDownList>
                                <asp:Label ID="lblchecksupplier3" runat="server" CssClass="label label-danger"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div>
                        <asp:Button ID="Button2" runat="server" Text="Save" CssClass="btn btn-success" OnClick="Button2_Click" ValidationGroup="valRegister" />
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
