<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="MaintainDepartmentInfo.aspx.cs" Inherits="LogicUniversity_WebApp.Department.MaintainDepartmentInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <!-- Page Heading -->
    <div class="text-center">
        <div class="col-lg-12">
            <h2 class="page-header">
                <asp:Label ID="lblDepartmentName" runat="server" Text="Department"></asp:Label>
            </h2>
        </div>
    </div>
    <!-- Content -->
    <div class="row">
        <div class="col-lg-12">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h1 class="panel-title text-center">Maintain Department Information</h1>
                </div>
                <div class="panel-body">
                    <div class="form-group">
                        <fieldset class="well">
                            <legend class="well-legend" style="font-size:14pt;"><b>Collection Points</b></legend>
                            <div class="radio">
                                <asp:RadioButtonList ID="rdBtnLst" runat="server" RepeatColumns="2" CssClass="table table-borderless" Style="font-size: 13pt;">
                                </asp:RadioButtonList>
                            </div>
                        </fieldset>
                    </div>
                    <div class="form-inline" style="<%= Convert.ToInt32(Session["roleid"])==1?"":"display:none;" %>">
                        <div class="form-group">
                            <label class="control-label" style="font-size:14pt;">Staff as Representative:&nbsp;</label>
                            <asp:DropDownList ID="ddlDeptRep" runat="server" CssClass="form-control" DataTextField="staffname">
                            </asp:DropDownList>
                        </div>
                    </div>
                    <div style="<%= Convert.ToInt32(Session["roleid"])==1?"":"display:none;" %>">
                        <asp:LinkButton ID="btnConfirm" CssClass="btn btn-success" Font-Size="8pt" runat="server" Text="Confirm" OnClick="btnConfirm_Click"/>
                    </div>
                    <div style="<%= (Convert.ToInt32(Session["roleid"])==2) ?"":"display:none;" %>">
                        <asp:LinkButton ID="btnChange" CssClass="btn btn-primary" Font-Size="8pt" runat="server" Text="Change" OnClick="btnChange_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
    <!-- Modal Confirm-->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header modalheader text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel" style="color: #ffffff;">Are you sure?</h3>
                </div>
                <div class="modal-body">
                    Assign&nbsp;<b><asp:Label runat="server" ID="lblSname"></asp:Label></b>&nbsp;to collect at&nbsp;
                    <b><asp:Label runat="server" ID="lblCollectPoint" ></asp:Label></b>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnOk" CssClass="btn btn-primary" OnClick="btnOk_Click" Text="Yes"/>
                    <asp:Button runat="server" ID="btnClose" CssClass="btn btn-default" data-dismiss="modal" Text="No"/>
                </div>
            </div>
        </div>
    </div>
        <!-- Modal Change-->
    <div class="modal fade" id="changeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header modalheader text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h3 class="modal-title" id="myModalLabel1" style="color: #ffffff;">Are you sure?</h3>
                </div>
                <div class="modal-body">
                    Change&nbsp;to<b><asp:Label runat="server" ID="Label1"></asp:Label></b>&nbsp;
                    <b><asp:Label runat="server" ID="lblnewCP" ></asp:Label></b>
                </div>
                <div class="modal-footer">
                    <asp:Button runat="server" ID="btnCfmChange" CssClass="btn btn-primary" OnClick="btnCfmChange_Click" Text="Yes"/>
                    <asp:Button runat="server" ID="Button2" CssClass="btn btn-default" data-dismiss="modal" Text="No"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
