<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="DisbursementList.aspx.cs" Inherits="LogicUniversity_WebApp.StationaryStore.DisbursementList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    
    <div class="row">
        <div class="col-lg-12">
            <h2 class="page-header text-center">Disbursement</h2>
        </div>
    </div>
    <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">
                        <h4>Disbursement List</h4>
                    </div>
                    <div class="panel-body">                       
                        <asp:GridView ID="gvDisbursementList" runat="server" CssClass="table table-bordered table-striped" AutoGenerateColumns="false"
                            DataKeyNames="DisbursementId" OnRowCreated="gvDisbursementList_RowCreated" OnSelectedIndexChanged="gvDisbursementList_SelectedIndexChanged">
                            <HeaderStyle CssClass="info"/>
                            <Columns>
                                <asp:BoundField DataField="DisbursementId" HeaderText="DisbursementId" Visible="true">
                                </asp:BoundField>                           
                                 <asp:BoundField DataField="DepartmentRequisitionId" HeaderText="DeptRequisitionId" Visible="true" >
                                </asp:BoundField>
                                <asp:BoundField DataField="DepartmentName" HeaderText="Department Name" Visible="true" >
                                </asp:BoundField>
                                  <asp:BoundField DataField="RepresentativeName" HeaderText="Representative Name" Visible="true" >
                                </asp:BoundField>
                                  <asp:BoundField DataField="CollectionPointName" HeaderText="Collection Point" Visible="true" >
                                </asp:BoundField>
                                  <asp:BoundField DataField="CollectionPointTime" HeaderText="Collection Time" Visible="true">
                                </asp:BoundField>                                                   
                            </Columns>  
                        </asp:GridView>                      
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
