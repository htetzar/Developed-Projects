<%@ Page Language="C#" MasterPageFile="~/TrainerMasterPage.master" AutoEventWireup="true" CodeFile="AddNewCourse.aspx.cs" Inherits="AddNewCourse" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 267px;
        }
        .style2
        {
            width: 267px;
            height: 38px;
        }
        .style3
        {
            height: 38px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td align="center" colspan="2">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label1" runat="server" Text="Adding New Course" 
                    Font-Size="X-Large"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label2" runat="server" Text="Course Title"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtCourseTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtCourseTitle" ErrorMessage="Required"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" Text="Outline"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtOutline" runat="server" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label4" runat="server" Text="Time"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtTime" runat="server" Width="50px"></asp:TextBox>
                &nbsp;&nbsp;
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Selected="True">AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                &nbsp;<asp:Label ID="Label9" runat="server" Text="to"></asp:Label>
                &nbsp;&nbsp;<asp:TextBox ID="txtTime1" runat="server" Width="50px"></asp:TextBox>
                &nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                    <asp:ListItem Selected="True">AM</asp:ListItem>
                    <asp:ListItem>PM</asp:ListItem>
                </asp:DropDownList>
                &nbsp;
                <br />
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtTime" ErrorMessage="Required"></asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtTime1" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                (eg:9:00AM to 11:00AM)</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label5" runat="server" Text="Day"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDay" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtDay" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                (Monday-Friday)</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label6" runat="server" Text="Duration"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtDuration" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtDuration" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                (2 months)</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label7" runat="server" Text="Start Date"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtSdate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                    ControlToValidate="txtSdate" ErrorMessage="Required."></asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtSdate" ErrorMessage="Must be today or later" 
                    onservervalidate="CustomValidator1_ServerValidate">Must be today or later</asp:CustomValidator>
                <asp:CalendarExtender ID="CalendarExtender1" runat="server" Format="dd-MMM-yy" 
                    TargetControlID="txtSdate">
                </asp:CalendarExtender>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                <asp:Label ID="Label8" runat="server" Text="Fees"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtFees" runat="server"></asp:TextBox>
                &nbsp;&nbsp; Ks&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                    ControlToValidate="txtFees" ErrorMessage="Required."></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtFees" ErrorMessage="Fees must be number" 
                    Type="Double" Operator="GreaterThan" ValueToCompare="0"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style1">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btmInsert" runat="server" onclick="btmInsert_Click" 
                    Text="Insert" Width="67px" />
            </td>
            <td>
                <asp:Button ID="btmCancel" runat="server" onclick="btmCancel_Click" 
                    Text="Cancel" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                <asp:SqlDataSource ID="AddnewcourseDS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                    DeleteCommand="DELETE FROM [Course] WHERE [courseID] = @courseID" 
                    InsertCommand="INSERT INTO [Course] ([courseID], [trainerID], [courseTitle], [courseOutline], [time], [days], [duration], [startdate], [fee]) VALUES (@courseID, @trainerID, @courseTitle, @courseOutline, @time, @days, @duration, @startdate, @fee)" 
                    SelectCommand="SELECT max(courseid) FROM [Course]" 
                    
                    UpdateCommand="UPDATE [Course] SET [trainerID] = @trainerID, [courseTitle] = @courseTitle, [courseOutline] = @courseOutline, [time] = @time, [days] = @days, [duration] = @duration, [startdate] = @startdate, [fee] = @fee WHERE [courseID] = @courseID">
                    <DeleteParameters>
                        <asp:Parameter Name="courseID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="trainerID" Type="Int32" />
                        <asp:Parameter Name="courseTitle" Type="String" />
                        <asp:Parameter Name="courseOutline" Type="String" />
                        <asp:Parameter Name="time" Type="String" />
                        <asp:Parameter Name="days" Type="String" />
                        <asp:Parameter Name="duration" Type="String" />
                        <asp:Parameter DbType="Date" Name="startdate" />
                        <asp:Parameter DbType="Date" Name="fee" />
                        <asp:Parameter Name="courseID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:SessionParameter Name="courseID" SessionField="id" Type="Int32" />
                        <asp:SessionParameter Name="trainerID" SessionField="trainerId" Type="Int32" />
                        <asp:ControlParameter ControlID="txtCourseTitle" Name="courseTitle" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtOutline" Name="courseOutline" 
                            PropertyName="Text" Type="String" />
                        <asp:SessionParameter Name="time" SessionField="mytime" Type="String" />
                        <asp:ControlParameter ControlID="txtDay" Name="days" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtDuration" Name="duration" 
                            PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtSdate" DbType="DateTime" Name="startdate" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtFees" Name="fee" PropertyName="Text" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

