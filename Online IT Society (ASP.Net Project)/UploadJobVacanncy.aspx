<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="UploadJobVacanncy.aspx.cs" Inherits="UploadJobVacanncy" Title="Upload Job Vacancy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
       
        .style6
        {
            width: 130px;
        }
       
        .style2
        {
            color: #CC0000;
        }
           
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table width="100%">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                <asp:Label ID="Label10" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="UPLOAD JOB VACANCY"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
        <br />

        <table style="width:100%;" 
                cellpadding="10px">
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label1" runat="server" Text="Job Cateogory"></asp:Label>
            </td>
            <td>
                <asp:DropDownList ID="ddlJobCategory" runat="server" Height="21px" 
                    Width="175px">
                    <asp:ListItem>Window Programmer</asp:ListItem>
<asp:ListItem>Web Programmer</asp:ListItem>
                    <asp:ListItem>Training Teacher</asp:ListItem>
                    <asp:ListItem>Network Engineer</asp:ListItem>
                    <asp:ListItem>System Ananlyst</asp:ListItem>
                    <asp:ListItem>Graphic Designer</asp:ListItem>
                    <asp:ListItem>Test Engineer</asp:ListItem>
                    <asp:ListItem>Database Administrator</asp:ListItem>
                    <asp:ListItem>Team Leader</asp:ListItem>
                    <asp:ListItem>Project Manager</asp:ListItem>
                    <asp:ListItem>Hardware Technician</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td valign="top" class="style6" align="right">
                <asp:Label ID="Label2" runat="server" Text="Job Title"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtJobTitle" runat="server" Width="175px" Height="72px" 
                    TextMode="MultiLine"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtJobTitle" ErrorMessage="Job Title is required." SetFocusOnError="True" 
                    ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label3" runat="server" Text="Salary"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtSalary" runat="server" Width="160px"></asp:TextBox>
            &nbsp;Ks</td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtSalary" 
                    ErrorMessage="Salary is required." 
                    SetFocusOnError="True" ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtSalary" ErrorMessage="Must be Number" 
                    Operator="GreaterThan" Type="Integer" ValidationGroup="AllValidators" 
                    ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style6" align="right">
                <asp:Label ID="Label4" runat="server" Text="Address"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Height="57px" TextMode="MultiLine" 
                    Width="182px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtAddress" 
                    ErrorMessage="Address is required." 
                    SetFocusOnError="True" ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label5" runat="server" Text="Qualification"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtQualification" runat="server" Width="160px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtQualification" 
                    ErrorMessage="Qualification is required." 
                    SetFocusOnError="True" ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td valign="top" class="style6" align="right">
                <asp:Label ID="Label6" runat="server" Text="Description"></asp:Label>
                <span class="style2">*</span></td>
            <td>
                <asp:TextBox ID="txtDescription" runat="server" Height="128px" 
                    TextMode="MultiLine" Width="185px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtDescription" 
                    ErrorMessage="Description is required." 
                    SetFocusOnError="True" ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label7" runat="server" Text="Logo"></asp:Label>
            </td>
            <td>
                <asp:FileUpload ID="fulLogo" runat="server" />
            </td>
            <td>
                <asp:Button ID="btnUploadLogo" runat="server" onclick="btnUploadLogo_Click" 
                    Text="Upload Logo" />
                <br />
            </td>
        </tr>
        <tr>
            <td class="style6" align="right">
                &nbsp;</td>
            <td>
                <asp:Image ID="imgJobVacancy" runat="server" Height="165px" Width="175px" />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label8" runat="server" Text="No of Post"></asp:Label>
                <span class="style2">*</s*</span></td>
            <td>
                <asp:TextBox ID="txtNoofPost" runat="server" Width="160px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtNoofPost" 
                    ErrorMessage="No of Post is required." 
                    SetFocusOnError="True" ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                &nbsp;<br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtNoofPost" ErrorMessage="Must be number." 
                    Operator="GreaterThan" Type="Integer" ValidationGroup="AllValidators" 
                    ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style6" align="right">
                <asp:Label ID="Label9" runat="server" Text="Gender"></asp:Label>
                <span class="style2">*</td>
            <td align="left">
                <asp:CheckBoxList ID="chklsGender" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Value="M">Male</asp:ListItem>
                    <asp:ListItem Value="F">Female</asp:ListItem>
                </asp:CheckBoxList>
            </td>
            <td>
                <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="right">
                &nbsp;</td>
            <td align="left" colspan="2">
                &nbsp;
                <asp:Button ID="btnUploadJob" runat="server" Height="39px" Text="Upload Job Vacancy" 
                    Width="141px" onclick="btnUploadJob_Click" 
                    ValidationGroup="AllValidators" />
                &nbsp;<asp:Button ID="btnCancel" runat="server" Height="39px" Text="Cancel" 
                    Width="90px" onclick="btnCancel_Click" />
            </td>
        </tr>
        </table>
    <br /><br /><br />
    
</asp:Content>


