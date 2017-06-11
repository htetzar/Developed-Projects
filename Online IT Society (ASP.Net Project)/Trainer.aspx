<%@ Page Language="C#" MasterPageFile="~/TrainerMasterPage.master" AutoEventWireup="true" CodeFile="Trainer.aspx.cs" Inherits="Trainer" Title="Trainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td>
            <asp:ListView ID="TrainerLV" runat="server" DataKeyNames="trainerID" 
                DataSourceID="trainerDS" style="margin-bottom: 0px">
                <ItemTemplate>
                    <span style="">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# "Handler.ashx?tid="+Eval("trainerID") %>' 
                                    Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                <asp:Label ID="trainerNameLabel" runat="server" 
                                    Text='<%# Eval("trainerName") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Eval("description") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                    </table>
                    </span>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <span style="">
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("logo") %>' 
                                    Width="150px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                <asp:Label ID="trainerNameLabel" runat="server" 
                                    Text='<%# Eval("trainerName") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <span>
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Eval("description") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                    </table>
                    </span>
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    trainerName:
                    <asp:TextBox ID="trainerNameTextBox" runat="server" 
                        Text='<%# Bind("trainerName") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    trainerID:
                    <asp:TextBox ID="trainerIDTextBox" runat="server" 
                        Text='<%# Bind("trainerID") %>' />
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
                        <span ID="itemPlaceholder" runat="server">
                        </span>
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <span style="">logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    trainerName:
                    <asp:TextBox ID="trainerNameTextBox" runat="server" 
                        Text='<%# Bind("trainerName") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    trainerID:
                    <asp:Label ID="trainerIDLabel1" runat="server" 
                        Text='<%# Eval("trainerID") %>' />
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
                    <span style="">logo:
                    <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
                    <br />
                    trainerName:
                    <asp:Label ID="trainerNameLabel" runat="server" 
                        Text='<%# Eval("trainerName") %>' />
                    <br />
                    description:
                    <asp:Label ID="descriptionLabel" runat="server" 
                        Text='<%# Eval("description") %>' />
                    <br />
                    trainerID:
                    <asp:Label ID="trainerIDLabel" runat="server" Text='<%# Eval("trainerID") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="trainerDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                
                SelectCommand="SELECT [logo], [trainerName], [description], [trainerID] FROM [Trainer] WHERE ([email] = @email)" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:SessionParameter Name="email" SessionField="login" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
        </td>
    </tr>
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" 
                AutoGenerateColumns="False" DataKeyNames="courseID" DataSourceID="courseDS" 
                PageSize="5" Height="165px" Width="359px" style="margin-top: 0px" 
                BorderWidth="0px">
                <Columns>
                    <asp:BoundField DataField="courseTitle" 
                        SortExpression="courseTitle" ShowHeader="False" >
                        <FooterStyle BorderWidth="0px" />
                        <HeaderStyle BorderWidth="0px" />
                        <ItemStyle BorderWidth="0px" />
                    </asp:BoundField>
                    <asp:HyperLinkField DataNavigateUrlFields="courseid" 
                        DataNavigateUrlFormatString="~/EditCourse.aspx?val={0}" Text="Edit" 
                        ShowHeader="False" >
                        <FooterStyle BorderWidth="0px" />
                        <HeaderStyle BorderWidth="0px" />
                        <ItemStyle BorderWidth="0px" />
                    </asp:HyperLinkField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Delete" Text="Delete" OnClientClick="javascript:return confirm('Do you really want to delete the item?');"></asp:LinkButton>
                        </ItemTemplate>
                        <FooterStyle BorderWidth="0px" />
                        <HeaderStyle BorderWidth="0px" />
                        <ItemStyle BorderWidth="0px" />
                    </asp:TemplateField>
                </Columns>
                <EmptyDataTemplate>
                    courseTitle
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="courseDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [Course] WHERE [courseID] = @courseID"
                
                SelectCommand="SELECT [courseID], [courseTitle] FROM [Course] WHERE ([trainerID] = @trainerID)" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:SessionParameter Name="trainerID" SessionField="trainerId" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                        <asp:Parameter Name="courseID" Type="Int32" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td>
            <asp:LinkButton ID="LinkButton2" runat="server" 
                PostBackUrl="~/AddNewCourse.aspx?val={1}">Add New Course</asp:LinkButton>
        </td>
    </tr>
</table>
</asp:Content>

