<%@ Page Language="C#" Debug="true" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Detail.aspx.cs" Inherits="Detail" Title="Untitled Page" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 192px;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiViewDetailPage" runat="server">
        <asp:View ID="ViewJob" runat="server">
            <asp:FormView ID="FormViewJob" runat="server" DataKeyNames="jobID" 
                DataSourceID="SqlDataSourceJobDetail" Width="100%">
                <EditItemTemplate>
                    
                    <br />
                    <table style="width:100%; height: 512px;">
                        <tr>
                            <td valign="top">
                                Logo</td>
                            <td>
                                <asp:FileUpload ID="FileUploadJob" runat="server" />
                                &nbsp;
                                <asp:Button ID="BtnUpload" runat="server" Text="Upload" CommandName="upload" />
                                <br />
                                <asp:Image ID="Image2" runat="server" Width="120px" 
                                    ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Job Category</td>
                            <td>
                                <asp:TextBox ID="categoryTextBox" runat="server" 
                                    Text='<%# Bind("category") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="categoryTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="titleTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Salary</td>
                            <td>
                                <asp:TextBox ID="salaryTextBox" runat="server" Text='<%# Bind("salary") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="salaryTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Required Qualification</td>
                            <td>
                                <asp:TextBox ID="qualificationTextBox" runat="server" 
                                    Text='<%# Bind("qualification") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                    ControlToValidate="qualificationTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number of Post</td>
                            <td>
                                <asp:TextBox ID="noofpostTextBox" runat="server" 
                                    Text='<%# Bind("noofpost") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                    ControlToValidate="noofpostTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender</td>
                            <td>
                                <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                    ControlToValidate="genderTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Description</td>
                            <td>
                                <asp:TextBox ID="descriptionTextBox" runat="server" 
                                    Text='<%# Bind("description") %>' TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                    ControlToValidate="descriptionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Address</td>
                            <td>
                                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' 
                                    TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                                    ControlToValidate="addressTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="jobIDLabel1" runat="server" Text='<%# Eval("jobID") %>' 
                                    Visible="False" />
                                <asp:TextBox ID="postedDateTextBox" runat="server" 
                                    Text='<%# Bind("postedDate") %>' Visible="False" />
                            </td>
                            <td align="left">
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    category:
                    <asp:TextBox ID="categoryTextBox" runat="server" 
                        Text='<%# Bind("category") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    salary:
                    <asp:TextBox ID="salaryTextBox" runat="server" Text='<%# Bind("salary") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <br />
                    qualification:
                    <asp:TextBox ID="qualificationTextBox" runat="server" 
                        Text='<%# Bind("qualification") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    noofpost:
                    <asp:TextBox ID="noofpostTextBox" runat="server" 
                        Text='<%# Bind("noofpost") %>' />
                    <br />
                    gender:
                    <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    jobID:
                    <asp:TextBox ID="jobIDTextBox" runat="server" Text='<%# Bind("jobID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width: 100%; height: 487px;">
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="150px" />
                            </td>
                            <td align="right" valign="top">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Job Category</td>
                            <td>
                                <asp:Label ID="categoryLabel" runat="server" Text='<%# Bind("category") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Salary</td>
                            <td>
                                <asp:Label ID="salaryLabel" runat="server" Text='<%# Bind("salary") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Required Qualification</td>
                            <td>
                                <asp:Label ID="qualificationLabel" runat="server" 
                                    Text='<%# Bind("qualification") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Number of Post</td>
                            <td>
                                <asp:Label ID="noofpostLabel" runat="server" Text='<%# Bind("noofpost") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender</td>
                            <td>
                                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td>
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Bind("description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address</td>
                            <td>
                                <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" Visible='<%#IsMemberJV(Eval("jobID")) %>' />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsMemberAdminJV(Eval("jobID")) %>' OnClientClick="javascript:return confirm('Are you sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    &nbsp;
                    
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/JobVacancy.aspx">Go 
            to Job Vacancy</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceJobDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [Job] WHERE [jobID] = @jobID" 
                InsertCommand="INSERT INTO [Job] ([logo], [category], [title], [salary], [address], [qualification], [description], [noofpost], [gender], [postedDate], [jobID]) VALUES (@logo, @category, @title, @salary, @address, @qualification, @description, @noofpost, @gender, @postedDate, @jobID)" 
                SelectCommand="SELECT [logo], [category], [title], [salary], [address], [qualification], [description], [noofpost], [gender], [postedDate], [jobID] FROM [Job] WHERE ([jobID] = @jobID)" 
                
                UpdateCommand="UPDATE [Job] SET [logo] = @logo, [category] = @category, [title] = @title, [salary] = @salary, [address] = @address, [qualification] = @qualification, [description] = @description, [noofpost] = @noofpost, [gender] = @gender WHERE [jobID] = @jobID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="jobID" QueryStringField="jobid" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="jobID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="logo" SessionField="logo" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="salary" Type="Decimal" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="qualification" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="noofpost" Type="Int32" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="jobID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="logo" Type="Object" />
                    <asp:Parameter Name="category" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="salary" Type="Decimal" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="qualification" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="noofpost" Type="Int32" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                    <asp:Parameter Name="jobID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewCV" runat="server">
            <asp:FormView ID="FormViewCV" runat="server" DataKeyNames="cvID" 
                DataSourceID="SqlDataSourceCVDetail" Width="100%" 
                onitemcommand="FormViewCV_ItemCommand" 
                onitemupdating="FormViewCV_ItemUpdating">
                <EditItemTemplate>
                    <br />
                    &nbsp;<br />
                    <table style="width:100%;">
                        <tr>
                            <td valign="top">
                                Photo</td>
                            <td>
                                <asp:FileUpload ID="FileUploadCV" runat="server" />
                                &nbsp;&nbsp;<asp:Button ID="btnUpload" runat="server" CommandName="upload" Text="Upload" 
                                    CausesValidation="False" />
                                <br />
                                <asp:Image ID="Image4" runat="server" Width="120px" 
                                    ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                                    ControlToValidate="titleTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name</td>
                            <td>
                                <asp:TextBox ID="personNameTextBox" runat="server" 
                                    Text='<%# Bind("personName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                                    ControlToValidate="personNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date of Birth</td>
                            <td>
                                <asp:TextBox ID="dobTextBox" runat="server" 
                                    Text='<%# Bind("dob", "{0:d}") %>' />
                                <asp:CalendarExtender
                                    ID="CalendarExtender1" runat="server" TargetControlID="dobTextBox"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                                    ControlToValidate="dobTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender</td>
                            <td>
                            <%--<asp:TextBox ID="TextBox1" runat="server" />--%>
                                <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                                <asp:RadioButtonList ID="rdlGender"  runat="server" AutoPostBack="True" SelectedValue='<%# Eval("gender") %>'
                                    RepeatDirection="Horizontal" 
                                    onselectedindexchanged="rdlGender_SelectedIndexChanged1">
                                    <asp:ListItem >Male</asp:ListItem>
                                    <asp:ListItem >Female</asp:ListItem>
                                </asp:RadioButtonList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                                    ControlToValidate="rdlGender" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                NRC No.</td>
                            <td>
                                <asp:TextBox ID="nrcTextBox" runat="server" Text='<%# Bind("nrc") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                                    ControlToValidate="nrcTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Marital Status</td>
                            <td>
                                <asp:TextBox ID="maritalStatusTextBox" runat="server" 
                                    Text='<%# Bind("maritalStatus") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                                    ControlToValidate="maritalStatusTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Father Name</td>
                            <td>
                                <asp:TextBox ID="fatherNameTextBox" runat="server" 
                                    Text='<%# Bind("fatherName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                                    ControlToValidate="fatherNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Qualification</td>
                            <td>
                                <asp:TextBox ID="qualificationTextBox" runat="server" 
                                    Text='<%# Bind("qualification") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                                    ControlToValidate="qualificationTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Other Qualification</td>
                            <td>
                                <asp:TextBox ID="otherQualTextBox" runat="server" 
                                    Text='<%# Bind("otherQual") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                                    ControlToValidate="otherQualTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Experience</td>
                            <td>
                                <asp:TextBox ID="experienceTextBox" runat="server" 
                                    Text='<%# Bind("experience") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" 
                                    ControlToValidate="experienceTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Expected Salary</td>
                            <td>
                                <asp:TextBox ID="expectedSalaryTextBox" runat="server" 
                                    Text='<%# Bind("expectedSalary") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                                    ControlToValidate="expectedSalaryTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email</td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                                    ControlToValidate="emailTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address</td>
                            <td>
                                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' 
                                    TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                                    ControlToValidate="addressTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone</td>
                            <td>
                                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator22" runat="server" 
                                    ControlToValidate="phoneTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="postedDateTextBox" runat="server" 
                                    Text='<%# Bind("postedDate") %>' Visible="False" />
                                <asp:Label ID="cvIDLabel1" runat="server" Text='<%# Eval("cvID") %>' 
                                    Visible="False" />
                            </td>
                            <td>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    cvID:
                    <asp:TextBox ID="cvIDTextBox" runat="server" Text='<%# Bind("cvID") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    personName:
                    <asp:TextBox ID="personNameTextBox" runat="server" 
                        Text='<%# Bind("personName") %>' />
                    <br />
                    dob:
                    <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                    <br />
                    gender:
                    <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                    <br />
                    nrc:
                    <asp:TextBox ID="nrcTextBox" runat="server" Text='<%# Bind("nrc") %>' />
                    <br />
                    maritalStatus:
                    <asp:TextBox ID="maritalStatusTextBox" runat="server" 
                        Text='<%# Bind("maritalStatus") %>' />
                    <br />
                    fatherName:
                    <asp:TextBox ID="fatherNameTextBox" runat="server" 
                        Text='<%# Bind("fatherName") %>' />
                    <br />
                    qualification:
                    <asp:TextBox ID="qualificationTextBox" runat="server" 
                        Text='<%# Bind("qualification") %>' />
                    <br />
                    otherQual:
                    <asp:TextBox ID="otherQualTextBox" runat="server" 
                        Text='<%# Bind("otherQual") %>' />
                    <br />
                    experience:
                    <asp:TextBox ID="experienceTextBox" runat="server" 
                        Text='<%# Bind("experience") %>' />
                    <br />
                    expectedSalary:
                    <asp:TextBox ID="expectedSalaryTextBox" runat="server" 
                        Text='<%# Bind("expectedSalary") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <br />
                    &nbsp;&nbsp;<br />
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Image ID="Image3" runat="server" 
                                    ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' Width="120px" />
                            </td>
                            <td align="right" valign="top">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Name</td>
                            <td>
                                <asp:Label ID="personNameLabel" runat="server" 
                                    Text='<%# Bind("personName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Date Of Birth</td>
                            <td>
                                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Gender</td>
                            <td>
                                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                NRC No.</td>
                            <td>
                                <asp:Label ID="nrcLabel" runat="server" Text='<%# Bind("nrc") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Marital Status</td>
                            <td>
                                <asp:Label ID="maritalStatusLabel" runat="server" 
                                    Text='<%# Bind("maritalStatus") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Father Name</td>
                            <td>
                                <asp:Label ID="fatherNameLabel" runat="server" 
                                    Text='<%# Bind("fatherName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Qualification</td>
                            <td>
                                <asp:Label ID="qualificationLabel" runat="server" 
                                    Text='<%# Bind("qualification") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Other Qualification</td>
                            <td>
                                <asp:Label ID="otherQualLabel" runat="server" Text='<%# Bind("otherQual") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Experience</td>
                            <td>
                                <asp:Label ID="experienceLabel" runat="server" 
                                    Text='<%# Bind("experience") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Expected Salary</td>
                            <td>
                                <asp:Label ID="expectedSalaryLabel" runat="server" 
                                    Text='<%# Bind("expectedSalary") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email</td>
                            <td>
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address</td>
                            <td>
                                <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone</td>
                            <td>
                                <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" Visible='<%#IsMemberCV(Eval("cvID")) %>' />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsMemberAdminCV(Eval("cvID")) %>' OnClientClick="javascript:return confirm('Are you sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/ViewCV.aspx">Go 
            to CVs</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceCVDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [CV] WHERE [cvID] = @cvID" 
                InsertCommand="INSERT INTO [CV] ([cvID], [photo], [title], [personName], [dob], [gender], [nrc], [maritalStatus], [fatherName], [qualification], [otherQual], [experience], [expectedSalary], [email], [address], [phone], [postedDate]) VALUES (@cvID, @photo, @title, @personName, @dob, @gender, @nrc, @maritalStatus, @fatherName, @qualification, @otherQual, @experience, @expectedSalary, @email, @address, @phone, @postedDate)" 
                SelectCommand="SELECT [cvID], [photo], [title], [personName], [dob], [gender], [nrc], [maritalStatus], [fatherName], [qualification], [otherQual], [experience], [expectedSalary], [email], [address], [phone], [postedDate] FROM [CV] WHERE ([cvID] = @cvID)" 
                
                UpdateCommand="UPDATE [CV] SET [photo] = @photo, [title] = @title, [personName] = @personName, [dob] = @dob, [gender] = @gender, [nrc] = @nrc, [maritalStatus] = @maritalStatus, [fatherName] = @fatherName, [qualification] = @qualification, [otherQual] = @otherQual, [experience] = @experience, [expectedSalary] = @expectedSalary, [email] = @email, [address] = @address, [phone] = @phone WHERE [cvID] = @cvID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="cvID" QueryStringField="cvid" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="cvID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="photo" SessionField="photo" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="personName" Type="String" />
                    <asp:SessionParameter Name="dob" SessionField="Date" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="nrc" Type="String" />
                    <asp:Parameter Name="maritalStatus" Type="String" />
                    <asp:Parameter Name="fatherName" Type="String" />
                    <asp:Parameter Name="qualification" Type="String" />
                    <asp:Parameter Name="otherQual" Type="String" />
                    <asp:Parameter Name="experience" Type="String" />
                    <asp:Parameter Name="expectedSalary" Type="Decimal" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="cvID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="cvID" Type="Int32" />
                    <asp:Parameter Name="photo" Type="Object" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="personName" Type="String" />
                    <asp:Parameter DbType="Date" Name="dob" />
                    <asp:Parameter Name="gender" Type="String" />
                    <asp:Parameter Name="nrc" Type="String" />
                    <asp:Parameter Name="maritalStatus" Type="String" />
                    <asp:Parameter Name="fatherName" Type="String" />
                    <asp:Parameter Name="qualification" Type="String" />
                    <asp:Parameter Name="otherQual" Type="String" />
                    <asp:Parameter Name="experience" Type="String" />
                    <asp:Parameter Name="expectedSalary" Type="Decimal" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewSaleAndService" runat="server">
            <asp:FormView ID="FormViewSaleandService" runat="server" 
                DataKeyNames="centerID" DataSourceID="SqlDataSourceSaleAndService" 
                Width="100%" onitemcommand="FormViewSaleandService_ItemCommand">
                <EditItemTemplate>
                    <table style="width: 100%; height: 505px;">
                        <tr>
                            <td valign="top">
                                Logo</td>
                            <td>
                                <asp:FileUpload ID="FileUploadSS" runat="server" />
                                &nbsp;&nbsp;<asp:Button ID="btnUpload" runat="server" CommandName="upload" Text="Upload" />
                                <br />
                                <asp:Image ID="Image5" runat="server" Width="120px" 
                                    ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Center Name</td>
                            <td>
                                <asp:TextBox ID="centerNameTextBox" runat="server" 
                                    Text='<%# Bind("centerName") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator23" runat="server" 
                                    ControlToValidate="centerNameTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator24" runat="server" 
                                    ControlToValidate="titleTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Type</td>
                            <td>
                                <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator25" runat="server" 
                                    ControlToValidate="typeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Description</td>
                            <td>
                                <asp:TextBox ID="descriptionTextBox" runat="server" 
                                    Text='<%# Bind("description") %>' TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator26" runat="server" 
                                    ControlToValidate="descriptionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Address</td>
                            <td>
                                <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' 
                                    TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator27" runat="server" 
                                    ControlToValidate="addressTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone</td>
                            <td>
                                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator28" runat="server" 
                                    ControlToValidate="phoneTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Email</td>
                            <td>
                                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator29" runat="server" 
                                    ControlToValidate="emailTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Website</td>
                            <td>
                                <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator30" runat="server" 
                                    ControlToValidate="websiteTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="postedDateTextBox" runat="server" 
                                    Text='<%# Bind("postedDate") %>' Visible="False" />
                                <asp:Label ID="centerIDLabel1" runat="server" Text='<%# Eval("centerID") %>' 
                                    Visible="False" />
                            </td>
                            <td>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    centerID:
                    <asp:TextBox ID="centerIDTextBox" runat="server" 
                        Text='<%# Bind("centerID") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    centerName:
                    <asp:TextBox ID="centerNameTextBox" runat="server" 
                        Text='<%# Bind("centerName") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    type:
                    <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    website:
                    <asp:TextBox ID="websiteTextBox" runat="server" Text='<%# Bind("website") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;&nbsp;<br />
                    <table style="width:100%;">
                        <tr>
                            <td>
                                <asp:Image ID="Image6" runat="server" 
                                    ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' Width="150px" Height="150px" />
                            </td>
                            <td align="right" valign="top">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Center Name</td>
                            <td>
                                <asp:Label ID="centerNameLabel" runat="server" 
                                    Text='<%# Bind("centerName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Title</td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Bind("description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Center Type</td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="typeLabel" runat="server" Text='<%# Bind("type") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Address</td>
                            <td style="margin-left: 80px">
                                <asp:Label ID="addressLabel" runat="server" Text='<%# Bind("address") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Phone</td>
                            <td style="margin-left: 80px">
                                <asp:Label ID="phoneLabel" runat="server" Text='<%# Bind("phone") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="margin-left: 80px">
                            
                            
                            
                                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                                
                           
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="margin-left: 80px">
                                <asp:Label ID="websiteLabel" runat="server" Text='<%# Bind("website") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td style="margin-left: 80px" align="right">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" Visible='<%#IsMemberSS(Eval("centerID")) %>' />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsMemberAdminSS(Eval("centerID")) %>' OnClientClick="javascript:return confirm('Are you sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton3" runat="server" 
                PostBackUrl="~/SaleandService.aspx">Go to Sale &amp; Service Centers</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceSaleAndService" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [SaleandServiceCenter] WHERE [centerID] = @centerID" 
                InsertCommand="INSERT INTO [SaleandServiceCenter] ([centerID], [logo], [centerName], [title], [type], [description], [address], [phone], [email], [website], [postedDate]) VALUES (@centerID, @logo, @centerName, @title, @type, @description, @address, @phone, @email, @website, @postedDate)" 
                SelectCommand="SELECT [centerID], [logo], [centerName], [title], [type], [description], [address], [phone], [email], [website], [postedDate] FROM [SaleandServiceCenter] WHERE ([centerID] = @centerID)" 
                
                UpdateCommand="UPDATE [SaleandServiceCenter] SET [logo] = @logo, [centerName] = @centerName, [title] = @title, [type] = @type, [description] = @description, [address] = @address, [phone] = @phone, [email] = @email, [website] = @website WHERE [centerID] = @centerID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="centerID" QueryStringField="centerid" 
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="centerID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="logo" SessionField="logo" />
                    <asp:Parameter Name="centerName" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="website" Type="String" />
                    <asp:Parameter Name="centerID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="centerID" Type="Int32" />
                    <asp:Parameter Name="logo" Type="Object" />
                    <asp:Parameter Name="centerName" Type="String" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="type" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="address" Type="String" />
                    <asp:Parameter Name="phone" Type="String" />
                    <asp:Parameter Name="email" Type="String" />
                    <asp:Parameter Name="website" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewSeminar" runat="server">
            <asp:FormView ID="FormViewSeminar" runat="server" DataKeyNames="seminarID" 
                DataSourceID="SqlDataSourceSeminarDetail" Width="100%" 
                onitemupdating="FormViewSeminar_ItemUpdating">
                <EditItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                Seminar Title</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator31" runat="server" 
                                    ControlToValidate="titleTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Seminar Date</td>
                            <td>
                                <asp:TextBox ID="seminarDateTextBox" runat="server" 
                                    Text='<%# Bind("seminarDate", "{0:d}") %>' /><asp:CalendarExtender ID="CalendarExtender2"
                                        runat="server" TargetControlID="seminarDateTextBox"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator32" runat="server" 
                                    ControlToValidate="seminarDateTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                From Time</td>
                            <td>
                                <asp:TextBox ID="fromTimeTextBox" runat="server" 
                                    Text='<%# Bind("fromTime") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator33" runat="server" 
                                    ControlToValidate="fromTimeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                To Time</td>
                            <td>
                                <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator34" runat="server" 
                                    ControlToValidate="toTimeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Place</td>
                            <td>
                                <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator35" runat="server" 
                                    ControlToValidate="placeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Presenter</td>
                            <td>
                                <asp:TextBox ID="presenterTextBox" runat="server" 
                                    Text='<%# Bind("presenter") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator36" runat="server" 
                                    ControlToValidate="presenterTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Description</td>
                            <td>
                                <asp:TextBox ID="descriptionTextBox" runat="server" 
                                    Text='<%# Bind("description") %>' TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator37" runat="server" 
                                    ControlToValidate="descriptionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="postedDateTextBox" runat="server" 
                                    Text='<%# Bind("postedDate") %>' Visible="False" />
                                <asp:Label ID="seminarIDLabel1" runat="server" Text='<%# Eval("seminarID") %>' 
                                    Visible="False" />
                            </td>
                            <td>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    seminarID:
                    <asp:TextBox ID="seminarIDTextBox" runat="server" 
                        Text='<%# Bind("seminarID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    seminarDate:
                    <asp:TextBox ID="seminarDateTextBox" runat="server" 
                        Text='<%# Bind("seminarDate") %>' />
                    <br />
                    fromTime:
                    <asp:TextBox ID="fromTimeTextBox" runat="server" 
                        Text='<%# Bind("fromTime") %>' />
                    <br />
                    toTime:
                    <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    presenter:
                    <asp:TextBox ID="presenterTextBox" runat="server" 
                        Text='<%# Bind("presenter") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;&nbsp;<br />
                    <table style="width:100%; height: 281px;">
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Seminar Title</td>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Seminar Date</td>
                            <td>
                                <asp:Label ID="seminarDateLabel" runat="server" 
                                    Text='<%# Bind("seminarDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Time</td>
                            <td>
                                <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Bind("fromTime") %>' />
                                &nbsp;to
                                <asp:Label ID="toTimeLabel" runat="server" Text='<%# Bind("toTime") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Place</td>
                            <td>
                                <asp:Label ID="placeLabel" runat="server" Text='<%# Bind("place") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Presenter</td>
                            <td>
                                <asp:Label ID="presenterLabel" runat="server" Text='<%# Bind("presenter") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Description</td>
                            <td align="justify" valign="top">
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Bind("description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" Visible='<%#IsMemberSem(Eval("seminarID")) %>' />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsMemberAdminSem(Eval("seminarID")) %>' OnClientClick="javascript:return confirm('Are you Sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/Seminar.aspx">Go 
            to Seminar</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceSeminarDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [Seminar] WHERE [seminarID] = @seminarID" 
                InsertCommand="INSERT INTO [Seminar] ([seminarID], [title], [seminarDate], [fromTime], [toTime], [place], [presenter], [description], [postedDate]) VALUES (@seminarID, @title, @seminarDate, @fromTime, @toTime, @place, @presenter, @description, @postedDate)" 
                SelectCommand="SELECT [seminarID], [title], [seminarDate], [fromTime], [toTime], [place], [presenter], [description], [postedDate] FROM [Seminar] WHERE ([seminarID] = @seminarID)" 
                
                UpdateCommand="UPDATE [Seminar] SET [title] = @title, [seminarDate] = @seminarDate, [fromTime] = @fromTime, [toTime] = @toTime, [place] = @place, [presenter] = @presenter, [description] = @description WHERE [seminarID] = @seminarID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="seminarID" QueryStringField="seminarid" 
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="seminarID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:SessionParameter Name="seminarDate" SessionField="Date" />
                    <asp:Parameter Name="fromTime" Type="String" />
                    <asp:Parameter Name="toTime" Type="String" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="presenter" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="seminarID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="seminarID" Type="Int32" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter DbType="Date" Name="seminarDate" />
                    <asp:Parameter Name="fromTime" Type="String" />
                    <asp:Parameter Name="toTime" Type="String" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="presenter" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewExhibition" runat="server">
            <asp:FormView ID="FormViewExhitbition" runat="server" DataKeyNames="ewID" 
                DataSourceID="SqlDataSourceExhitbitionDetail" Width="100%" 
                onitemupdating="FormViewExhitbition_ItemUpdating">
                <EditItemTemplate>
                    <table style="width: 100%; height: 255px;">
                        <tr>
                            <td>
                                Title</td>
                            <td>
                                <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator38" runat="server" 
                                    ControlToValidate="titleTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Start Date</td>
                            <td>
                                <asp:TextBox ID="startDateTextBox" runat="server" 
                                    Text='<%# Bind("startDate", "{0:d}") %>' />
                                <asp:CalendarExtender ID="CalendarExtender3"
                                        runat="server" TargetControlID="startDateTextBox"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator39" runat="server" 
                                    ControlToValidate="startDateTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                End Date</td>
                            <td>
                                <asp:TextBox ID="endDateTextBox" runat="server" 
                                    Text='<%# Bind("endDate", "{0:d}") %>' /><asp:CalendarExtender ID="CalendarExtender4"
                                        runat="server" TargetControlID="endDateTextBox"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator40" runat="server" 
                                    ControlToValidate="endDateTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                From Time</td>
                            <td>
                                <asp:TextBox ID="fromTimeTextBox" runat="server" 
                                    Text='<%# Bind("fromTime") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator41" runat="server" 
                                    ControlToValidate="fromTimeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                To Time</td>
                            <td>
                                <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator42" runat="server" 
                                    ControlToValidate="toTimeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Place</td>
                            <td>
                                <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator43" runat="server" 
                                    ControlToValidate="placeTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                Description</td>
                            <td>
                                <asp:TextBox ID="descriptionTextBox" runat="server" 
                                    Text='<%# Bind("description") %>' TextMode="MultiLine" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator44" runat="server" 
                                    ControlToValidate="descriptionTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:TextBox ID="postedDateTextBox" runat="server" 
                                    Text='<%# Bind("postedDate") %>' Visible="False" />
                                <asp:Label ID="ewIDLabel1" runat="server" Text='<%# Eval("ewID") %>' 
                                    Visible="False" />
                            </td>
                            <td>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    ewID:
                    <asp:TextBox ID="ewIDTextBox" runat="server" Text='<%# Bind("ewID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    startDate:
                    <asp:TextBox ID="startDateTextBox" runat="server" 
                        Text='<%# Bind("startDate") %>' />
                    <br />
                    endDate:
                    <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
                    <br />
                    fromTime:
                    <asp:TextBox ID="fromTimeTextBox" runat="server" 
                        Text='<%# Bind("fromTime") %>' />
                    <br />
                    toTime:
                    <asp:TextBox ID="toTimeTextBox" runat="server" Text='<%# Bind("toTime") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width:100%; height: 281px;">
                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td align="right">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Title</td>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Text='<%# Bind("title") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Start Date</td>
                            <td>
                                <asp:Label ID="startDateLabel" runat="server" 
                                    Text='<%# Bind("startDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                End Date</td>
                            <td>
                                <asp:Label ID="endDateLabel" runat="server" 
                                    Text='<%# Bind("endDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Time</td>
                            <td>
                                <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Bind("fromTime") %>' />
                                &nbsp;to
                                <asp:Label ID="toTimeLabel" runat="server" Text='<%# Bind("toTime") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                Place</td>
                            <td>
                                <asp:Label ID="placeLabel" runat="server" Text='<%# Bind("place") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3" valign="top">
                                Description</td>
                            <td align="justify" valign="top">
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Bind("description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td class="style3">
                                &nbsp;</td>
                            <td align="right">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" Visible='<%#IsMemberEx(Eval("ewID")) %>' />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsMemberAdminEx(Eval("ewID")) %>' OnClientClick="javascript:return confirm('Are you Sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/Exhibition.aspx">Go 
            to Exhibition</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceExhitbitionDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [ExhibitionWS] WHERE [ewID] = @ewID" 
                InsertCommand="INSERT INTO [ExhibitionWS] ([ewID], [title], [startDate], [endDate], [fromTime], [toTime], [place], [description], [postedDate]) VALUES (@ewID, @title, @startDate, @endDate, @fromTime, @toTime, @place, @description, @postedDate)" 
                SelectCommand="SELECT [ewID], [title], [startDate], [endDate], [fromTime], [toTime], [place], [description], [postedDate] FROM [ExhibitionWS] WHERE ([ewID] = @ewID)" 
                
                UpdateCommand="UPDATE [ExhibitionWS] SET [title] = @title, [startDate] = @startDate, [endDate] = @endDate, [fromTime] = @fromTime, [toTime] = @toTime, [place] = @place, [description] = @description WHERE [ewID] = @ewID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="ewID" QueryStringField="ewid" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="ewID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:SessionParameter Name="startDate" SessionField="sDate" />
                    <asp:SessionParameter Name="endDate" SessionField="eDate" />
                    <asp:Parameter Name="fromTime" Type="String" />
                    <asp:Parameter Name="toTime" Type="String" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter Name="ewID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="ewID" Type="Int32" />
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter DbType="Date" Name="startDate" />
                    <asp:Parameter DbType="Date" Name="endDate" />
                    <asp:Parameter Name="fromTime" Type="String" />
                    <asp:Parameter Name="toTime" Type="String" />
                    <asp:Parameter Name="place" Type="String" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewNews" runat="server">
            <asp:FormView ID="FormViewNews" runat="server" DataKeyNames="newsID" 
                DataSourceID="SqlDataSourceNewsDetail" Width="100%">
                <EditItemTemplate>
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    newsID:
                    <asp:Label ID="newsIDLabel1" runat="server" Text='<%# Eval("newsID") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                        CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                    <br />
                    description:
                    <asp:TextBox ID="descriptionTextBox" runat="server" 
                        Text='<%# Bind("description") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
                    <br />
                    newsID:
                    <asp:TextBox ID="newsIDTextBox" runat="server" Text='<%# Bind("newsID") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td align="right">
                                <asp:Label ID="postedDateLabel" runat="server" 
                                    Text='<%# Bind("postedDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="titleLabel" runat="server" Font-Bold="True" Font-Size="Large"
                                    Text='<%# Bind("title") %>' /><br /><br />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Image ID="Image7" runat="server" Height="248px" 
                                    ImageUrl='<%# "Handler.ashx?nid="+Eval("newsID") %>' Width="388px" /><br /><br />
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: left">
                                <asp:Label ID="descriptionLabel" runat="server" 
                                    Text='<%# Bind("description") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" Visible='<%#IsAdminLogin() %>' OnClientClick="javascript:return confirm('Are you sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton6" runat="server" PostBackUrl="~/News.aspx">Go to 
            News</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceNewsDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [News] WHERE [newsID] = @newsID" 
                InsertCommand="INSERT INTO [News] ([title], [photo], [description], [postedDate], [newsID]) VALUES (@title, @photo, @description, @postedDate, @newsID)" 
                SelectCommand="SELECT [title], [photo], [description], [postedDate], [newsID] FROM [News] WHERE ([newsID] = @newsID)" 
                
                UpdateCommand="UPDATE [News] SET [title] = @title, [photo] = @photo, [description] = @description, [postedDate] = @postedDate WHERE [newsID] = @newsID" 
                
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="newsID" QueryStringField="newsid" 
                        Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="newsID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="photo" Type="Object" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                    <asp:Parameter Name="newsID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="title" Type="String" />
                    <asp:Parameter Name="photo" Type="Object" />
                    <asp:Parameter Name="description" Type="String" />
                    <asp:Parameter DbType="Date" Name="postedDate" />
                    <asp:Parameter Name="newsID" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewMyAlert" runat="server">
            <asp:FormView ID="FormViewMyAlert" runat="server" DataKeyNames="alertID" 
                DataSourceID="SqlDataSourceMyAlertDetail" Width="100%" 
                onitemupdating="FormViewMyAlert_ItemUpdating">
                <EditItemTemplate>
                    <table style="width:100%;">
                        <tr>
                            <td>
                                Category</td>
                            <td>
                                <asp:DropDownList ID="ddlCategory" runat="server" DataSourceID="SqlDataSource1" 
                                    DataTextField="saleCategoryName" DataValueField="saleCategoryID" 
                                    AutoPostBack="True">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [saleCategoryName], [saleCategoryID] FROM [SaleCategory]">
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Brand</td>
                            <td>
                                <asp:DropDownList ID="ddlBrand" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="brandName" DataValueField="brandID">
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT [brandName], [brandID] FROM [Brand] WHERE ([saleCategoryID] = @saleCategoryID)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="ddlCategory" Name="saleCategoryID" 
                                            PropertyName="SelectedValue" Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Model</td>
                            <td>
                                <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator45" runat="server" 
                                    ControlToValidate="modelTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Maximum Price</td>
                            <td>
                                <asp:TextBox ID="maxpriceTextBox" runat="server" 
                                    Text='<%# Bind("maxprice") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator46" runat="server" 
                                    ControlToValidate="maxpriceTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Minimum Price</td>
                            <td>
                                <asp:TextBox ID="minpriceTextBox" runat="server" 
                                    Text='<%# Bind("minprice") %>' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator47" runat="server" 
                                    ControlToValidate="minpriceTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Expire Date</td>
                            <td>
                                <asp:TextBox ID="expireDateTextBox" runat="server" 
                                    Text='<%# Bind("expireDate", "{0:d}") %>' />
                                <asp:CalendarExtender ID="CalendarExtender5" runat="server" 
                                    TargetControlID="expireDateTextBox" Format="dd-MMM-yy"></asp:CalendarExtender>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator48" runat="server" 
                                    ControlToValidate="expireDateTextBox" ErrorMessage="*"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="alertIDLabel1" runat="server" Text='<%# Eval("alertID") %>' 
                                    Visible="False" />
                            </td>
                            <td>
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                    CommandName="Update" Text="Update" />
                                &nbsp;
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                    CommandName="Cancel" Text="Cancel" />
                            </td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    alertID:
                    <asp:TextBox ID="alertIDTextBox" runat="server" Text='<%# Bind("alertID") %>' />
                    <br />
                    saleCategoryName:
                    <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                        Text='<%# Bind("saleCategoryName") %>' />
                    <br />
                    brandName:
                    <asp:TextBox ID="brandNameTextBox" runat="server" 
                        Text='<%# Bind("brandName") %>' />
                    <br />
                    model:
                    <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                    <br />
                    maxprice:
                    <asp:TextBox ID="maxpriceTextBox" runat="server" 
                        Text='<%# Bind("maxprice") %>' />
                    <br />
                    minprice:
                    <asp:TextBox ID="minpriceTextBox" runat="server" 
                        Text='<%# Bind("minprice") %>' />
                    <br />
                    expireDate:
                    <asp:TextBox ID="expireDateTextBox" runat="server" 
                        Text='<%# Bind("expireDate") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                        CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                        CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    <table style="width:100%; height: 221px;">
                        <tr>
                            <td>
                                Category</td>
                            <td>
                                <asp:Label ID="saleCategoryNameLabel" runat="server" 
                                    Text='<%# Bind("saleCategoryName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Brand</td>
                            <td>
                                <asp:Label ID="brandNameLabel" runat="server" Text='<%# Bind("brandName") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Model</td>
                            <td>
                                <asp:Label ID="modelLabel" runat="server" Text='<%# Bind("model") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Maximum Price</td>
                            <td>
                                <asp:Label ID="maxpriceLabel" runat="server" Text='<%# Bind("maxprice") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Minimum Price</td>
                            <td>
                                <asp:Label ID="minpriceLabel" runat="server" Text='<%# Bind("minprice") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Expire Date</td>
                            <td style="margin-left: 40px">
                                <asp:Label ID="expireDateLabel" runat="server" 
                                    Text='<%# Bind("expireDate", "{0:d}") %>' />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;</td>
                            <td align="right" style="margin-left: 40px">
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
                                    CommandName="Edit" Text="Edit" />
                                &nbsp;
                                <asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
                                    CommandName="Delete" Text="Delete" OnClientClick="javascript:return confirm('Are you sure to Delete ?');" />
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <asp:LinkButton ID="LinkButton7" runat="server" PostBackUrl="~/MyAlert.aspx">Go 
            to My Alert</asp:LinkButton>
            <asp:SqlDataSource ID="SqlDataSourceMyAlertDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                DeleteCommand="DELETE FROM [Alert] WHERE [alertID] = @alertID" 
                InsertCommand="INSERT INTO [Alert] ([alertID], [memberID], [brandID], [model], [maxprice], [minprice], [expireDate]) VALUES (@alertID, @memberID, @brandID, @model, @maxprice, @minprice, @expireDate)" 
                SelectCommand="SELECT Alert.alertID, SaleCategory.saleCategoryName,Brand.brandName, Alert.model, Alert.maxprice, Alert.minprice, Alert.expireDate FROM Brand INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID INNER JOIN Alert ON Brand.brandID = Alert.brandID WHERE (Alert.alertID = @alertid)" 
                
                
                UpdateCommand="UPDATE [Alert] SET [brandID] = @brandID, [model] = @model, [maxprice] = @maxprice, [minprice] = @minprice, [expireDate] = @expireDate WHERE [alertID] = @alertID" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                <SelectParameters>
                    <asp:QueryStringParameter Name="alertid" QueryStringField="alertid" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="alertID" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:SessionParameter Name="brandID" SessionField="brandID" Type="Int32" />
                    <asp:Parameter Name="memberID" Type="Int32" />
                    <asp:Parameter Name="maxprice" Type="Decimal" />
                    <asp:Parameter Name="minprice" Type="Decimal" />
                    <asp:SessionParameter Name="expireDate" SessionField="expDate" />
                    <asp:Parameter Name="alertID" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="alertID" Type="Int32" />
                    <asp:Parameter Name="memberID" Type="Int32" />
                    <asp:Parameter Name="brandID" Type="Int32" />
                    <asp:Parameter Name="model" Type="String" />
                    <asp:Parameter Name="maxprice" Type="Decimal" />
                    <asp:Parameter Name="minprice" Type="Decimal" />
                    <asp:Parameter DbType="Date" Name="expireDate" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
    </asp:MultiView>
</asp:Content>

