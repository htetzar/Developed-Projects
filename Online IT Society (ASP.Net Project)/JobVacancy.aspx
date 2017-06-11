<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="JobVacancy.aspx.cs" Inherits="JobVacancy" Title="Job Vacancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="jobID" 
        DataSourceID="SqlDataSourceJV" onitemcommand="ListView1_ItemCommand">
        <ItemTemplate>
 
           <asp:Image ID="Image1" runat="server" Height="120px" 
                ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="120px" />
           <br />     
            <asp:Label ID="Label1" runat="server" 
                Text='<%# Eval("postedDate", "{0:d}") %>'></asp:Label>  
           <br />
            <asp:LinkButton ID="LinkButton1" runat="server" 
                CommandArgument='<%# Eval("jobID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
           <br />    
            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label> 
           <br />
           <hr />
           <br />      
        </ItemTemplate>
        <AlternatingItemTemplate>
            <asp:Image ID="Image2" runat="server" Height="120px" 
                ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="120px" />
           <br />     
            <asp:Label ID="Label2" runat="server" 
                Text='<%# Eval("postedDate", "{0:d}") %>'></asp:Label>  
           <br />
            <asp:LinkButton ID="LinkButton2" runat="server" 
                CommandArgument='<%# Eval("jobID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
           <br />    
            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label> 
           <br />
           <hr />
           <br /> 
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">jobID:
            <asp:TextBox ID="jobIDTextBox" runat="server" Text='<%# Bind("jobID") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" 
                Text='<%# Bind("category") %>' />
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
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <span ID="itemPlaceholder" runat="server"></span></span>
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
            <span style="">jobID:
            <asp:Label ID="jobIDLabel1" runat="server" Text='<%# Eval("jobID") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" 
                Text='<%# Bind("category") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
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
            <span style="">jobID:
            <asp:Label ID="jobIDLabel" runat="server" Text='<%# Eval("jobID") %>' />
            <br />
            logo:
            <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            category:
            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceJV" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        
        SelectCommand="SELECT [jobID], [logo], [title], [category], [postedDate] FROM [Job] ORDER BY [postedDate] DESC" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
    </asp:SqlDataSource>
</asp:Content>

