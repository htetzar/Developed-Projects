<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Enroll.aspx.cs" Inherits="Enroll" Title="Enroll" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
          
    .style1
    {
        width: 290px;
    }
    .style2
    {
        width: 118px;
    }
        .style3
        {
            color: #CC0000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table style="width: 100%; height: 335px;">
            <tr>
                <td class="style2">
                  
                    &nbsp;</td>
                <td class="style1">
                    
                    <asp:Label ID="Label10" runat="server" Font-Size="X-Large" Text="Enroll Course"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                  
                    &nbsp;</td>
                <td class="style1">
                    
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style2">
                  
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    
                    <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="Name required" ControlToValidate="txtName"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                  
                    <asp:Label ID="Label2" runat="server" Text="Gender"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                   
                    <asp:RadioButtonList ID="rdlGender" runat="server" Height="33px" 
                        RepeatDirection="Horizontal" Width="153px">
                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="rdlGender" ErrorMessage="Gender required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px" class="style2">
                    
                    <asp:Label ID="Label3" runat="server" Text="NRC"></asp:Label>
                    <span class="style3">*</span></td>
                <td align="center" class="style1">
                   
                    <asp:TextBox ID="txtNRC" runat="server" style="margin-right: 199px"></asp:TextBox>
                </td>
                <td>
                    
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="txtNRC" ErrorMessage="NRC  required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                        ErrorMessage="Incorrect NRC" ControlToValidate="txtNRC" 
                        
                        
                        ValidationExpression="\d{1,2}/[A-Za-z]{3,9}(([(][N|n][)])|([(][N|n][A|a][I|i][N|n][G|g][)]))\d{6}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="margin-left: 40px" class="style2">
                    <asp:Label ID="Label6" runat="server" Text="Date Of Birth"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtDOB" runat="server"></asp:TextBox>
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                        TargetControlID="txtDOB" Format="dd-MMM-yy">
                    </asp:CalendarExtender>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="txtDOB" ErrorMessage="Date of Birth  required"></asp:RequiredFieldValidator>
                    <br />
                <asp:CustomValidator ID="CustValDOB" runat="server" ControlToValidate="txtDOB" 
                    ErrorMessage="Must be 16 year or greater" 
                    onservervalidate="CustValDOB_ServerValidate"></asp:CustomValidator>
                    </td>
            </tr>
            <tr>
                <td  style="margin-left: 40px" class="style2">
                    <asp:Label ID="Label4" runat="server" Text="Father Name"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtFatherName" runat="server"></asp:TextBox></td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="txtFatherName" ErrorMessage="Father Name  required"></asp:RequiredFieldValidator>
                   </td>
            </tr>
            <tr>
                <td style="margin-left: 40px" class="style2">
                    <asp:Label ID="Label5" runat="server" Text="Qualification"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtQualification" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="txtQualification" 
                        ErrorMessage="Qualification  required"></asp:RequiredFieldValidator>
                    </td>
            </tr>
            <tr>
                <td valign="top" class="style2">
                    <asp:Label ID="Label7" runat="server" Text="Address"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtAddress" runat="server" Height="63px" TextMode="MultiLine" 
                        Width="184px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtAddress" ErrorMessage="Address  required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label8" runat="server" Text="Phone"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                        ControlToValidate="txtPhone" ErrorMessage="Phone  required"></asp:RequiredFieldValidator>
                    <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Invalid Phone Number" 
                    ValidationExpression="((\d{2,3})?(-)?\d{6,9}[,]?)+" 
                    ValidationGroup="AllValidators"></asp:RegularExpressionValidator>
                    </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label ID="Label9" runat="server" Text="Email"></asp:Label>
                    <span class="style3">*</span></td>
                <td class="style1">
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email  required"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                        ErrorMessage="Invalid Format" ControlToValidate="txtEmail" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    </td>
                <td class="style1">
                    <br />
                    <asp:Button ID="btnEnroll" runat="server" Height="38px" 
                        onclick="btnEnroll_Click" Text="Enroll" Width="92px" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnCancel" runat="server" Height="38px" 
                        onclick="btnCancel_Click" Text="Cancel" Width="92px" 
                        CausesValidation="False" />
                    &nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style11" >
                    <asp:SqlDataSource ID="sqlDSEnroll" runat="server" 
                        ConnectionString="Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3" 
                        DeleteCommand="DELETE FROM [Enroll] WHERE [enrollID] = @enrollID" 
                        InsertCommand="INSERT INTO Enroll(enrollID, courseID, enrollName, gender, nrc, fatherName, qualification, contactAddress, phone, email, dob, enrolldate) VALUES (@enrollID, @courseID, @enrollName, @gender, @nrc, @fatherName, @qualification, @contactAddress, @phone, @email, @dob, @enrolldate)" 
                        SelectCommand="SELECT max(enrollID) FROM [Enroll]" 
                        
                        
                        UpdateCommand="UPDATE [Enroll] SET [courseID] = @courseID, [enrollName] = @enrollName, [gender] = @gender, [nrc] = @nrc, [fatherName] = @fatherName, [qualification] = @qualification, [contactAddress] = @contactAddress, [phone] = @phone, [email] = @email, [dob] = @dob WHERE [enrollID] = @enrollID" 
                        
                        
                        
                        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                        <DeleteParameters>
                            <asp:Parameter Name="enrollID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="courseID" Type="Int32" />
                            <asp:Parameter Name="enrollName" Type="String" />
                            <asp:Parameter Name="gender" Type="String" />
                            <asp:Parameter Name="nrc" Type="String" />
                            <asp:Parameter Name="fatherName" Type="String" />
                            <asp:Parameter Name="qualification" Type="String" />
                            <asp:Parameter Name="contactAddress" Type="String" />
                            <asp:Parameter Name="phone" Type="String" />
                            <asp:Parameter Name="email" Type="String" />
                            <asp:Parameter Type="DateTime" Name="dob" />
                            <asp:Parameter Name="enrollID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="enrollID" SessionField="enrollID" Type="Int32" />
                            <asp:QueryStringParameter Name="courseID" QueryStringField="cid" Type="Int32" />
                            <asp:ControlParameter ControlID="txtName" Name="enrollName" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="rdlGender" Name="gender" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="txtNRC" Name="nrc" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtFatherName" Name="fatherName" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtQualification" Name="qualification" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtAddress" Name="contactAddress" 
                                PropertyName="Text" Type="String" />
                            <asp:ControlParameter ControlID="txtPhone" Name="phone" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtEmail" Name="email" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtDOB" Name="dob" PropertyName="Text" 
                                DbType="DateTime" />
                            <asp:SessionParameter Name="enrolldate" SessionField="enrolldate" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        &nbsp;
    </p>
</asp:Content>

