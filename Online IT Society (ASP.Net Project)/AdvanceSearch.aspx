<%@ Page Language="C#" Debug="true" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="AdvanceSearch.aspx.cs" Inherits="AdvanceSearch" Title="Advance Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="ViewFS" runat="server">
            <asp:ListView ID="LiseViewItem" runat="server" DataKeyNames="itemID" 
                DataSourceID="SqlDataSourceItem" GroupItemCount="3" 
                onitemcommand="LiseViewItem_ItemCommand"><EmptyItemTemplate><td runat="server" /></EmptyItemTemplate><ItemTemplate><td runat="server" style=""><asp:ImageButton ID="ImageButton1" Width="150px" Height="150px" runat="server" ImageUrl='<%#"Handler.ashx?iid="+ Eval("itemID") %>' CommandArgument='<%#Eval("itemID") %>' /><br /><asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br /><asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Eval("saleCategoryName") %>' /><br /><asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' /><br /><asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' /><br /><br /></td></ItemTemplate><AlternatingItemTemplate><td runat="server" style=""><asp:ImageButton ID="ImageButton2" runat="server" Width="150px" Height="150px" ImageUrl='<%#"Handler.ashx?iid="+ Eval("itemID") %>' CommandArgument='<%#Eval("itemID") %>' /><br /><asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br /><asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Eval("saleCategoryName") %>' /><br /><asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' /><br /><asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' /><br /><br /></td></AlternatingItemTemplate><EmptyDataTemplate><table runat="server" style=""><tr><td>Searched Result is not found !</td></tr></table></EmptyDataTemplate><InsertItemTemplate><td runat="server" style="">itemID: <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />saleCategoryName: <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                                Text='<%# Bind("saleCategoryName") %>' /><br />brandName: <asp:TextBox ID="brandNameTextBox" runat="server" 
                                Text='<%# Bind("brandName") %>' /><br />model: <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" /><br /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" /><br /></td></InsertItemTemplate><LayoutTemplate><table runat="server"><tr runat="server"><td runat="server"><table ID="groupPlaceholderContainer" runat="server" border="0" style=""><tr ID="groupPlaceholder" runat="server"></tr></table></td></tr><tr runat="server"><td runat="server" style=""><asp:DataPager ID="DataPager1" runat="server" PageSize="12"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></td></tr></table></LayoutTemplate><EditItemTemplate><td runat="server" style="">itemID: <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />saleCategoryName: <asp:TextBox ID="saleCategoryNameTextBox" runat="server" 
                                Text='<%# Bind("saleCategoryName") %>' /><br />brandName: <asp:TextBox ID="brandNameTextBox" runat="server" 
                                Text='<%# Bind("brandName") %>' /><br />model: <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" /><br /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" /><br /></td></EditItemTemplate><GroupTemplate><tr ID="itemPlaceholderContainer" runat="server"><td ID="itemPlaceholder" runat="server"></td></tr></GroupTemplate><SelectedItemTemplate><td runat="server" style="">itemID: <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' /><br />title: <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br />saleCategoryName: <asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Eval("saleCategoryName") %>' /><br />brandName: <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' /><br />model: <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' /><br /></td></SelectedItemTemplate></asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceItem" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT Item.itemID, Item.title, SaleCategory.saleCategoryName, Brand.brandName, Item.model FROM Brand INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID INNER JOIN Item ON Brand.brandID = Item.brandID WHERE (Item.brandID = @brandid) AND (Item.price &gt;= @minprice) AND (Item.price &lt;= @maxprice) AND (Item.region = @region)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="brandid" QueryStringField="brand" 
                            DefaultValue="" />
                        <asp:QueryStringParameter DefaultValue="" Name="minprice" 
                            QueryStringField="minprice" />
                        <asp:QueryStringParameter DefaultValue="" Name="maxprice" 
                            QueryStringField="maxprice" />
                        <asp:QueryStringParameter DefaultValue="" Name="region" 
                            QueryStringField="region" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewJV" runat="server">
            <asp:ListView ID="ListViewJV" runat="server" DataKeyNames="jobID" 
                DataSourceID="SqlDataSourceJV" onitemcommand="ListViewJV_ItemCommand"><ItemTemplate><span style=""><asp:Image ID="Image1" Width="120px" Height="120px" ImageUrl='<%# "Handler.ashx?jid="+ Eval("jobID") %>' runat="server" /><br /><asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("jobID") %>'></asp:LinkButton><br /><asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /><br /><asp:Label ID="postedDateLabel" runat="server" 
                        Text='<%# Eval("postedDate") %>' /><br /><hr /><br /></span></ItemTemplate><AlternatingItemTemplate><span style=""><asp:Image ID="Image2" Width="120px" Height="120px" ImageUrl='<%# "Handler.ashx?jid="+ Eval("jobID") %>' runat="server" /><br /><asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%# Eval("jobID") %>'></asp:LinkButton><br /><asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /><br /><asp:Label ID="postedDateLabel" runat="server" 
                        Text='<%# Eval("postedDate") %>' /><br /><hr /><br /></span></AlternatingItemTemplate><EmptyDataTemplate><span>Searched Result is not found !</span></EmptyDataTemplate><InsertItemTemplate><span style="">jobID: <asp:TextBox ID="jobIDTextBox" runat="server" Text='<%# Bind("jobID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />category: <asp:TextBox ID="categoryTextBox" runat="server" 
                        Text='<%# Bind("category") %>' /><br />postedDate: <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" /><br /><br /></span></InsertItemTemplate><LayoutTemplate><div ID="itemPlaceholderContainer" runat="server" style=""><span ID="itemPlaceholder" runat="server" /></div><div style=""><asp:DataPager ID="DataPager1" runat="server"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></div></LayoutTemplate><EditItemTemplate><span style="">jobID: <asp:Label ID="jobIDLabel1" runat="server" Text='<%# Eval("jobID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />category: <asp:TextBox ID="categoryTextBox" runat="server" 
                        Text='<%# Bind("category") %>' /><br />postedDate: <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" /><br /><br /></span></EditItemTemplate><SelectedItemTemplate><span style="">jobID: <asp:Label ID="jobIDLabel" runat="server" Text='<%# Eval("jobID") %>' /><br />title: <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br />category: <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' /><br />postedDate: <asp:Label ID="postedDateLabel" runat="server" 
                        Text='<%# Eval("postedDate") %>' /><br /><br /></span></SelectedItemTemplate></asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceJV" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT [jobID], [title], [category], [postedDate] FROM [Job] WHERE (([category] = @category) AND ([salary] &gt;= @salary) AND ([salary] &lt;= @salary2))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="category" QueryStringField="jobcat" 
                        Type="String" />
                    <asp:QueryStringParameter Name="salary" QueryStringField="minsal" 
                        Type="Decimal" />
                    <asp:QueryStringParameter Name="salary2" QueryStringField="maxsal" 
                        Type="Decimal" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewCV" runat="server">
            <asp:ListView ID="ListViewCV" runat="server" DataKeyNames="cvID" 
                DataSourceID="SqlDataSourceCV" onitemcommand="ListViewCV_ItemCommand"><ItemTemplate><span style=""><asp:Image ID="Image7" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?cvid="+ Eval("cvID") %>' /><br /><asp:LinkButton ID="LinkButton7" runat="server" CommandArgument='<%# Eval("cvID") %>' Text='<%# Eval("title") %>'></asp:LinkButton><br /><asp:Label ID="qualificationLabel" runat="server" 
                        Text='<%# Eval("qualification") %>' /><br /><asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>' /><br /><hr /><br /></span></ItemTemplate><AlternatingItemTemplate><span style=""><asp:Image ID="Image8" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?cvid="+ Eval("cvID") %>' /><br /><asp:LinkButton ID="LinkButton8" runat="server" CommandArgument='<%# Eval("cvID") %>' Text='<%# Eval("title") %>'></asp:LinkButton><br /><asp:Label ID="qualificationLabel" runat="server" 
                        Text='<%# Eval("qualification") %>' /><br /><asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>' /><br /><hr /><br />
                </AlternatingItemTemplate><EmptyDataTemplate><span>Searched Result is not found !</span></EmptyDataTemplate><InsertItemTemplate><span style="">cvID: <asp:TextBox ID="cvIDTextBox" runat="server" Text='<%# Bind("cvID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />qualification: <asp:TextBox ID="qualificationTextBox" runat="server" 
                        Text='<%# Bind("qualification") %>' /><br />otherQual: <asp:TextBox ID="otherQualTextBox" runat="server" 
                        Text='<%# Bind("otherQual") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" /><br /><br /></span></InsertItemTemplate><LayoutTemplate><div ID="itemPlaceholderContainer" runat="server" style=""><span ID="itemPlaceholder" runat="server" /></div><div style=""><asp:DataPager ID="DataPager1" runat="server"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></div></LayoutTemplate><EditItemTemplate><span style="">cvID: <asp:Label ID="cvIDLabel1" runat="server" Text='<%# Eval("cvID") %>' /><br />title: <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' /><br />qualification: <asp:TextBox ID="qualificationTextBox" runat="server" 
                        Text='<%# Bind("qualification") %>' /><br />otherQual: <asp:TextBox ID="otherQualTextBox" runat="server" 
                        Text='<%# Bind("otherQual") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" /><br /><br /></span></EditItemTemplate><SelectedItemTemplate><span style="">cvID: <asp:Label ID="cvIDLabel" runat="server" Text='<%# Eval("cvID") %>' /><br />title: <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' /><br />qualification: <asp:Label ID="qualificationLabel" runat="server" 
                        Text='<%# Eval("qualification") %>' /><br />otherQual: <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>' /><br /><br /></span></SelectedItemTemplate></asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceCV" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT cvID, title, qualification, otherQual FROM CV WHERE (qualification LIKE '%' + @qualification + '%') AND (DATEDIFF(year, dob, GETDATE()) &gt;= @dob) AND (DATEDIFF(year, dob, GETDATE()) &lt;= @dob2)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="qualification" QueryStringField="quali" />
                    <asp:QueryStringParameter Name="dob" QueryStringField="minage" />
                    <asp:QueryStringParameter Name="dob2" QueryStringField="maxage" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewTr" runat="server">
            <asp:ListView ID="ListViewTraining" runat="server" DataKeyNames="trainerID" 
                DataSourceID="SqlDataSourceTraining" 
                onitemcommand="ListViewTraining_ItemCommand"><ItemTemplate><span style=""><asp:Image ID="Image3" runat="server" Height="120px" Width="120px" ImageUrl='<%#"Handler.ashx?tid="+ Eval("trainerID") %>' /><br /><asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("trainerName") %>' CommandArgument='<%#Eval("trainerID") %>'></asp:LinkButton><br /><asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><hr /><br /></span></ItemTemplate><AlternatingItemTemplate><span style=""><asp:Image ID="Image4" runat="server" Height="120px" Width="120px" ImageUrl='<%#"Handler.ashx?tid="+ Eval("trainerID") %>' /><br /><asp:LinkButton ID="LinkButton4" runat="server" Text='<%# Eval("trainerName") %>' CommandArgument='<%#Eval("trainerID") %>'></asp:LinkButton><br /><asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><hr /><br /></span></AlternatingItemTemplate><EmptyDataTemplate><span>Searched Result is not found !</span></EmptyDataTemplate><InsertItemTemplate><span style="">trainerID: <asp:TextBox ID="trainerIDTextBox" runat="server" 
                        Text='<%# Bind("trainerID") %>' /><br />trainerName: <asp:TextBox ID="trainerNameTextBox" runat="server" 
                        Text='<%# Bind("trainerName") %>' /><br />address: <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" /><br /><br /></span></InsertItemTemplate><LayoutTemplate><div ID="itemPlaceholderContainer" runat="server" style=""><span ID="itemPlaceholder" runat="server" /></div><div style=""><asp:DataPager ID="DataPager1" runat="server"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></div></LayoutTemplate><EditItemTemplate><span style="">trainerID: <asp:Label ID="trainerIDLabel1" runat="server" 
                        Text='<%# Eval("trainerID") %>' /><br />trainerName: <asp:TextBox ID="trainerNameTextBox" runat="server" 
                        Text='<%# Bind("trainerName") %>' /><br />address: <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" /><br /><br /></span></EditItemTemplate><SelectedItemTemplate><span style="">trainerID: <asp:Label ID="trainerIDLabel" runat="server" Text='<%# Eval("trainerID") %>' /><br />trainerName: <asp:Label ID="trainerNameLabel" runat="server" 
                        Text='<%# Eval("trainerName") %>' /><br />address: <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><br /></span></SelectedItemTemplate></asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceTraining" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT [trainerID], [trainerName], [address] FROM [Trainer] WHERE ([trainerName] LIKE '%' + @trainerName + '%')">
                <SelectParameters>
                    <asp:QueryStringParameter Name="trainerName" QueryStringField="training" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="ViewSS" runat="server">
            <asp:ListView ID="ListViewSS" runat="server" DataKeyNames="centerID" 
                DataSourceID="SqlDataSourceSS" onitemcommand="ListViewSS_ItemCommand"><ItemTemplate><span style=""><asp:Image ID="Image5" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?cid="+Eval("centerID") %>' /><br /><asp:LinkButton ID="LinkButton5" runat="server" Text='<%# Eval("centerName") %>' CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton><br /><asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><hr /><br /></span></ItemTemplate><AlternatingItemTemplate><span style=""><asp:Image ID="Image6" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?cid="+Eval("centerID") %>' /><br /><asp:LinkButton ID="LinkButton6" runat="server" Text='<%# Eval("centerName") %>' CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton><br /><asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><hr /><br /></span></AlternatingItemTemplate><EmptyDataTemplate><span>Searched Result is not found !</span></EmptyDataTemplate><InsertItemTemplate><span style="">centerID: <asp:TextBox ID="centerIDTextBox" runat="server" 
                        Text='<%# Bind("centerID") %>' /><br />centerName: <asp:TextBox ID="centerNameTextBox" runat="server" 
                        Text='<%# Bind("centerName") %>' /><br />address: <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" /><br /><br /></span></InsertItemTemplate><LayoutTemplate><div ID="itemPlaceholderContainer" runat="server" style=""><span ID="itemPlaceholder" runat="server" /></div><div style=""><asp:DataPager ID="DataPager1" runat="server"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></div></LayoutTemplate><EditItemTemplate><span style="">centerID: <asp:Label ID="centerIDLabel1" runat="server" Text='<%# Eval("centerID") %>' /><br />centerName: <asp:TextBox ID="centerNameTextBox" runat="server" 
                        Text='<%# Bind("centerName") %>' /><br />address: <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" /><br /><br /></span></EditItemTemplate><SelectedItemTemplate><span style="">centerID: <asp:Label ID="centerIDLabel" runat="server" Text='<%# Eval("centerID") %>' /><br />centerName: <asp:Label ID="centerNameLabel" runat="server" 
                        Text='<%# Eval("centerName") %>' /><br />address: <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /><br /><br /></span></SelectedItemTemplate></asp:ListView>
            <asp:SqlDataSource ID="SqlDataSourceSS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT [centerID], [centerName], [address] FROM [SaleandServiceCenter] WHERE (([centerName] LIKE '%' + @centerName + '%') AND ([type] = @type))">
                <SelectParameters>
                    <asp:QueryStringParameter Name="centerName" QueryStringField="center" 
                        Type="String" />
                    <asp:QueryStringParameter Name="type" QueryStringField="centertype" 
                        Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </asp:View>
            <asp:View ID="ViewEbook" runat="server">
                <asp:ListView ID="ListViewEbook" runat="server" DataKeyNames="bookID" 
                    DataSourceID="SqlDataSourceEbook" GroupItemCount="3" 
                    onitemcommand="ListViewEbook_ItemCommand"><EmptyItemTemplate><td runat="server" /></EmptyItemTemplate><ItemTemplate><td runat="server" style=""><asp:LinkButton ID="LinkButton9" runat="server" Text='<%# Eval("bookTitle") %>' CommandArgument='<%# Eval("bookID") %>'></asp:LinkButton><br /><asp:Image ID="Image9" runat="server" Width="150px" Height="150px" ImageUrl='<%#"Handler.ashx?bid="+Eval("bookID") %>' /><br /><br /></td></ItemTemplate><AlternatingItemTemplate><td runat="server" style=""><asp:LinkButton ID="LinkButton10" runat="server" Text='<%# Eval("bookTitle") %>' CommandArgument='<%# Eval("bookID") %>'></asp:LinkButton><br /><asp:Image ID="Image10" runat="server" Width="150px" Height="150px" ImageUrl='<%#"Handler.ashx?bid="+Eval("bookID") %>' /><br /><br /></td></AlternatingItemTemplate><EmptyDataTemplate><table runat="server" style=""><tr><td>No data was returned.</td></tr></table></EmptyDataTemplate><InsertItemTemplate><td runat="server" style="">bookTitle: <asp:TextBox ID="bookTitleTextBox" runat="server" 
                                    Text='<%# Bind("bookTitle") %>' /><br />bookID: <asp:TextBox ID="bookIDTextBox" runat="server" Text='<%# Bind("bookID") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                    Text="Insert" /><br /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Clear" /><br /></td></InsertItemTemplate><LayoutTemplate><table runat="server"><tr runat="server"><td runat="server"><table ID="groupPlaceholderContainer" runat="server" border="0" style=""><tr ID="groupPlaceholder" runat="server"></tr></table></td></tr><tr runat="server"><td runat="server" style=""><asp:DataPager ID="DataPager1" runat="server" PageSize="12"><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                    ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></td></tr></table></LayoutTemplate><EditItemTemplate><td runat="server" style="">bookTitle: <asp:TextBox ID="bookTitleTextBox" runat="server" 
                                    Text='<%# Bind("bookTitle") %>' /><br />bookID: <asp:Label ID="bookIDLabel1" runat="server" Text='<%# Eval("bookID") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Update" /><br /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Cancel" /><br /></td></EditItemTemplate><GroupTemplate><tr ID="itemPlaceholderContainer" runat="server"><td ID="itemPlaceholder" runat="server"></td></tr></GroupTemplate><SelectedItemTemplate><td runat="server" style="">bookTitle: <asp:Label ID="bookTitleLabel" runat="server" Text='<%# Eval("bookTitle") %>' /><br />bookID: <asp:Label ID="bookIDLabel" runat="server" Text='<%# Eval("bookID") %>' /><br /></td></SelectedItemTemplate></asp:ListView>
                    <asp:SqlDataSource ID="SqlDataSourceEbook" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString7 %>" 
                        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString7.ProviderName %>" 
                        
                    SelectCommand="SELECT [bookTitle], [bookID] FROM [Ebook] WHERE ([bookTitle] LIKE '%' + @bookTitle + '%')">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="bookTitle" QueryStringField="bname" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </asp:View>
        <asp:View ID="ViewSW" runat="server">
            <asp:ListView ID="ListViewSW" runat="server" DataKeyNames="softwareID" 
                DataSourceID="SqlDataSourceSW" GroupItemCount="3" 
                onitemcommand="ListViewSW_ItemCommand">
                <EmptyItemTemplate>
                    <td runat="server" />
                    </EmptyItemTemplate>
                    <ItemTemplate>
                        <td runat="server" style="">
                            
                            <asp:LinkButton ID="LinkButton11" runat="server" Text='<%# Eval("softwareName") %>' CommandArgument='<%# Eval("softwareID") %>'></asp:LinkButton>
                            
                            <br />
                            
                            <asp:Image ID="Image11" runat="server" Width="150px" Height="150px" ImageUrl='<%#"Handler.ashx?swid="+Eval("softwareID") %>' />
                            <br />
                            <br />
                        </td>
                    </ItemTemplate>
                    <AlternatingItemTemplate>
                        <td runat="server" style="">
                            <asp:LinkButton ID="LinkButton12" runat="server" Text='<%# Eval("softwareName") %>' CommandArgument='<%# Eval("softwareID") %>'></asp:LinkButton>
                            
                            <br />
                            
                            <asp:Image ID="Image12" runat="server" Width="150px" Height="150px" ImageUrl='<%#"Handler.ashx?swid="+Eval("softwareID") %>' />
                            <br />
                            <br />
                        </td>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <table runat="server" style="">
                            <tr>
                                <td>
                                    No data was returned.</td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <td runat="server" style="">
                            softwareName:
                            <asp:TextBox ID="softwareNameTextBox" runat="server" 
                                Text='<%# Bind("softwareName") %>' />
                            <br />
                            softwareID:
                            <asp:TextBox ID="softwareIDTextBox" runat="server" 
                                Text='<%# Bind("softwareID") %>' />
                            <br />
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                Text="Insert" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Clear" />
                            <br />
                        </td>
                    </InsertItemTemplate>
                    <LayoutTemplate>
                        <table runat="server">
                            <tr runat="server">
                                <td runat="server">
                                    <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                        <tr ID="groupPlaceholder" runat="server">
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr runat="server">
                                <td runat="server" style="">
                                    <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                                        <Fields>
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                            <asp:NumericPagerField />
                                            <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                                ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                        </Fields>
                                    </asp:DataPager>
                                </td>
                            </tr>
                        </table>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <td runat="server" style="">
                            softwareName:
                            <asp:TextBox ID="softwareNameTextBox" runat="server" 
                                Text='<%# Bind("softwareName") %>' />
                            <br />
                            softwareID:
                            <asp:Label ID="softwareIDLabel1" runat="server" 
                                Text='<%# Eval("softwareID") %>' />
                            <br />
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                Text="Update" />
                            <br />
                            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                Text="Cancel" />
                            <br />
                        </td>
                    </EditItemTemplate>
                    <GroupTemplate>
                        <tr ID="itemPlaceholderContainer" runat="server">
                            <td ID="itemPlaceholder" runat="server">
                            </td>
                        </tr>
                    </GroupTemplate>
                    <SelectedItemTemplate>
                        <td runat="server" style="">
                            softwareName:
                            <asp:Label ID="softwareNameLabel" runat="server" 
                                Text='<%# Eval("softwareName") %>' />
                            <br />
                            softwareID:
                            <asp:Label ID="softwareIDLabel" runat="server" 
                                Text='<%# Eval("softwareID") %>' />
                            <br />
                        </td>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="SqlDataSourceSW" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString7 %>" 
                    ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString7.ProviderName %>" 
                    
                    SelectCommand="SELECT [softwareName], [softwareID] FROM [Software] WHERE ([softwareName] LIKE '%' + @softwareName + '%')">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="softwareName" QueryStringField="swname" 
                            Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </asp:View>
    </asp:MultiView>
</asp:Content>

