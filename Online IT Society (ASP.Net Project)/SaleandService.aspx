<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="SaleandService.aspx.cs" Inherits="SaleandService" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table>
        <tr>
            <td>
                <h3>Sale & Services Centers</h3><br />
            </td>
        </tr>
        <tr>
           <td >
                <asp:ListView ID="listViewSAS" runat="server" DataKeyNames="centerID" 
                    DataSourceID="ViewCVDB2" onitemcommand="listViewSAS_ItemCommand">
                    <ItemTemplate>
                    <table>
                     <tr>
                            <td colspan="2"  style="height:50px;"><asp:Image ID="Image3" runat="server" AlternateText="Your Photo Here" 
                            Height="122px" ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' 
                            Width="120px" /></td>
                        </tr>
                         <tr>
                               <td  style="height:30px;"></td>
                               <td  style="height:30px;"><asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("centerName") %>' Font-Bold="true" CommandName="sasdetail" CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton></td>
                        </tr>
                       <tr>
                            <td  style="height:30px;"></td>
                             <td  style="height:30px;"> <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' /></td>
                       </tr>
                       
                       </table>
                    </ItemTemplate>
                    <ItemSeparatorTemplate>
                    <hr />
                    </ItemSeparatorTemplate>
                    <AlternatingItemTemplate>
                    <table>
                  <tr>
                              <td colspan="2" style="height:50px;"> <asp:Image ID="Image3" runat="server" AlternateText="Your Photo Here" 
                            Height="122px" ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' 
                            Width="120px" /></td>
                    </tr>
                    <tr>
                            <td style="height:30px;"></td>
                             <td style="height:30px;">
                                 <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("centerName") %>' Font-Bold="true" CommandName="sasdetail" CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton>
                        <br /></td>
                    </tr>
                      <tr>
                            <td  style="height:30px;"></td>
                             <td  style="height:30px;">   <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label></td>
                    </tr>
                      
                      </table>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <span style="">centerID:
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
                        address:
                        <asp:TextBox ID="addressTextBox" runat="server" 
                            Text='<%# Bind("address") %>' />
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
                            <span style="" >
                            <span ID="itemPlaceholder" runat="server"></span>
                            </span>
                        </div>
                        <div style="">
                        </div>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <span style="">centerID:
                        <asp:Label ID="centerIDLabel1" runat="server" Text='<%# Eval("centerID") %>' />
                        <br />
                        logo:
                        <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                        <br />
                        centerName:
                        <asp:TextBox ID="centerNameTextBox" runat="server" 
                            Text='<%# Bind("centerName") %>' />
                        <br />
                        address:
                        <asp:TextBox ID="addressTextBox" runat="server" 
                            Text='<%# Bind("address") %>' />
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
                        <span style="">centerID:
                        <asp:Label ID="centerIDLabel" runat="server" Text='<%# Eval("centerID") %>' />
                        <br />
                        logo:
                        <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
                        <br />
                        centerName:
                        <asp:Label ID="centerNameLabel" runat="server" 
                            Text='<%# Eval("centerName") %>' />
                        <br />
                        address:
                        <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                        <br />
                        <br />
                        </span>
                    </SelectedItemTemplate>
                </asp:ListView>
                <div align="center">
                <asp:DataPager ID="DataPager1" runat="server" PagedControlID="listViewSAS" 
                        PageSize="3">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                        <asp:NumericPagerField />
                        <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                            ShowNextPageButton="False" ShowPreviousPageButton="False" />
                    </Fields>
                </asp:DataPager>
                </div>
                <asp:SqlDataSource ID="ViewCVDB2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT [centerID], [logo], [centerName], [address] FROM [SaleandServiceCenter] ORDER BY [centerName]">
                </asp:SqlDataSource>
            </td>
        </tr>
        </table>

</asp:Content>

