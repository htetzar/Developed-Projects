<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="ItemDetail.aspx.cs" Inherits="ItemDetail" Title="Item Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 29px;
        }
        .style2
        {
            height: 31px;
        }
        .style4
        {
            height: 46px;
        }
        .style5
        {
            height: 43px;
        }
        .style6
        {
            height: 40px;
        }
        .style7
        {
            height: 44px;
        }
        .style8
        {
            height: 41px;
            width: 14px;
        }
        .style9
        {
            height: 39px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="itemID" 
            DataSourceID="ItemDS" Width="100%" onitemupdating="FormView1_ItemUpdating" 
            style="margin-right: 0px">
            <EditItemTemplate>
                &nbsp;<asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' 
                    Visible="False" />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td valign="top">
                            Photo</td>
                        <td>
                            <asp:FileUpload ID="FileUpload1" runat="server" />
                            &nbsp;
                            <asp:Button ID="btnUpload" runat="server" Text="Upload" 
                                onclick="btnUpload_Click" />
                            <br />
                            <asp:Image ID="Image2" runat="server" Height="150px" Width="150px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Title</td>
                        <td>
                            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;Category</td>
                        <td>
                            <asp:DropDownList ID="ddlCategory" runat="server" AutoPostBack="True" 
                                DataSourceID="ItemCategoryDS" DataTextField="saleCategoryName" 
                                DataValueField="saleCategoryID" Width="150px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ItemCategoryDS" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                                DeleteCommand="DELETE FROM [SaleCategory] WHERE [saleCategoryID] = @saleCategoryID" 
                                InsertCommand="INSERT INTO [SaleCategory] ([saleCategoryName], [saleCategoryID]) VALUES (@saleCategoryName, @saleCategoryID)" 
                                SelectCommand="SELECT [saleCategoryName], [saleCategoryID] FROM [SaleCategory]" 
                                
                                UpdateCommand="UPDATE [SaleCategory] SET [saleCategoryName] = @saleCategoryName WHERE [saleCategoryID] = @saleCategoryID" 
                                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                                <DeleteParameters>
                                    <asp:Parameter Name="saleCategoryID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="saleCategoryName" Type="String" />
                                    <asp:Parameter Name="saleCategoryID" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="saleCategoryName" Type="String" />
                                    <asp:Parameter Name="saleCategoryID" Type="Int32" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Brand</td>
                        <td>
                            <asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="ItemBrandDS" 
                                DataTextField="brandName" DataValueField="brandID" Width="150px">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="ItemBrandDS" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                                DeleteCommand="DELETE FROM [Brand] WHERE [brandID] = @brandID" 
                                InsertCommand="INSERT INTO [Brand] ([brandID], [brandName]) VALUES (@brandID, @brandName)" 
                                SelectCommand="SELECT [brandID], [brandName] FROM [Brand] WHERE ([saleCategoryID] = @saleCategoryID)" 
                                
                                UpdateCommand="UPDATE [Brand] SET [brandName] = @brandName WHERE [brandID] = @brandID" 
                                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ddlCategory" Name="saleCategoryID" 
                                        PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                                <DeleteParameters>
                                    <asp:Parameter Name="brandID" Type="Int32" />
                                </DeleteParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="brandName" Type="String" />
                                    <asp:Parameter Name="brandID" Type="Int32" />
                                </UpdateParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="brandID" Type="Int32" />
                                    <asp:Parameter Name="brandName" Type="String" />
                                </InsertParameters>
                            </asp:SqlDataSource>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Model</td>
                        <td>
                            <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Price</td>
                        <td>
                            <asp:TextBox ID="priceTextBox" runat="server"  Text='<%# Bind("price") %>' />
                            &nbsp;Ks.
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Description</td>
                        <td>
                            <asp:TextBox ID="descriptionTextBox" runat="server" Height="56px" 
                                Text='<%# Bind("description") %>' TextMode="MultiLine" Width="188px" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Region</td>
                        <td>
                            <asp:TextBox ID="regionTextBox" runat="server" Text='<%# Bind("region") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Phone</td>
                        <td>
                            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Email</td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            Address</td>
                        <td>
                            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' 
                                TextMode="MultiLine" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                     Text="Update" CommandName="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                itemID:
                <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                <br />
                memberID:
                <asp:TextBox ID="memberIDTextBox" runat="server" 
                    Text='<%# Bind("memberID") %>' />
                <br />
                brandID:
                <asp:TextBox ID="brandIDTextBox" runat="server" Text='<%# Bind("brandID") %>' />
                <br />
                model:
                <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                <br />
                title:
                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                <br />
                price:
                <asp:TextBox ID="priceTextBox" runat="server" Text='<%# Bind("price") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                photo:
                <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                <br />
                address:
                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                <br />
                region:
                <asp:TextBox ID="regionTextBox" runat="server" Text='<%# Bind("region") %>' />
                <br />
                description:
                <asp:TextBox ID="descriptionTextBox" runat="server" 
                    Text='<%# Bind("description") %>' />
                <br />
                postedDate:
                <asp:TextBox ID="postedDateTextBox" runat="server" 
                    Text='<%# Bind("postedDate") %>' />
                <br />
                saleCategoryName:
                <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                    Text='<%# Bind("saleCategoryName") %>' />
                <br />
                brandName:
                <asp:TextBox ID="brandNameTextBox" runat="server" 
                    Text='<%# Bind("brandName") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                <br />
                <table style="width:100%;">
                    <tr>
                        <td>
                            <asp:Image ID="Image1" runat="server" Height="150px" Width="150px" ImageUrl='<%# "ForsaleHandler.ashx?iid="+Eval("itemID") %>' />
                        </td>
                        <td align="right" valign="top">
                            <asp:Label ID="postedDateLabel" runat="server" 
                                Text='<%# Bind("postedDate", "{0:d}") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Title</td>
                        <td>
                            <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Category</td>
                        <td>
                            <asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Bind("saleCategoryName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Brand</td>
                        <td>
                            <asp:Label ID="brandNameLabel" runat="server" Text='<%# Bind("brandName") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Model</td>
                        <td>
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Bind("model") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Price</td>
                        <td>
                            <asp:Label ID="priceLabel" runat="server" ForeColor="Red" Text='<%# Bind("price") %>' />
                            &nbsp;Ks.
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            <asp:Label ID="descriptionLabel" runat="server" 
                                Text='<%# Bind("description") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Region</td>
                        <td>
                            <asp:Label ID="regionLabel" runat="server" Text='<%# Bind("region") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Phone</td>
                        <td>
                            <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Email</td>
                        <td>
                            <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            Address</td>
                        <td>
                            <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                    CommandName="Edit" Text="Edit" Visible='<%#IsMember(Eval("itemID")) %>'></asp:LinkButton> 
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                    CommandName="Delete" Text="Delete"  Visible='<%#IsMemberAdmin(Eval("itemID")) %>' OnClientClick="javascript:return confirm('Are you sure to Delete?');" />
                &nbsp;
            </ItemTemplate>
        </asp:FormView>
        <asp:SqlDataSource ID="ItemDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Item] WHERE [itemID] = @itemID" 
            InsertCommand="INSERT INTO [Item] ([itemID], [brandID], [model], [title], [price], [description], [region], [address], [photo], [email], [phone]) VALUES (@itemID, @brandID, @model, @title, @price, @description, @region, @address, @photo, @email, @phone)" 
            SelectCommand="SELECT Item.itemID, Item.memberID, Item.brandID, Item.model, Item.title, Item.price, Item.phone, Item.email, Item.photo, Item.address, Item.region, Item.description, Item.postedDate, SaleCategory.saleCategoryName, Brand.brandName FROM Brand INNER JOIN Item ON Brand.brandID = Item.brandID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (Item.itemID = @itemID)" 
            
            
                
                
            
            UpdateCommand="UPDATE [Item] SET [photo] = @photo, [brandID] = @brandID, [title] = @title, [model] = @model, [price] = @price, [description] = @description, [region] = @region, [phone] = @phone, [email] = @email, [address] = @address WHERE [itemID] = @itemID" 
            
            
            ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="itemID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:SessionParameter Name="photo" SessionField="photo" />
                <asp:SessionParameter Name="brandID" SessionField="Brand" />
                <asp:Parameter Name="status" DefaultValue="True" />
                <asp:Parameter Name="model" />
                <asp:Parameter Name="price" />
                <asp:Parameter Name="description" />
                <asp:Parameter Name="region" />
                <asp:Parameter Name="phone" />
                <asp:Parameter Name="email" />
                <asp:Parameter Name="address" />
                <asp:Parameter Name="itemID" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="itemID" Type="Int32" />
                <asp:Parameter Name="brandID" Type="Int32" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="region" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="photo" Type="Object" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSourceUpdate" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    DeleteCommand="DELETE FROM [Item] WHERE [itemID] = @itemID" 
                    InsertCommand="INSERT INTO [Item] ([photo], [brandID], [title], [model], [price], [description], [region], [phone], [email], [address], [itemID]) VALUES (@photo, @brandID, @title, @model, @price, @description, @region, @phone, @email, @address, @itemID)" 
                    SelectCommand="SELECT [photo], [brandID], [title], [model], [price], [description], [region], [phone], [email], [address], [itemID] FROM [Item] WHERE ([itemID] = @itemID)" 
                    
                    
            UpdateCommand="UPDATE Item SET status = @status, purchaseDate = @purchaseDate WHERE (itemID = @itemID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" 
                            Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:Parameter Name="itemID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter DefaultValue="True" Name="status" />
                <asp:QueryStringParameter DefaultValue="itemid" Name="itemID" 
                    QueryStringField="itemid" />
                <asp:SessionParameter Name="purchaseDate" SessionField="PurchaseDate" 
                    DefaultValue="" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="photo" Type="Object" />
                <asp:Parameter Name="brandID" Type="Int32" />
                <asp:Parameter Name="title" Type="String" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="price" Type="Decimal" />
                <asp:Parameter Name="description" Type="String" />
                <asp:Parameter Name="region" Type="String" />
                <asp:Parameter Name="phone" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="address" Type="String" />
                <asp:Parameter Name="itemID" Type="Int32" />
            </InsertParameters>
        </asp:SqlDataSource>
        <asp:LinkButton ID="lbtnPurchase" runat="server" onclick="lbtnPurchase_Click" Visible='<%#PurchaseVisible() %>' >Purchase</asp:LinkButton>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="lblMsg" runat="server" ForeColor="#3333CC" ></asp:Label>
        <asp:Panel ID="pnlPurchase" runat="server" Visible="false">
            <table style="width: 100%;">
                <tr>
                    <td class="style8">
                        <asp:Label ID="Label1" runat="server" Text="Account Number"></asp:Label>
                    </td>
                    <td class="style8">
                        <asp:TextBox ID="txtAccountNumber" runat="server" Height="22px"></asp:TextBox>
                    </td>
                    <td class="style8">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ErrorMessage="RequiredFieldValidator" Text="Required Account Number" 
                            ControlToValidate="txtAccountNumber" ValidationGroup="purchase"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Security Code"></asp:Label>
                    </td>
                    <td class="style7">
                       <asp:TextBox ID="txtSecurityCode" runat="server"></asp:TextBox>
                    </td>
                    <td class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ErrorMessage="RequiredFieldValidator" Text="Required Security Code" 
                            ControlToValidate="txtSecurityCode" ValidationGroup="purchase"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        Name</td>
                    <td class="style9">
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtName" ErrorMessage="Required" 
                            ValidationGroup="purchase"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        Phone Number</td>
                    <td class="style9">
                        <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtPhone" ErrorMessage="Required" 
                            ValidationGroup="purchase"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="style9">
                        Address</td>
                    <td class="style9">
                        <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtAddress" ErrorMessage="Required" 
                            ValidationGroup="purchase"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                        <asp:SqlDataSource ID="PurchaseDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                            DeleteCommand="DELETE FROM [PurchaseInfo] WHERE [purchaseID] = @purchaseID" 
                            InsertCommand="INSERT INTO [PurchaseInfo] ([purchaseID], [itemID], [personName], [phone], [address]) VALUES (@purchaseID, @itemID, @personName, @phone, @address)" 
                            SelectCommand="SELECT * FROM [PurchaseInfo]" 
                            UpdateCommand="UPDATE [PurchaseInfo] SET [itemID] = @itemID, [personName] = @personName, [phone] = @phone, [address] = @address WHERE [purchaseID] = @purchaseID">
                            <DeleteParameters>
                                <asp:Parameter Name="purchaseID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="itemID" Type="Int32" />
                                <asp:Parameter Name="personName" Type="String" />
                                <asp:Parameter Name="phone" Type="String" />
                                <asp:Parameter Name="address" Type="String" />
                                <asp:Parameter Name="purchaseID" Type="Int32" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:SessionParameter Name="purchaseID" SessionField="pid" Type="Int32" />
                                <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" 
                                    Type="Int32" />
                                <asp:ControlParameter ControlID="txtName" Name="personName" PropertyName="Text" 
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtPhone" Name="phone" PropertyName="Text" 
                                    Type="String" />
                                <asp:ControlParameter ControlID="txtAddress" Name="address" PropertyName="Text" 
                                    Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="btnBuy" runat="server" Text="Buy" Height="31px" Width="77px" 
                            onclick="btnBuy_Click" ValidationGroup="purchase" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" Height="31px" 
                            onclick="btnCancel_Click" Text="Cancel" Width="77px" />
                    </td>
                    <td>
                        &nbsp;
                        <asp:SqlDataSource ID="AccountDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                            DeleteCommand="DELETE FROM [Account] WHERE [accountID] = @accountID" 
                            InsertCommand="INSERT INTO [Account] ([accountID], [balance], [securityCode]) VALUES (@accountID, @balance, @securityCode)" 
                            SelectCommand="SELECT * FROM [Account]" 
                            
                            
                            UpdateCommand="UPDATE Account SET balance = @balance WHERE (accountID = @accountID) AND (securityCode = @securityCode)" 
                            ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                            <DeleteParameters>
                                <asp:Parameter Name="accountID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="balance" SessionField="Balance" Type="Decimal" />
                                <asp:ControlParameter ControlID="txtAccountNumber" Name="accountID" 
                                    PropertyName="Text" Type="Int32" />
                                <asp:ControlParameter ControlID="txtSecurityCode" Name="securityCode" 
                                    PropertyName="Text" Type="String" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="accountID" Type="Int32" />
                                <asp:Parameter Name="balance" Type="Decimal" />
                                <asp:Parameter Name="securityCode" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="AccountForAdminDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                            DeleteCommand="DELETE FROM [Account] WHERE [accountID] = @accountID" 
                            InsertCommand="INSERT INTO [Account] ([accountID], [balance], [securityCode]) VALUES (@accountID, @balance, @securityCode)" 
                            SelectCommand="SELECT balance FROM Account WHERE (securityCode = @securityCode)" 
                            
                            UpdateCommand="UPDATE Account SET balance = @balance WHERE (accountID = @accountID) AND (securityCode = @securityCode)" 
                            ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                            <SelectParameters>
                                <asp:Parameter DefaultValue="admin" Name="securityCode" Type="String" />
                            </SelectParameters>
                            <DeleteParameters>
                                <asp:Parameter Name="accountID" Type="Int32" />
                            </DeleteParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="balance" SessionField="Balance" Type="Decimal" />
                                <asp:Parameter DefaultValue="33333" Name="accountID" Type="Int32" />
                                <asp:Parameter DefaultValue="admin" Name="securityCode" Type="String" />
                            </UpdateParameters>
                            <InsertParameters>
                                <asp:Parameter Name="accountID" Type="Int32" />
                                <asp:Parameter Name="balance" Type="Decimal" />
                                <asp:Parameter Name="securityCode" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:SqlDataSource ID="AccountForSellerDS" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                            SelectCommand="SELECT Account.balance FROM Item INNER JOIN Member ON Item.memberID = Member.memberID INNER JOIN Account ON Member.bankaccount = Account.accountID AND Item.itemID = @itemID" 
                            
                            UpdateCommand="UPDATE Account SET balance = @balance FROM Item INNER JOIN Member ON Item.memberID = Member.memberID INNER JOIN Account ON Member.bankaccount = Account.accountID AND Item.itemID = @itemID" 
                            
                            ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:SessionParameter Name="balance" SessionField="Balance" />
                                <asp:QueryStringParameter Name="itemID" QueryStringField="itemid" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br /><br />
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="ForSale.aspx">Go to 
        ForSale Items</asp:LinkButton>
    
    </div>
</asp:Content>

