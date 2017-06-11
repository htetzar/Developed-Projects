<%@ Page Language="C#" MasterPageFile="~/AdminMasterPage.master" AutoEventWireup="true" CodeFile="TodayPost.aspx.cs" Inherits="TodayPost" Title="Today Post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br />
    <br />
    <asp:Panel ID="ItemPanel" runat="server">
        <h2 style="color: #FF6600">Items</h2>
       <br />
                <asp:ListView ID="ItemLView" runat="server" DataKeyNames="itemID" 
            DataSourceID="Item_DS" GroupItemCount="3" onitemcommand="ItemLView_ItemCommand">
                    <EmptyItemTemplate>
                        <td runat="server" />
                        </EmptyItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <asp:ImageButton ID="ImageButton1" runat="server" 
                                    CommandArgument='<%# Eval("itemID") %>' 
                                    ImageUrl='<%# "Handler.ashx?iid="+Eval("itemID") %>' Width="130px" />
                                <br />
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                <br />
                            </td>
                        </ItemTemplate>
                        <AlternatingItemTemplate>
                            <td runat="server" style="">
                                <asp:ImageButton ID="ImageButton2" runat="server" 
                                    CommandArgument='<%# Eval("itemID") %>' 
                                    ImageUrl='<%# "Handler.ashx?iid="+Eval("itemID") %>' Width="130px" />
                                <br />
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                <br />
                            </td>
                        </AlternatingItemTemplate>
                        <EmptyDataTemplate>
                            <table runat="server" style="">
                                <tr>
                                    <td>
                                        <%--No data was returned.--%></td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">
                                itemID:
                                <asp:TextBox ID="itemIDTextBox" runat="server" Text='<%# Bind("itemID") %>' />
                                <br />
                                photo:
                                <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                                <br />
                                Title:
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                                    Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Clear" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <LayoutTemplate>
                            <table runat="server">
                                <tr runat="server">
                                    <td runat="server">
                                        <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                            <tr ID="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr runat="server">
                                    <td runat="server" style="">
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="">
                                itemID:
                                <asp:Label ID="itemIDLabel1" runat="server" Text='<%# Eval("itemID") %>' />
                                <br />
                                photo:
                                <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
                                <br />
                                Title:
                                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                                    Text="Update" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                                    Text="Cancel" />
                                <br />
                            </td>
                        </EditItemTemplate>
                        <GroupTemplate>
                            <tr ID="itemPlaceholderContainer" runat="server">
                                <td ID="itemPlaceholder" runat="server">
                                </td>
                            </tr>
                        </GroupTemplate>
                        <SelectedItemTemplate>
                            <td runat="server" style="">
                                itemID:
                                <asp:Label ID="itemIDLabel" runat="server" Text='<%# Eval("itemID") %>' />
                                <br />
                                photo:
                                <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
                                <br />
                                Title:
                                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                    <br />
                <asp:SqlDataSource ID="Item_DS" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                    
                SelectCommand="SELECT itemID, photo, title+model as Title FROM Item WHERE (CONVERT (nvarchar, postedDate, 103) = CONVERT (nvarchar, GETDATE(), 103))">
                </asp:SqlDataSource>
                        <br />
        <hr />
    </asp:Panel>

        <asp:Panel ID="JobPanel" runat="server">
            <h2 style="color: #FF6600">Jobs</h2>
            <asp:ListView ID="JobLView" runat="server" DataKeyNames="jobID" 
                DataSourceID="Job_DS" onitemcommand="JobLView_ItemCommand">
                <ItemTemplate>

                    <asp:Image ID="Image1" runat="server" 
                        ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="120px" />
                       <br /> 
                                             
                            <span style="">&nbsp; <span>
                            <asp:LinkButton ID="LinkButton2" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("title") %>'></asp:LinkButton>
                            </span></span>
                  <br />

                           <span style="">&nbsp; <span>
                            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                            </span></span>
     
                    <br />
                    <br />
                </ItemTemplate>
                <AlternatingItemTemplate>
    
                    <asp:Image ID="Image2" runat="server" 
                        ImageUrl='<%# "Handler.ashx?jid="+Eval("jobID") %>' Width="120px" />
                      <br />
                   
                            <asp:LinkButton ID="LinkButton1" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("title") %>'></asp:LinkButton>
                        <br />
                        
                            <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>'></asp:Label>
                    <br />
                    <br />
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">jobID:
                    <asp:TextBox ID="jobIDTextBox" runat="server" Text='<%# Bind("jobID") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    category:
                    <asp:TextBox ID="categoryTextBox" runat="server" 
                        Text='<%# Bind("category") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
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
                        <span>
                           <span ID="itemPlaceholder" runat="server" />
                              <span style="">
                                    <br />                                    
                               </span>
                        </span>
                    </div>
                    <div style="">
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <span style="">jobID:
                    <asp:Label ID="jobIDLabel1" runat="server" Text='<%# Eval("jobID") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    category:
                    <asp:TextBox ID="categoryTextBox" runat="server" 
                        Text='<%# Bind("category") %>' />
                    <br />
                    postedDate:
                    <asp:TextBox ID="postedDateTextBox" runat="server" 
                        Text='<%# Bind("postedDate") %>' />
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
                    <span style="">jobID:
                    <asp:Label ID="jobIDLabel" runat="server" Text='<%# Eval("jobID") %>' />
                    <br />
                    logo:
                    <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    category:
                    <asp:Label ID="categoryLabel" runat="server" Text='<%# Eval("category") %>' />
                    <br />
                    postedDate:
                    <asp:Label ID="postedDateLabel" runat="server" 
                        Text='<%# Eval("postedDate") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="Job_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT [jobID], [logo], [title], [category], [postedDate] FROM [Job]
