<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="UploadForSale.aspx.cs" Inherits="UploadForSale" Title="Upload Forsale Items" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .style6
        {
           
        }
        .style7
        {
            width: 187px;
        }
       
        .style8
        {
            width: 187px;
            height: 44px;
        }
       
        .style2
        {
            color: #CC0000;
        }
           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <table style="width:100%; ">
        <tr>
            <td class="style6" align="center">
                <asp:Label ID="Label13" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="UPLOAD FOR SALE"></asp:Label>
            </td>
        </tr>
        </table>
        <br />
        <table style="width:100%;" 
                cellpadding="10px">
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label1" runat="server" Text="Sale Category"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlSaleCategory" runat="server" AutoPostBack="True" 
                    Width="150px" 
                    onselectedindexchanged="ddlSaleCategory_SelectedIndexChanged">
                </asp:DropDownList>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td align="right" class="style8">
                <asp:Label ID="Label2" runat="server" Text="Brand"></asp:Label>
            </td>
            <td class="style1">
                <asp:DropDownList ID="ddlBrand" runat="server" Width="150px" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td class="style1">
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label10" runat="server" Text="Title"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="185px" Height="128px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="Title is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label3" runat="server" Text="Model"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtModel" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtModel" ErrorMessage="Model required" 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtPrice" runat="server" Width="150px"></asp:TextBox>
                &nbsp;Ks.</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtPrice" ErrorMessage="Price required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                &nbsp;<asp:CompareValidator 
                    ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtPrice" ErrorMessage="Price must be number and greater or equal 1000 Ks" 
                    Operator="GreaterThanEqual" Type="Integer" ValidationGroup="AllValidators" 
                    ValueToCompare="1000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label5" runat="server" Text="Contact Phone Number"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtPhoneNo" runat="server" Width="150px"></asp:TextBox>
                <br />
                eg., 01-123456 or 09-1234567(89)</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtPhoneNo" ErrorMessage="Phone Number is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtPhoneNo" ErrorMessage="Invalid Phone Number" 
                    ValidationExpression="\d{2,3}[-]\d{6,9}" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label6" runat="server" Text="Email"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                                    </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Incorrect Format Email." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label7" runat="server" Text="Photo"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fulSalePhoto" runat="server" />
                &nbsp;
                </td>
            <td>
                <asp:Button ID="btnUploadPhoto" runat="server" Text="Upload Photo" 
                    onclick="btnUploadPhoto_Click" />
                <br />
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                &nbsp;</td>
            <td>
                <asp:Image ID="imgSale" runat="server" Height="165px" Width="175px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label11" runat="server" Text="Address"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Height="128px" 
                    Width="185px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Address is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label14" runat="server" Text="Region"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlRegion" runat="server" Height="24px" Width="177px">
                    <asp:ListItem>Yangon</asp:ListItem>
                    <asp:ListItem>Mandalay</asp:ListItem>
                    <asp:ListItem>BaGo</asp:ListItem>
                    <asp:ListItem>MaGway</asp:ListItem>
                    <asp:ListItem>SitGaing</asp:ListItem>
                    <asp:ListItem>TaHninThaYi</asp:ListItem>
                    <asp:ListItem>Ayeyarwady</asp:ListItem>
                    <asp:ListItem>KaChin State</asp:ListItem>
                    <asp:ListItem>KaYah State</asp:ListItem>
                    <asp:ListItem>KaYin State</asp:ListItem>
                    <asp:ListItem>Chinn State</asp:ListItem>
                    <asp:ListItem>Mon State</asp:ListItem>
                    <asp:ListItem>YaKhine State</asp:ListItem>
                    <asp:ListItem>Shann State</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label9" runat="server" Text="Description"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" 
                    Width="185px" Height="128px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtDescription" ErrorMessage="Description is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label12" runat="server" Text="Bank Account No.  "></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtBankAcc" runat="server"></asp:TextBox>
                <br />
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtBankAcc" ErrorMessage="Bank Account Number is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;<br />
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                &nbsp;</td>
            <td>
                <asp:CustomValidator ID="CustValBankAcc" runat="server" 
                    ControlToValidate="txtBankAcc" ErrorMessage="Enter correct bank account" 
                    ValidationGroup="AllValidators" 
                    onservervalidate="CustValBankAcc_ServerValidate"></asp:CustomValidator>
                <br />
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                <br />
                <asp:Button ID="btnUploadSale" runat="server" Height="33px" Text="Upload Sale" 
                    Width="109px" onclick="btnUploadSale_Click" 
                    ValidationGroup="AllValidators" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Height="30px" Text="Cancel" 
                    Width="77px" onclick="btnCancel_Click" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style7">
                &nbsp;</td>
            <td>
                &nbsp;
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

