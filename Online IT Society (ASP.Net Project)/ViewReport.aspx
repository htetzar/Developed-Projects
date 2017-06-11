<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="ViewReport.aspx.cs" Inherits="ViewReport" Title="View Report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <center></center>
    Choose Report type : 
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
        onselectedindexchanged="DropDownList1_SelectedIndexChanged">
        <asp:ListItem Value="2">Sold Item List</asp:ListItem>
        <asp:ListItem Value="3">Member List</asp:ListItem>
        <asp:ListItem Value="4">Trainer List</asp:ListItem>
        <asp:ListItem Value="5">Request Trainer List</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    </center>
    <asp:MultiView ID="MultiView1" runat="server">
       <asp:View ID="View1" runat="server">   
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
               DataKeyNames="ItemID" DataSourceID="view1DB" Width="791px" 
                AllowPaging="True" PageSize="5">
               <Columns>
                   <asp:BoundField DataField="ItemID" HeaderText="Item ID" ReadOnly="True" 
                       SortExpression="ItemID" />
                   <asp:BoundField DataField="Member" HeaderText="Member" 
                       SortExpression="Member" />
                   <asp:BoundField DataField="SaleCategory" HeaderText="Sale Category" 
                       SortExpression="SaleCategory" />
                   <asp:BoundField DataField="Brand" HeaderText="Brand" SortExpression="Brand" />
                   <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                   <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
                       <ItemStyle HorizontalAlign="Right" />
                   </asp:BoundField>
                   <asp:BoundField DataField="PurchaseDate" HeaderText="Purchased Date" 
                       SortExpression="PurchaseDate" DataFormatString="{0:d}" />
                   <asp:TemplateField HeaderText="Photo" SortExpression="Photo">
                       <EditItemTemplate>
                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Photo") %>'></asp:TextBox>
                       </EditItemTemplate>
                       <ItemTemplate>
                           <asp:Image ID="Image1" runat="server" Width ="120px" Height ="120px" ImageUrl ='<%# "Handler.ashx?iid="+Eval("itemID")%>'/>
                           <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("Photo") %>'></asp:Label>--%>
                       </ItemTemplate>
                   </asp:TemplateField>
               </Columns>
               <PagerStyle HorizontalAlign="Center" />
           </asp:GridView>
           <asp:SqlDataSource ID="view1DB" runat="server" 
               ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
               
               SelectCommand="SELECT Item.itemID AS ItemID, Member.username AS Member, SaleCategory.saleCategoryName AS SaleCategory, Brand.brandName AS Brand, Item.model AS Model, Item.title AS Title, Item.price AS Price, Item.photo AS Photo, Item.purchaseDate AS PurchaseDate, Item.status FROM Brand INNER JOIN Item ON Brand.brandID = Item.brandID INNER JOIN Member ON Item.memberID = Member.memberID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (Item.status = @status)" 
               ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
               <SelectParameters>
                   <asp:Parameter DefaultValue="True" Name="status" />
               </SelectParameters>
           </asp:SqlDataSource>
           <br />
            <br />  
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="memberID" DataSourceID="view2DB" 
                Height="123px" Width="649px" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="memberID" HeaderText="Member ID" ReadOnly="True" 
                        SortExpression="memberID" />
                    <asp:BoundField DataField="username" HeaderText="User Name" 
                        SortExpression="username" />
                    <asp:BoundField DataField="gender" HeaderText="Gender" 
                        SortExpression="gender" />
                    <asp:BoundField DataField="dob" HeaderText="Date of Birth" 
                        SortExpression="dob" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="view2DB" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                
                SelectCommand="SELECT [memberID], [username], [gender], [dob], [email] FROM [Member]" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:View>       
        <asp:View ID="View3" runat="server">
            <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="trainerID" DataSourceID="view3DB" 
                Width="601px" AllowPaging="True" PageSize="5">
                <Columns>
                    <asp:BoundField DataField="trainerID" HeaderText="Trainer ID" ReadOnly="True" 
                        SortExpression="trainerID" />
                    <asp:BoundField DataField="trainerName" HeaderText="Trainer Name" 
                        SortExpression="trainerName" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                    <asp:BoundField DataField="address" HeaderText="Address" 
                        SortExpression="address" />
                    <asp:TemplateField HeaderText="Logo" SortExpression="logo">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("logo") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                         <asp:Image ID="Image2" runat="server" Width ="120px" Height ="120px" ImageUrl ='<%# "Handler.ashx?tid="+Eval("trainerID")%>'/>
                           <%-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("logo") %>'></asp:Label>--%>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <PagerStyle HorizontalAlign="Center" />
            </asp:GridView>
            <asp:SqlDataSource ID="view3DB" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                
                SelectCommand="SELECT [trainerID], [trainerName], [description], [email], [phone], [address], [logo] FROM [Trainer]" 
                ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
            </asp:SqlDataSource>
            <br />
            <br />
        </asp:View>        
        <asp:View ID="View4" runat="server">
                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="requestID" DataSourceID="view4DB" 
                    Height="119px" Width="631px" AllowPaging="True" PageSize="5">
                    <Columns>
                        <asp:BoundField DataField="requestID" HeaderText="Request ID" ReadOnly="True" 
                            SortExpression="requestID" />
                        <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                        <asp:BoundField DataField="enquiry" HeaderText="Enquiry" 
                            SortExpression="enquiry" />
                        <asp:HyperLinkField DataNavigateUrlFields="RequestID" 
                            DataNavigateUrlFormatString="~/CreateTrainer.aspx?val={0}" 
                            Text="Create Trainer" />
                    </Columns>
                    <PagerStyle HorizontalAlign="Center" />
                </asp:GridView>
                <asp:SqlDataSource ID="view4DB" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                    DeleteCommand="DELETE FROM [RequestTrainer] WHERE [requestID] = @requestID" 
                    InsertCommand="INSERT INTO [RequestTrainer] ([requestID], [trainerName], [email], [enquiry]) VALUES (@requestID, @trainerName, @email, @enquiry)" 
                    SelectCommand="SELECT * FROM [RequestTrainer]" 
                    
                    UpdateCommand="UPDATE [RequestTrainer] SET [trainerName] = @trainerName, [email] = @email, [enquiry] = @enquiry WHERE [requestID] = @requestID" 
                    ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString2.ProviderName %>">
                    <DeleteParameters>
                        <asp:Parameter Name="requestID" Type="Int32" />
                    </DeleteParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="trainerName" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="enquiry" Type="String" />
                        <asp:Parameter Name="requestID" Type="Int32" />
                    </UpdateParameters>
                    <InsertParameters>
                        <asp:Parameter Name="requestID" Type="Int32" />
                        <asp:Parameter Name="trainerName" Type="String" />
                        <asp:Parameter Name="email" Type="String" />
                        <asp:Parameter Name="enquiry" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
                <br />
                <br />
        </asp:View>
    </asp:MultiView>
</asp:Content>

