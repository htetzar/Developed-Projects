<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Exhibition.aspx.cs" Inherits="Exhibition" Title="Exhibition/WS" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="ewID" 
        DataSourceID="SqlDataSourceExpo" onitemcommand="ListView1_ItemCommand">
        <ItemTemplate>           
            
            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("ewID") %>'></asp:LinkButton>
            <br />
            
            Place : 
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            Date : 
            <asp:Label ID="startDateLabel" runat="server" 
                Text='<%# Eval("startDate", "{0:d}") %>' />
            &nbsp;to&nbsp;
            <asp:Label ID="endDateLabel" runat="server" 
                Text='<%# Eval("endDate", "{0:d}") %>' />
            <br />
            Time : 
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>' />
            &nbsp;to&nbsp;
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>' />
            <br />
            <hr />
            <br />
            
        </ItemTemplate>
        <AlternatingItemTemplate>
            <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("ewID") %>'></asp:LinkButton>
            <br />
            
            Place : 
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            Date : 
            <asp:Label ID="startDateLabel" runat="server" 
                Text='<%# Eval("startDate", "{0:d}") %>' />
            &nbsp;to&nbsp;
            <asp:Label ID="endDateLabel" runat="server" 
                Text='<%# Eval("endDate", "{0:d}") %>' />
            <br />
            Time : 
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>' />
            &nbsp;to&nbsp;
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>' />
            <br />
            <hr />
            <br />
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">ewID:
            <asp:TextBox ID="ewIDTextBox" runat="server" Text='<%# Bind("ewID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            startDate:
            <asp:TextBox ID="startDateTextBox" runat="server" 
                Text='<%# Bind("startDate") %>' />
            <br />
            endDate:
            <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
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
                <span ID="itemPlaceholder" runat="server" />
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
            <span style="">ewID:
            <asp:Label ID="ewIDLabel1" runat="server" Text='<%# Eval("ewID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            place:
            <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
            <br />
            startDate:
            <asp:TextBox ID="startDateTextBox" runat="server" 
                Text='<%# Bind("startDate") %>' />
            <br />
            endDate:
            <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
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
            <span style="">ewID:
            <asp:Label ID="ewIDLabel" runat="server" Text='<%# Eval("ewID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            place:
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            startDate:
            <asp:Label ID="startDateLabel" runat="server" Text='<%# Eval("startDate") %>' />
            <br />
            endDate:
            <asp:Label ID="endDateLabel" runat="server" Text='<%# Eval("endDate") %>' />
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
    <asp:SqlDataSource ID="SqlDataSourceExpo" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        SelectCommand="SELECT [ewID], [title], [place], [startDate], [endDate], [fromTime], [toTime] FROM [ExhibitionWS] ORDER BY [postedDate] DESC" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
    </asp:SqlDataSource>
</asp:Content>

