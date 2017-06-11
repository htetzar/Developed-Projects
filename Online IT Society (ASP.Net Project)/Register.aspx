<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" Title="Register" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 43px;
        }
        .style6
        {
            width: 192px;
            height: 47px;
        }
        .style7
        {
            height: 47px;
        }
        .style8
        {
            height: 39px;
        text-align: left;
    }
        .style9
        {
            height: 40px;
            width: 192px;
        }
        .style10
        {
            height: 40px;
        }
        .style12
        {
            height: 43px;
            width: 204px;
        }
        .style16
    {
        height: 54px;
        width: 192px;
    }
    .style18
    {
        height: 54px;
    }
        .style19
        {
            width: 192px;
            height: 80px;
        }
        .style20
        {
            height: 80px;
        }
    .style21
    {
        height: 39px;
        width: 192px;
    }
    .style22
    {
        width: 192px;
        height: 44px;
    }
    .style23
    {
        height: 39px;
        text-align: left;
        width: 204px;
    }
    .style24
    {
        height: 49px;
        width: 192px;
    }
    .style26
    {
        height: 49px;
        text-align: left;
    }
        .style27
        {
            height: 54px;
            width: 204px;
        }
        .style28
        {
            height: 39px;
            width: 204px;
        }
        .style29
        {
            width: 204px;
            height: 47px;
        }
        .style30
        {
            height: 49px;
            width: 204px;
        }
        .style31
        {
            height: 40px;
            width: 204px;
        }
        .style32
        {
            color: #FF0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
            <tr>
                <td class="style16">
                </td>
                <td class="style27">
                    &nbsp;</td>
                <td class="style18">
                </td>
            </tr>
            <tr>
                <td class="style21" align="right">
                    <asp:Label ID="Label1" runat="server" Text="User Name"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style28">
                    <asp:TextBox ID="txtName" runat="server" Width="156px"></asp:TextBox>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="txtName" ErrorMessage="Name is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style21" align="right">
                    <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style23">
                    <asp:RadioButtonList ID="rdlGender" runat="server" AutoPostBack="True" 
                        Height="26px" RepeatDirection="Horizontal" Width="158px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td class="style8">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="rdlGender" ErrorMessage="Gender is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22" align="right">
                    <asp:Label ID="Label3" runat="server" Text="Date Of Birth"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style12">
                    <asp:TextBox ID="txtDOB" runat="server" Width="154px"></asp:TextBox>
                    &nbsp;<asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDOB">
                    </asp:CalendarExtender>
                    <%--<asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtDOB">
                    </asp:CalendarExtender>--%>
                    </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtDOB" ErrorMessage="Date of birth is required."></asp:RequiredFieldValidator>
                    &nbsp;<asp:CustomValidator ID="AgeValidator" runat="server" 
                        ControlToValidate="txtDOB" ErrorMessage="Age under 18 cannot register." 
                        onservervalidate="AgeValidator_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td class="style6" align="right">
                    <asp:Label ID="Label4" runat="server" Text="Email"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style29">
                    <asp:TextBox ID="txtEmail" runat="server" Width="153px"></asp:TextBox>
                </td>
                <td class="style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email address is required."></asp:RequiredFieldValidator>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Type valid email address." 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style24" align="right">
                    <asp:Label ID="Label5" runat="server" Text="Password"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style30" >
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="153px"></asp:TextBox>
                </td>
                <td class="style26">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required."></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style22" align="right">
                    <asp:Label ID="Label6" runat="server" Text="Confirm Password"></asp:Label>
                    <span class="style32">*</span></td>
                <td class="style12">
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" Width="153px"></asp:TextBox>
                </td>
                <td class="style5">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtConfirm" ErrorMessage="Need to confirm password."></asp:RequiredFieldValidator>
                    &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ControlToCompare="txtPassword" ControlToValidate="txtConfirm" 
                        ErrorMessage="Need to same with password."></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="style9" align="right">
                    &nbsp;</td>
                <td class="style31">
                    <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td class="style10">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" align="right">
                    &nbsp;</td>
                <td class="style31">
                    <asp:Button ID="btnRegister" runat="server" Height="34px" 
                        onclick="btnRegister_Click" Text="Register" Width="86px" 
                        Font-Bold="True" />
                    <asp:Button ID="Cancel" runat="server" Height="34px" Text="Cancel" 
                        Width="85px" Font-Bold="True" CausesValidation="False" />
                </td>
                <td class="style10">
                </td>
            </tr>
            <tr>
                <td class="style19">
                    </td>
                <td class="style20" colspan="2" align="left">
                    &nbsp;&nbsp;
                    <asp:SqlDataSource ID="memDS" runat="server" 
                        ConnectionString="Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3" 
                        DeleteCommand="DELETE FROM [Member] WHERE [memberID] = @memberID" 
                        InsertCommand="INSERT INTO [Member] ([memberID], [username], [gender], [dob], [email], [password], [bankaccount]) VALUES (@memberID, @username, @gender, @dob, @email, @password, '')" 
                        SelectCommand="SELECT max([memberID]) FROM [Member]" 
                        
                        UpdateCommand="UPDATE [Member] SET [username] = @username, [gender] = @gender, [dob] = @dob, [email] = @email, [password] = @password, [bankaccount] = @bankaccount WHERE [memberID] = @memberID" 
                        ProviderName="System.Data.SqlClient">
                        <DeleteParameters>
                            <asp:Parameter Name="memberID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="username" Type="String" />
                            <asp:Parameter Name="gender" Type="String" />
                            <asp:Parameter Name="dob" Type="DateTime" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Name="password" Type="String" />
                            <asp:Parameter Name="bankaccount" Type="String" />
                            <asp:Parameter Name="memberID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="memberID" SessionField="id" Type="Int32" />
                            <asp:ControlParameter ControlID="txtName" Name="username" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="rdlGender" Name="gender" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtDOB" Name="dob" PropertyName="Text" 
                                Type="DateTime" />
                            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtPassword" Name="password" 
                                PropertyName="Text" Type="String" />
                            <asp:Parameter Name="bankaccount" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="checkmemDB" runat="server" 
                        ConnectionString="Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3" 
                        SelectCommand="SELECT * FROM [Member] WHERE [email] = @email" 
                        ProviderName="System.Data.SqlClient">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
</asp:Content>

