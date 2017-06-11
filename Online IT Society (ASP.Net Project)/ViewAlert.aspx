<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewAlert.aspx.cs" Inherits="ViewAlert" Title="View Alert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <asp:SqlDataSource ID="viewalertDB" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
        
        
        
        
        
        
         SelectCommand="SELECT Member.username AS [User Name], SaleCategory.saleCategoryName AS Category, Brand.brandName AS Brand, Alert.model AS Model, Alert.minprice AS [Min Price], Alert.maxprice AS [Max Price], Alert.expireDate AS [Expire Date], Member.email, Alert.memberID FROM Alert INNER JOIN Brand ON Alert.brandID = Brand.brandID INNER JOIN Member ON Alert.memberID = Member.memberID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (Alert.expireDate &gt; @ed)" 
         ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
        <SelectParameters>
            <asp:SessionParameter Name="ed" SessionField="edate" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="viewalertDB" Height="151px" Width="782px">
        <Columns>
            <asp:BoundField DataField="User Name" HeaderText="User Name" 
                SortExpression="User Name" />
            <asp:BoundField DataField="Category" HeaderText="Category" 
                SortExpression="Category" />
            <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
            <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
            <asp:BoundField DataField="Min Price" HeaderText="Min Price" 
                SortExpression="Min Price" />
            <asp:BoundField DataField="Max Price" HeaderText="Max Price" 
                SortExpression="Max Price" />
            <asp:BoundField DataField="Expire Date" HeaderText="Expired Date" 
                SortExpression="Expire Date" DataFormatString="{0:d}" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="email" />
            <asp:TemplateField>
            <ItemTemplate >
            <a href ="mailto:'<%#Eval("email") %>'&subject=Item Reach&body=Hi <%#Eval("User Name") %>, The thing(<%#Eval("Category") %> <%#Eval("Brand") %>) u want to buy is reached at our site!">
            <asp:Label ID="Label1" runat="server" Text="Response"></asp:Label></a> 
            </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</asp:Content>

