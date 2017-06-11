<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="CreateTrainer.aspx.cs" Inherits="CreateTrainer" Title="Create Trainer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <%--   <style type="text/css">
        .style6
        {
            width: 140px;
        }
        .style7
        {
            width: 351px;
        }
        .style8
        {
            width: 197px;
            text-align: left;
            height: 68px;
        }
        .style9
        {
            width: 351px;
            height: 68px;
        }
        .style10
        {
            height: 68px;
        }
        .style14
        {
            width: 197px;
            height: 44px;
            text-align: left;
        }
        .style15
        {
            width: 197px;
            text-align: left;
            height: 37px;
        }
        .style16
        {
            width: 351px;
            height: 37px;
        }
        .style17
        {
            height: 37px;
        }
        .style18
        {
            width: 197px;
            height: 31px;
            text-align: left;
        }
        .style19
        {
            width: 351px;
            height: 31px;
        }
        .style20
        {
            height: 31px;
        }
    </style>--%>
    <style type="text/css">
        .style6
        {
            height: 39px;
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%; height: 128px;" align="left">
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" Text="Trainer Name"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTrainerName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td align="left">
                <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                <span class="style6">*</span></td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtPassword" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style8">
                <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                <span class="style6">*</span></td>
            <td class="style2">
                <asp:TextBox ID="txtCPass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCPass" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
             <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtCPass" 
                    ErrorMessage="Password and Confirm Password must be matched."></asp:CompareValidator>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
            <asp:Button 
            ID="Button1" runat="server" onclick="btnCreate_Click2" Text="Create" 
                    Height="26px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;       
        <asp:Button ID="Button2" runat="server" Text="Cancel" onclick="Button2_Click" 
                    CausesValidation="False" />
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8">
                &nbsp;</td>
            <td class="style2">
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
            
            SelectCommand="SELECT [trainerName], [email], [requestID] FROM [RequestTrainer] WHERE ([requestID] = @requestID)" 
            ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
            <SelectParameters>
                <asp:QueryStringParameter Name="requestID" QueryStringField="val" 
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
                <br />
                <asp:SqlDataSource ID="DSdelRequest" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    DeleteCommand="DELETE FROM RequestTrainer WHERE (trainerName = @trainerName) AND (email = @email)" 
                    InsertCommand="INSERT INTO [RequestTrainer] ([requestID], [trainerName], [email], [enquiry]) VALUES (@requestID, @trainerName, @email, @enquiry)" 
                    SelectCommand="SELECT * FROM [RequestTrainer]" 
                    UpdateCommand="UPDATE [RequestTrainer] SET [trainerName] = @trainerName, [email] = @email, [enquiry] = @enquiry WHERE [requestID] = @requestID">
                    <DeleteParameters>
                        <asp:ControlParameter ControlID="txtTrainerName" Name="trainerName" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="trainerName" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="enquiry" Type="String" />
                        <asp:Parameter Name="requestID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="requestID" Type="Int32" />
                        <asp:Parameter Name="trainerName" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="enquiry" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString6 %>" 
                    DeleteCommand="DELETE FROM [Trainer] WHERE [trainerID] = @trainerID" 
                    InsertCommand="INSERT INTO Trainer(trainerID, trainerName, email, password, logo) VALUES (@trainerID, @trainerName, @email, @password, @logo)" 
                    SelectCommand="SELECT [trainerID], [trainerName], [email], [password] FROM [Trainer]" 
                    
                    UpdateCommand="UPDATE [Trainer] SET [trainerName] = @trainerName, [email] = @email, [password] = @password WHERE [trainerID] = @trainerID" 
                    
                    ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString6.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="trainerID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="trainerName" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="trainerID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="trainerID" SessionField="id" Type="Int32" />
                        <asp:ControlParameter ControlID="txtTrainerName" Name="trainerName" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtPassword" Name="password" 
                            PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="logo" SessionField="logo" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT MAX(trainerID) AS Expr1 FROM Trainer" 
                    ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                </asp:SqlDataSource>
                &nbsp;</td>
        </tr>
    </table>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       <%--<a href ="mailto:'<%#Eval("email") %>'">
       <asp:Label ID="Label5" runat="server" 
Text="Create"></asp:Label></a> --%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <%--<a href="mailto:'<%#getEmail() %>'">Create</a>--%><br />
        <br />
        
     
</asp:Content>

