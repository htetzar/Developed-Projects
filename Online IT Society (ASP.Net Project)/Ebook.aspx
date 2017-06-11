<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Ebook.aspx.cs" Inherits="Ebook" Title="Ebooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="EbookListView" runat="server" DataSourceID="EbookDB" 
        DataKeyNames="bookID" GroupItemCount="3" 
    onitemcommand="EbookListView_ItemCommand">
        <AlternatingItemTemplate>
            <td id="Td1" runat="server" style="">
                    <br />
                    <br />
                    <table style="width:101%; height: 238px;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server"  CommandArgument='<%# Eval("bookID") %>'
                                    Text='<%# Eval("bookTitle") %>'></asp:LinkButton><br /><br />
                                <asp:Image ID="Image2" runat="server" Height="150px" 
                                    ImageUrl='<%# "Handler.ashx?bid="+Eval("bookID") %>' Width="150px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
        </AlternatingItemTemplate>
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
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    bookID:
                    <asp:TextBox ID="bookIDTextBox" runat="server" Text='<%# Bind("bookID") %>' />
                    <br />
                    author:
                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                    <br />
                    bookTitle:
                    <asp:TextBox ID="bookTitleTextBox" runat="server" 
                        Text='<%# Bind("bookTitle") %>' />
                    <br />
                    savedPath:
                    <asp:TextBox ID="savedPathTextBox" runat="server" 
                        Text='<%# Bind("savedPath") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">
                    bookID:
                    <asp:Label ID="bookIDLabel" runat="server" Text='<%# Eval("bookID") %>' />
                    <br />
                    author:
                    <asp:Label ID="authorLabel" runat="server" Text='<%# Eval("author") %>' />
                    <br />
                    bookTitle:
                    <asp:Label ID="bookTitleLabel" runat="server" Text='<%# Eval("bookTitle") %>' />
                    <br />
                    savedPath:
                    <asp:Label ID="savedPathLabel" runat="server" Text='<%# Eval("savedPath") %>' />
                    <br />
                    photo:
                    <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <td runat="server" style="">
                    bookID:
                    <asp:Label ID="bookIDLabel1" runat="server" Text='<%# Eval("bookID") %>' />
                    <br />
                    author:
                    <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
                    <br />
                    bookTitle:
                    <asp:TextBox ID="bookTitleTextBox" runat="server" 
                        Text='<%# Bind("bookTitle") %>' />
                    <br />
                    savedPath:
                    <asp:TextBox ID="savedPathTextBox" runat="server" 
                        Text='<%# Bind("savedPath") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <ItemTemplate>
                <td id="Td1" runat="server" style="">
                    <br />
                    <br />
                    <table style="width:101%; height: 238px;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:LinkButton ID="LinkButton1" runat="server"  CommandArgument='<%# Eval("bookID") %>'
                                    Text='<%# Eval("bookTitle") %>'></asp:LinkButton><br /><br />
                                <asp:Image ID="Image2" runat="server" Height="150px"  
                                    ImageUrl='<%# "Handler.ashx?bid="+Eval("bookID") %>' Width="150px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
                
            </ItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="EbookDB" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString11 %>" 
    DeleteCommand="DELETE FROM [Ebook] WHERE [bookID] = @bookID" 
    InsertCommand="INSERT INTO [Ebook] ([bookID], [author], [bookTitle], [savedPath], [photo]) VALUES (@bookID, @author, @bookTitle, @savedPath, @photo)" 
    SelectCommand="SELECT * FROM [Ebook]" 
    
            
            UpdateCommand="UPDATE [Ebook] SET [author] = @author, [bookTitle] = @bookTitle, [savedPath] = @savedPath, [photo] = @photo WHERE [bookID] = @bookID">
    <DeleteParameters>
        <asp:Parameter Name="bookID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="bookTitle" Type="String" />
        <asp:Parameter Name="savedPath" Type="String" />
        <asp:Parameter Name="photo" Type="Object" />
        <asp:Parameter Name="bookID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="bookID" Type="Int32" />
        <asp:Parameter Name="author" Type="String" />
        <asp:Parameter Name="bookTitle" Type="String" />
        <asp:Parameter Name="savedPath" Type="String" />
        <asp:Parameter Name="photo" Type="Object" />
    </InsertParameters>
</asp:SqlDataSource>
        <br />
        <div align="center">
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="EbookListView" 
            PageSize="6">
            <Fields>
                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                <asp:NumericPagerField />
                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
            </Fields>
        </asp:DataPager>
        </div>
</asp:Content>

