<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ProcessStationaryRequisition.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.ProcessStationaryRequisition" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Stationery Requisition</h2>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h2 class="panel-title text-center">Process Stationery Requisition</h2>
                </div>
                <div class="panel-body">
                    <asp:GridView ID="gvRetrievalItem" runat="server" CssClass="table table-bordered table-striped"
                        AutoGenerateColumns="false"
                        DataKeyNames="departmentRequisitionId" OnRowDataBound="gvRetrievalItem_RowDataBound"
                        OnRowCancelingEdit="gvRetrievalItem_RowCancelingEdit"
                        OnRowDeleting="gvRetrievalItem_RowDeleting"
                        OnRowEditing="gvRetrievalItem_RowEditing" OnRowUpdating="gvRetrievalItem_RowUpdating">
                        <HeaderStyle CssClass="info" />
                        <Columns>
                            <asp:BoundField DataField="itemId" HeaderText="Item ID" ReadOnly="true" />
                            <asp:BoundField DataField="bin" HeaderText="Bin" ReadOnly="True" />
                            <asp:BoundField DataField="itemName" HeaderText="Stationery" ReadOnly="True" />
                            <asp:BoundField DataField="totalNeeded" HeaderText="Total Needed" ReadOnly="True" />
                            <asp:BoundField DataField="totalRetrieved" HeaderText="Total Retrieved" ReadOnly="true" />
                            <asp:BoundField DataField="status" HeaderText="Request Status" ReadOnly="true" />
                            <asp:BoundField DataField="departmentName" HeaderText="Dept Name" ReadOnly="true" />
                            <asp:BoundField DataField="departmentNeeded" HeaderText="Dept Needed" ReadOnly="True" />
                            <asp:BoundField DataField="departmentId" HeaderText="Department Id" Visible="false" />
                            <asp:BoundField DataField="departmentRequisitionId" HeaderText="DepartmentRequisition Id" Visible="false" />

                            <asp:TemplateField HeaderText="Dept Actual">
                                <ItemTemplate>
                                    <%# Eval("departmentActual")%>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox runat="server" ID="txtDeptActual" Text='<%# Eval("departmentActual")%>' CssClass="form-control" MaxLength="5" />
                                    <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtDeptActual" ErrorMessage="Out of range" CssClass="label label-danger overlaytext" MinimumValue="0" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="processrequisit"></asp:RangeValidator>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtDeptActual" ValidationGroup="processrequisit" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                        ControlToValidate="txtDeptActual"
                                        ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                        ValidationExpression="^[0-9]*$" ValidationGroup="processrequisit"></asp:RegularExpressionValidator>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderStyle CssClass="text-center" Width="130px" />
                                <ItemStyle Width="130px" />
                                <HeaderTemplate>
                                    <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                </HeaderTemplate>
                                <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" CssClass="btn btn-circle btn-primary glyphicon glyphicon-edit" runat="server" Font-Size="8pt" CommandName="Edit" ToolTip="EDIT" />
                                    <asp:LinkButton ID="btnDelete" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove" runat="server" Font-Size="8pt" CommandName="Delete" ToolTip="DELETE" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-circle btn-success glyphicon glyphicon-check" Font-Size="8pt" CommandName="Update" ToolTip="Update" ValidationGroup="processrequisit" />
                                    <asp:LinkButton ID="btnCancel" runat="server" CssClass="btn btn-circle btn-warning glyphicon glyphicon-remove-circle" Font-Size="8pt" CommandName="Cancel" ToolTip="Cancel" />
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <%--<asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" causesvalidation="false" ShowCancelButton="true" />--%>
                        </Columns>
                    </asp:GridView>
                    <asp:Label ID="lblMsg" runat="server" CssClass="label label-danger"></asp:Label><br />
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-success" OnClick="btnSubmit_Click" Visible="false"/>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
