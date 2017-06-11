<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="homeItem" Title="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">
    .style1
    {
        width: 188px;
    }
</style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <table style="width: 100%;">
        <tr>
            <td class="style1">
    <asp:Label ID="Label1" runat="server" SkinID="header" Text="Recently posted:"></asp:Label>
            </td>
            <td>
    <asp:DropDownList ID="ddlpost" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlpost_SelectedIndexChanged">
        
        <asp:ListItem>Available Items</asp:ListItem>
        <asp:ListItem>News</asp:ListItem>
        <asp:ListItem>Job Vacancies</asp:ListItem>
        <asp:ListItem>Sale and Service Centers</asp:ListItem>
        <asp:ListItem>Seminar</asp:ListItem>
        <asp:ListItem>Exhibition/Workshop</asp:ListItem>
    </asp:DropDownList>
            </td>
          
        </tr>
      
    </table>
 
    
        <asp:ListView ID="lvNews" runat="server" DataSourceID="homeNewsDS" 
        DataKeyNames="newsID" onitemcommand="lvNews_ItemCommand" Visible="False">
        <AlternatingItemTemplate>
        <tr><td>
            <asp:LinkButton ID="LinkButton1" runat="server" 
                CommandArgument='<%# Eval("newsID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                </td></tr>
            <tr>
                <td align="right">
                    <span>
                    <asp:Label ID="postedDateLabel" runat="server" Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <span>
                    <asp:Image ID="Image2" runat="server" 
                        ImageUrl='<%# "Handler.ashx?nid="+Eval("newsID") %>' Width="150px" />
                    </span>
                </td>
            </tr>
                           <tr>
                    <td align="justify">
                        <span>
                        <asp:Label ID="descriptionLabel" runat="server" 
                            Text='<%# desclength(Eval("description")) %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
        </AlternatingItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                &nbsp;<table style="width: 100%;">
                    <tr>
                        <td>
                            <tr>
                                <td>
                                    <span ID="itemPlaceholder" runat="server"></span>
                                </td>
                            </tr>
                        </td>
                    </tr>
                </table>
                </span>
 

            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">newsID:
            <asp:TextBox ID="newsIDTextBox" runat="server" Text='<%# Bind("newsID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="">newsID:
            <asp:Label ID="newsIDLabel" runat="server" Text='<%# Eval("newsID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" 
                Text='<%# Eval("description") %>' />
            <br />
            photo:
            <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="">newsID:
            <asp:Label ID="newsIDLabel1" runat="server" Text='<%# Eval("newsID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
            <br />
            photo:
            <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
        <tr><td>
            <asp:LinkButton ID="LinkButton1" runat="server" 
                CommandArgument='<%# Eval("newsID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                </td></tr>
            <tr>
                <td align="right">
                    <span>
                    <asp:Label ID="postedDateLabel" runat="server" Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <span>
                    <asp:Image ID="Image2" runat="server" 
                        ImageUrl='<%# "Handler.ashx?nid="+Eval("newsID") %>' Width="150px" />
                    </span>
                </td>
            </tr>
                           <tr>
                    <td align="justify">
                        <span>
                        <asp:Label ID="descriptionLabel" runat="server" 
                            Text='<%# desclength(Eval("description")) %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
        </ItemTemplate>
