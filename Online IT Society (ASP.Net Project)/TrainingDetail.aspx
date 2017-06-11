<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="TrainingDetail.aspx.cs" Inherits="TrainingDetail" Title="Training Detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource1" Height="51px" Width="85%" GridLines="None" 
        BorderStyle="None" Font-Bold="False" CellPadding="4" CellSpacing="4">
        <FieldHeaderStyle Font-Bold="True" />
        <EmptyDataRowStyle Font-Bold="True" />
        <Fields>
            <asp:TemplateField SortExpression="logo">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server"  ImageUrl='<%#"Handler.ashx?tid="+Eval("trainerID") %>' Width="150px"/>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="trainerName" HeaderText="Trainer Name" 
                SortExpression="trainerName" >
                
                <HeaderStyle VerticalAlign="Top" />
                
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            
            <asp:BoundField DataField="description" HeaderText="Description" 
                SortExpression="description" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            
            <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            
            <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            
            <asp:BoundField DataField="address" HeaderText="Address" 
                SortExpression="address" >
                <HeaderStyle VerticalAlign="Top" />
                <ItemStyle VerticalAlign="Top" />
            </asp:BoundField>
            
        </Fields>
    </asp:DetailsView>
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="CourseDS" GridLines="None" DataKeyNames="courseID">
        <Columns>
            <asp:HyperLinkField DataNavigateUrlFields="courseID,trainerID" 
                DataNavigateUrlFormatString="~/CourseDetail.aspx?cid={0}&amp;tid={1}" 
                DataTextField="courseTitle" HeaderText="Courses" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="CourseDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        
        
        SelectCommand="SELECT [trainerID], [courseTitle], [courseID] FROM [Course] WHERE ([trainerID] = @trainerID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="trainerID" QueryStringField="tid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
        SelectCommand="SELECT [description], [trainerName], [email], [phone], [address], [logo] ,trainerID FROM [Trainer] WHERE ([trainerID] = @trainerID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="trainerID" QueryStringField="tid" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
    <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/Trainings.aspx">Go 
    to Trainings</asp:LinkButton>
</asp:Content>

