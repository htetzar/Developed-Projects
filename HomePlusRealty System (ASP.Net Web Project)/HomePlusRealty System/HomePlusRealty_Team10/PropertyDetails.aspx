<%@ Page Language="C#"  MasterPageFile="~/Anonymous.Master" AutoEventWireup="true" CodeFile="PropertyDetails.aspx.cs" Inherits="PropertyDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">   
    <div class="container"><br /><br /><br />
        <asp:DetailsView AutoGenerateRows="False" DataKeyNames="PropertyID"
            HeaderText="Property Details" ID="DetailsView1" runat="server" Width="375px" HorizontalAlign="Center" CssClass="table table-bordered">
            <Fields>
              <asp:BoundField DataField="UserName" HeaderText="UserName" />
              <asp:BoundField DataField="PropertyName" HeaderText="PropertyName" />
              <asp:BoundField DataField="Address" HeaderText="Address" />
              <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" />
              <asp:BoundField DataField="FloorSize" HeaderText="FloorSize" />
              <asp:BoundField DataField="Type" HeaderText="Type" />
              <asp:ImageField DataImageUrlField="ImagePath" ControlStyle-Width="100px" ControlStyle-Height="100px" HeaderText="Image">
             </asp:ImageField>
              <asp:BoundField DataField="NoOfBathRoom" HeaderText="NoOfBathRoom" />
              <asp:BoundField DataField="NoOfRoom" HeaderText="NoOfRoom" />  
              <asp:BoundField DataField="Description" HeaderText="Description" />  
              <asp:BoundField DataField="Price" HeaderText="Price" />  
              <asp:BoundField DataField="Tenure" HeaderText="Tenure" />  
              <asp:BoundField DataField="NearByFacility" HeaderText="NearByFacility" />  
              <asp:BoundField DataField="Developer" HeaderText="Developer" />             
            </Fields>
          </asp:DetailsView>
    </div>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>

