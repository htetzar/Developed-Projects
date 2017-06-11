<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="MyAlert.aspx.cs" Inherits="MyAlert" Title="My Alert" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table style="width:100%;">
            <tr>    
            <td align="center">           
                    <h1 style="color: #FF6600">My Alert</h1>
            </td>
            </tr>
            <tr>
                <td align="left">
                    <br />
                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="alertID" 
                        DataSourceID="myalert_ViewDS" onitemcommand="ListView1_ItemCommand">
                        <ItemTemplate>
                            <span style="">Model:
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            <br />
                            Max Price:
                            <asp:Label ID="maxpriceLabel" runat="server" Text='<%# Eval("maxprice") %>' />
                            <br />
                            Min Price:
                            <asp:Label ID="minpriceLabel" runat="server" Text='<%# Eval("minprice") %>' />
                            <br />
                            Expire Date:
                            <asp:Label ID="expireDateLabel" runat="server" 
                                Text='<%# Eval("expireDate", "{0:D}") %>' />
                            <br />
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("alertID") %>'>Detail...</asp:LinkButton>
                            <br />
                            <br />
                            </span>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <span style="">Model:
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            <br />
                            Max Price:
                            <asp:Label ID="maxpriceLabel" runat="server" Text='<%# Eval("maxprice") %>' />
                            <br />
                            Min Price:
                            <asp:Label ID="minpriceLabel" runat="server" Text='<%# Eval("minprice") %>' />
                            <br />
                            Expire Date:
                            <asp:Label ID="expireDateLabel" runat="server" 
                                Text='<%# Eval("expireDate", "{0:D}") %>' />
                            <br />
                            <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("alertID") %>'>Detail...</asp:LinkButton>
                            <br />
                            <br />
                            </span>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            <span>No data was returned.</span>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <span style="">alertID:
                            <asp:TextBox ID="alertIDTextBox" runat="server" Text='<%# Bind("alertID") %>' />
                            <br />
                            memberID:
                            <asp:TextBox ID="memberIDTextBox" runat="server" 
                                Text='<%# Bind("memberID") %>' />
                            <br />
                            brandID:
                            <asp:TextBox ID="brandIDTextBox" runat="server" Text='<%# Bind("brandID") %>' />
                            <br />
                            model:
                            <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                            <br />
                            maxprice:
                            <asp:TextBox ID="maxpriceTextBox" runat="server" 
                                Text='<%# Bind("maxprice") %>' />
                            <br />
                            minprice:
                            <asp:TextBox ID="minpriceTextBox" runat="server" 
                                Text='<%# Bind("minprice") %>' />
                            <br />
                            expireDate:
                            <asp:TextBox ID="expireDateTextBox" runat="server" 
                                Text='<%# Bind("expireDate") %>' />
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
                            </div>
                        </LayoutTemplate>
                        <EditItemTemplate>
                            <span style="">alertID:
                            <asp:Label ID="alertIDLabel1" runat="server" Text='<%# Eval("alertID") %>' />
                            <br />
                            memberID:
                            <asp:TextBox ID="memberIDTextBox" runat="server" 
                                Text='<%# Bind("memberID") %>' />
                            <br />
                            brandID:
                            <asp:TextBox ID="brandIDTextBox" runat="server" Text='<%# Bind("brandID") %>' />
                            <br />
                            model:
                            <asp:TextBox ID="modelTextBox" runat="server" Text='<%# Bind("model") %>' />
                            <br />
                            maxprice:
                            <asp:TextBox ID="maxpriceTextBox" runat="server" 
                                Text='<%# Bind("maxprice") %>' />
                            <br />
                            minprice:
                            <asp:TextBox ID="minpriceTextBox" runat="server" 
                                Text='<%# Bind("minprice") %>' />
                            <br />
                            expireDate:
                            <asp:TextBox ID="expireDateTextBox" runat="server" 
                                Text='<%# Bind("expireDate") %>' />
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
                            <span style="">alertID:
                            <asp:Label ID="alertIDLabel" runat="server" Text='<%# Eval("alertID") %>' />
                            <br />
                            memberID:
                            <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
                            <br />
                            brandID:
                            <asp:Label ID="brandIDLabel" runat="server" Text='<%# Eval("brandID") %>' />
                            <br />
                            model:
                            <asp:Label ID="modelLabel" runat="server" Text='<%# Eval("model") %>' />
                            <br />
                            maxprice:
                            <asp:Label ID="maxpriceLabel" runat="server" Text='<%# Eval("maxprice") %>' />
                            <br />
                            minprice:
                            <asp:Label ID="minpriceLabel" runat="server" Text='<%# Eval("minprice") %>' />
                            <br />
                            expireDate:
                            <asp:Label ID="expireDateLabel" runat="server" 
                                Text='<%# Eval("expireDate") %>' />
                            <br />
                            <br />
                            </span>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </td>
            </tr>
        </table>
    </p>
    <p>
        <asp:SqlDataSource ID="myalert_ViewDS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
            SelectCommand="SELECT * FROM [Alert] WHERE ([memberID] = @memberID)">
            <SelectParameters>
                <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <p></p>
    </asp:Content>

