<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Software.aspx.cs" Inherits="Software" Title="Software" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div align="center">
    <asp:ListView ID="SoftwareListView" runat="server" DataKeyNames="softwareID" 
        DataSourceID="SoftwareDS" GroupItemCount="3" 
        onitemcommand="SoftwareListView_ItemCommand1">
        <EmptyItemTemplate>
            <td runat="server" />
            </EmptyItemTemplate>
            <ItemTemplate>
                <td runat="server" style="">
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
                                <asp:LinkButton ID="LinkButton1" runat="server"  CommandArgument='<%# Eval("softwareID") %>'
                                    Text='<%# Eval("softwareName") %>'></asp:LinkButton><br /><br />
                                <asp:Image ID="Image2" runat="server" Height="150px" 
                                    ImageUrl='<%# "Handler.ashx?swid="+Eval("softwareID") %>' Width="150px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </ItemTemplate>
            <AlternatingItemTemplate>
                <td id="Td1" runat="server" style="">
                    <br />
                    <br />
                    <table style="width:100%;">
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
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("softwareID") %>'
                                    Text='<%# Eval("softwareName") %>'></asp:LinkButton><br /><br />
                                <asp:Image ID="Image2" runat="server" Height="150px" 
                                    ImageUrl='<%# "Handler.ashx?swid="+Eval("softwareID") %>' Width="150px" />
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <td runat="server" style="">
                    softwareID:
                    <asp:TextBox ID="softwareIDTextBox" runat="server" 
                        Text='<%# Bind("softwareID") %>' />
                    <br />
                    softwareName:
                    <asp:TextBox ID="softwareNameTextBox" runat="server" 
                        Text='<%# Bind("softwareName") %>' />
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
            <EditItemTemplate>
                <td runat="server" style="">
                    softwareID:
                    <asp:Label ID="softwareIDLabel1" runat="server" 
                        Text='<%# Eval("softwareID") %>' />
                    <br />
                    softwareName:
                    <asp:TextBox ID="softwareNameTextBox" runat="server" 
                        Text='<%# Bind("softwareName") %>' />
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
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <SelectedItemTemplate>
                <td runat="server" style="">
                    softwareID:
                    <asp:Label ID="softwareIDLabel" runat="server" 
                        Text='<%# Eval("softwareID") %>' />
                    <br />
                    softwareName:
                    <asp:Label ID="softwareNameLabel" runat="server" 
                        Text='<%# Eval("softwareName") %>' />
                    <br />
                    photo:
                    <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
        </asp:ListView>
        </div>
        <br />
        <asp:SqlDataSource ID="SoftwareDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString9 %>" 
            DeleteCommand="DELETE FROM [Software] WHERE [softwareID] = @softwareID" 
            InsertCommand="INSERT INTO [Software] ([softwareID], [softwareName], [photo]) VALUES (@softwareID, @softwareName, @photo)" 
            SelectCommand="SELECT [softwareID], [softwareName], [photo] FROM [Software]" 
            
            UpdateCommand="UPDATE [Software] SET [softwareName] = @softwareName, [photo] = @photo WHERE [softwareID] = @softwareID">
            <DeleteParameters>
                <asp:Parameter Name="softwareID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="softwareName" Type="String" />
                <asp:Parameter Name="photo" Type="Object" />
                <asp:Parameter Name="softwareID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="softwareID" Type="Int32" />
                <asp:Parameter Name="softwareName" Type="String" />
                <asp:Parameter Name="photo" Type="Object" />
            </InsertParameters>
        </asp:SqlDataSource>
        <br />
        <div align="center">
        <asp:DataPager ID="DataPager1" runat="server" PagedControlID="SoftwareListView" 
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

