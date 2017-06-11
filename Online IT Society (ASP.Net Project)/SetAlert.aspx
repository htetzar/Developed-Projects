<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="SetAlert.aspx.cs" Inherits="SetAlert" Title="Set Alert" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <style type="text/css">
        .style33
        {
            width: 137px;
        }
        .style34
        {
        }
        .style36
        {
            width: 318px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
        &nbsp;<table style="width:100%;">
        <tr>
            <td colspan="3">
                <h1 style="color: #FF6600" align="center">Set Alert</h1>
                </td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    <asp:Label ID="Label1" runat="server" Text="Looking for"></asp:Label>
                </td>
            <td align="left" class="style36" >
                    <asp:DropDownList ID="ddlLooking" runat="server" 
                        onselectedindexchanged="ddlLooking_SelectedIndexChanged" 
                        AutoPostBack="True" Height="24px" Width="150px" 
                        DataSourceID="setalert_lookforDS" DataTextField="saleCategoryName" 
                        DataValueField="saleCategoryID">
                        <asp:ListItem Value="1">Laptop</asp:ListItem>
                        <asp:ListItem Value="2">Phone</asp:ListItem>
                        <asp:ListItem Value="5">Tablet</asp:ListItem>
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="setalert_lookforDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                        DeleteCommand="DELETE FROM [SaleCategory] WHERE [saleCategoryID] = @saleCategoryID" 
                        InsertCommand="INSERT INTO [SaleCategory] ([saleCategoryID], [saleCategoryName]) VALUES (@saleCategoryID, @saleCategoryName)" 
                        SelectCommand="SELECT * FROM [SaleCategory]" 
                        
                        UpdateCommand="UPDATE [SaleCategory] SET [saleCategoryName] = @saleCategoryName WHERE [saleCategoryID] = @saleCategoryID">
                        <DeleteParameters>
                            <asp:Parameter Name="saleCategoryID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="saleCategoryName" Type="String" />
                            <asp:Parameter Name="saleCategoryID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="saleCategoryID" Type="Int32" />
                            <asp:Parameter Name="saleCategoryName" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
            <td align="left">
                    &nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    <asp:Label ID="Label2" runat="server" Text="Brand"></asp:Label>
                </td>
            <td align="left" class="style36" >
                    <asp:DropDownList ID="ddlBrand" runat="server" Width="150px" 
                        DataSourceID="setalert_brandDS" DataTextField="brandName" 
                        DataValueField="brandID" ForeColor="Black">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="setalert_brandDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                        
                        SelectCommand="SELECT * FROM [Brand] WHERE ([saleCategoryID] = @saleCategoryID)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlLooking" Name="saleCategoryID" 
                                PropertyName="SelectedValue" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            <td align="left">
                    &nbsp;</td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    <asp:Label ID="Label3" runat="server" Text="Model"></asp:Label>
                </td>
            <td align="left" class="style36" >
                    <asp:TextBox ID="txtModel" runat="server" Width="150px"></asp:TextBox>
                </td>
            <td align="left">
                    <asp:RequiredFieldValidator ID="rfvModel" runat="server" 
                        ErrorMessage="Required" ControlToValidate="txtModel"></asp:RequiredFieldValidator>
                </td>
        </tr>
        <tr>
            <td  align="left" class="style33" valign="top">
                    Max
                    <asp:Label ID="Label4" runat="server" Text="Price"></asp:Label>
                </td>
            <td  align="left" class="style36" valign="top">
                    <asp:TextBox ID="txtMax" runat="server" Width="150px"></asp:TextBox>
                        
                    Ks&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                   
                    <br />
            </td>
            <td align="left">
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                        ControlToValidate="txtMax" ErrorMessage="Required"></asp:RequiredFieldValidator>
                     <br />
                     <asp:CompareValidator ID="CompareValidator3" runat="server" 
                         ControlToValidate="txtMax" 
                         ErrorMessage="Must be number and less than or equal to 2000000 Ks" 
                         Operator="LessThanEqual" Type="Double" ValueToCompare="2000000"></asp:CompareValidator>
                        
                    <br />
                        
            </td>
        </tr>
        <tr>
            <td  align="left" class="style33" valign="top">
                    Min Price</td>
            <td  align="left" class="style36" valign="top">
                <asp:TextBox ID="txtMin" runat="server" 
                        Width="150px"></asp:TextBox>
                Ks</td>
            <td align="left">
             <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                    ControlToValidate="txtMin" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator2" runat="server" 
                    ControlToValidate="txtMin" ErrorMessage="Must be number and greater than equal to 1000 Ks" 
                    Operator="GreaterThanEqual" Type="Double" ValueToCompare="1000"></asp:CompareValidator>
                <br />
               
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtMin" ControlToValidate="txtMax" 
                    ErrorMessage="MaxPrice must be greater than or equal to MinPrice" 
                    Operator="GreaterThanEqual" Type="Double"></asp:CompareValidator>
               
                <br />
            </td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    Email             <td align="left" class="style36" >
                <asp:TextBox ID="txtEmail" runat="server" Enabled="False" Width="148px"></asp:TextBox>
            </td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Incorrect Email Format" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    <asp:Label ID="Label7" runat="server" Text="Expire Date"></asp:Label>
                </td>
            <td align="left" class="style36" >
        <asp:TextBox ID="txtDate" runat="server" Width="150px"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtDate" 
                    Format="dd-MMM-yy" >
        </asp:CalendarExtender>
            </td>
            <td align="left">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                    ControlToValidate="txtDate" ErrorMessage="Required"></asp:RequiredFieldValidator>
                <br />
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtDate" ErrorMessage="Must be greater than today." 
                    onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td align="left" class="style33" >
                    <br />
                </td>
            <td align="left" class="style34" colspan="2" >
                    <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                </td>
        </tr>
        <tr>
            <td class="style33" >
                    &nbsp;</td>
            <td  align="left" class="style36">
                    <asp:Button ID="btnSetAlert" runat="server" Text="Set Alert" Height="39px" 
                        Width="75px" onclick="btnSetAlert_Click" />
                    &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" Height="39px" 
                        Width="75px" CausesValidation="False" onclick="btnCancel_Click" />
                    </td>
            <td  align="left">
                    &nbsp;</td>
        </tr>
        <tr>
            <td class="style33" >
                &nbsp;</td>
            <td class="style36" >
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                    <asp:SqlDataSource ID="setalert_SaveDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                        DeleteCommand="DELETE FROM [Alert] WHERE [alertID] = @alertID" 
                        InsertCommand="INSERT INTO [Alert] ([alertID], [memberID], [brandID], [model], [maxprice], [minprice], [expireDate]) VALUES (@alertID, @memberID, @brandID, @model, @maxprice, @minprice, @expireDate)" 
                        SelectCommand="SELECT * FROM [Alert]" 
                        
            UpdateCommand="UPDATE [Alert] SET [memberID] = @memberID, [brandID] = @brandID, [model] = @model, [maxprice] = @maxprice, [minprice] = @minprice, [expireDate] = @expireDate WHERE [alertID] = @alertID">
                        <DeleteParameters>
                            <asp:Parameter Name="alertID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="memberID" Type="Int32" />
                            <asp:Parameter Name="brandID" Type="Int32" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="maxprice" Type="Decimal" />
                            <asp:Parameter Name="minprice" Type="Decimal" />
                            <asp:Parameter Name="expireDate" DbType="Date" />
                            <asp:Parameter Name="alertID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:SessionParameter Name="alertID" SessionField="alertid" Type="Int32" />
                            <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlBrand" Name="brandID" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="txtModel" Name="model" PropertyName="Text" 
                                Type="String" />
                            <asp:ControlParameter ControlID="txtMax" Name="maxprice" PropertyName="Text" 
                                Type="Decimal" />
                            <asp:ControlParameter ControlID="txtMin" Name="minprice" PropertyName="Text" 
                                Type="Decimal" />
                            <asp:ControlParameter ControlID="txtDate" Name="expireDate" 
                                PropertyName="Text" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="setalert_GenerateidDS" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                        DeleteCommand="DELETE FROM [Alert] WHERE [alertID] = @alertID" 
                        InsertCommand="INSERT INTO [Alert] ([alertID], [memberID], [brandID], [model], [maxprice], [minprice], [expireDate]) VALUES (@alertID, @memberID, @brandID, @model, @maxprice, @minprice, @expireDate)" 
                        SelectCommand="SELECT MAX(alertID) AS id FROM Alert" 
                        UpdateCommand="UPDATE [Alert] SET [memberID] = @memberID, [brandID] = @brandID, [model] = @model, [maxprice] = @maxprice, [minprice] = @minprice, [expireDate] = @expireDate WHERE [alertID] = @alertID">
                        <DeleteParameters>
                            <asp:Parameter Name="alertID" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="memberID" Type="Int32" />
                            <asp:Parameter Name="brandID" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="maxprice" Type="Decimal" />
                            <asp:Parameter Name="minprice" Type="Decimal" />
                            <asp:Parameter DbType="Date" Name="expireDate" />
                            <asp:Parameter Name="alertID" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Name="alertID" Type="Int32" />
                            <asp:Parameter Name="memberID" Type="Int32" />
                            <asp:Parameter Name="brandID" Type="String" />
                            <asp:Parameter Name="model" Type="String" />
                            <asp:Parameter Name="maxprice" Type="Decimal" />
                            <asp:Parameter Name="minprice" Type="Decimal" />
                            <asp:Parameter DbType="Date" Name="expireDate" />
                        </InsertParameters>
                    </asp:SqlDataSource>
    
</asp:Content>

