<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="MyPost.aspx.cs" Inherits="MemberProfile" Title="Member Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 180px;
        }
        .style7
        {
            width: 230px;
        }
        .style8
        {
            width: 230px;
            height: 43px;
        }
        .style10
        {
            width: 230px;
            height: 191px;
        }
        .style11
        {
            color: #FF6600;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <br/>
       <div style="font-family: 'Times New Roman', Times, serif; font-weight: 600; font-size: xx-large;" align="center" 
><span class="style11">My Posts</span><br />
           <br />
                            </div>
    <asp:Panel ID="PanelCV" runat="server">                        
       <table style="width:92%;">
           <tr>
                 <td align="left" 
                    
                     style="font-family: 'Times New Roman', Times, serif; font-weight: 700; font-size: x-large; color: #512800;" 
                     class="style8">
                     My CV</td>
           </tr>
           <tr>
               <td align="center" class="style7">

        <asp:GridView ID="GridView2" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BorderWidth="0px" DataKeyNames="cvID" 
            DataSourceID="mypost_DS" Width="327px" BorderColor="#B6D6DA" PageSize="5">
            <Columns>
                <asp:BoundField DataField="cvID" HeaderText="cvID" ReadOnly="True" 
                    SortExpression="cvID" Visible="False" />
                <asp:BoundField DataField="title" ShowHeader="False" SortExpression="title">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderColor="#B6D6DA" BorderWidth="0px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="cvID" 
                    DataNavigateUrlFormatString="~/Detail.aspx?cvid={0}&amp;type=cv" 
                    Text="Detail...">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderColor="#B6D6DA" BorderWidth="0px" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
                </td>
           </tr>
       </table>
       </asp:Panel>
       
                <asp:SqlDataSource ID="mypost_DS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        
    SelectCommand="SELECT title, cvID FROM CV WHERE (memberID = @memberID)" 
    ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                    <SelectParameters>
                        <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                    </SelectParameters>
    </asp:SqlDataSource>
    <asp:Panel ID="PanelExpo" runat="server">

       <table style="width:92%;">
           <tr>
                 <td align="left" 
                    
                     style="font-family: 'Times New Roman', Times, serif; font-weight: 700; font-size: x-large; color: #512800;" 
                     class="style8">
                     My ExhibitionWS</td>
           </tr>
           <tr>
               <td align="center" class="style7">

        <asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BorderWidth="0px" DataKeyNames="ewID" 
            DataSourceID="mypost_DS2" Width="329px" BorderColor="#B6D6DA" PageSize="5">
            <Columns>
                <asp:BoundField DataField="ewID" HeaderText="ewID" ReadOnly="True" 
                    SortExpression="ewID" Visible="False" />
                <asp:BoundField DataField="title" ShowHeader="False" SortExpression="title">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderColor="#B6D6DA" BorderWidth="0px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="ewID" 
                    DataNavigateUrlFormatString="~/Detail.aspx?ewid={0}&amp;type=expo" 
                    Text="Detail...">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderColor="#B6D6DA" BorderWidth="0px" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
                   <asp:SqlDataSource ID="mypost_DS2" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                       
                       SelectCommand="SELECT [ewID], [title] FROM [ExhibitionWS] WHERE ([memberID] = @memberID)" 
                       ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                       <SelectParameters>
                           <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                </td>
           </tr>
       </table>
       
    </asp:Panel>       
       
    <asp:Panel ID="PanelItem" runat="server">
    
       <table style="width:92%;">
           <tr>
                 <td align="left" 
                    
                     style="font-family: 'Times New Roman', Times, serif; font-weight: 700; font-size: x-large; color: #512800;" 
                     class="style8">
                     For Sale Items</td>
           </tr>
           <tr>
               <td align="center" class="style10">

                   <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" 
                       BorderWidth="0px" DataKeyNames="itemID" DataSourceID="mypost_DS3" Width="316px">
                       <Columns>
                           <asp:BoundField DataField="title" ShowHeader="False" SortExpression="title">
                               <FooterStyle BorderWidth="0px" />
                               <HeaderStyle BorderWidth="0px" />
                               <ItemStyle BorderWidth="0px" />
                           </asp:BoundField>
                           <asp:HyperLinkField DataNavigateUrlFields="itemID" 
                               DataNavigateUrlFormatString="~/ItemDetail.aspx?itemid={0}&amp;type=itm" 
                               Text="Detail..">
                               <FooterStyle BorderWidth="0px" />
                               <HeaderStyle BorderWidth="0px" />
                               <ItemStyle BorderWidth="0px" />
                           </asp:HyperLinkField>
                       </Columns>
                   </asp:GridView>
                   <asp:SqlDataSource ID="mypost_DS3" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                       
                       SelectCommand="SELECT itemID, title FROM Item WHERE (memberID = @memberID) AND (status = @status)" 
                       
                       
                       ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                       <SelectParameters>
                           <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                           <asp:Parameter DefaultValue="False" Name="status" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                </td>
           </tr>
       </table>
       </asp:Panel>
      
       
    <asp:Panel ID="PanelJob" runat="server">
    
       <table style="width:92%;">
           <tr>
                 <td align="left" 
                    
                     style="font-family: 'Times New Roman', Times, serif; font-weight: 700; font-size: x-large; color: #512800;" 
                     class="style8">
                     Jobs</td>
           </tr>
           <tr>
               <td align="center" class="style10">

                   <asp:GridView ID="GridView9" runat="server" AllowPaging="True" 
                       AutoGenerateColumns="False" BorderWidth="0px" DataKeyNames="jobID" 
                       DataSourceID="mypost_DS4" PageSize="5" Width="329px">
                       <Columns>
                           <asp:BoundField DataField="jobID" HeaderText="jobID" ReadOnly="True" 
                               SortExpression="jobID" Visible="False" />
                           <asp:BoundField DataField="title" ShowHeader="False" SortExpression="title">
                               <FooterStyle BorderWidth="0px" />
                               <HeaderStyle BorderWidth="0px" />
                               <ItemStyle BorderWidth="0px" />
                           </asp:BoundField>
                           <asp:HyperLinkField DataNavigateUrlFields="jobID" 
                               DataNavigateUrlFormatString="~/Detail.aspx?jobid={0}&amp;type=jv" ShowHeader="False" 
                               Text="Detail...">
                               <FooterStyle BorderWidth="0px" />
                               <HeaderStyle BorderWidth="0px" />
                               <ItemStyle BorderWidth="0px" />
                           </asp:HyperLinkField>
                       </Columns>
                   </asp:GridView>
                   <asp:SqlDataSource ID="mypost_DS4" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                       
                       SelectCommand="SELECT [jobID], [title] FROM [Job] WHERE ([memberID] = @memberID)" 
                       ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                       <SelectParameters>
                           <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>
                </td>
           </tr>
       </table>
       </asp:Panel>
       
    <asp:Panel ID="PanelSS" runat="server">
                       
       <table style="width:92%;">
           <tr>
                 <td align="left" 
                    
                     style="font-family: 'Times New Roman', Times, serif; font-weight: 700; font-size: x-large; color: #512800;" 
                     class="style8">
                     Sale &amp; Service Center</td>
           </tr>
           <tr>
               <td align="center" class="style10">

        <asp:GridView ID="GridView8" runat="server" AllowPaging="True" 
            AutoGenerateColumns="False" BorderWidth="0px" DataKeyNames="centerID" 
            DataSourceID="mypost_DS5" Width="329px" PageSize="5">         
            <Columns>
                <asp:BoundField DataField="centerID" HeaderText="centerID" ReadOnly="True" 
                    SortExpression="centerID" Visible="False" />
                <asp:BoundField DataField="centerName" ShowHeader="False" 
                    SortExpression="centerName">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderWidth="0px" />
                </asp:BoundField>
                <asp:HyperLinkField DataNavigateUrlFields="centerID" 
                    DataNavigateUrlFormatString="~/Detail.aspx?centerid={0}&amp;type=ss" ShowHeader="False" 
                    Text="Detail...">
                    <FooterStyle BorderWidth="0px" />
                    <HeaderStyle BorderWidth="0px" />
                    <ItemStyle BorderWidth="0px" />
                </asp:HyperLinkField>
            </Columns>
        </asp:GridView>
                   <asp:SqlDataSource ID="mypost_DS5" runat="server" 
                       ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                       
                       SelectCommand="SELECT [centerID], [centerName] FROM [SaleandServiceCenter] WHERE ([memberID] = @memberID)" 
                       ProviderName="<%$ ConnectionStrings:ITSocietyDBConnectionString.ProviderName %>">
                       <SelectParameters>
                           <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                       </SelectParameters>
                   </asp:SqlDataSource>                   
                </td>
           </tr>
       </table>
       </asp:Panel>
                </asp:Content>

