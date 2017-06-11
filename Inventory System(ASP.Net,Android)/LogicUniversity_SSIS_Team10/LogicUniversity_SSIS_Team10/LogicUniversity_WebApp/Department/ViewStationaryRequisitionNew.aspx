<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ViewStationaryRequisitionNew.aspx.cs" Inherits="LogicUniversity_WebApp.Department.ViewStationaryRequisitionNew" %>

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
                    <h3 class="panel-title text-center">New Stationery Requisition Form</h3>
                </div>
                <div class="panel-body">
                    <fieldset class="well">
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-6 col-md-6 col-sm-8">
                                    <label id="lblRequisitionID" class="control-label">Requisition Form#:&emsp;&emsp;</label>
                                    <asp:Label ID="lblRequisition" runat="server"></asp:Label>
                                </div>
                                <div class="col-lg-3 col-md-3 col-sm-4">
                                    <label id="lblDateId" class="control-label">Date:&nbsp;</label>
                                    <asp:Label ID="lblDate" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-2 col-md-2 col-sm-3">
                                    <label id="lblDescription" class="control-label">Description:&nbsp;</label>
                                </div>
                                <div class="col-lg-4 col-md-4 col-sm-5">
                                    <asp:DropDownList ID="ddlDescription" runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlDescription_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-4">
                                    <label id="lblUnit" class="control-label" style="text-align:left;">Unit of Measurement:&nbsp;</label>
                                    <asp:Label ID="lblUOM" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-3">
                                    <label id="lblQuantityId" class="control-label">Quantity:</label>
                                </div>
                                <div class="col-lg-2 col-md-2 col-sm-3 col-xs-5">
                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" MaxLength="5"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" CssClass="label label-danger overlaytext" ErrorMessage="Cannot be empty" ControlToValidate="txtQuantity" ValidationGroup="qtyValidate"></asp:RequiredFieldValidator>
                                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Out of range" MinimumValue="1" MaximumValue="500" CssClass="label label-danger overlaytext" Display="Dynamic" Type="Integer" ValidationGroup="qtyValidate"></asp:RangeValidator>
                                    <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext" ControlToValidate="txtQuantity" ValidationGroup="qtyValidate" ValidationExpression="^[0-9]*$"></asp:RegularExpressionValidator>      
                                </div>
                            </div><br />
                            <div class="form-group">
                                <div class="text-center">
                                    <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Add" OnClick="btnAdd_Click" ValidationGroup="qtyValidate"/>
                                </div>
                            </div>
                        </div>
                    </fieldset>
                    <div class="form-group">
                        <asp:GridView ID="gv_Items" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="False" DataKeyNames="ItemId" OnRowDeleting="gv_Items_RowDeleting">
                            <HeaderStyle CssClass="info" />
                            <Columns>
                                <asp:BoundField HeaderText="Item Id" DataField="ItemId" Visible="false"></asp:BoundField>
                                <asp:BoundField HeaderText="Item Description" DataField="ItemDescription"></asp:BoundField>
                                <asp:BoundField HeaderText="Unit of Measure" DataField="UnitofMeasure"></asp:BoundField>
                                <asp:BoundField HeaderText="Quantity" DataField="Quantity"></asp:BoundField>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="text-center" Width="100px" />
                                    <ItemStyle CssClass="text-center" />
                                    <HeaderTemplate>
                                        <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LnkBtnDelete" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove" runat="server" CausesValidation="False"
                                            CommandName="Delete"></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                        <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-success" Text="Submit" OnClick="btnSubmit_Click" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
