<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="ChatRoom.aspx.cs" Inherits="ChatRoom" Title="Chat Room" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajax" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <table style="width: 100%; height:400px">
            <tr>
                <td>
                    
                    <asp:TextBox ID="txtChat" runat="server" Height="500px" 
                        ontextchanged="txtChat_TextChanged" ReadOnly="true" Rows="100" 
                        TextMode="MultiLine" Width="650px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;&nbsp;<h4>Online Users</h4>
                   <asp:Panel ID="Panel1" runat="server" Height="330px" Width="130px">
                        <asp:BulletedList ID="BulletOnlineUser" runat="server" 
                            BulletImageUrl="~/App_Themes/Theme1/online.JPG" BulletStyle="CustomImage">
                        </asp:BulletedList>
                    </asp:Panel>
                </td>
            </tr>
        </table>
        <asp:Timer ID="Timer1" runat="server" ontick="Timer1_Tick" Interval="1000">
        </asp:Timer>
         
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:TextBox ID="txtMsg" runat="server" Width="466px"></asp:TextBox>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSend" runat="server" onclick="btnSend_Click" 
        Text="Send" />

       
        
<br />
    <br />
    
    &nbsp;&nbsp;  
</asp:Content>