where convert(nvarchar,postedDate,103)=convert(nvarchar,getdate(),103)">
            </asp:SqlDataSource>
            <br />
            <hr />
        </asp:Panel>

        <asp:Panel ID="CVPanel" runat="server">
            <h2 style="color: #FF6600">
                CV Forms</h2>
            <br />
            <asp:ListView ID="CvLView" runat="server" DataKeyNames="cvID" 
                DataSourceID="CV_DS" onitemcommand="CvLView_ItemCommand">
                <ItemTemplate>
                    </span>
                    <asp:Image ID="Image4" runat="server" 
                        ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' Width="120px" />
                    <br />
                    <asp:LinkButton ID="LinkButton3" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("cvID") %>'></asp:LinkButton>
                    <br />
                    <asp:Label ID="qualificationLabel" runat="server" 
                        Text='<%# Eval("qualification") %>' />
                    <br />
                    <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>' />
                    <br />
                    <br />
                </ItemTemplate>
                <AlternatingItemTemplate>
                     </span>
                     <asp:Image ID="Image5" runat="server" 
                         ImageUrl='<%# "Handler.ashx?cvid="+Eval("cvID") %>' Width="120px" />
                     <br />
                     <asp:LinkButton ID="LinkButton4" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("cvID") %>'></asp:LinkButton>
                     <br />
                     <asp:Label ID="qualificationLabel" runat="server" 
                         Text='<%# Eval("qualification") %>' />
                     <br />
                     <asp:Label ID="otherQualLabel" runat="server" Text='<%# Eval("otherQual") %>'></asp:Label>
                     <br />
                     <br />
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">cvID:
                    <asp:TextBox ID="cvIDTextBox" runat="server" Text='<%# Bind("cvID") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                    <span style="">cvID:
                    <asp:Label ID="cvIDLabel1" runat="server" Text='<%# Eval("cvID") %>' />
                    <br />
                    photo:
                    <asp:TextBox ID="photoTextBox" runat="server" Text='<%# Bind("photo") %>' />
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
                    photo:
                    <asp:Label ID="photoLabel" runat="server" Text='<%# Eval("photo") %>' />
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
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="CV_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT cvID, photo, title, qualification, otherQual FROM CV WHERE (CONVERT (nvarchar, postedDate, 103) = CONVERT (nvarchar, GETDATE(), 103))">
            </asp:SqlDataSource>
  
            <br />
            <hr />
  
        </asp:Panel>
          <br />
        <asp:Panel ID="CenterPanel" runat="server">
            <h2 style="color: #FF6600">
                Sale &amp; Service Centers</h2>
            <br />
            <asp:ListView ID="CenterLView" runat="server" DataKeyNames="centerID" 
                DataSourceID="Center_DS" onitemcommand="CenterLView_ItemCommand">
                <ItemTemplate>
                    <asp:Image ID="Image6" runat="server" 
                        ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' Width="120px" />
                    <br />
                    <asp:LinkButton ID="LinkButton6" runat="server" 
                        Text='<%# Eval("centerName") %>' CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton>
                    <br />
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                    <br />
                    <br />
                    <div style="">
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <asp:Image ID="Image5" runat="server" 
                        ImageUrl='<%# "Handler.ashx?cid="+Eval("centerID") %>' Width="120px" />
                    <br />
                    <asp:LinkButton ID="LinkButton5" runat="server" 
                        Text='<%# Eval("centerName") %>' CommandArgument='<%#Eval("centerID") %>'></asp:LinkButton>
                    <br />
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>'></asp:Label>
                    <br />
                    <br />
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">centerID:
                    <asp:TextBox ID="centerIDTextBox" runat="server" 
                        Text='<%# Bind("centerID") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    centerName:
                    <asp:TextBox ID="centerNameTextBox" runat="server" 
                        Text='<%# Bind("centerName") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
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
                        <span style=""><span ID="itemPlaceholder" runat="server"></span></span></span>
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <span style="">centerID:
                    <asp:Label ID="centerIDLabel1" runat="server" Text='<%# Eval("centerID") %>' />
                    <br />
                    logo:
                    <asp:TextBox ID="logoTextBox" runat="server" Text='<%# Bind("logo") %>' />
                    <br />
                    centerName:
                    <asp:TextBox ID="centerNameTextBox" runat="server" 
                        Text='<%# Bind("centerName") %>' />
                    <br />
                    address:
                    <asp:TextBox ID="addressTextBox" runat="server" Text='<%# Bind("address") %>' />
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
                    <span style="">centerID:
                    <asp:Label ID="centerIDLabel" runat="server" Text='<%# Eval("centerID") %>' />
                    <br />
                    logo:
                    <asp:Label ID="logoLabel" runat="server" Text='<%# Eval("logo") %>' />
                    <br />
                    centerName:
                    <asp:Label ID="centerNameLabel" runat="server" 
                        Text='<%# Eval("centerName") %>' />
                    <br />
                    address:
                    <asp:Label ID="addressLabel" runat="server" Text='<%# Eval("address") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="Center_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                
                SelectCommand="SELECT centerID, logo, centerName, address FROM SaleandServiceCenter WHERE (CONVERT (nvarchar, postedDate, 103) = CONVERT (nvarchar, GETDATE(), 103))">
            </asp:SqlDataSource>
            <br />
            <hr />
        </asp:Panel>
    <br />    
        <asp:Panel ID="SeminarPanel" runat="server">
            <h2 style="color: #FF6600">
                Seminars</h2>
            <br />
            <asp:ListView ID="SeminarLView" runat="server" DataKeyNames="seminarID" 
                DataSourceID="Seminer_DS" onitemcommand="SeminarLView_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton8" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("seminarID") %>'></asp:LinkButton>
                    <br />
                    place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                    <br />
                    seminarDate:
                    <asp:Label ID="seminarDateLabel" runat="server" 
                        Text='<%# Eval("seminarDate", "{0:D}") %>'></asp:Label>
                    <br />
                    <br />
                    <div style="">
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <asp:LinkButton ID="LinkButton7" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("seminarID") %>'></asp:LinkButton>
                    <br />
                    place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                    <br />
                    seminarDate:
                    <asp:Label ID="seminarDateLabel" runat="server" 
                        Text='<%# Eval("seminarDate", "{0:D}") %>'></asp:Label>
                    <br />
                    <br />
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">seminarID:
                    <asp:TextBox ID="seminarIDTextBox" runat="server" 
                        Text='<%# Bind("seminarID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    seminarDate:
                    <asp:TextBox ID="seminarDateTextBox" runat="server" 
                        Text='<%# Bind("seminarDate") %>' />
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
                        <span style=""><span ID="itemPlaceholder" runat="server"></span></span></span>
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <span style="">seminarID:
                    <asp:Label ID="seminarIDLabel1" runat="server" 
                        Text='<%# Eval("seminarID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    seminarDate:
                    <asp:TextBox ID="seminarDateTextBox" runat="server" 
                        Text='<%# Bind("seminarDate") %>' />
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
                    <span style="">seminarID:
                    <asp:Label ID="seminarIDLabel" runat="server" Text='<%# Eval("seminarID") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
                    <br />
                    seminarDate:
                    <asp:Label ID="seminarDateLabel" runat="server" 
                        Text='<%# Eval("seminarDate") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="Seminer_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT seminarID, title, place, seminarDate FROM Seminar WHERE (CONVERT (nvarchar, postedDate, 103) = CONVERT (nvarchar, GETDATE(), 103))">
            </asp:SqlDataSource>
            <br />
            <hr />
        </asp:Panel>
        <br />
        <asp:Panel ID="ExhibitionPanel" runat="server">
            <h2 style="color: #FF6600">
                ExhibitionWS</h2>
            <br />
            <asp:ListView ID="ExhibitionLView" runat="server" DataKeyNames="ewID" 
                DataSourceID="Ex_DS" onitemcommand="ExhibitionLView_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton10" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("ewID") %>'></asp:LinkButton>
                    <br />
                    Place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                    <br />
                    Date:
                    <asp:Label ID="startDateLabel" runat="server" 
                        Text='<%# Eval("startDate", "{0:D}") %>'></asp:Label>
                    &nbsp;to
                    <asp:Label ID="endDateLabel" runat="server" 
                        Text='<%# Eval("endDate", "{0:D}") %>'></asp:Label>
                    <br />
                    <br />
                    <div style="">
                    </div>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <asp:LinkButton ID="LinkButton9" runat="server" Text='<%# Eval("title") %>' CommandArgument='<%#Eval("ewID") %>'></asp:LinkButton>
                    <br />
                    Place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>'></asp:Label>
                    <br />
                    Date:
                    <asp:Label ID="startDateLabel" runat="server" 
                        Text='<%# Eval("startDate", "{0:D}") %>'></asp:Label>
                    &nbsp;to
                    <asp:Label ID="endDateLabel" runat="server" 
                        Text='<%# Eval("endDate", "{0:D}") %>'></asp:Label>
                    <br />
                    <br />
                </AlternatingItemTemplate>
                <EmptyDataTemplate>
                    <span>No data was returned.</span>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <span style="">ewID:
                    <asp:TextBox ID="ewIDTextBox" runat="server" Text='<%# Bind("ewID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    startDate:
                    <asp:TextBox ID="startDateTextBox" runat="server" 
                        Text='<%# Bind("startDate") %>' />
                    <br />
                    endDate:
                    <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
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
                        <span style=""><span ID="itemPlaceholder" runat="server"></span></span></span>
                    </div>
                </LayoutTemplate>
                <EditItemTemplate>
                    <span style="">ewID:
                    <asp:Label ID="ewIDLabel1" runat="server" Text='<%# Eval("ewID") %>' />
                    <br />
                    title:
                    <asp:TextBox ID="titleTextBox" runat="server" Text='<%# Bind("title") %>' />
                    <br />
                    place:
                    <asp:TextBox ID="placeTextBox" runat="server" Text='<%# Bind("place") %>' />
                    <br />
                    startDate:
                    <asp:TextBox ID="startDateTextBox" runat="server" 
                        Text='<%# Bind("startDate") %>' />
                    <br />
                    endDate:
                    <asp:TextBox ID="endDateTextBox" runat="server" Text='<%# Bind("endDate") %>' />
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
                    <span style="">ewID:
                    <asp:Label ID="ewIDLabel" runat="server" Text='<%# Eval("ewID") %>' />
                    <br />
                    title:
                    <asp:Label ID="titleLabel" runat="server" Text='<%# Eval("title") %>' />
                    <br />
                    place:
                    <asp:Label ID="placeLabel" runat="server" Text='<%# Eval("place") %>' />
                    <br />
                    startDate:
                    <asp:Label ID="startDateLabel" runat="server" Text='<%# Eval("startDate") %>' />
                    <br />
                    endDate:
                    <asp:Label ID="endDateLabel" runat="server" Text='<%# Eval("endDate") %>' />
                    <br />
                    <br />
                    </span>
                </SelectedItemTemplate>
            </asp:ListView>
            <asp:SqlDataSource ID="Ex_DS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT ewID, title, place, startDate, endDate FROM ExhibitionWS WHERE (CONVERT (nvarchar, postedDate, 103) = CONVERT (nvarchar, GETDATE(), 103))">
            </asp:SqlDataSource>
            <br />
            <hr />
        </asp:Panel>
        <p>
            &nbsp;</p>
<br />
</asp:Content>

