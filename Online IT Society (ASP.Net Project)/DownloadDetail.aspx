<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="DownloadDetail.aspx.cs" Inherits="DownloadDetail" Title="Download" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 102px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="fvEbookDetail" runat="server" DataSourceID="homeebookDS" 
        onitemcommand="fvEbookDetail_ItemCommand">
        <EditItemTemplate>
            author:
            <asp:TextBox ID="authorTextBox" runat="server" Text='<%# Bind("author") %>' />
            <br />
            bookTitle:
            <asp:TextBox ID="bookTitleTextBox" runat="server" 
                Text='<%# Bind("bookTitle") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            savedPath:
            <asp:TextBox ID="savedPathTextBox" runat="server" 
                Text='<%# Bind("savedPath") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            author:
            <asp:TextBox ID="authorTextBox0" runat="server" Text='<%# Bind("author") %>' />
            <br />
            bookTitle:
            <asp:TextBox ID="bookTitleTextBox0" runat="server" 
                Text='<%# Bind("bookTitle") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox0" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            savedPath:
            <asp:TextBox ID="savedPathTextBox0" runat="server" 
                Text='<%# Bind("savedPath") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td colspan="3">
                        <asp:Image ID="Image7" runat="server" ImageUrl='<%# "Handler.ashx?bid="+Eval("bookID") %>' 
                            Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Title</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="bookTitleLabel" runat="server" Text='<%# Bind("bookTitle") %>' />
                    </td>
                </tr>
                <tr>
                    <td class="style3">
                        Author</td>
                    <td>
                        :</td>
                    <td>
                        <asp:Label ID="authorLabel" runat="server" Text='<%# Bind("author") %>' />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:LinkButton ID="bookDeleteButton" runat="server" CommandName="Delete" 
                            onclientclick="javascript:return confirm('Are you sure to delete?');" Visible='<%#IsAdmin() %>'>Delete</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                <td class="style3">
                <br />
                <br />
                    <asp:LinkButton ID="LinkButton1" runat="server" CommandName="back" 
                        PostBackUrl="~/Ebook.aspx">Go to Ebook</asp:LinkButton>
                </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="homeebookDS" runat="server" 
        ConnectionString="Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3" 
        ProviderName="System.Data.SqlClient" 
        
        
        
        SelectCommand="SELECT author, bookTitle, photo, savedPath, bookID FROM Ebook WHERE (bookID = @bookID)" 
        DeleteCommand="DELETE FROM [Ebook] WHERE [bookID] = @bookID" 
        InsertCommand="INSERT INTO [Ebook] ([bookID], [author], [bookTitle], [savedPath], [photo]) VALUES (@bookID, @author, @bookTitle, @savedPath, @photo)" 
        UpdateCommand="UPDATE [Ebook] SET [author] = @author, [bookTitle] = @bookTitle, [savedPath] = @savedPath, [photo] = @photo WHERE [bookID] = @bookID">
        <SelectParameters>
            <asp:QueryStringParameter Name="bookID" QueryStringField="bookid" />
        </SelectParameters>
        <DeleteParameters>
            <asp:QueryStringParameter Name="bookID" QueryStringField="bookid" 
                Type="Int32" />
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
    <asp:FormView ID="fvSWDetail" runat="server" DataKeyNames="softwareID" 
        DataSourceID="homeSWds" onitemcommand="fvSWDetail_ItemCommand">
        <EditItemTemplate>
            softwareName:
            <asp:TextBox ID="softwareNameTextBox" runat="server" 
                Text='<%# Bind("softwareName") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            savedPath:
            <asp:TextBox ID="savedPathTextBox" runat="server" 
                Text='<%# Bind("savedPath") %>' />
            <br />
            softwareID:
            <asp:Label ID="softwareIDLabel1" runat="server" 
                Text='<%# Eval("softwareID") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                CommandName="Update" Text="Update" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            softwareName:
            <asp:TextBox ID="softwareNameTextBox" runat="server" 
                Text='<%# Bind("softwareName") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            savedPath:
            <asp:TextBox ID="savedPathTextBox" runat="server" 
                Text='<%# Bind("savedPath") %>' />
            <br />
            softwareID:
            <asp:TextBox ID="softwareIDTextBox" runat="server" 
                Text='<%# Bind("softwareID") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            <table style="width:100%;">
                <tr>
                    <td>
                        <asp:Image ID="Image8" runat="server" 
                            ImageUrl='<%# "Handler.ashx?swid="+Eval("softwareID") %>' Width="150px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="softwareNameLabel" runat="server" ForeColor="Red" 
                            Text='<%# Bind("softwareName") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="descriptionLabel" runat="server" 
                            Text='<%# Bind("description") %>' />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="swDeleteButton" runat="server" CommandName="Delete" OnClientClick="javascript:return confirm('Are you sure to delete?');" Visible='<%#IsAdmin() %>'>Delete</asp:LinkButton>
                    </td>
                </tr>
                <tr>
                <td>
                <br />
                <br />
                    <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="Software.aspx">Go 
                    to Software</asp:LinkButton>
                </td>
                </tr>
            </table>
            <br />
        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource ID="homeSWds" runat="server" 
        ConnectionString="Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3" 
        DeleteCommand="DELETE FROM [Software] WHERE [softwareID] = @softwareID" 
        InsertCommand="INSERT INTO [Software] ([softwareID], [softwareName], [description], [photo], [savedPath]) VALUES (@softwareID, @softwareName, @description, @photo, @savedPath)" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT softwareID, softwareName, description, savedPath, photo FROM Software WHERE (softwareID = @softwareID)" 
        UpdateCommand="UPDATE [Software] SET [softwareName] = @softwareName, [description] = @description, [photo] = @photo, [savedPath] = @savedPath WHERE [softwareID] = @softwareID">
        <SelectParameters>
            <asp:QueryStringParameter Name="softwareID" QueryStringField="softwareid" />
        </SelectParameters>
        <DeleteParameters>
            <asp:QueryStringParameter Name="softwareID" QueryStringField="softwareid" 
                Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="softwareName" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="photo" Type="Object" />
            <asp:Parameter Name="savedPath" Type="String" />
            <asp:Parameter Name="softwareID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="softwareID" Type="Int32" />
            <asp:Parameter Name="softwareName" Type="String" />
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="photo" Type="Object" />
            <asp:Parameter Name="savedPath" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
    <asp:LinkButton ID="lbutdl" runat="server" onclick="lbutdl_Click">Download</asp:LinkButton>
    <asp:Label ID="lblmsg" runat="server"></asp:Label>
</asp:Content>

