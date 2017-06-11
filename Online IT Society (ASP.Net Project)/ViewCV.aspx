<%@ Page Language="C#" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="ViewCV.aspx.cs" Inherits="ViewCV" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 389px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                <asp:Label ID="Label1" runat="server" Text="Filter By :"></asp:Label>
                &nbsp;&nbsp;&nbsp;
                <asp:DropDownList ID="ddlcv" runat="server" AutoPostBack="True" 
                    DataSourceID="ViewCVDB1" DataTextField="title" DataValueField="title" 
                    Height="28px" Width="146px">
                </asp:DropDownList>
<br />
    <table style="height: 389px">
        <tr>
            <td class="style1">
                <asp:ListView ID="ListView1" runat="server" DataKeyNames="cvID" 
                    DataSourceID="ViewCVDB2" onitemcommand="ListView1_ItemCommand">
                    <ItemTemplate>
        <table>
                    <tr>
                            <td colspan="2">   <asp:Image ID="Image4" runat="server" Height="122px" 
                        ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' Width="120px" 
                            AlternateText="Your Photo Here"/></td>
                    </tr>
                    <tr>
                        <td>Job Title</td><td>:</td>
                        <td>   <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label></td>
                    </tr>
                     <tr>
                        <td>  Qualification</td><td>:</td>
                         <td>   <asp:Label ID="qualificationLabel" runat="server" 
                            Text='<%# Eval("qualification") %>'></asp:Label></td>
                     </tr>
                     <tr>
                            <td> Other Qualification</td><td>:</td> 
                            <td>  <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>'></asp:Label></td>
                     </tr>
                     <tr>
                            <td colspan="2"> <asp:LinkButton ID="CVlb1" runat="server" CommandName="aa" CommandArgument='<%#Eval("cvID") %>'>Detail</asp:LinkButton></td>
                     
                     </tr>
                     </table>
                    </ItemTemplate>
                    <ItemSeparatorTemplate>
                    <hr />
                    </ItemSeparatorTemplate>
                    <AlternatingItemTemplate>
                    <table>
                    <tr>
                            <td colspan="2">   <asp:Image ID="Image4" runat="server" Height="122px" 
                        ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' Width="120px" 
                            AlternateText="Your Photo Here"/></td>
                    </tr>
                    <tr>
                        <td>Job Title</td><td>:</td>
                        <td>   <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>'></asp:Label></td>
                    </tr>
                     <tr>
                        <td>  Qualification</td><td>:</td>
                         <td>   <asp:Label ID="qualificationLabel" runat="server" 
                            Text='<%# Eval("qualification") %>'></asp:Label></td>
                     </tr>
                     <tr>
                            <td> Other Qualification</td><td>:</td> 
                            <td>  <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>'></asp:Label></td>
                     </tr>
                     <tr>
                            <td colspan="2"> <asp:LinkButton ID="CVlb1" runat="server" CommandName="aa" CommandArgument='<%#Eval("cvID") %>'>Detail</asp:LinkButton></td>
                     
                     </tr>
                     </table>
                    </AlternatingItemTemplate>
                    <EmptyDataTemplate>
                        <span>No data was returned.</span>
                    </EmptyDataTemplate>
                    <InsertItemTemplate>
                        <span style="">cvID:
                        <asp:TextBox ID="cvIDTextBox" runat="server" Text='<%# Bind("cvID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        qualification:
                        <asp:TextBox ID="qualificationTextBox" runat="server" 
                            Text='<%# Bind("qualification") %>' />
                        <br />
                        otherQual:
                        <asp:TextBox ID="otherQualTextBox" runat="server" 
                            Text='<%# Bind("otherQual") %>' />
                        <br />
                        photo:
                        <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                            <span style=""><span><span ID="itemPlaceholder" runat="server"></span>
                            </span></span></span>
                        </div>
                    </LayoutTemplate>
                    <EditItemTemplate>
                        <span style="">cvID:
                        <asp:Label ID="cvIDLabel1" runat="server" Text='<%# Eval("cvID") %>' />
                        <br />
                        title:
                        <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                        <br />
                        qualification:
                        <asp:TextBox ID="qualificationTextBox" runat="server" 
                            Text='<%# Bind("qualification") %>' />
                        <br />
                        otherQual:
                        <asp:TextBox ID="otherQualTextBox" runat="server" 
                            Text='<%# Bind("otherQual") %>' />
                        <br />
                        photo:
                        <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                        <span style="">cvID:
                        <asp:Label ID="cvIDLabel" runat="server" Text='<%# Eval("cvID") %>' />
                        <br />
                        title:
                        <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                        <br />
                        qualification:
                        <asp:Label ID="qualificationLabel" runat="server" 
                            Text='<%# Eval("qualification") %>' />
                        <br />
                        otherQual:
                        <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>' />
                        <br />
                        photo:
                        <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                        <br />
                        <br />
                        </span>
                    </SelectedItemTemplate>
                </asp:ListView>
                <asp:SqlDataSource ID="ViewCVDB2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    
                    
                    SelectCommand="SELECT [cvID], [title], [qualification], [otherQual], [photo] FROM [CV] WHERE ([title] = @title)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ddlcv" Name="title" 
                            PropertyName="SelectedValue" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
<asp:SqlDataSource ID="ViewCVDB1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT Distinct [title] FROM [CV]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>

