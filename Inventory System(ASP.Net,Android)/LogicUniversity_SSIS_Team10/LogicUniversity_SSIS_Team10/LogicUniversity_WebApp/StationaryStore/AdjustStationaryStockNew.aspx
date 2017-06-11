<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="AdjustStationaryStockNew.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.AdjustStationaryStockNew" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Adjustment Voucher Form</h2>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">New Stock Adjustment</h1>
                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <fieldset class="well">
                                <asp:HiddenField ID="hiddenUnitPrice" runat="server" />
                                <div class="col-lg-7 col-lg-offset-3 col-md-7 col-md-offset-3 col-sm-12 col-sm-offset-1 text-center">
                                    <div class="col-lg-5 col-md-5 col-sm-5">
                                        <label id="labVoucherText" class="control-label">Voucher#:&nbsp;</label>
                                        <asp:Label ID="lblVoucher" CssClass="control-label" runat="server"></asp:Label>
                                    </div>
                                    <div class="col-lg-7 col-md-5 col-sm-5">
                                        <label id="lblDateIssueText">Date Issued:&nbsp;</label>
                                        <asp:Label ID="lblDateIssue" CssClass="control-label" runat="server"></asp:Label>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                        <hr />
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1">
                                    <div class="col-lg-5 col-md-5 col-sm-5">
                                        <label id="Label1" class="control-label">Item Code:</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-7">
                                        <asp:TextBox ID="txtItemCode" CssClass="form-control" runat="server" MaxLength="10" OnTextChanged="txtItemCode_TextChanged" AutoPostBack="True"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="label label-danger overlaytext" runat="server" ValidationGroup="newstockadj" ControlToValidate="txtItemCode" ErrorMessage="Cannot be empty"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1">
                                    <div class="col-lg-5 col-md-5 col-sm-5">
                                        <label id="Label2" class="control-label" style="text-align:left;">Quantity Adjusted:</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-7">
                                        <asp:TextBox ID="txtQuantityAdjusted" CssClass="form-control" MaxLength="5" runat="server">
                                        </asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="label label-danger overlaytext" runat="server" ControlToValidate="txtQuantityAdjusted" ErrorMessage="Cannot be empty" ValidationGroup="newstockadj"></asp:RequiredFieldValidator>
                                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtQuantityAdjusted" ErrorMessage="Out of range" CssClass="label label-danger overlaytext" MinimumValue="-200" MaximumValue="500" Display="Dynamic" Type="Integer" ValidationGroup="newstockadj"></asp:RangeValidator>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                            ControlToValidate="txtQuantityAdjusted"
                                            ErrorMessage="Only numeric allowed." CssClass="label label-danger overlaytext"
                                            ValidationExpression="^-?[0-9]\d*(\.\d+)?$" ValidationGroup="newstockadj"></asp:RegularExpressionValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <div class="col-lg-6 col-lg-offset-3 col-md-6 col-md-offset-3 col-sm-10 col-sm-offset-1">
                                    <div class="col-lg-5 col-md-5 col-sm-5">
                                        <label id="Label3" class="control-label">Reason:</label>
                                    </div>
                                    <div class="col-lg-7 col-md-7 col-sm-7">
                                        <asp:TextBox ID="txtReason" TextMode="multiline" Columns="50" Rows="5" style ="resize:none;" MaxLength="200" CssClass="form-control" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="text-center">
                                <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" Text="Add" OnClick="btnAdd_Click" ValidationGroup="newstockadj" />
                            </div>
                        </div>
                        <div class="form-group">
                            <asp:GridView
                            class="mGrid"
                            ID="gvAdjustNew" runat="server"
                            AutoGenerateColumns="false"
                            Width="100%" Height="100%"
                            AllowPaging="True" OnRowDeleting="gvAdjustNew_RowDeleting"
                            OnPageIndexChanging="gvAdjustNew_PageIndexChanging" OnDataBound="gvAdjustNew_DataBound"
                            DataKeyNames="ItemCode" CssClass="table table-striped table-bordered"
                            OnRowDataBound="gvAdjustNew_RowDataBound">
                            <HeaderStyle CssClass="info"/>
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                            <PagerSettings Mode="Numeric" PageButtonCount="15" />
                            <Columns>
                                <asp:BoundField DataField="ItemCode" HeaderText="Item Code" Visible="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="QtyAdjusted" HeaderText="Quantity Adjusted" Visible="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" Visible="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="Amount" HeaderText="Amount" Visible="true">
                                </asp:BoundField>
                                <asp:BoundField DataField="Reason" HeaderText="Reason" Visible="true">
                                </asp:BoundField>
                                <asp:TemplateField>
                                    <HeaderStyle CssClass="text-center"/>
                                    <ItemStyle/>
                                    <HeaderTemplate>
                                        <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                    </HeaderTemplate>
                                    <ItemStyle CssClass="text-center" />
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnDelete" CssClass="btn btn-circle btn-danger glyphicon glyphicon-remove" runat="server" CommandName="Delete" Font-Size="8pt" ToolTip="DELETE" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                            <div class="text-left">
                                <asp:Button ID="btnSubmit" CssClass="btn btn-success" runat="server" Visible="false" Text="Submit" OnClick="btnSubmit_Click" />
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
