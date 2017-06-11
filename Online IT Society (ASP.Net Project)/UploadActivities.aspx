<%@ Page Language="C#" MasterPageFile="~/MemberMasterPage.master" AutoEventWireup="true" CodeFile="UploadActivities.aspx.cs" Inherits="UploadActivities" Title="Upload Activities" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
   
    <style type="text/css">
        .style6
        {
            height: 31px;
        }
        .style2
        {
            color: #CC0000;
        }
        .style7
        {
            height: 31px;
            width: 135px;
        }
        .style8
        {
            width: 135px;
        }
        .style9
        {
            height: 31px;
            width: 137px;
        }
    </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <table style="width:100%; text-align: left;">
        <tr>
            <td align="center" colspan="2">
                <asp:Label ID="Label15" runat="server"  Font-Size="X-Large"  style="font-family: 'Californian FB'; font-weight: 700" Text="UPLOAD ACTIVITIES"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style40">
            </td>
            <td align="left">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style40" align="right">
                &nbsp;<asp:Label ID="Label1" runat="server" Text=" Type : " Font-Bold="True" 
                    Font-Size="Large"></asp:Label>
                <br />
                </td>
            <td align="left">
                <asp:DropDownList ID="ddlActivityType" runat="server" AutoPostBack="True" 
                    Width="150px" 
                    onselectedindexchanged="ddlActivityType_SelectedIndexChanged" 
                    Font-Bold="True">
                    <asp:ListItem Value="1" Selected="True">Seminar</asp:ListItem>
                    <asp:ListItem Value="2">Exhibition</asp:ListItem>
                    <asp:ListItem Value="3">Workshop</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        </table>

    <br />
    <asp:MultiView ID="MultiView1" runat="server">
    <br />
        <asp:View ID="View1" runat="server">
            <br />
            <table style="width: 100%;">
                <tr>
                    
                    <td align="center" class="style6">
                        &nbsp;
                        <asp:Label ID="Label16" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="UPLOAD SEMINAR"></asp:Label>
                    </td>
                   
                </tr>
            </table>
            <br/>
            <table align="right" style="width:100%;" 
                cellpadding="10px">
                <tr>
                    <td valign="top" align="right" class="style7">
                        <asp:Label ID="Label2" runat="server" Text="Title"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style6">
                        <asp:TextBox ID="txtSemTitle" runat="server" Width="180px" Height="80px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style6">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtSemTitle" ErrorMessage="Title is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style8">
                        <asp:Label ID="Label13" runat="server" Text="Presenter Name"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style43">
                        <asp:TextBox ID="txtSemPresenter" runat="server" Width="150px"></asp:TextBox>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtSemPresenter" ErrorMessage="Presenter Name is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style8">
                        <asp:Label ID="Label3" runat="server" Text="Place"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style43">
                        <asp:TextBox ID="txtSemPlace" runat="server" Width="180px" Height="80px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style9">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="txtSemPlace" ErrorMessage="Place is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style8">
                        <asp:Label ID="Label4" runat="server" Text="Date"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style33">
                        <asp:TextBox ID="txtSemDate" runat="server" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtSemDate_CalendarExtender" runat="server" 
                            TargetControlID="txtSemDate" Format="dd-MMM-yy">
                        </asp:CalendarExtender>
                        
                    </td>
                    <td class="style11">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="txtSemDate" ErrorMessage="Date is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator ID="CustValSeminarDate" runat="server" 
                            ErrorMessage="Must be today or later" ControlToValidate="txtSemDate" 
                            onservervalidate="CustValSeminarDate_ServerValidate" 
                            ValidationGroup="AllValidators"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style8">
                        <asp:Label ID="Label14" runat="server" Text="Start Time"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style34">
                        <asp:TextBox ID="txtSemStartTime" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlSemStartAMPM" runat="server" 
                            Height="22px" Width="46px">
                            <asp:ListItem Value="AM"></asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label22" runat="server" Text="eg. (12:00)"></asp:Label>
                    </td>
                    <td align="left" class="style13">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="txtSemStartTime" ErrorMessage="Start Time is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style7">
                        <asp:Label ID="Label5" runat="server" Text="Finish Time"></asp:Label>
                        <span class="style2">*</span></td>
                    <td class="style42">
                        <asp:TextBox ID="txtSemFinishTime" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlSemSemFinishAMPM" runat="server" 
                            Height="22px" Width="46px">
                            <asp:ListItem Value="AM"></asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label23" runat="server" Text="eg. (12:00)"></asp:Label>
                    </td>
                    <td align="left" class="style7">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="txtSemFinishTime" ErrorMessage="Finish Time is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="right" class="style7">
                        <asp:Label ID="Label18" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td class="style42">
                        <asp:TextBox ID="txtSemDescription" runat="server" Height="108px" 
                            TextMode="MultiLine" Width="209px"></asp:TextBox>
                    </td>
                    <td align="left" class="style7">
                        <asp:Label ID="lblStatusSeminar" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
        <br />
        <br />
        </asp:View>
        <br />
        <asp:View ID="View2" runat="server">
            <br />
            <table style="width: 100%;">
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td align="center">
                        &nbsp;
                        <asp:Label ID="Label19" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700"  Text="UPLOAD EXHIBITION OR WORKSHOP"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <table align="right" style="width:100%;" 
                cellpadding="10px">
                <tr>
                    <td valign="top" align="right" class="style18">
                        <asp:Label ID="Label6" runat="server" Text="Title"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style41">
                        <asp:TextBox ID="txtEWTitle" runat="server" Width="180px" Height="80px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style20">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="txtEWTitle" ErrorMessage="Title is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style21">
                        <asp:Label ID="Label7" runat="server" Text="Start Date"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style22">
                        <asp:TextBox ID="txtEWStartDate" runat="server" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtEWStartDate_CalendarExtender" runat="server" 
                            TargetControlID="txtEWStartDate" Format="dd-MMM-yy">
                        </asp:CalendarExtender>
                        
                    </td>
                    <td class="style23">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" 
                            ControlToValidate="txtEWStartDate" ErrorMessage="Start Date is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator2" runat="server" 
                            ControlToValidate="txtEWStartDate" 
                            ErrorMessage="Start date must be today or later." 
                            onservervalidate="CustomValidator2_ServerValidate" 
                            ValidationGroup="AllValidators"></asp:CustomValidator>
                        <br />
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style35">
                        <asp:Label ID="Label8" runat="server" Text="End Date"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style36">
                        <asp:TextBox ID="txtEWEndDate" runat="server" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtEWEndDate_CalendarExtender" runat="server" 
                            TargetControlID="txtEWEndDate" Format="dd-MMM-yy">
                        </asp:CalendarExtender>
                        
                    </td>
                    <td class="style37">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" 
                            ControlToValidate="txtEWEndDate" ErrorMessage="End Date is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" 
                            ControlToValidate="txtEWEndDate" ErrorMessage="Start date, End date no match" 
                            onservervalidate="CustomValidator1_ServerValidate" 
                            ValidationGroup="AllValidators"></asp:CustomValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style26" style="margin-left: 160px">
                        <asp:Label ID="Label9" runat="server" Text="Start Time"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style27">
                        <asp:TextBox ID="txtEWStartTime" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEWStartAMPM" runat="server">
                            <asp:ListItem>AM</asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label20" runat="server" Text="eg. (12:00)"></asp:Label>
                    </td>
                    <td align="left" class="style28">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" 
                            ControlToValidate="txtEWStartTime" ErrorMessage="Start Time is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style18" style="margin-left: 200px">
                        <asp:Label ID="Label10" runat="server" Text="Finish Time"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style41">
                        <asp:TextBox ID="txtEWFinishTime" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;&nbsp;
                        <asp:DropDownList ID="ddlEWFinishAMPM2" runat="server" 
                            Height="22px" Width="46px">
                            <asp:ListItem Value="AM"></asp:ListItem>
                            <asp:ListItem>PM</asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Label ID="Label21" runat="server" Text="eg. (12:00)"></asp:Label>
                    </td>
                    <td align="left" class="style20">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" 
                            ControlToValidate="txtEWFinishTime" ErrorMessage="Finish Time is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td align="right" class="style16" style="margin-left: 200px">
                        <asp:Label ID="Label11" runat="server" Text="Place"></asp:Label>
                        <span class="style2">*</span></td>
                    <td align="left" class="style17">
                        <asp:TextBox ID="txtEWPlace" runat="server" Width="180px" Height="80px" 
                            TextMode="MultiLine"></asp:TextBox>
                    </td>
                    <td class="style29">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                            ControlToValidate="txtEWPlace" ErrorMessage="Place is required." 
                            ValidationGroup="AllValidators"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td valign="top" align="right" class="style14" style="margin-left: 200px">
                        <asp:Label ID="Label12" runat="server" Text="Description"></asp:Label>
                    </td>
                    <td align="left" class="style15">
                        <asp:TextBox ID="txtEWDescription" runat="server" Height="140px" 
                            TextMode="MultiLine" Width="219px"></asp:TextBox>
                    </td>
                    <td>
                        <asp:Label ID="lblStatusExhibitionWS" runat="server"></asp:Label>
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </asp:View>
        <br />
    <br />
    </asp:MultiView>
    <br />

    <table style="width:100%;">
        <tr>
            <td>
                &nbsp;</td>
            <td align="center">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
                <asp:Button ID="btnPost" runat="server" Height="38px" Text="Post" 
                    Width="95px" AccessKey="p" onclick="btnPost_Click" 
                    ValidationGroup="AllValidators" />
                &nbsp;
                <asp:Button ID="btnCancel" runat="server" Height="38px" Text="Cancel" 
                    Width="95px" AccessKey="c" onclick="btnCancel_Click" />
            </td>
            <td style="font-weight: 700">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <br />
    <br />
</asp:Content>


