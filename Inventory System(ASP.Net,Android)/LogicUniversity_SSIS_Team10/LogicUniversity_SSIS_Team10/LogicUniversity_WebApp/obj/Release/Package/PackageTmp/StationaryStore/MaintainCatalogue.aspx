<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="MaintainCatalogue.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.MaintainCatalogue" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-center">Maintain Catalogue
            </h1>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Stationery Catalogue List</h1>
                </div>
                <div class="panel-body">
                    <div class="form-group text-left">
                        <a href="MaintainCatalogueNew.aspx" class="btn btn-primary"><i class="glyphicon glyphicon-plus-sign"></i>&nbsp;Add New Stationery</a>
                    </div>
                    <div class="form-group">
                        <asp:GridView ID="gdvMaintainCata" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" DataKeyNames="ItemId"
                            AllowPaging="True" OnPageIndexChanging="gdvMaintainCata_PageIndexChanging" OnRowEditing="gdvMaintainCata_RowEditing" 
                            OnRowCancelingEdit="gdvMaintainCata_RowCancelingEdit" OnRowUpdating="gdvMaintainCata_RowUpdating"
                            OnRowDeleting="gdvMaintainCata_RowDeleting" OnRowDataBound="gdvMaintainCata_RowDataBound"
                            OnRowCommand="gdvMaintainCata_RowCommand">
                            <HeaderStyle CssClass="info" />
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                            <PagerSettings Mode="Numeric" PageButtonCount="15" />
                            <Columns>
                                <asp:TemplateField HeaderText="Item No">
                                    <HeaderStyle CssClass="hidden-xs" />
                                    <ItemStyle CssClass="hidden-xs" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemId" CssClass="control-label" Text='<%#Eval("ItemId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Category">
                                    <HeaderStyle CssClass="hidden-xs" />
                                    <ItemStyle CssClass="hidden-xs" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblCategoryName" CssClass="control-label" Text='<%#Eval("CategoryName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Description">
                                    <HeaderStyle />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblItemName" CssClass="control-label" Text='<%#Eval("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtItemName" runat="server" CssClass="form-control" Text='<%# Eval("ItemName") %>'  MaxLength="150"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="label label-danger" runat="server" ControlToValidate="txtItemName" ErrorMessage="Cannot be empty" ValidationGroup="maintaincata"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reorder Level">
                                    <HeaderStyle Width="123px" />
                                    <ItemStyle Width="123px" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReOrderLevel" CssClass="control-label" Text='<%#Eval("ReorderLevel") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtReorderLvl" runat="server" CssClass="form-control" Text='<%# Bind("ReorderLevel") %>' MaxLength="5"></asp:TextBox>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtReorderLvl" ErrorMessage="Out of range" CssClass="label label-danger overlaytext" MinimumValue="10" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="maintaincata"></asp:RangeValidator>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtReorderLvl" ValidationGroup="maintaincata" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="txtReorderLvl"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^[0-9]*$" ValidationGroup="maintaincata"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Reorder Qty">
                                    <HeaderStyle Width="123px" />
                                    <ItemStyle Width="123px" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblReOrderQty" CssClass="control-label" Text='<%#Eval("ReorderQty") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtReorderQty" runat="server" CssClass="form-control" Text='<%# Bind("ReorderQty") %>' MaxLength="5"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Cannot be empty" ValidationGroup="maintaincata"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtReorderQty" ErrorMessage="Out of range" MinimumValue="-200" MaximumValue="500" CssClass="label label-danger overlaytext" Display="Dynamic" Type="Integer" ValidationGroup="maintaincata"></asp:RangeValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                                            ControlToValidate="txtReorderQty"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^-?[0-9]\d*(\.\d+)?$" ValidationGroup="maintaincata"></asp:RegularExpressionValidator>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit of Measure">
                                    <HeaderStyle Width="75px" />
                                    <ItemStyle CssClass="text-center" Width="75px" />
                                    <ItemTemplate>
                                        <asp:Label runat="server" ID="lblUOM" CssClass="control-label" Text='<%#Eval("UOM") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="text-center" Width="130px" />
                                    <ItemStyle Width="130px" />
                                    <HeaderTemplate>
                                        <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                    </HeaderTemplate>
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnView" CssClass="btn btn-circle btn-default fa fa-info" Font-Size="8pt" runat="server" CommandName="Select" CommandArgument='<%#Eval("ItemId") %>' ToolTip="DETAILs" />
                                        <asp:LinkButton ID="btnEdit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit" runat="server" Font-Size="8pt" CommandName="Edit" ToolTip="EDIT"/>
                                        <%--<asp:LinkButton ID="btnDelete" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove" runat="server" Font-Size="8pt" CommandName="Delete" ToolTip="DELETE" />--%>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-circle btn-success glyphicon glyphicon-check" Font-Size="8pt" CommandName="Update" ToolTip="Update" ValidationGroup="maintaincata"/>
                                        <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-circle btn-warning glyphicon glyphicon-remove-circle" Font-Size="8pt" CommandName="Cancel" ToolTip="Cancel" />
                                    </EditItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!-- Modal Detail View-->
    <div class="modal fade" id="detailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header modalheader text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel" style="color: #ffffff;">Stock Card Details</h3>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                <label id="lblIid" class="control-label">Item code:&nbsp;</label>
                                <asp:Label ID="lblitemid" runat="server" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4">
                                <label id="lblIDecription" class="control-label">Item Description:&nbsp;</label>
                                <asp:Label ID="lblDescription" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2">
                                <label id="lblBNo" class="control-label">BIN#:&nbsp;</label>
                                <asp:Label ID="lblBin" runat="server" CssClass="control-label"></asp:Label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                <label id="lblUom" class="control-label">Unit of Measure:&nbsp;</label>
                                <asp:Label ID="lblUOM" CssClass="control-label" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <hr />
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-3">
                                <label id="lblSt" class="control-label"><span class="label label-danger">1<sup>st</sup></span>Supplier:&nbsp;</label>
                                <asp:Label ID="lblSup1" runat="server"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <label id="lblNd" class="control-label"><span class="label label-primary">2<sup>nd</sup></span>Supplier:&nbsp;</label>
                                <asp:Label ID="lblSup2" runat="server"></asp:Label>
                            </div>
                            <div class="col-lg-3">
                                <label id="lblRd" class="control-label"><span class="label label-info">3<sup>rd</sup></span>Supplier:&nbsp;</label>
                                <asp:Label ID="lblSup3" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered">
                            <HeaderStyle CssClass="info" />
                        </asp:GridView>
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnClose" CssClass="btn btn-default" data-dismiss="modal" Text="Close"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
