<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile= "~/MemberEditProfile.aspx.cs" Inherits="MemberEditProfile" Title="Member Edit Profile" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            height: 53px;
        }
        .style7
        {
            text-align: left;
        }
    </style>
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p class="style7">
        <asp:Label ID="lblMsg" runat="server" ForeColor="#000099"></asp:Label>
</p>
    <p class="style7">
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="memberID" 
            DataSourceID="Mem_ProfileDS" DefaultMode="Edit" style="margin-right: 0px" 
            onitemupdated="FormView1_ItemUpdated1">
            <EditItemTemplate>
                <table style="width:100%;" align="left">
                    <tr>
                        <td colspan="2" align="center">
                        <h1 style="color: #FF6600">Member Profile</h1>
                            &nbsp;<%--<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
                            </asp:DropDownList>--%>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            User Name:</td>
                        <td>
                            <asp:TextBox ID="usernameTextBox" runat="server" 
                                Text='<%# Bind("username") %>' />
                            <asp:RequiredFieldValidator ID="rfvName" runat="server" 
                                ControlToValidate="usernameTextBox" ErrorMessage="*" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Gender:</td>
                        <td>
                            <asp:RadioButtonList ID="rblgender" runat="server" 
                                RepeatDirection="Horizontal" SelectedValue='<%# Bind("gender") %>'>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                            </asp:RadioButtonList>
                            <asp:RequiredFieldValidator ID="rfvgender" runat="server" 
                                ControlToValidate="rblgender" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Date of Birth:</td>
                        <td>
                            <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob", "{0:d}") %>' 
                                Height="22px" ReadOnly="True" />
                            <asp:RequiredFieldValidator ID="rfvDOB" runat="server" 
                                ControlToValidate="dobTextBox" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" 
                                TargetControlID="dobTextBox" Format="dd-MMM-yyyy">
                            </asp:CalendarExtender>
                            
    
                            <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="*" 
                                onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
                            
                           
                            
    
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Email:</td>
                        <td>
                            <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' 
                                Enabled="False" />
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                ControlToValidate="emailTextBox" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                                ControlToValidate="emailTextBox" ErrorMessage="Invalid Email!" 
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                                SetFocusOnError="True"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Current Password:</td>
                        <td>
                            <asp:TextBox ID="cur_psw" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvCurPsw" runat="server" 
                                ControlToValidate="cur_psw" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CustomValidator ID="CustomValidator2" runat="server" 
                                ControlToValidate="cur_psw" ErrorMessage="Invalid Current Password" 
                                onservervalidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            New Password:</td>
                        <td>
                            <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' 
                                TextMode="Password" />
                            <asp:RequiredFieldValidator ID="rfvNPsw" runat="server" 
                                ControlToValidate="passwordTextBox" ErrorMessage="*" 
                                SetFocusOnError="True"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Confirm Password:</td>
                        <td>
                            <asp:TextBox ID="con_psw" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvConPsw" runat="server" 
                                ControlToValidate="con_psw" ErrorMessage="*" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvConPsw" runat="server" 
                                ControlToCompare="passwordTextBox" ControlToValidate="con_psw" 
                                ErrorMessage="Not Match!" SetFocusOnError="True"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Bank Account:</td>
                        <td>
                            <asp:TextBox ID="bankaccountTextBox" runat="server" 
                                Text='<%# Bind("bankaccount") %>' ReadOnly="True" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblmsg" runat="server" Font-Size="Large" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style6" align="center">
                            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update" 
                                ondatabinding="UpdateButton_DataBinding" onclick="UpdateButton_Click" />
                        </td>
                        <td class="style6">
                            <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel" />
                            &nbsp;&nbsp;&nbsp;
                            <%--<asp:LinkButton ID="LinkButton2" runat="server" onclick="Delete_Click">Delete</asp:LinkButton>--%>
                        </td>
                    </tr>
                    <tr>
                        <td class="style6">
                            &nbsp;</td>
                        <td class="style6">
                            &nbsp;</td>
                    </tr>
                </table>
            </EditItemTemplate>
            <InsertItemTemplate>
                memberID:
                <asp:TextBox ID="memberIDTextBox" runat="server" 
                    Text='<%# Bind("memberID") %>' />
                <br />
                username:
                <asp:TextBox ID="usernameTextBox" runat="server" 
                    Text='<%# Bind("username") %>' />
                <br />
                gender:
                <asp:TextBox ID="genderTextBox" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                dob:
                <asp:TextBox ID="dobTextBox" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                email:
                <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>' />
                <br />
                password:
                <asp:TextBox ID="passwordTextBox" runat="server" 
                    Text='<%# Bind("password") %>' />
                <br />
                bankaccount:
                <asp:TextBox ID="bankaccountTextBox" runat="server" 
                    Text='<%# Bind("bankaccount") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" 
                    CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" 
                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                memberID:
                <asp:Label ID="memberIDLabel" runat="server" Text='<%# Eval("memberID") %>' />
                <br />
                username:
                <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>' />
                <br />
                gender:
                <asp:Label ID="genderLabel" runat="server" Text='<%# Bind("gender") %>' />
                <br />
                dob:
                <asp:Label ID="dobLabel" runat="server" Text='<%# Bind("dob") %>' />
                <br />
                email:
                <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>' />
                <br />
                password:
                <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                <br />
                bankaccount:
                <asp:Label ID="bankaccountLabel" runat="server" 
                    Text='<%# Bind("bankaccount") %>' />
                <br />
            </ItemTemplate>
        </asp:FormView>
