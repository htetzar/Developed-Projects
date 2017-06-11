<%@ Page Language="C#" MasterPageFile="~/AdminLoginMasterPage.master" AutoEventWireup="true" CodeFile="AdminLogin.aspx.cs" Inherits="AdminLogin" Title="Admin Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            text-align: left;
        }
        .style8
        {
            height: 38px;
            text-align: left;
        }
        .style9
        {
            height: 38px;
        }
        .style10
        {
            width: 113px;
            height: 45px;
            text-align: center;
        }
        .style11
        {
            height: 45px;
        }
        .style13
        {
            height: 38px;
            text-align: left;
            width: 113px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<center>
    <table style="width: 100%; height: 150px;">
    <br /><br /><br /><br />
    <caption><h2>Admin Login</h2></caption>
        <tr>
            <td class="style10">
                User Name</td>
            <td class="style11">
                <asp:TextBox ID="txtUser" runat="server" style="margin-left: 0px"></asp:TextBox>
            </td>
            <td class="style11">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtUser" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style13" align="left">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Password</td>
            <td class="style9">
                <asp:TextBox ID="txtpwd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style9">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtpwd" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td class="style13" align="center">
                &nbsp;</td>
            <td class="style9">
                <asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td class="style9">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style8" colspan="3">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnLogin" runat="server" Text="Login" onclick="btnLogin_Click" 
                    Height="30px" Width="104px" />
                &nbsp;&nbsp;&nbsp;&nbsp;
                </td>
        </tr>
        </table>
        </center>
        <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
</asp:Content>

