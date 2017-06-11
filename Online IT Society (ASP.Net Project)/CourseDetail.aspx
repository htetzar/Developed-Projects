<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="CourseDetail.aspx.cs" Inherits="CourseDetail" Title="Course Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="CourseDS" Height="50px" Width="100%" GridLines="None" 
        DataKeyNames="courseID" BorderStyle="None" Font-Bold="False" 
        CellPadding="4" CellSpacing="4">
        <FieldHeaderStyle Font-Bold="True" />
        <Fields>
            <asp:BoundField DataField="courseTitle" HeaderText="Course Title" 
                SortExpression="courseTitle" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="courseOutline" HeaderText="Course Outline" 
                SortExpression="courseOutline" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="time" HeaderText="Time" SortExpression="time" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="days" HeaderText="Days" SortExpression="days" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="duration" HeaderText="Duration" 
                SortExpression="duration" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:BoundField DataField="startDate" HeaderText="Start Date" 
                SortExpression="startDate" DataFormatString="{0:d}" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            <asp:TemplateField HeaderText="Fee" SortExpression="fee">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fee") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fee") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("fee") %>'></asp:Label> Ks.
                </ItemTemplate>
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:TemplateField>
        </Fields>
        <HeaderStyle Font-Bold="False" />
    </asp:DetailsView>
    <asp:LinkButton ID="lbtnEnroll" runat="server" onclick="lbtnEnroll_Click">Enroll 
    Course</asp:LinkButton>    
    <br />
    <br /> 
    <asp:Label
        ID="lblMsg" runat="server"></asp:Label>
    <asp:SqlDataSource ID="CourseDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        
        
        SelectCommand="SELECT [courseTitle], [courseOutline], [time], [days], [duration], [startDate], [fee], [courseID], [trainerID] FROM [Course] WHERE ([courseID] = @courseID)" 
        DeleteCommand="DELETE FROM [Course] WHERE [courseID] = @courseID" 
        InsertCommand="INSERT INTO [Course] ([courseTitle], [courseOutline], [time], [days], [duration], [startDate], [fee], [courseID], [trainerID]) VALUES (@courseTitle, @courseOutline, @time, @days, @duration, @startDate, @fee, @courseID, @trainerID)" 
        
        UpdateCommand="UPDATE [Course] SET [courseTitle] = @courseTitle, [courseOutline] = @courseOutline, [time] = @time, [days] = @days, [duration] = @duration, [startDate] = @startDate, [fee] = @fee, [trainerID] = @trainerID WHERE [courseID] = @courseID" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
        <SelectParameters>
            <asp:QueryStringParameter Name="courseID" QueryStringField="cid" Type="Int32" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="courseID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="courseTitle" Type="String" />
            <asp:Parameter Name="courseOutline" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="days" Type="String" />
            <asp:Parameter Name="duration" Type="String" />
            <asp:Parameter Type="DateTime" Name="startDate" />
            <asp:Parameter Name="fee" Type="String" />
            <asp:Parameter Name="trainerID" Type="Int32" />
            <asp:Parameter Name="courseID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="courseTitle" Type="String" />
            <asp:Parameter Name="courseOutline" Type="String" />
            <asp:Parameter Name="time" Type="String" />
            <asp:Parameter Name="days" Type="String" />
            <asp:Parameter Name="duration" Type="String" />
            <asp:Parameter Type="DateTime" Name="startDate" />
            <asp:Parameter Name="fee" Type="String" />
            <asp:Parameter Name="courseID" Type="Int32" />
            <asp:Parameter Name="trainerID" Type="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>
            <br />
            <br />
    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" Text="<< Back"></asp:LinkButton>
</asp:Content>

