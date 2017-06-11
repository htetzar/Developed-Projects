<%@ Page Language="C#" MasterPageFile="~/TrainerMasterPage.master" AutoEventWireup="true" CodeFile="CheckEnrollment.aspx.cs" Inherits="CheckEnrollment" Title="Check Enroolment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ListView ID="ListView1" runat="server" 
        DataSourceID="SqlDataSourceEnrollments" 
        onitemcommand="ListView1_ItemCommand">
        <ItemTemplate>
            <li style=""><b>Enroll Name : </b>
                <asp:Label ID="enrollNameLabel" runat="server" 
                    Text='<%# Eval("enrollName") %>' />
                <br />
                <b>Gender : </b>
                <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                <br />
                <b>NRC : </b>
                <asp:Label ID="nrcLabel" runat="server" Text='<%# Eval("nrc") %>' />
                <br />
                <b>Father Name : </b>
                <asp:Label ID="fatherNameLabel" runat="server" 
                    Text='<%# Eval("fatherName") %>' />
                <br />
                <b>Qualification : </b>
                <asp:Label ID="qualificationLabel" runat="server" 
                    Text='<%# Eval("qualification") %>' />
                <br />
                <b>Contact Address : </b>
                <asp:Label ID="contactAddressLabel" runat="server" 
                    Text='<%# Eval("contactAddress") %>' />
                <br />
                <b>Phone : </b>
                <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                <br />
                <b>Email : </b>
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                <b>Enroll Date : </b>
                <asp:Label ID="enrolldateLabel" runat="server" 
                    Text='<%# Eval("enrolldate", "{0:d}") %>' />
                <br />
                <b>Course Title : </b>
                <asp:Label ID="courseTitleLabel" runat="server" 
                    Text='<%# Eval("courseTitle") %>' />
                <br />
                <asp:LinkButton ID="lbtnDelete1" CommandArgument='<%#Eval("enrollID") %>' runat="server" Text="Delete" OnClientClick="javascript:return confirm('Are you sure to Delete?');"></asp:LinkButton>
                <br />
                <hr /><br />
            </li>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <li style=""><b>Enroll Name : </b>
                <asp:Label ID="enrollNameLabel" runat="server" 
                    Text='<%# Eval("enrollName") %>' />
                <br />
                <b>Gender : </b>
                <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                <br />
                <b>NRC : </b>
                <asp:Label ID="nrcLabel" runat="server" Text='<%# Eval("nrc") %>' />
                <br />
                <b>Father Name : </b>
                <asp:Label ID="fatherNameLabel" runat="server" 
                    Text='<%# Eval("fatherName") %>' />
                <br />
                <b>Qualification : </b>
                <asp:Label ID="qualificationLabel" runat="server" 
                    Text='<%# Eval("qualification") %>' />
                <br />
                <b>Contact Address : </b>
                <asp:Label ID="contactAddressLabel" runat="server" 
                    Text='<%# Eval("contactAddress") %>' />
                <br />
                <b>Phone : </b>
                <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                <br />
                <b>Email : </b>
                <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                <br />
                <b>Enroll Date : </b>
                <asp:Label ID="enrolldateLabel" runat="server" 
                    Text='<%# Eval("enrolldate", "{0:d}")%>' />
                <br />
                <b>Course Title : </b>
                <asp:Label ID="courseTitleLabel" runat="server" 
                    Text='<%# Eval("courseTitle") %>' />
                <br />
                <asp:LinkButton ID="lbtnDelete2" CommandArgument='<%#Eval("enrollID") %>' runat="server" Text="Delete" OnClientClick="javascript:return confirm('Are you sure to Delete?');"></asp:LinkButton>
                <br />
                <hr /><br />
            </li>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            There is no Enrolled Student.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">enrollName:
                <asp:TextBox ID="enrollNameTextBox" runat="server" 
                    Text='<%# Bind("enrollName") %>' />
                <br />
                gender:
                <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                nrc:
                <asp:TextBox ID="nrcTextBox" runat="server" Text='<%# Bind("nrc") %>' />
                <br />
                fatherName:
                <asp:TextBox ID="fatherNameTextBox" runat="server" 
                    Text='<%# Bind("fatherName") %>' />
                <br />
                qualification:
                <asp:TextBox ID="qualificationTextBox" runat="server" 
                    Text='<%# Bind("qualification") %>' />
                <br />
                contactAddress:
                <asp:TextBox ID="contactAddressTextBox" runat="server" 
                    Text='<%# Bind("contactAddress") %>' />
                <br />
                phone:
                <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                enrolldate:
                <asp:TextBox ID="enrolldateTextBox" runat="server" 
                    Text='<%# Bind("enrolldate") %>' />
                <br />
                courseTitle:
                <asp:TextBox ID="courseTitleTextBox" runat="server" 
                    Text='<%# Bind("courseTitle") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
            </li>
        </InsertItemTemplate>
        <LayoutTemplate>
            <ul ID="itemPlaceholderContainer" runat="server" style="">
                <li ID="itemPlaceholder" runat="server" />
                </ul>
                <div style="">
                    <asp:DataPager ID="DataPager1" runat="server">
                        <Fields>
                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            <asp:NumericPagerField />
                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        </Fields>
                    </asp:DataPager>
                </div>
            </LayoutTemplate>
            <EditItemTemplate>
                <li style="">enrollName:
                    <asp:TextBox ID="enrollNameTextBox" runat="server" 
                        Text='<%# Bind("enrollName") %>' />
                    <br />
                    gender:
                    <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                    <br />
                    nrc:
                    <asp:TextBox ID="nrcTextBox" runat="server" Text='<%# Bind("nrc") %>' />
                    <br />
                    fatherName:
                    <asp:TextBox ID="fatherNameTextBox" runat="server" 
                        Text='<%# Bind("fatherName") %>' />
                    <br />
                    qualification:
                    <asp:TextBox ID="qualificationTextBox" runat="server" 
                        Text='<%# Bind("qualification") %>' />
                    <br />
                    contactAddress:
                    <asp:TextBox ID="contactAddressTextBox" runat="server" 
                        Text='<%# Bind("contactAddress") %>' />
                    <br />
                    phone:
                    <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
                    <br />
                    email:
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                    <br />
                    enrolldate:
                    <asp:TextBox ID="enrolldateTextBox" runat="server" 
                        Text='<%# Bind("enrolldate") %>' />
                    <br />
                    courseTitle:
                    <asp:TextBox ID="courseTitleTextBox" runat="server" 
                        Text='<%# Bind("courseTitle") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </li>
            </EditItemTemplate>
            <ItemSeparatorTemplate>
                <br />
            </ItemSeparatorTemplate>
            <SelectedItemTemplate>
                <li style="">enrollName:
                    <asp:Label ID="enrollNameLabel" runat="server" 
                        Text='<%# Eval("enrollName") %>' />
                    <br />
                    gender:
                    <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
                    <br />
                    nrc:
                    <asp:Label ID="nrcLabel" runat="server" Text='<%# Eval("nrc") %>' />
                    <br />
                    fatherName:
                    <asp:Label ID="fatherNameLabel" runat="server" 
                        Text='<%# Eval("fatherName") %>' />
                    <br />
                    qualification:
                    <asp:Label ID="qualificationLabel" runat="server" 
                        Text='<%# Eval("qualification") %>' />
                    <br />
                    contactAddress:
                    <asp:Label ID="contactAddressLabel" runat="server" 
                        Text='<%# Eval("contactAddress") %>' />
                    <br />
                    phone:
                    <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
                    <br />
                    email:
                    <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
                    <br />
                    enrolldate:
                    <asp:Label ID="enrolldateLabel" runat="server" 
                        Text='<%# Eval("enrolldate") %>' />
                    <br />
                    courseTitle:
                    <asp:Label ID="courseTitleLabel" runat="server" 
                        Text='<%# Eval("courseTitle") %>' />
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        <asp:SqlDataSource ID="SqlDataSourceEnrollments" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
            
            
            SelectCommand="SELECT Enroll.enrollName, Enroll.gender, Enroll.nrc, Enroll.fatherName, Enroll.qualification, Enroll.contactAddress, Enroll.phone, Enroll.email, Enroll.enrolldate, Course.courseTitle, Enroll.enrollID FROM Enroll INNER JOIN Course ON Enroll.courseID = Course.courseID INNER JOIN Trainer ON Course.trainerID = Trainer.trainerID WHERE (Trainer.trainerID = @tid)" 
            DeleteCommand="Delete from Enroll WHERE enrollID=@eid">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="" Name="tid" SessionField="trainerID" />
            </SelectParameters>
            <DeleteParameters>
                <asp:SessionParameter Name="eid" SessionField="eid" />
            </DeleteParameters>
        </asp:SqlDataSource>
    <br />
    <br />
</asp:Content>

