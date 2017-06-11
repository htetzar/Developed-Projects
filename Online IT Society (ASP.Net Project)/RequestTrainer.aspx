<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="RequestTrainer.aspx.cs" Inherits="RequestTrainer" Title="Request Trainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblSuccessful" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Training Name"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTrainingName" runat="server" Width="155px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtTrainingName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style3">
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                </td>
                <td class="style3">
                    <asp:TextBox ID="txtEmai" runat="server" Width="155px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtEmai" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;&nbsp;
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmai" ErrorMessage="Incorrect Email Format" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    <asp:Label ID="Label3" runat="server" Text="Enquiry"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtEnquiry" runat="server" Height="76px" TextMode="MultiLine"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtEnquiry" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSave" runat="server" onclick="btnSave_Click" Text="Send Request" 
                        Width="112px" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:SqlDataSource ID="chkUniqueEmailDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                        SelectCommand="SELECT [email] FROM [Member] WHERE ([email] = @email)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtEmai" Name="email" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                        DeleteCommand="DELETE FROM [RequestTrainer] WHERE [RequestID] = @RequestID" 
                        InsertCommand="INSERT INTO [RequestTrainer] ([RequestID], [trainerName], [email], [enquiry]) VALUES (@RequestID, @trainerName, @email, @enquiry)" 
                        SelectCommand="SELECT * FROM [RequestTrainer]" 
                        
                        
                        UpdateCommand="UPDATE [RequestTrainer] SET [trainerName] = @trainerName, [email] = @email, [enquiry] = @enquiry WHERE [RequestID] = @RequestID" 
                        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
                        <DeleteParameters>
                            <asp:Parameter Name="RequestID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="trainerName" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="enquiry" Type="String" />
                            <asp:Parameter Name="RequestID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="RequestID" SessionField="id" Type="Int32" />
                            <asp:ControlParameter ControlID="txtTrainingName" Name="trainerName" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtEmai" Name="email" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtEnquiry" Name="enquiry" PropertyName="Text" 
                                Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                        SelectCommand="SELECT MAX(requestID) AS Expr1 FROM RequestTrainer" 
                        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    
    </div>
</asp:Content>

