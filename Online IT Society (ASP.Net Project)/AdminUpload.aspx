<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="AdminUpload.aspx.cs" Inherits="AdminUpload" Title="Admin Upload" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>

    <br />

        <table style="width:100%;">
            <tr>
                <td align="right" width="33%">
                    <asp:Label ID="Label1" runat="server" Text="Choose type to upload  : "></asp:Label>
                </td>
                <td height="50px">
                    <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" Height="20px" 
                        onselectedindexchanged="ddlType_SelectedIndexChanged" Width="128px">
                        <asp:ListItem Value="Ebook">Ebook</asp:ListItem>
                        <asp:ListItem Value="News">News</asp:ListItem>
                        <asp:ListItem Value="Software">Software</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td width="33%">
                    &nbsp;</td>
            </tr>
        </table>

        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <br />
            <br />
            <asp:View ID="View1" runat="server">
                <br />
                <br />
                <table width="100%">
                    <tr>
                        <td width="33%" align="right">
                            &nbsp;</td>
                        <td height="50px" align="left">
                            <asp:Label ID="Label2" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="Upload Ebook"></asp:Label>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    </table>
                <br />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp; Title:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtEBTitle" runat="server" Width="225px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtEBTitle" ErrorMessage="*" SetFocusOnError="True" 
                                ToolTip="Title required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; Author:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtAuthor" runat="server" Width="225px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ControlToValidate="txtAuthor" ErrorMessage="*" SetFocusOnError="True" 
                                ToolTip="Author required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; Ebook:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="fupEbook" runat="server" Width="218px" />
                            <br />
                            <asp:Button ID="btnbookupload" runat="server" onclick="btnbookupload_Click" 
                                Text="Upload" />
                            &nbsp;
                            <asp:Label ID="lblbshow" runat="server" ForeColor="Blue"></asp:Label>
                            <asp:Label ID="lblbook" runat="server" ForeColor="Blue" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp; Photo:</td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:FileUpload ID="fupEBPhoto" runat="server" Width="218px" />
                            <br />
                            <asp:Button ID="btnEBphoto" runat="server" onclick="btnEBphoto_Click" 
                                Text="Upload Photo" Width="96px" />
                            <br />
                            <asp:Image ID="imgEbook" runat="server" Width="110px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnUploadEB" runat="server" onclick="btnUploadEB_Click" 
                                Text="Upload Ebook" Width="100px" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:Button ID="btnCancelEbook" runat="server" onclick="btnCancelEbook_Click" 
                                Text="Cancel" Width="70px" />
                        </td>
                    </tr>
                </table>
                    <asp:SqlDataSource ID="EbookID_DS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT MAX(bookID) AS BID FROM Ebook"></asp:SqlDataSource>
                    <br />
                  
                <br />
                <br />
            </asp:View>
            <br />
            <asp:View ID="View2" runat="server">
                <br />
                <table style="width:100%;">
                    <tr>
                        <td width="33%" align="right">
                            &nbsp;</td>
                        <td height="50px" align="left">
                            <asp:Label ID="Label3" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="Upload News"></asp:Label>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    </table>
                    <br />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp; Title:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtNews" runat="server" Width="225px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                ControlToValidate="txtNews" ErrorMessage="*" SetFocusOnError="True" 
                                ToolTip="Title required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp; News Description:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtNewsDes" runat="server" Height="55px" TextMode="MultiLine" 
                                Width="224px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                ControlToValidate="txtNewsDes" ErrorMessage="*" SetFocusOnError="True" 
                                ToolTip="News Description required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; Photo:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="fupNews" runat="server" />
                            <br />
                            <asp:Button ID="btnNewPhoto" runat="server" onclick="btnNewPhoto_Click" 
                                Text="Upload Photo" Width="93px" />
                            <br />
                            <asp:Image ID="imgNews" runat="server" style="margin-top: 0px" Width="110px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnUploadNews" runat="server" Height="26px" 
                                onclick="btnUploadNews_Click" Text="Upload News" Width="94px" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:Button ID="btnCancelNews" runat="server" onclick="btnCancelNews_Click" 
                                Text="Cancel" Width="70px" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="NewidDs" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT MAX(newsID) AS NID FROM News"></asp:SqlDataSource>
                <br />
            </asp:View>
            <br />
            <asp:View ID="View3" runat="server">
                <br />
                <br />
                <table style="width:100%;">
                    <tr>
                        <td width="33%" align="right">
                            &nbsp;</td>
                        <td height="50px" align="left">
                            <asp:Label ID="Label4" runat="server" Font-Size="X-Large" ForeColor="#0000CC" 
                                style="font-family: 'Californian FB'; font-weight: 700" Text="Upload Software"></asp:Label>
                        </td>
                        <td width="33%">
                            &nbsp;</td>
                    </tr>
                    </table>
                    <br />
                <table style="width: 100%;">
                    <tr>
                        <td>
                            &nbsp; Title:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtSWtitle" runat="server" Width="225px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                ControlToValidate="txtSWtitle" ErrorMessage="*" SetFocusOnError="True" 
                                ToolTip="Title required"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;&nbsp; Description:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:TextBox ID="txtSWDes" runat="server" Height="55px" TextMode="MultiLine" 
                                Width="224px"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                ControlToValidate="txtSWDes" SetFocusOnError="True" ErrorMessage="*" 
                                ToolTip="Description required."></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; Software:</td>
                        <td>
                            &nbsp;
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="fupSW" runat="server" />
                            <br />
                            <asp:Button ID="btnswupload" runat="server" onclick="btnswupload_Click" 
                                Text="Upload" />
                            &nbsp;
                            <asp:Label ID="lblswshow" runat="server" ForeColor="#0033CC"></asp:Label>
                            <asp:Label ID="lblsw" runat="server" ForeColor="#0033CC" Visible="False"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp; Photo:&nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:FileUpload ID="fupSWphoto" runat="server" />
                            <br />
                            <asp:Button ID="btnSWPhoto" runat="server" onclick="btnSWPhoto_Click" 
                                Text="Upload Photo" />
                            <br />
                            <asp:Image ID="imgSW" runat="server" Width="110px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnUploadSW" runat="server" onclick="btnUploadSW_Click" 
                                Text="Upload Software" Width="112px" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td align="left">
                            <asp:Button ID="btnCancelSW" runat="server" onclick="btnCancelSW_Click" 
                                Text="Cancel" Width="70px" />
                        </td>
                    </tr>
                </table>
                <asp:SqlDataSource ID="AdUpSWid_DS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    SelectCommand="SELECT MAX(softwareID) AS swID FROM Software">
                </asp:SqlDataSource>
                <br />
            </asp:View>
            <br />
        </asp:MultiView>
    
    <br />
    
    </div>
</asp:Content>

