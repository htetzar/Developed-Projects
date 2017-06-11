<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="ForSale.aspx.cs" Inherits="ForSale" Title="For Sale Item" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            width: 545px;
        }
        .style7
        {
            width: 545px;
            height: 222px;
        }
        .style8
        {
            width: 643px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <div align="center">
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="itemID" 
            DataSourceID="ItemDS" GroupItemCount="3"
            onitemcommand="ListView1_ItemCommand">
            <EmptyItemTemplate>
                <td id="Td1" runat="server" />
                </EmptyItemTemplate>
                <ItemTemplate>
                    <td id="Td2" runat="server" class="style8">
                        <asp:ImageButton ID="imgbtnForSale" runat="server" Width="150px" 
                            Height="150px"  ImageUrl='<%# "ForsaleHandler.ashx?iid="+Eval("itemID") %>' 
                            CommandArgument='<%# Eval("itemID") %>'  />
                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>'  
                            Visible="False"/>
                        <br />
                        
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />                      
                       
                       
                        <asp:Label ID="saleCategoryNameLabel" runat="server" 
                            Text='<%# Eval("saleCategoryName") %>' />
                        <br />
                        
                        <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                        <br />
                    </td>
                </ItemTemplate>
                
                <EmptyDataTemplate>
                    <table id="Table1" runat="server" style="">
                        <tr>
                            <td>
                                No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <td id="Td3" runat="server" style="">
                        itemID:
                        <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        photo:
                        <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                        <br />
                        saleCategoryName:
                        <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                            Text='<%# Bind("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:TextBox ID="brandNameTextBox" runat="server" 
                            Text='<%# Bind("brandName") %>' />
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
                    <table id="Table2" runat="server">
                        <tr id="Tr1" runat="server">
                            <td id="Td4" runat="server" class="style7">
                                <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr ID="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr id="Tr2" runat="server">
                            <td id="Td5" runat="server" class="style2">
                            <div align="center">
                                <asp:DataPager ID="DataPager1" runat="server" PageSize="6">
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
                    <td id="Td6" runat="server" style="">
                        itemID:
                        <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        photo:
                        <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                        <br />
                        saleCategoryName:
                        <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                            Text='<%# Bind("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:TextBox ID="brandNameTextBox" runat="server" 
                            Text='<%# Bind("brandName") %>' />
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
                    <td id="Td7" runat="server" style="">
                        itemID:
                        <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        photo:
                        <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                        <br />
                        saleCategoryName:
                        <asp:Label ID="saleCategoryNameLabel" runat="server" 
                            Text='<%# Eval("saleCategoryName") %>' />
                        <br />
                        brandName:
                        <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                        <br />
                    </td>
                </SelectedItemTemplate>
            </asp:ListView>
         </div>
            <asp:SqlDataSource ID="ItemDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                
                
                
                
                
                
                SelectCommand="SELECT Item.itemID, Item.model, Item.title, Item.photo, SaleCategory.saleCategoryName, Brand.brandName, Item.status FROM Brand INNER JOIN Item ON Brand.brandID = Item.brandID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (Item.status = N'false')" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
            </asp:SqlDataSource>
    
    </div>
</asp:Content>

