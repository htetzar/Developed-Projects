<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" AutoEventWireup="true" CodeBehind="PreparePurchaseOrderList.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.PreparePurchaseOrderList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
            <!-- Page Heading -->
        <div class="row">
            <div class="col-lg-12 text-center">
                <h1 class="page-header text-center">Stationery Purchase Order</h1>
            </div>
        </div>
        <!-- Content -->
        <div class="row" id="Grid_StoreClerk">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                    <h3 class="panel-title text-center">Stationery Purchase Order List</h3>
                    </div>
                    <div class="panel-body">
                        <asp:GridView ID="GridView_Store" runat="server" CssClass="table table-striped table-bordered" OnRowDataBound="GridView_Store_RowDataBound" 
                            AutoGenerateColumns="False" AllowPaging="true" OnPageIndexChanging="GridView_Store_PageIndexChanging">      
                            <HeaderStyle CssClass="info" />
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                            <PagerSettings Mode="Numeric" PageButtonCount="15" />
                            <Columns>
                                <asp:BoundField DataField="OrderId" HeaderText="Order Id" />
                                <asp:BoundField DataField="OrderedBy" HeaderText="Order By" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy/MM/dd}"  ItemStyle-Width="200px"/>
                                <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>
                                <asp:BoundField DataField="Reason" HeaderText="Remark" HeaderStyle-CssClass="hidden-xs" ItemStyle-CssClass="hidden-xs" ItemStyle-Width="200px"/>
                            </Columns>
                        </asp:GridView>
                        <asp:GridView ID="GridView_Supervisor" runat="server" CssClass="table table-striped table-bordered" AutoGenerateColumns="False" OnRowDataBound="GridView_Supervisor_RowDataBound"
                            OnPageIndexChanging="GridView_Supervisor_PageIndexChanging" AllowPaging="true">
                            <HeaderStyle CssClass="info" />
                            <PagerStyle HorizontalAlign="Center" CssClass="pagination-girdview" />
                            <PagerSettings Mode="Numeric" PageButtonCount="15" />
                            <Columns>
                               <asp:BoundField DataField="OrderId" HeaderText="Order Id" />
                                <asp:BoundField DataField="OrderedBy" HeaderText="Order By" />
                                <asp:BoundField DataField="OrderDate" HeaderText="Order Date" DataFormatString="{0:yyyy/MM/dd}" ItemStyle-Width="200px"/>
                                <asp:BoundField DataField="OrderStatus" HeaderText="Order Status" HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center"/>

                                <asp:HyperLinkField DataNavigateUrlFields="OrderId" HeaderText="<i class='glyphicon glyphicon-cog'></i>" 
                                    DataNavigateUrlFormatString="~/StationaryStore/PreparePurchaseOrderDetail.aspx?OrderId={0}"
                                    HeaderStyle-CssClass="text-center" ItemStyle-CssClass="text-center" Text="<i class='btn btn-circle btn-default fa fa-info' title='Detail'></i>"/>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
