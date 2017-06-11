<%@ Page Language="C#" MasterPageFile="~/TrainerMasterPage.master" AutoEventWireup="true" CodeFile="EditCourse.aspx.cs" Inherits="EditCourse" Title="Edit Course" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="courseID" 
    DataSourceID="DetailDS" DefaultMode="Edit" ondatabound="FormView1_DataBound" 
    onitemcommand="FormView1_ItemCommand" 
    onitemupdated="FormView1_ItemUpdated" Height="326px" 
    Width="402px">
    <EditItemTemplate>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <table style="width:131%; height: 244px;">
            <tr>
                <td valign="top">
                    Course Title</td>
                <td valign="top">
                    <asp:TextBox ID="courseTitleTextBox" runat="server" 
                        Text='<%# Bind("courseTitle") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="courseTitleTextBox" 
                        ErrorMessage="Course title is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Course Outline</td>
                <td valign="top">
                    <asp:TextBox ID="courseOutlineTextBox" runat="server" 
                        Text='<%# Bind("courseOutline") %>' TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="courseOutlineTextBox" 
                        ErrorMessage="Course outline is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Time</td>
                <td valign="top">
                    <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="timeTextBox" ErrorMessage="Time is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Days</td>
                <td style="margin-left: 40px" valign="top">
                    <asp:TextBox ID="daysTextBox" runat="server" Text='<%# Bind("days") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="daysTextBox" ErrorMessage="Day id required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Duration</td>
                <td style="margin-left: 80px" valign="top">
                    <asp:TextBox ID="durationTextBox" runat="server" 
                        Text='<%# Bind("duration") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                        ControlToValidate="durationTextBox" ErrorMessage="Duration is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Startdate</td>
                <td style="margin-left: 120px" valign="top">
                    <asp:TextBox ID="startdateTextBox" runat="server" 
                        Text='<%# Bind("startdate", "{0:d}") %>' />
                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="startdateTextBox">
                    </asp:CalendarExtender>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                        ControlToValidate="startdateTextBox" ErrorMessage="Start date is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td valign="top">
                    Fee</td>
                <td style="margin-left: 120px" valign="top">
                    <asp:TextBox ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="feeTextBox" ErrorMessage="Fees is required"></asp:RequiredFieldValidator>
                </td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
            CommandName="Update" Text="Update" />
        &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
            CommandName="Cancel" Text="Cancel" />
    </EditItemTemplate>
    <InsertItemTemplate>
        courseID:
        <asp:TextBox ID="courseIDTextBox" runat="server" 
            Text='<%# Bind("courseID") %>' />
        <br />
        trainerID:
        <asp:TextBox ID="trainerIDTextBox" runat="server" 
            Text='<%# Bind("trainerID") %>' />
        <br />
        courseTitle:
        <asp:TextBox ID="courseTitleTextBox" runat="server" 
            Text='<%# Bind("courseTitle") %>' />
        <br />
        courseOutline:
        <asp:TextBox ID="courseOutlineTextBox" runat="server" 
            Text='<%# Bind("courseOutline") %>' />
        <br />
        time:
        <asp:TextBox ID="timeTextBox" runat="server" Text='<%# Bind("time") %>' />
        <br />
        days:
        <asp:TextBox ID="daysTextBox" runat="server" Text='<%# Bind("days") %>' />
        <br />
        duration:
        <asp:TextBox ID="durationTextBox" runat="server" 
            Text='<%# Bind("duration") %>' />
        <br />
        startdate:
        <asp:TextBox ID="startdateTextBox" runat="server" 
            Text='<%# Bind("startdate") %>' />
        <br />
        fee:
        <asp:TextBox ID="feeTextBox" runat="server" Text='<%# Bind("fee") %>' />
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
            CommandName="Insert" Text="Insert" />
        &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
            CausesValidation="False" CommandName="Cancel" Text="Cancel" />
    </InsertItemTemplate>
    <ItemTemplate>
        <br />
        courseTitle:
        <asp:Label ID="courseTitleLabel" runat="server" 
            Text='<%# Bind("courseTitle") %>' />
        <br />
        courseOutline:
        <asp:Label ID="courseOutlineLabel" runat="server" 
            Text='<%# Bind("courseOutline") %>' />
        <br />
        time:
        <asp:Label ID="timeLabel" runat="server" Text='<%# Bind("time") %>' />
        <br />
        days:
        <asp:Label ID="daysLabel" runat="server" Text='<%# Bind("days") %>' />
        <br />
        duration:
        <asp:Label ID="durationLabel" runat="server" Text='<%# Bind("duration") %>' />
        <br />
        startdate:
        <asp:Label ID="startdateLabel" runat="server" Text='<%# Bind("startdate") %>' />
        <br />
        fee:
        <asp:Label ID="feeLabel" runat="server" Text='<%# Bind("fee") %>' />
        <br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" 
            CommandName="Edit" Text="Edit" />
        &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" 
            CommandName="Delete" Text="Delete" />
        &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" 
            CommandName="New" Text="New" />
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="DetailDS" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
    DeleteCommand="DELETE FROM [Course] WHERE [courseID] = @courseID" 
    InsertCommand="INSERT INTO [Course] ([courseID], [trainerID], [courseTitle], [courseOutline], [time], [days], [duration], [startdate], [fee]) VALUES (@courseID, @trainerID, @courseTitle, @courseOutline, @time, @days, @duration, @startdate, @fee)" 
    SelectCommand="SELECT * FROM [Course] WHERE ([courseID] = @courseID)" 
    UpdateCommand="UPDATE [Course] SET [courseTitle] = @courseTitle, [courseOutline] = @courseOutline, [time] = @time, [days] = @days, [duration] = @duration, [startdate] = @startdate, [fee] = @fee WHERE [courseID] = @courseID">
    <SelectParameters>
        <asp:QueryStringParameter Name="courseID" QueryStringField="val" Type="Int32" />
    </SelectParameters>
    <DeleteParameters>
        <asp:Parameter Name="courseID" Type="Int32" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:QueryStringParameter Name="courseID" QueryStringField="val" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="courseID" Type="Int32" />
        <asp:Parameter Name="trainerID" Type="Int32" />
        <asp:Parameter Name="courseTitle" Type="String" />
        <asp:Parameter Name="courseOutline" Type="String" />
        <asp:Parameter Name="time" Type="String" />
        <asp:Parameter Name="days" Type="String" />
        <asp:Parameter Name="duration" Type="String" />
        <asp:Parameter DbType="Date" Name="startdate" />
        <asp:Parameter Name="fee" Type="Decimal" />
    </InsertParameters>
</asp:SqlDataSource>
</asp:Content>

