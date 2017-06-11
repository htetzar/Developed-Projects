<%@ Page Language="C#" MasterPageFile="UserAdmin.Master" AutoEventWireup="true" CodeFile="PropertyList_UserAdmin.aspx.cs" Inherits="UserAdmin_PropertyList_UserAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
</asp:Content>
 
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
    <div class="text-right"><asp:LinkButton runat="server" ID="lbNewProperty" CssClass="text-right" Text="NewProperty" OnClick="_lbNewProperty_Click"></asp:LinkButton></div>    
    <div class="container">
        <asp:ScriptManager ID="scriptManager" runat="server"></asp:ScriptManager>      
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:DataGrid ID="_dataGrid" runat="server" CssClass="table table-bordered" OnItemCommand="_dataGrid_ItemCommand" AutoGenerateColumns="false">
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateColumn>
                            <ItemStyle />
                            <HeaderTemplate>
                                <label class="control-label">Image</label>
                            </HeaderTemplate>
                            <ItemTemplate>                         
                                <asp:Image ID="_image" runat="server" CssClass="control-label imgSize" ImageUrl='<%#Eval("ImagePath") %>'/>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemStyle />
                            <HeaderTemplate>
                                <label class="control-label">Property Name</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="_pname" runat="server" Text='<%#Eval("PropertyName") %>' CssClass="control-label"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemStyle />
                            <HeaderTemplate>
                                <label class="control-label">Address</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="_address" runat="server" CssClass="control-label" Text='<%#Eval("Address") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemStyle />
                            <HeaderTemplate>
                                <label class="control-label">Price</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="_price" runat="server" CssClass="control-label" Text='<%#Eval("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                        <asp:TemplateColumn>
                            <ItemStyle />
                            <HeaderTemplate>
                                <label class="control-label">Action</label>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <%--<asp:LinkButton runat="server" CssClass="btn btn-info glyphicon glyphicon-eye-open"
                                    Style="text-decoration: none; font-size: 11px;" ToolTip="VIEW" CommandName="View" CommandArgument='<%#Eval("PropertyID") %>'></asp:LinkButton>--%>
                                <asp:LinkButton runat="server" CssClass="btn btn-warning glyphicon glyphicon-pencil"
                                    Style="text-decoration: none; font-size: 11px;" ToolTip="EDIT" CommandName="Edit" CommandArgument='<%#Eval("PropertyID") %>'></asp:LinkButton>
                                <asp:LinkButton runat="server" CssClass="btn btn-danger glyphicon glyphicon-remove"
                                    Style="text-decoration: none; font-size: 11px;" ToolTip="Delete" CommandName="Delete" CommandArgument='<%#Eval("PropertyID") %>'></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateColumn>
                    </Columns>
                </asp:DataGrid>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <!-- Modal up VIEW DETAILS-->
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="_viewModal" id="_modalView">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="myModalLabel">
                        <asp:Label runat="server" CssClass="control-label" ID="Label2">Details</asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="_pnlView">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">ImageURL</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:Image runat="server" CssClass="form-control" ImageUrl="_image">
                                    </asp:Image>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Property Name</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:Label runat="server" CssClass="form-control" ID="_txtpname">
                                    </asp:Label>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Address</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:Label runat="server" CssClass="form-control" ID="_txtAddress">
                                    </asp:Label>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Price</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:Label runat="server" CssClass="form-control" ID="_txtPrice">
                                    </asp:Label>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="cancel" Text="Close" />
                </div>
            </div>
        </div>
    </div>
    <!-- Modal up Edit-->
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="_EditModal" id="_modalEdit">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="">
                        <asp:Label runat="server" CssClass="control-label" ID="Label1">Edit</asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Customer Name</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="_txtEditCname">
                                    </asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Food Name</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="_txtEditFname">
                                    </asp:TextBox>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-2">
                                    <label class="control-label">Size</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="_txtESize">
                                    </asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Spice</label>
                                </div>
                                <div class="col-md-4" style="font-weight: bold;">
                                    <asp:TextBox runat="server" CssClass="form-control" ID="_txtESpice">
                                    </asp:TextBox>
                                </div>
                            </div>
                        </ContentTemplate>
                        
                    </asp:UpdatePanel>
                    <br />
                </div>
                <div class="modal-footer text-right">
                    <asp:Button runat="server" CssClass="btn btn-success" ID="Edit" Text="Accept"  />
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="Button2" Text="Cancel" />
                </div>
            </div>
        </div>
    </div>
    <!-- Modal up Delete-->
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="_modifyModal" id="_modalDelete">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="">
                        <asp:Label runat="server" CssClass="control-label" ID="Label3"> Delete</asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:Label runat="server" CssClass="control-label" Text="Are you sure you want to delete it?" Style="color: red"></asp:Label>
                </div>
                <div class="modal-footer">
                    <div class="text-right">
                        <asp:Button runat="server" CssClass="btn btn-success" Text="Delete" ID="Delete"  />
                        <asp:Button runat="server" CssClass="btn btn-danger" Text="Cancel" ID="_btnClose1" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
