<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="ManageAuthorityDelegation.aspx.cs" Inherits="LogicUniversity_WebApp.Department.ManageAuthorityDelegation" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <!-- Page Heading -->
    <div class="row">
        <div class="col-lg-12 text-center">
            <h2 class="page-header">
                <label class="control-label">Department Of&nbsp;</label>
                <asp:Label ID="lblDepartmentName" runat="server"></asp:Label></h2>
        </div>
    </div>
    <!-- Content -->
    <div class="row" id="Grid_StoreClerk">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Delegate Authority</h1>
                </div>
                <div class="panel-body">
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <label class="control-label" id="lblEName" style="text-align:left;">Employee Name:&nbsp;</label>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-6">
                                <asp:DropDownList ID="ddlEmpList" runat="server"  CssClass="form-control"></asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <label id="lblStartDate" class="control-label">StartDate:&nbsp;</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-4">
                                <asp:TextBox ID="txtSDate" runat="server" CssClass="form-control" onkeydown="return false;" placeholder="Select a StartDate"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="sdate" Display="Dynamic" ValidationGroup="g1" CssClass="label label-danger"
                                     runat="server" ControlToValidate="txtSDate" ErrorMessage="Select a startDate"></asp:RequiredFieldValidator>
                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtSDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>    
                        </div>
                    </div>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <div class="col-lg-2 col-md-2 col-sm-3">
                                <label id="lblEndDate" class="control-label">EndDate:&nbsp;</label>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-4">
                                <asp:TextBox ID="txtEDate" runat="server" CssClass="form-control" onkeydown="return false;" placeholder="Select an EndDate"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic" ValidationGroup="g1" CssClass="label label-danger"
                                    runat="server" ControlToValidate="txtEDate" ErrorMessage="Select an endDate"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvtxtEDate" runat="server" ControlToCompare="txtSDate" CultureInvariantValues="true"
                                    Display="Dynamic" EnableClientScript="true" ControlToValidate="txtEDate" ErrorMessage="Choose EndDate before Start Date"
                                    Type="Date" SetFocusOnError="true" Operator="GreaterThanEqual" CssClass="label label-danger overlaytext" ValidationGroup="enddateVal"></asp:CompareValidator>
                                <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtEDate" Format="yyyy/MM/dd"></asp:CalendarExtender>
                            </div>
                        </div>
                    </div>
                    <div class="text-left">
                        <asp:Button ID="btnDeletegate" runat="server" CssClass="btn btn-primary" ValidationGroup="enddateVal" Text="Delegate" OnClick="btnDeletegate_Click" />
                    </div><br />
                    <div class="form-group">
                        <asp:GridView ID="grv_delegate" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered table-striped">
                        <HeaderStyle CssClass="info"/>
                        <Columns>
                            <asp:TemplateField Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblStaffId" runat="server" Text='<%# Eval("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffName" HeaderText="EmployeeName" />
                            <asp:BoundField DataField="StartDate" HeaderText="StartDate" />
                            <asp:BoundField DataField="EndDate" HeaderText="EndDate" />
                            <asp:TemplateField>
                                <HeaderStyle CssClass="text-center"/>
                                    <ItemStyle/>
                                    <HeaderTemplate>
                                        <label class="control-label"><i class="glyphicon glyphicon-cog"></i></label>
                                    </HeaderTemplate>
                                    <ItemStyle CssClass="text-center" />
                                <ItemTemplate>
                                    <asp:LinkButton ID="btn_terminate" runat="server" CssClass="btn btn-warning" Text="Terminate" OnClick="btn_terminate_Click"></asp:LinkButton>
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
