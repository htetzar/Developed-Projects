<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="UploadCV.aspx.cs" Inherits="UploadCV" Title="Upload CV" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        
        .style7
        {
            width: 167px;
        }
        .style2
        {
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%; " cellpadding="20px">
        <tr>
            <td align="center">
                
                <asp:Label ID="Label16" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" 
                    Text="UPLOAD YOUR CV FORM&nbsp;"></asp:Label>
            </td>
        </tr>

        </table>
    <br />
    <table style="width:100%;" 
                cellpadding="10px">
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtName" runat="server" Width="150px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtName" ErrorMessage="Name is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label15" runat="server" Text="Title"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" Width="185px" Height="128px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtTitle" ErrorMessage="Title is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label2" runat="server" Text="Date Of Birth"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtDOB" runat="server" Width="150px"  ></asp:TextBox>
                <asp:CalendarExtender ID="txtDOB_CalendarExtender" runat="server" 
                    TargetControlID="txtDOB" Format="dd-MMM-yy">
                </asp:CalendarExtender>
                <!--<asp:Button ID="btnChooseCalender" runat="server" Text="Choose Date" />-->
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDOB" ErrorMessage="Date of Birth is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                <asp:CustomValidator ID="CustValDOB" runat="server" ControlToValidate="txtDOB" 
                    ErrorMessage="Must be 18 year or greater" 
                    onservervalidate="CustValDOB_ServerValidate" ValidationGroup="AllValidators"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label3" runat="server" Text="Gender"></asp:Label>
                <span class="style2">*</span></td>
            <td align="left">
                <asp:RadioButtonList ID="rdlGender" runat="server" 
                    Height="17px" RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="rdlGender" ErrorMessage="Gender is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label4" runat="server" Text="NRC"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtNRC" runat="server" Width="150px"></asp:TextBox>
                <br />
                eg.12/YaKaNa(N)123214</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtNRC" ErrorMessage="NRC is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                    runat="server" ControlToValidate="txtNRC" ErrorMessage="Incorrect NRC." 
                    ValidationExpression="\d{1,2}/[A-Za-z]{3,9}[(][N|n][)]\d{6}" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label5" runat="server" Text="Marital Status"></asp:Label>
                <span class="style2">*</span></td>
            <td align="left">
                <asp:RadioButtonList ID="rdlStatus" runat="server" 
                    Height="27px" RepeatDirection="Horizontal" Width="150px">
                    <asp:ListItem>Single</asp:ListItem>
                    <asp:ListItem>Marriage</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="rdlStatus" ErrorMessage="Marital Status is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label6" runat="server" Text="Father Name"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtFatherName" runat="server" Width="150px" Height="22px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtFatherName" ErrorMessage="Father Name is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label7" runat="server" Text="Qualification"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtQualification" runat="server" TextMode="MultiLine" 
                    Width="185px" Height="128px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtQualification" ErrorMessage="Qualification is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label8" runat="server" Text="Other Qualification"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtOtherQualification" runat="server" TextMode="MultiLine" 
                    Width="185px" Height="128px"></asp:TextBox>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label9" runat="server" Text="Experience"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtExperience" runat="server" TextMode="MultiLine" 
                    Width="185px" Height="128px"></asp:TextBox>
            </td>
            <td>
                </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label10" runat="server" Text="Expected Salary"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtSalary" runat="server" Width="150px"></asp:TextBox>
                &nbsp;Ks.</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtSalary" ErrorMessage="Expected Salary is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtSalary" ErrorMessage="Must be number" 
                    Operator="GreaterThan" Type="Integer" ValidationGroup="AllValidators" 
                    ValueToCompare="0"></asp:CompareValidator>
                </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label11" runat="server" Text="Email"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" Width="150px"></asp:TextBox>
                                    </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                    runat="server" ControlToValidate="txtEmail" 
                    ErrorMessage="Incorrect Fomat Email." 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" align="right" class="style7">
                <asp:Label ID="Label12" runat="server" Text="Addess"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" 
                    Width="185px" Height="128px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                    ControlToValidate="txtAddress" ErrorMessage="Address is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label13" runat="server" Text="Contact Phone Number"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtContactPhone" runat="server" Width="150px"></asp:TextBox>
                <br />
                eg., 01-123456 or 09-1234567(89)</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                    ControlToValidate="txtContactPhone" ErrorMessage="Phone Number is required." 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtContactPhone" ErrorMessage="Invalid Phone Number" 
                    ValidationExpression="\d{2,3}[-]\d{6,9}" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="Label14" runat="server" Text="Photo"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fulCV" runat="server" Width="217px" />
                &nbsp;
                <br />
            </td>
            <td>
                <asp:Button ID="btnUpload" runat="server" Height="26px" Text="Upload Photo" 
                    Width="93px" onclick="btnUpload_Click" style="margin-left: 3px" />
                </td>
        </tr>
        <tr>
            <td align="right" class="style7">
                &nbsp;</td>
            <td>
                <asp:Image ID="ImgCV" runat="server" Height="165px" Width="141px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style7">
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
            </td>
            <td>
                <br />
                <asp:Button ID="btnUploadCV" runat="server" Height="35px" Text="Upload CV" 
                    Width="83px" onclick="btnUploadCV_Click" ValidationGroup="AllValidators" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Height="35px" Text="Cancel" 
                    Width="83px" onclick="btnCancel_Click" />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>

    <br />
                
    <br />
</asp:Content>



