<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Seminar.aspx.cs" Inherits="Seminar" Title="Seminar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListViewSeminar" runat="server" DataKeyNames="seminarID" 
        DataSourceID="SqlDataSourceSeminar" 
        onitemcommand="ListViewSeminar_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="LinkButton1" runat="server" 
                CommandArgument='<%# Eval("seminarID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
            <br />
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
            <br />
            Seminar Date : 
            <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# Eval("seminarDate", "{0:d}") %>'></asp:Label>
            <br />
            Seminar Time : 
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label>
            &nbsp;to&nbsp;
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>
            <br />
            <hr />
            <br />

        </ItemTemplate>
        <AlternatingItemTemplate>
            <asp:LinkButton ID="LinkButton2" runat="server" 
                CommandArgument='<%# Eval("seminarID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
            <br />
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
            <br />
            Seminar Date : 
            <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# Eval("seminarDate", "{0:d}") %>'></asp:Label>
            <br />
            Seminar Time :
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label>
            &nbsp;to&nbsp;
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>
            <br />
            <hr />
            <br />
            
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">seminarID:
            <asp:TextBox ID="seminarIDTextBox" runat="server" 
                Text='<%# Bind("seminarID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            seminarDate:
            <asp:TextBox ID="seminarDateTextBox" runat="server" 
                Text='<%# Bind("seminarDate") %>' />
            <br />
            fromTime:
            <asp:TextBox ID="fromTimeTextBox" runat="server" 
                Text='<%# Bind("fromTime") %>' />
            <br />
            toTime:
            <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <span style=""><span ID="itemPlaceholder" runat="server"></span>
                </span></span>
            </div>
            <div style="">
            <div align="center">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
                </div>
            </div>
        </LayoutTemplate>
        <EditItemTemplate>
            <span style="">seminarID:
            <asp:Label ID="seminarIDLabel1" runat="server" 
                Text='<%# Eval("seminarID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            seminarDate:
            <asp:TextBox ID="seminarDateTextBox" runat="server" 
                Text='<%# Bind("seminarDate") %>' />
            <br />
            fromTime:
            <asp:TextBox ID="fromTimeTextBox" runat="server" 
                Text='<%# Bind("fromTime") %>' />
            <br />
            toTime:
            <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <span style="">seminarID:
            <asp:Label ID="seminarIDLabel" runat="server" Text='<%# Eval("seminarID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            place:
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            seminarDate:
            <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# Eval("seminarDate") %>' />
            <br />
            fromTime:
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>' />
            <br />
            toTime:
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceSeminar" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        SelectCommand="SELECT [seminarID], [title], [place], [seminarDate], [fromTime], [toTime] FROM [Seminar] ORDER BY [postedDate] DESC" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
    </asp:SqlDataSource>
</asp:Content>

