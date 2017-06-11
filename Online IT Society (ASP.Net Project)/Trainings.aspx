<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="Trainings.aspx.cs" Inherits="Trainings" Title="Trainings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:ListView ID="ListViewTraining" runat="server" DataKeyNames="trainerID" 
        DataSourceID="SqlDataSourceTraining" 
        onitemcommand="ListViewTraining_ItemCommand">
        <ItemTemplate>
            <span style="">
            
                <asp:Image ID="Image1" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?tid="+Eval("trainerID") %>' />
            
            <br />
            
                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("trainerID") %>' Text='<%# Eval("trainerName") %>'></asp:LinkButton>
            
            <br />
            
            <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
            <br />
            <hr />
            <br />
            </span>
        </ItemTemplate>
        <AlternatingItemTemplate>
            <span style="">
            
                <asp:Image ID="Image2" runat="server" Width="120px" Height="120px" ImageUrl='<%#"Handler.ashx?tid="+Eval("trainerID") %>' />
            
            <br />
            
                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("trainerID") %>' Text='<%# Eval("trainerName") %>'></asp:LinkButton>
            
            <br />
            
            <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
            <br />
            <hr />
            <br />
            </span>
        </AlternatingItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <span style="">trainerID:
            <asp:TextBox ID="trainerIDTextBox" runat="server" 
                Text='<%# Bind("trainerID") %>' />
            <br />
            trainerName:
            <asp:TextBox ID="trainerNameTextBox" runat="server" 
                Text='<%# Bind("trainerName") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <LayoutTemplate>
            <div ID="itemPlaceholderContainer" runat="server" style="">
                <span ID="itemPlaceholder" runat="server" />
            </div>
            <div style="">
            <div align="center">
                <asp:DataPager ID="DataPager1" runat="server" PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
                </div>
            </div>
        </LayoutTemplate>
        <EditItemTemplate>
            <span style="">trainerID:
            <asp:Label ID="trainerIDLabel1" runat="server" 
                Text='<%# Eval("trainerID") %>' />
            <br />
            trainerName:
            <asp:TextBox ID="trainerNameTextBox" runat="server" 
                Text='<%# Bind("trainerName") %>' />
            <br />
            address:
            <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br />
            <br />
            </span>
        </EditItemTemplate>
        <SelectedItemTemplate>
            <span style="">trainerID:
            <asp:Label ID="trainerIDLabel" runat="server" Text='<%# Eval("trainerID") %>' />
            <br />
            trainerName:
            <asp:Label ID="trainerNameLabel" runat="server" 
                Text='<%# Eval("trainerName") %>' />
            <br />
            address:
            <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
            <br />
            <br />
            </span>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="SqlDataSourceTraining" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>" 
        
        SelectCommand="SELECT [trainerID], [trainerName], [address] FROM [Trainer] ORDER BY [trainerName]">
    </asp:SqlDataSource>
    <%--<table style="width:100%; height: 591px;" align="right">
    <caption><h3>Training Centers</h3></caption>
    <tr>
    <td>
    
    </td>
    </tr>
        <tr>
            <td class="style8">
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Creative.aspx">CREATIVE 
                WEB STUDIO</asp:HyperLink>
            </td>
            <td class="style9">
                </td>
        </tr>
        <tr>
            <td class="style10">
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/IMCEITS.aspx">AZURE 
                COMPUTER ACADEMY</asp:HyperLink>
            </td>
            <td class="style11">
                </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/IMCEITS.aspx">BIT 
                SYSTEM</asp:HyperLink>
            </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td class="style14">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/IMCEITS.aspx">BRIGHT 
                STAR</asp:HyperLink>
            </td>
            <td class="style15">
                </td>
        </tr>
        <tr>
            <td class="style16">
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/IMCEITS.aspx">C.C.T.C</asp:HyperLink>
            </td>
            <td class="style17">
                </td>
        </tr>
        <tr>
            <td class="style21">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/IMCEITS.aspx">ACT 
                COMPUTER TRAINING(AUNG COMPUTER TRAINING)</asp:HyperLink>
            </td>
            <td class="style22">
                </td>
        </tr>
        <tr>
            <td class="style16">
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/IMCEITS.aspx">CIT</asp:HyperLink>
            </td>
            <td class="style17">
                </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/IMCEITS.aspx">CYBER 
                WEB MEDIA</asp:HyperLink>
            </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td class="style23">
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/IMCEITS.aspx">CYBER 
                MAX INTERNET TRAINING CENTER</asp:HyperLink>
            </td>
            <td class="style24">
                </td>
        </tr>
        <tr>
            <td class="style12">
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/IMCEITS.aspx">ECC 
                COMPUTER</asp:HyperLink>
            </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td class="style25">
                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/IMCEITS.aspx">EDILIGHT 
                COMPUTER CENTER</asp:HyperLink>
            </td>
            <td class="style26">
                </td>
        </tr>
        <tr>
        <td align="center">
            <asp:HyperLink ID="HyperLink13" runat="server">1</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/Trainings2.aspx">2</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/Trainings2.aspx">3</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/Trainings2.aspx">4</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/Trainings2.aspx">5</asp:HyperLink>
&nbsp;<asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/Trainings2.aspx">Next</asp:HyperLink>
        </td>
        </tr>
        </table>--%>
       
        
</asp:Content>

