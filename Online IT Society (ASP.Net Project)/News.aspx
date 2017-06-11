<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="News.aspx.cs" Inherits="News" Title="News" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="NewListView" runat="server" DataSourceID="NewsDB" 
        style="margin-right: 364px" onitemcommand="NewListView_ItemCommand">
        <AlternatingItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="X-Large"
                            CommandArgument='<%# Eval("newsID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                                <%--<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />--%>

                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="postedDateLabel" runat="server" 
                            Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image16" runat="server" 
                            ImageUrl='<%# "Handler.ashx?nid=" + Eval("newsID") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="descriptionLabel" runat="server" 
                            Text='<%# desclength(Eval("description")) %>'></asp:Label>
                        ...
                    </td>
                </tr>
            </table>
            <br /><br />
        </AlternatingItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" 
                style="font-family: 'times New Roman', Times, serif;">
                <table>
                    <tr>
                        <td>
                            <tr>
                                <td>
                                    <tr>
                                        <td>
                                            <span ID="itemPlaceholder" runat="server"></span>
                                        </td>
                                    </tr>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="background-color: #FFCC66;font-weight: bold;color: #000080;">title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            photo:
            <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel0" runat="server" 
                Text='<%# Eval("description") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel0" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="background-color: #FFCC66;color: #000080;">title:
            <asp:TextBox ID="titleTextBox0" runat="server" Text='<%# Bind("title") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox0" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox0" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox0" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton0" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
            <table>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server"  Font-Size="X-Large"
                            CommandArgument='<%# Eval("newsID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                               <%--<asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />--%>

                    </td>
                </tr>
                <tr>
                    <td align="right">
                        <asp:Label ID="postedDateLabel1" runat="server" 
                            Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image17" runat="server" 
                            ImageUrl='<%# "Handler.ashx?nid=" + Eval("newsID") %>' Width="200px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="descriptionLabel1" runat="server" 
                            Text='<%# desclength(Eval("description")) %>'></asp:Label>
                        ...
                    </td>
                </tr>
            </table>
            <br /><br />
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="NewsDB" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString10 %>" 
    
    
        SelectCommand="SELECT [newsID], [title], [photo], [description], [postedDate] FROM [News] ORDER BY [postedDate] DESC"></asp:SqlDataSource>
    <br />
    <asp:DataPager ID="DataPager1" runat="server" PagedControlID="NewListView" 
        PageSize="3">
        <Fields>
            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                ShowNextPageButton="False" ShowPreviousPageButton="False" />
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                ShowNextPageButton="False" ShowPreviousPageButton="False" />
        </Fields>
    </asp:DataPager>
</asp:Content>

