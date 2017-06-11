<%@ Page Title="" Language="C#" MasterPageFile="~/LogicUniversity.Master" EnableEventValidation="false" AutoEventWireup="true" CodeBehind="AcknowledgeDisbursementList.aspx.cs" Inherits="LogicUniversity_WebApp.Department.AcknowledgeDisbursementList" %>
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
                    <div class="panel-heading">
                        <h4 class="text-center panel-title">Acknowledge Disbursement List</h4>
                    </div>
                    <div class="panel-body">                   
                        <asp:GridView ID="gvAcknowledgeDisbursementList" runat="server" CssClass="table table-bordered table-striped"
                            AutoGenerateColumns="False" DataKeyNames="DisbursementId" OnRowCreated="gvAcknowledgeDisbursementList_RowCreated" 
                            OnSelectedIndexChanged="gvAcknowledgeDisbursementList_SelectedIndexChanged" OnRowDataBound="gvAcknowledgeDisbursementList_RowDataBound">
                            <HeaderStyle CssClass="info"/>
                            <Columns>                        
                                <asp:BoundField DataField="DisbursementId" HeaderText="Disbursement ID" ReadOnly="true" Visible="False"/>
                                <asp:BoundField DataField="DepartmentRequisitionId" HeaderText="DepartmentRequisition ID" ReadOnly="True" Visible="False" />  
                                <asp:BoundField DataField="ItemDescription" HeaderText="Item Description" ReadOnly="True" HtmlEncode="false" />                                                                        
                                <asp:BoundField DataField="Status" HeaderText="Status" ReadOnly="True" />
                                <asp:BoundField DataField="CollectionPointName" HeaderText="Collection Point" ReadOnly="true" />   
                                <asp:BoundField DataField="CollectionPointTime" HeaderText="Collection Time" ReadOnly="true" /> 
                                </Columns>
                        </asp:GridView>   
                    </div>
                </div>
            </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>
