<%@ Page Language="C#" MasterPageFile="~/TrainerMasterPage.master" AutoEventWireup="true" CodeFile="TrainerEditProfile.aspx.cs" Inherits="TrainerEditProfile" Title="Edit Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width: 100%;">
        <tr>
            <td align="center">
                &nbsp;
                <asp:Label ID="Label1" runat="server" Font-Size="X-Large" 
                    Text="Trainer Edit Profile"></asp:Label>
            </td>
            
        </tr>
       
               
    </table>
<br />

    <asp:FormView ID="FormView1" runat="server" DataKeyNames="trainerID" 
    DataSourceID="TrainerEditProfileDS" DefaultMode="Edit" 
        onitemcommand="FormView1_ItemCommand" 
        onitemupdated="FormView1_ItemUpdated" Width="100%" 
        ondatabound="FormView1_DataBound">
    <EditItemTemplate>
        <table style="width:100%;">
            <tr>
                <td>
                    Logo</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    &nbsp;<asp:Button ID="btmUpload" runat="server" CausesValidation="False" 
                        CommandName="aa" onclick="btmUpload_Click" style="margin-top: 3px" 
                        Text="Upload" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Width="150px" ImageUrl='<%# "Handler.ashx?tid="+Eval("trainerID") %>' />
                </td>
            </tr>
            <tr>
                <td>
                    Training Name</td>
                <td>
                    <asp:TextBox ID="trainerNameTextBox" runat="server" 
                        Text='<%# Bind("trainerName") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="trainerNameTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Description</td>
                <td>
                    <asp:TextBox ID="descriptionTextBox" runat="server" style="margin-bottom: 0px" 
                        Text='<%# Bind("description") %>' TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="descriptionTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Email</td>
                <td>
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="emailTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ControlToValidate="emailTextBox" ErrorMessage="Invalid Email." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Current Password</td>
                <td>
                    <asp:TextBox ID="cur_psw" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="cur_psw" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" 
                        ControlToValidate="cur_psw" ErrorMessage="Incorrect Password" 
                        onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>
                    New Password</td>
                <td>
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' 
                        TextMode="Password" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="passwordTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Confirm Password</td>
                <td>
                    <asp:TextBox ID="con_psw" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="con_psw" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="passwordTextBox" ControlToValidate="con_psw" 
                        ErrorMessage="Password is not Match"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Phone</td>
                <td>
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="phoneTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="phoneTextBox" ErrorMessage="Incorrect Phone No." 
                        ValidationExpression="\d{2,3}[-]\d{6,9}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Address</td>
                <td>
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' 
                        TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="addressTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        trainerID:
        <asp:TextBox ID="trainerIDTextBox" runat="server" 
            Text='<%# Bind("trainerID") %>' />
        <br />
        trainerName:
        <asp:TextBox ID="trainerNameTextBox" runat="server" 
            Text='<%# Bind("trainerName") %>' />
        <br />
        description:
        <asp:TextBox ID="descriptionTextBox" runat="server" 
            Text='<%# Bind("description") %>' />
        <br />
        email:
        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
        <br />
        password:
        <asp:TextBox ID="passwordTextBox" runat="server" 
            Text='<%# Bind("password") %>' />
        <br />
        phone:
        <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
        <br />
        address:
        <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
        <br />
        logo:
        <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        trainerID:
        <asp:Label ID="trainerIDLabel" runat="server" Text='<%# Eval("trainerID") %>' />
        <br />
        trainerName:
        <asp:Label ID="trainerNameLabel" runat="server" 
            Text='<%# Bind("trainerName") %>' />
        <br />
        description:
        <asp:Label ID="descriptionLabel" runat="server" 
            Text='<%# Bind("description") %>' />
        <br />
        email:
        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
        <br />
        password:
        <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
        <br />
        phone:
        <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
        <br />
        address:
        <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
        <br />
        
        <br />
        logo:
        <asp:Label ID="logoLabel" runat="server" Text='<%# Bind("logo") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
            CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="TrainerEditProfileDS" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
    DeleteCommand="DELETE FROM [Trainer] WHERE [trainerID] = @trainerID" 
    InsertCommand="INSERT INTO [Trainer] ([trainerID], [trainerName], [description], [email], [password], [phone], [address], [logo]) VALUES (@trainerID, @trainerName, @description, @email, @password, @phone, @address, @logo)" 
    SelectCommand="SELECT * FROM [Trainer] WHERE ([email] = @email)" 
    
        UpdateCommand="UPDATE [Trainer] SET [trainerName] = @trainerName, [description] = @description, [email] = @email, [password] = @password, [phone] = @phone, [address] = @address, [logo] = @logo WHERE [trainerID] = @trainerID" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
    <SelectParameters>
        <asp:SessionParameter Name="email" SessionField="login" Type="String" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="trainerID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="trainerName" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="phone" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:SessionParameter Name="logo" SessionField="logo" />
        <asp:Parameter Name="trainerID" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="trainerID" Type="Int32" />
        <asp:Parameter Name="trainerName" Type="String" />
        <asp:Parameter Name="description" Type="String" />
        <asp:Parameter Name="email" Type="String" />
        <asp:Parameter Name="password" Type="String" />
        <asp:Parameter Name="phone" Type="String" />
        <asp:Parameter Name="address" Type="String" />
        <asp:Parameter Name="logo" Type="String" />
    </InsertParameters>
</asp:SqlDataSource>
    <asp:SqlDataSource ID="PWDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        SelectCommand="SELECT [password] FROM [Trainer] WHERE ([email] = @email)">
        <SelectParameters>
            <asp:SessionParameter Name="email" SessionField="login" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