</p>
<p style="text-align: left">
    &nbsp;<asp:SqlDataSource ID="Mem_ProfileDS" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        DeleteCommand="DELETE FROM [Member] WHERE [memberID] = @memberID" 
        InsertCommand="INSERT INTO [Member] ([memberID], [username], [gender], [dob], [email], [password], [bankaccount]) VALUES (@memberID, @username, @gender, @dob, @email, @password, @bankaccount)" 
        SelectCommand="SELECT memberID, username, gender, dob, email, password, bankaccount FROM Member WHERE (memberID = @memberID)" 
        
        UpdateCommand="UPDATE [Member] SET [username] = @username, [gender] = @gender, [dob] = @dob, [email] = @email, [password] = @password, [bankaccount] = @bankaccount WHERE [memberID] = @memberID">
        <SelectParameters>
            <asp:SessionParameter Name="memberID" SessionField="mid" />
        </SelectParameters>
        <DeleteParameters>
            <asp:Parameter Name="memberID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="dob" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="bankaccount" Type="String" />
            <asp:Parameter Name="memberID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="memberID" Type="Int32" />
            <asp:Parameter Name="username" Type="String" />
            <asp:Parameter Name="gender" Type="String" />
            <asp:Parameter Name="dob" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="password" Type="String" />
            <asp:Parameter Name="bankaccount" Type="String" />
        </InsertParameters>
    </asp:SqlDataSource>
</p>
    <p style="text-align: left">
        <asp:SqlDataSource ID="Delete_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
            DeleteCommand="DELETE FROM [Alert] WHERE ([memberID] = @memberID)" 
            InsertCommand="INSERT INTO [Alert] ([alertID], [memberID], [brandID], [model], [maxprice], [minprice], [expireDate]) VALUES (@alertID, @memberID, @brandID, @model, @maxprice, @minprice, @expireDate)" 
            SelectCommand="SELECT * FROM [Alert] WHERE ([memberID] = @memberID)" 
            UpdateCommand="UPDATE [Alert] SET [memberID] = @memberID, [brandID] = @brandID, [model] = @model, [maxprice] = @maxprice, [minprice] = @minprice, [expireDate] = @expireDate WHERE [alertID] = @alertID">
            <SelectParameters>
                <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                <asp:SessionParameter Name="memberID" SessionField="mid" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="memberID" Type="Int32" />
                <asp:Parameter Name="brandID" Type="Int32" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="maxprice" Type="Decimal" />
                <asp:Parameter Name="minprice" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="expireDate" />
                <asp:Parameter Name="alertID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="alertID" Type="Int32" />
                <asp:Parameter Name="memberID" Type="Int32" />
                <asp:Parameter Name="brandID" Type="Int32" />
                <asp:Parameter Name="model" Type="String" />
                <asp:Parameter Name="maxprice" Type="Decimal" />
                <asp:Parameter Name="minprice" Type="Decimal" />
                <asp:Parameter DbType="Date" Name="expireDate" />
            </InsertParameters>
        </asp:SqlDataSource>
</p>
    <p style="text-align: left">
        <asp:SqlDataSource ID="psw_DS" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
            SelectCommand="SELECT [password] FROM [Member] WHERE ([memberID] = @memberID)">
            <SelectParameters>
                <asp:SessionParameter Name="memberID" SessionField="mid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
</p>
    <%--<asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
                            </asp:ToolkitScriptManager>
                            <asp:TextBox ID="TextBox10" runat="server" Text='<%# Bind("dob") %>' 
                                Height="22px" />
                            <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox10">
                            </asp:CalendarExtender>--%>
</p>
</asp:Content>