</asp:ListView>
<asp:SqlDataSource ID="homeNewsDS" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
    
        
        
        SelectCommand="SELECT newsID, title, description, photo, postedDate FROM News WHERE (CONVERT (varchar(10), postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) AS Expr1 FROM News AS News_1)) ORDER BY newsID DESC"></asp:SqlDataSource>
    <table style="width: 100%;">
        <tr><td align="center">
            <asp:DataPager ID="newsDP" runat="server" PagedControlID="lvNews" PageSize="2">
                <Fields>
                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                        ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                    <asp:NumericPagerField />
                    <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                        ShowNextPageButton="false" ShowPreviousPageButton="False" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        
                </Fields>
            </asp:DataPager>
        </td></tr>
        <tr><td align="right">
            <asp:HyperLink ID="hlNews" runat="server" NavigateUrl="~/News.aspx">More News</asp:HyperLink></td></tr>
    </table>
    <div align="center">
        <asp:ListView ID="lvItem" runat="server" DataKeyNames="itemID" 
        DataSourceID="homeItemDS" GroupItemCount="3" 
        onitemcommand="lvItem_ItemCommand" Visible="False">
        <AlternatingItemTemplate>
            <td id="Td1" runat="server" style="" align="center">
                
                <table style="width: 100%;" >
                    <tr>
                        <td>
                            <asp:Image ID="Image2" runat="server" 
                                ImageUrl='<%# "Handler.ashx?iid="+Eval("itemID") %>' Width="150px" Height="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("itemID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Eval("saleCategoryName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
        </AlternatingItemTemplate>
        <LayoutTemplate>
            <table id="Table1" runat="server" >
                <tr id="Tr1" runat="server">
                    <td id="Td2" runat="server">
                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="" >
                            <tr ID="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr id="Tr2" runat="server">
                    <td id="Td3" runat="server" style="">
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <EmptyItemTemplate>
            <td id="Td4" runat="server" />
            </EmptyItemTemplate>
            <InsertItemTemplate>
                <td id="Td5" runat="server" style="">
                    itemID:
                    <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                    <br />
                </td>
            </InsertItemTemplate>
            <SelectedItemTemplate>
                <td id="Td6" runat="server" style="">
                    itemID:
                    <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    photo:
                    <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                    <br />
                    saleCategoryName:
                    <asp:Label ID="saleCategoryNameLabel" runat="server" 
                        Text='<%# Eval("saleCategoryName") %>' />
                    <br />
                    brandName:
                    <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>' />
                    <br />
                    model:
                    <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                    <br />
                </td>
            </SelectedItemTemplate>
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <EmptyDataTemplate>
                <table id="Table2" runat="server" style="">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EditItemTemplate>
                <td id="Td7" runat="server" style="">
                    itemID:
                    <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <br />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                    <br />
                </td>
            </EditItemTemplate>
            <ItemTemplate>
            <td id="Td8" runat="server" style="" align="center">
                
                <table style="width: 100%;" >
                    <tr>
                        <td>
                            <asp:Image ID="Image2" runat="server" 
                                ImageUrl='<%# "Handler.ashx?iid="+Eval("itemID") %>' Width="150px" Height="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:LinkButton ID="LinkButton1" runat="server" 
                                CommandArgument='<%# Eval("itemID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="saleCategoryNameLabel" runat="server" 
                                Text='<%# Eval("saleCategoryName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="brandNameLabel" runat="server" Text='<%# Eval("brandName") %>'></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>'></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>
            </ItemTemplate>
        </asp:ListView>
        </div>
        <asp:SqlDataSource ID="homeItemDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
            
            
                SelectCommand="SELECT Item.itemID, Item.title, Item.photo, SaleCategory.saleCategoryName, Brand.brandName, Item.model FROM Brand INNER JOIN Item ON Brand.brandID = Item.brandID INNER JOIN SaleCategory ON Brand.saleCategoryID = SaleCategory.saleCategoryID WHERE (CONVERT (varchar(10), Item.postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) AS Expr1 FROM Item AS Item_1)) ORDER BY Item.itemID DESC"></asp:SqlDataSource>
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:DataPager ID="itemDP" runat="server" PagedControlID="lvItem" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="false" ShowPreviousPageButton="False" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                    </Fields>
                </asp:DataPager>
            </td>
        </tr>
                <tr><td align="right">
            <asp:HyperLink ID="hlItem" runat="server" NavigateUrl="~/ForSale.aspx">More Items</asp:HyperLink></td></tr>

    </table>
    
        <asp:ListView ID="lvJob" runat="server" DataKeyNames="memberID,jobID" 
        DataSourceID="homeJobDS" onitemcommand="lvJob_ItemCommand" Visible="False">
        <AlternatingItemTemplate>
        
            <tr><td align="right"><span>
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                </span></td></tr>
            <tr>
                <td>
                    <span>
                    <asp:Image ID="Image2" runat="server" 
                        ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="150px" />
                    </span>
                </td>
            </tr>
            <tr>
                <td><span>
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("jobID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                </span></td>
            </tr>
            <tr>
                <td>
                    <span>
                    <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>
                    <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                    &nbsp;(<asp:Label 
                                ID="noofpostLabel" runat="server" Text='<%# Eval("noofpost") %>'></asp:Label>
                    )
                    </span>
                </td>
            </tr>
            <%--<tr><td>&nbsp;</td></tr>--%>
            
        </AlternatingItemTemplate>
        <LayoutTemplate>
 <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <span style="">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <span ID="itemPlaceholder" runat="server"></span>
                                    </td>
                                </tr>
                            </table>
                            </span>
                        </td>
                    </tr>
                </table>
                </span>
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
            <br />
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" 
                Text='<%# Bind("category") %>' />
            <br />
            gender:
            <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
            <br />
            noofpost:
            <asp:TextBox ID="noofpostTextBox" runat="server" 
                Text='<%# Bind("noofpost") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            jobID:
            <asp:TextBox ID="jobIDTextBox" runat="server" Text='<%# Bind("jobID") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="">memberID:
            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            username:
            <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' />
            <br />
            category:
            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
            <br />
            gender:
            <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>' />
            <br />
            noofpost:
            <asp:Label ID="noofpostLabel" runat="server" Text='<%# Eval("noofpost") %>' />
            <br />
            logo:
            <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
            <br />
            jobID:
            <asp:Label ID="jobIDLabel" runat="server" Text='<%# Eval("jobID") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="">memberID:
            <asp:Label ID="memberIDLabel1" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            username:
            <asp:TextBox ID="usernameTextBox" runat="server" 
                Text='<%# Bind("username") %>' />
            <br />
            category:
            <asp:TextBox ID="categoryTextBox" runat="server" 
                Text='<%# Bind("category") %>' />
            <br />
            gender:
            <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
            <br />
            noofpost:
            <asp:TextBox ID="noofpostTextBox" runat="server" 
                Text='<%# Bind("noofpost") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            jobID:
            <asp:Label ID="jobIDLabel1" runat="server" Text='<%# Eval("jobID") %>' />
            <br />
            postedDate:
            <asp:TextBox ID="postedDateTextBox" runat="server" 
                Text='<%# Bind("postedDate") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
        
        <tr><td align="right"><span>
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# shortdate(Eval("postedDate")) %>'></asp:Label>
                </span></td></tr>
            <tr>
                <td>
                    <span>
                    <asp:Image ID="Image2" runat="server" 
                        ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="150px" />
                    </span>
                </td>
            </tr>
            <tr>
                <td><span>
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        CommandArgument='<%# Eval("jobID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                </span></td>
            </tr>
            <tr>
                <td>
                    <span>
                    <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                    </span>
                </td>
            </tr>
            <tr>
                <td>
                    <span>
                    <asp:Label ID="genderLabel" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
                    &nbsp;(<asp:Label 
                                ID="noofpostLabel" runat="server" Text='<%# Eval("noofpost") %>'></asp:Label>
                    )
                    </span>
                </td>
            </tr>
            <%--<tr><td>&nbsp;</td></tr>--%>
                    </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="homeJobDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
        
        
                SelectCommand="SELECT Member.memberID, Member.username, Job.category, Job.gender, Job.noofpost, Job.logo, Job.jobID, Job.postedDate, Job.title FROM Job INNER JOIN Member ON Job.memberID = Member.memberID WHERE (CONVERT (varchar(10), Job.postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) AS Expr1 FROM Job AS Job_1)) ORDER BY Job.jobID DESC">
    </asp:SqlDataSource>
    
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:DataPager ID="jobDP" runat="server" PagedControlID="lvJob" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="false" ShowPreviousPageButton="False" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                    </Fields>
                </asp:DataPager>
            </td>
        </tr>
        <tr><td align="right">
            <asp:HyperLink ID="hlJob" runat="server" NavigateUrl="~/JobVacancy.aspx">More 
            Jobs</asp:HyperLink></td></tr>
    </table>
    
        <asp:ListView ID="lvSeminar" runat="server" DataKeyNames="seminarID" 
        DataSourceID="homeSeminarDS" onitemcommand="lvSeminar_ItemCommand" Visible="False">
        <AlternatingItemTemplate>

            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument='<%# Eval("seminarID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="presenterLabel" runat="server" Text='<%# Eval("presenter") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                                 <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# shortdate(Eval("seminarDate")) %>' />

                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label>
                        to             <asp:Label ID="Label2" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>
                        
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>
        </AlternatingItemTemplate>
        <LayoutTemplate>
  <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <span style="">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <span ID="itemPlaceholder" runat="server"></span>
                                    </td>
                                </tr>
                            </table>
                            </span>
                        </td>
                    </tr>
                </table>
                </span>
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">seminarID:
            <asp:TextBox ID="seminarIDTextBox" runat="server" 
                Text='<%# Bind("seminarID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
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
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="">seminarID:
            <asp:Label ID="seminarIDLabel" runat="server" Text='<%# Eval("seminarID") %>' />
            <br />
            memberID:
            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            seminarDate:
            <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# Eval("seminarDate") %>' />
            <br />
            fromTime:
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>' />
            <br />
            toTime:
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>' />
            <br />
            place:
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            presenter:
            <asp:Label ID="presenterLabel" runat="server" Text='<%# Eval("presenter") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" 
                Text='<%# Eval("description") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="">seminarID:
            <asp:Label ID="seminarIDLabel1" runat="server" 
                Text='<%# Eval("seminarID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
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
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument='<%# Eval("seminarID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="presenterLabel" runat="server" Text='<%# Eval("presenter") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                               <tr>
                    <td>
                        <span>
                                 <asp:Label ID="seminarDateLabel" runat="server" 
                Text='<%# shortdate(Eval("seminarDate")) %>' />

                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label>
                        to             <asp:Label ID="Label2" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>
                        
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="homeSeminarDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
        
        
                SelectCommand="SELECT seminarID, memberID, title, seminarDate, fromTime, toTime, place, presenter, description, postedDate FROM Seminar WHERE (CONVERT (varchar(10), postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) FROM Seminar )) ORDER BY seminarDate">
    </asp:SqlDataSource>
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:DataPager ID="semDP" runat="server" PagedControlID="lvSeminar" 
                    PageSize="2">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="false" ShowPreviousPageButton="False" NextPageText="Next" PreviousPageText="Previous" LastPageText="Last" FirstPageText="First" />
                            
                    </Fields>
                </asp:DataPager>
            </td>
        </tr>
        <tr><td align="right">
            <asp:HyperLink ID="hlSem" runat="server" NavigateUrl="~/Seminar.aspx">More 
            Seminars and Workshops</asp:HyperLink></td></tr>
    </table>
    
        <asp:ListView ID="lvExpoWS" runat="server" DataKeyNames="ewID" 
        DataSourceID="homeExpoWSDS" onitemcommand="lvExpoWS_ItemCommand" Visible="False">
        <AlternatingItemTemplate>
            
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" 
                            CommandArgument='<%# Eval("ewID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="startDateLabel" runat="server" Text='<%# shortdate(Eval("startDate")) %>'></asp:Label> 
                        to
                                     <asp:Label ID="Label4" runat="server" Text='<%# shortdate(Eval("endDate")) %>'></asp:Label>

                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label> 
                        to 
                                   <asp:Label ID="Label3" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>

                        </span>
                    </td>
                </tr>
            </table>
        </AlternatingItemTemplate>
        <LayoutTemplate>
  <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <span style="">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <span ID="itemPlaceholder" runat="server"></span>
                                    </td>
                                </tr>
                            </table>
                            </span>
                        </td>
                    </tr>
                </table>
                </span>
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">ewID:
            <asp:TextBox ID="ewIDTextBox" runat="server" Text='<%# Bind("ewID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
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
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="">ewID:
            <asp:Label ID="ewIDLabel" runat="server" Text='<%# Eval("ewID") %>' />
            <br />
            memberID:
            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            startDate:
            <asp:Label ID="startDateLabel" runat="server" Text='<%# Eval("startDate") %>' />
            <br />
            endDate:
            <asp:Label ID="endDateLabel" runat="server" Text='<%# Eval("endDate") %>' />
            <br />
            fromTime:
            <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>' />
            <br />
            toTime:
            <asp:Label ID="toTimeLabel" runat="server" Text='<%# Eval("toTime") %>' />
            <br />
            place:
            <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" 
                Text='<%# Eval("description") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="">ewID:
            <asp:Label ID="ewIDLabel1" runat="server" Text='<%# Eval("ewID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
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
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton2" runat="server" 
                            CommandArgument='<%# Eval("ewID") %>' Text='<%# Eval("title") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="startDateLabel" runat="server" Text='<%# shortdate(Eval("startDate")) %>'></asp:Label> 
                        to
                                     <asp:Label ID="Label4" runat="server" Text='<%# shortdate(Eval("endDate")) %>'></asp:Label>

                        </span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="fromTimeLabel" runat="server" Text='<%# Eval("fromTime") %>'></asp:Label> 
                        to 
                                   <asp:Label ID="Label3" runat="server" Text='<%# Eval("toTime") %>'></asp:Label>

                        </span>
                    </td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="homeExpoWSDS" runat="server" 



        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
                SelectCommand="SELECT * FROM ExhibitionWS WHERE (CONVERT (varchar(10), postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) FROM ExhibitionWS )) ORDER BY ewID desc"></asp:SqlDataSource>
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:DataPager ID="expowsDP" runat="server" PagedControlID="lvExpoWS" 
                    PageSize="2">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="false" ShowPreviousPageButton="False" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                            
                    </Fields>
                </asp:DataPager>
            </td>
        </tr>
        <tr><td align="right">
            <asp:HyperLink ID="hlExpo" runat="server" NavigateUrl="~/Exhibition.aspx">More 
            Exhibitions and Workshops</asp:HyperLink></td></tr>
    </table>

   <asp:ListView ID="lvCenter" runat="server" DataKeyNames="centerID" 
        DataSourceID="homeCenterDS" onitemcommand="lvCenter_ItemCommand" Visible="False">
        <AlternatingItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' Width="150px" />

                    </td>
 
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument='<%# Eval("centerID") %>' Text='<%# Eval("centerName") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>
        </AlternatingItemTemplate>
        <LayoutTemplate>
  <div ID="itemPlaceholderContainer" runat="server" style="">
                <span style="" >
                <table style="width: 100%;">
                    <tr>
                        <td>
                            <span style="">
                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <span ID="itemPlaceholder" runat="server"></span>
                                    </td>
                                </tr>
                            </table>
                            </span>
                        </td>
                    </tr>
                </table>
                </span>
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <InsertItemTemplate>
            <span style="">centerID:
            <asp:TextBox ID="centerIDTextBox" runat="server" 
                Text='<%# Bind("centerID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            centerName:
            <asp:TextBox ID="centerNameTextBox" runat="server" 
                Text='<%# Bind("centerName") %>' />
            <br />
            phone:
            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            type:
            <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
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
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <SelectedItemTemplate>
            <span style="">centerID:
            <asp:Label ID="centerIDLabel" runat="server" Text='<%# Eval("centerID") %>' />
            <br />
            memberID:
            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
            <br />
            title:
            <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
            <br />
            centerName:
            <asp:Label ID="centerNameLabel" runat="server" 
                Text='<%# Eval("centerName") %>' />
            <br />
            phone:
            <asp:Label ID="phoneLabel" runat="server" Text='<%# Eval("phone") %>' />
            <br />
            address:
            <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
            <br />
            type:
            <asp:Label ID="typeLabel" runat="server" Text='<%# Eval("type") %>' />
            <br />
            logo:
            <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
            <br />
            description:
            <asp:Label ID="descriptionLabel" runat="server" 
                Text='<%# Eval("description") %>' />
            <br />
            email:
            <asp:Label ID="emailLabel" runat="server" Text='<%# Eval("email") %>' />
            <br />
            website:
            <asp:Label ID="websiteLabel" runat="server" Text='<%# Eval("website") %>' />
            <br />
            postedDate:
            <asp:Label ID="postedDateLabel" runat="server" 
                Text='<%# Eval("postedDate") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <EditItemTemplate>
            <span style="">centerID:
            <asp:Label ID="centerIDLabel1" runat="server" Text='<%# Eval("centerID") %>' />
            <br />
            memberID:
            <asp:TextBox ID="memberIDTextBox" runat="server" 
                Text='<%# Bind("memberID") %>' />
            <br />
            title:
            <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
            <br />
            centerName:
            <asp:TextBox ID="centerNameTextBox" runat="server" 
                Text='<%# Bind("centerName") %>' />
            <br />
            phone:
            <asp:TextBox ID="phoneTextBox" runat="server" Text='<%# Bind("phone") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            type:
            <asp:TextBox ID="typeTextBox" runat="server" Text='<%# Bind("type") %>' />
            <br />
            logo:
            <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
            <br />
            description:
            <asp:TextBox ID="descriptionTextBox" runat="server" 
                Text='<%# Bind("description") %>' />
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
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <ItemTemplate>
            <table style="width: 100%;">
                <tr>
                    <td>
                <asp:Image ID="Image2" runat="server" 
                    ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' Width="150px" />

                    </td>
 
                </tr>
                <tr>
                    <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" 
                            CommandArgument='<%# Eval("centerID") %>' Text='<%# Eval("centerName") %>'></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                        </span>
                    </td>
                </tr>
                <tr><td>&nbsp;</td></tr>
            </table>
        </ItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="homeCenterDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString2 %>" 
        
                SelectCommand="SELECT * FROM [SaleandServiceCenter] WHERE (CONVERT (varchar(10), postedDate, 111) = (SELECT MAX(DISTINCT CONVERT (varchar(10), postedDate, 111)) FROM SaleandServiceCenter )) order by centerID desc">
    </asp:SqlDataSource>
    <table style="width: 100%;">
        <tr>
            <td align="center">
                <asp:DataPager ID="centerDP" runat="server" PagedControlID="lvCenter" 
                    PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="false" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="false" ShowPreviousPageButton="False" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                    </Fields>
                </asp:DataPager>
            </td>
        </tr>
        <tr><td align="right">
            <asp:HyperLink ID="hlCenter" runat="server" 
                NavigateUrl="~/SaleandService.aspx">More Centers</asp:HyperLink></td></tr>
    </table>
    
    
</asp:Content>

