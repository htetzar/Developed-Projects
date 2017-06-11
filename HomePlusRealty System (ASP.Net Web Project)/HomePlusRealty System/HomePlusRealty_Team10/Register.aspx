<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <link rel="stylesheet" href="App_Themes/login.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="containerReg">
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" OnCreatedUser="CreateUserWizard1_CreatedUser">
            <WizardSteps>               
                <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server">
                    <CustomNavigationTemplate>
                        <table border="0" cellspacing="5" style="width:100%;height:100%;">
                            <tr align="right">
                                <td align="right" colspan="0">
                                    <asp:Button class="Button" ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="CreateUserWizard1" />
                                </td>
                            </tr>
                        </table>
                    </CustomNavigationTemplate>
                </asp:CreateUserWizardStep>                    
                <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server">
                </asp:CompleteWizardStep>
            </WizardSteps>
            <FinishNavigationTemplate>
                <asp:Button class="Button" ID="FinishPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious" Text="Previous" />
                <asp:Button class="Button" ID="FinishButton" runat="server" CommandName="MoveComplete" Text="Finish" />
            </FinishNavigationTemplate>
        </asp:CreateUserWizard>
    </div>
    </form>
</body>
</html>
