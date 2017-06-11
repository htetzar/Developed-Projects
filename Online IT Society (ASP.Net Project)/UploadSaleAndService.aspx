<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="UploadSaleAndService.aspx.cs" Inherits="UploadSaleAndService" Title="Upload Sale And Service Center" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
        {
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%; ">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center" >
                <asp:Label ID="Label16" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="UPLOAD SALE AND SERVICES"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        <br />

        <table style="width:100%;" 
                cellpadding="10px">
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="Label7" runat="server" Text="Title"></asp:Label>
                <span class="style2">*</span></td>
            <td >
                <asp:TextBox ID="txtTitle" runat="server" Height="60px" TextMode="MultiLine" 
                    Width="210px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="Title is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label1" runat="server" Text="Center Name"></asp:Label>
                <span class="style2">*</span></td>
            <td >
                <asp:TextBox ID="txtCenterName" runat="server" Width="187px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtCenterName" ErrorMessage="Center Name is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label2" runat="server" Text="Phone Number"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtPhone" runat="server" Width="187px"></asp:TextBox>
                <br />
                eg., 01-123456 or 09-1234567(89)</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Phone Number is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number" 
                    ValidationExpression="\d{2,3}[-]\d{6,9}" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="Label3" runat="server" Text="Address"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="60px" 
                    Width="210px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Address is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="Label4" runat="server" Text="Type"></asp:Label>
                <span class="style2">*</span></td>
            <td align="left">
                <asp:CheckBoxList ID="chklsType" runat="server">
                    <asp:ListItem>Sale</asp:ListItem>
                    <asp:ListItem>Service</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:Label ID="lblType" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right" >
                <asp:Label ID="Label5" runat="server" Text="Logo"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fulSaleAndService" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnUpload" runat="server" Height="31px" Text="Upload Logo" 
                    Width="94px" onclick="btnUpload_Click" />
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td>
                <asp:Image ID="ImgSaleAndService" runat="server" Height="100px" Width="200px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label17" runat="server" Text="Email"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Height="24px" Width="187px"></asp:TextBox>
                </td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Incorrect Format Email." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="Label18" runat="server" Text="Website"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtWebsite" runat="server" Width="187px"></asp:TextBox>
                <br />
                eg., http(s)://www.domainname.com(.mm)</td>
            <td>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtWebsite" ErrorMessage="Incorrect Format URL." 
                    ValidationExpression="http(s)?://([\w-]+\.)+[\w-]+(/[\w- ./?%&amp;=]*)?" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right">
                <asp:Label ID="Label6" runat="server" Text="Description"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                    Height="124px" Width="205px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right">
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <br />
                <asp:Button ID="btnUploadPost" runat="server" Height="36px" Text="Upload Post" 
                    Width="92px" onclick="btnUploadPost_Click" 
                    ValidationGroup="AllValidators" />
                &nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Height="36px" Text="Cancel" 
                    Width="92px" onclick="btnCancel_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <br />
    <br />

</asp:Content>

