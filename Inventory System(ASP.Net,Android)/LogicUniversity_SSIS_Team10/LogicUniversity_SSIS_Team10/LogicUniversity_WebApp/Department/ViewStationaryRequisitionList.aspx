<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ViewStationaryRequisitionList.aspx.cs" Inherits="LogicUniversity_WebApp.Department.ViewStationaryRequisitionList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header text-center">Stationery Requisition</h1>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Stationery Requisition List</h1>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <asp:GridView ID="gv_List" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-striped"
                             OnRowEditing="gv_List_RowEditing" OnRowDeleting="gv_List_RowDeleting" OnRowDataBound="gv_List_RowDataBound"
                            AllowPaging="true" OnPageIndexChanging="gv_List_PageIndexChanging">
                            <HeaderStyle CssClass="info"/>
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                            <PagerSettings Mode="Numeric" PageButtonCount="15" />
                            <Columns>
                                <asp:TemplateField HeaderText="Requsistion ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblRequisitionsID" runat="server" Text='<%# Eval("RequisitionId") %>' Visible="false"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblRequisitionsIDValue" runat="server" Text='<%# Bind("RequisitionId")%>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Item Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblItemName" runat="server" Text='<%# Eval("ItemName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblItemNameValue" runat="server" Text='<%# Bind("ItemName")%>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Date">
                                    <ItemTemplate>
                                        <asp:Label ID="lblDateID" runat="server" Text='<%# Eval("CreatedDate","{0:yyyy/MM/dd}") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblDateValue" runat="server" Text='<%# Bind("CreatedDate")%>'></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <asp:Label ID="lblStatusID" runat="server" Text='<%# Eval("Status") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="lblStatusValue" runat="server" Text='<%# Bind("Status")%>'></asp:Label>
                                        <asp:Label ID="lbl" runat="server"></asp:Label>
                                    </EditItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="text-center" Width="100px"/>
                                    <ItemStyle CssClass="text-center"/>
                                    <HeaderTemplate>
                                        <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkBtnEdit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit" runat="server" CausesValidation="False"
                                            CommandName="Edit" ToolTip="EDIT"></asp:LinkButton>
                                        <asp:LinkButton ID="LnkBtnDelete" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove" runat="server" CausesValidation="False"
                                            CommandName="Delete" ToolTip="DELETE"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
