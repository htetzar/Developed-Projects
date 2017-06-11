<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="SoldItem.aspx.cs" Inherits="SoldItem" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p style="text-align: left">
     <asp:Label ID="Label3" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                            ForeColor="#FF0066" Text="Sold Item"></asp:Label>
                            <br />
                            <br />
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="itemID" 
            DataSourceID="SqlDataSourceSoldItem" GroupItemCount="2">
            <EmptyItemTemplate>
                <td runat="server" />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#"Handler.ashx?iid="+Eval("itemID") %>' Width="150px" Height="150px" />
                        
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="SOLD!!" ForeColor="Red" Font-Size="Medium" Font-Italic="True" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        
                        <asp:Label ID="saleCategoryNameLabel" runat="server" 
                            Text='<%# Eval("saleCategoryName") %>' />
                        <br />
                        
                        <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                        <br />
                        <br />
                        <u><b>Buyer</b></u>
                        <br />
                        Name : 
                        <asp:Label ID="personNameLabel" runat="server" 
                            Text='<%# Eval("personName") %>' />
                        <br />
                        Phone : 
                        <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        <br />
                        Address : 
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                        <br />
                        <br />
                    </td>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <td runat="server" style="">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%#"Handler.ashx?iid="+Eval("itemID") %>' Width="150px" Height="150px" />
                        
                        <br />
                        <br />
                        <asp:Label ID="Label1" runat="server" Text="SOLD!!" ForeColor="Red" Font-Size="Medium" Font-Italic="True" Font-Bold="True"></asp:Label>
                        <br />
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        
                        <asp:Label ID="saleCategoryNameLabel" runat="server" 
                            Text='<%# Eval("saleCategoryName") %>' />
                        <br />
                        
                        <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                        <br />
                        <br />
                        <u><b>Buyer</b></u>
                        <br />
                        Name : 
                        <asp:Label ID="personNameLabel" runat="server" 
                            Text='<%# Eval("personName") %>' />
                        <br />
                        Phone : 
                        <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        <br />
                        Address : 
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                        <br />
                        <br />
                    </td>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>
                                No Item has been Sold!</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <td runat="server" style="">
                        itemID:
                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        saleCategoryName:
                        <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                            Text='<%# Bind("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:TextBox ID="brandNameTextBox" runat="server" 
                            Text='<%# Bind("brandName") %>' />
                        <br />
                        personName:
                        <asp:TextBox ID="personNameTextBox" runat="server" 
                            Text='<%# Bind("personName") %>' />
                        <br />
                        phone:
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        <br />
                        address:
                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                        <br />
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                        <br />
                    </td>
                </InsertItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style="">
                            <div align="center">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                                
                                    <Fields>
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        <asp:NumericPagerField />
                                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                    </Fields>
                                </asp:DataPager>
                                </div>
                            </td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <EditItemTemplate>
                    <td runat="server" style="">
                        itemID:
                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        saleCategoryName:
                        <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                            Text='<%# Bind("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:TextBox ID="brandNameTextBox" runat="server" 
                            Text='<%# Bind("brandName") %>' />
                        <br />
                        personName:
                        <asp:TextBox ID="personNameTextBox" runat="server" 
                            Text='<%# Bind("personName") %>' />
                        <br />
                        phone:
                        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        <br />
                        address:
                        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <br />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                        <br />
                    </td>
                </EditItemTemplate>
                <GroupTemplate>
                    <tr ID="itemPlaceholderContainer" runat="server">
                        <td ID="itemPlaceholder" runat="server">
                        </td>
                    </tr>
                </GroupTemplate>
                <SelectedItemTemplate>
                    <td runat="server" style="">
                        itemID:
                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        saleCategoryName:
                        <asp:Label ID="saleCategoryNameLabel" runat="server" 
                            Text='<%# Eval("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                        <br />
                        personName:
                        <asp:Label ID="personNameLabel" runat="server" 
                            Text='<%# Eval("personName") %>' />
                        <br />
                        phone:
                        <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                        <br />
                        address:
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceSoldItem" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT Item.itemID, Item.title, SaleCategory.saleCategoryName, Brand.brandName, PurchaseInfo.personName, PurchaseInfo.phone, PurchaseInfo.address FROM Brand INNER JOIN Item ON Brand.brandID = Item.brandID INNER JOIN PurchaseInfo ON Item.itemID = PurchaseInfo.itemID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (Item.memberID = @mid) AND (Item.status = @status)">
                <SelectParameters>
                    <asp:SessionParameter Name="mid" SessionField="mid" />
                    <asp:Parameter DefaultValue="True" Name="status" />
                </SelectParameters>
            </asp:SqlDataSource>
    <br />
</p>
</asp:Content>

