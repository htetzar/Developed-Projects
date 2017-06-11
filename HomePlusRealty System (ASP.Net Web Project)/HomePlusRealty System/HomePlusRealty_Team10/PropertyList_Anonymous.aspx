<%@ Page Language="C#" MasterPageFile="~/Anonymous.Master" AutoEventWireup="true" CodeFile="PropertyList_Anonymous.aspx.cs" Inherits="PropertyList_Anonymous" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">
    <asp:ScriptManager ID="scriptmanager" runat="server"></asp:ScriptManager>
    <div class="container">
        <div class="row">
            <div class="col-md-3">
<%--                <div class="breadcrumb">
                    <a href="Listing.aspx">List</a>                                                         
                </div>--%>        
            </div>
            <div class="col-md-9">
                <div class="text-right">
                    <a href="#" id="clickRegister"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> New User?</a>
                    <a href="#" id="clickLogin"><span class="glyphicon glyphicon-user" aria-hidden="true"></span> Sign in?</a>
                 </div>
            </div>
        </div>               
    </div>
    
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Modal" id="_modalSignin">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header bg-primary" style="background-color:rgba(255, 0, 0, 0.8);">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="myModalLabel">
                        <asp:Label runat="server" CssClass="control-label" ID="Label2">Log in</asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="_pnlView">
                        <ContentTemplate>                            
                            <asp:Login ID="Login1" runat="server" OnLoggedIn="Login1_LoggedIn">
        <LayoutTemplate>
            <table cellpadding="1" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0">
                            <tr>
                                <td align="center" colspan="2">Log In</td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="Remember me next time." />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" colspan="2" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" colspan="2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
    </asp:Login>                      
                         </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="cancel" Text="Close" />
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" tabindex="-1" role="dialog" aria-labelledby="Modal" id="_modalRegister">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header bg-primary" style="background-color:rgba(255, 0, 0, 0.8);">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                    <h4 class="modal-title" id="ModalLabel">
                        <asp:Label runat="server" CssClass="control-label" ID="Label1">Register</asp:Label></h4>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server" ID="UpdatePanel1">
                        <ContentTemplate>
                            <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">Sign Up for Your New Account</td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="ConfirmPasswordLabel" runat="server" AssociatedControlID="ConfirmPassword">Confirm Password:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="EmailLabel" runat="server" AssociatedControlID="Email">E-mail:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Email" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="QuestionLabel" runat="server" AssociatedControlID="Question">Security Question:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Question" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer">Security Answer:</asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="Answer" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2">
                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="CreateUserWizard1"></asp:CompareValidator>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" colspan="2" style="color:Red;">
                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
                <CustomNavigationTemplate>
                    <table border="0" cellspacing="5" style="width:100%;height:100%;">
                        <tr align="right">
                            <td align="right" colspan="0">
                                <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </CustomNavigationTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                <ContentTemplate>
                    <table>
                        <tr>
                            <td align="center" colspan="2">Complete</td>
                        </tr>
                        <tr>
                            <td>Your account has been successfully created.</td>
                        </tr>
                        <tr>
                            <td align="right" colspan="2">
                                <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" ValidationGroup="CreateUserWizard1" />
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:CompleteWizardStep>
        </WizardSteps>
        <FinishNavigationTemplate>
            <asp:Button ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
            <asp:Button ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
        </FinishNavigationTemplate>
        <StartNavigationTemplate>
            <asp:Button ID="StartNextButton" runat="server" CommandName="MoveNext" Text="Next" />
        </StartNavigationTemplate>
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
        </StepNavigationTemplate>
    </asp:CreateUserWizard>                                                         
                         </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="modal-footer text-right">
                    <asp:Button runat="server" CssClass="btn btn-danger" ID="Button1" Text="Close" />
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <asp:Repeater ID="_rpt" runat="server">
            <ItemTemplate>
                <a href="PropertyDetails.aspx?PID=<%# Eval("PropertyID") %>">
                <div class="col-md-2">                   
                        <asp:Image ID="Image2" ImageUrl='<%# Eval("ImagePath") %>' runat="server" CssClass="imgSize" />                    
                    <br />
                </div>
                <div class="col-md-4">
                    <table class="table" >
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Property Name :</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("PropertyName") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Developer     :</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("Developer") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Floor Size    :</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("FloorSize") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Tenure        :</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("Tenure") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Property Type :</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("Type") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Property Price:</td>
                            <td class="text-right" style="padding:0px;border:none"><%# Eval("Price") %></td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold;padding:0px;border:none;">Posted On     :</td>
                            <td class="text-right" style="padding:0px;border:none;"><%# Eval("CreatedDate") %></td>
                        </tr>
                    </table>
                    <br />
                </div>
                </a>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer" runat="server">
</asp:Content>