<%@ Page Language="C#" Debug="true" MasterPageFile="~/GuestMasterPage.master" AutoEventWireup="true" CodeFile="QuesANDAns.aspx.cs" Inherits="QuesANDAns" Title="Question and Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        #txtarea4
        {
            height: 83px;
            width: 341px;
        }
    
        #txtarea5
        {
            height: 83px;
            width: 341px;
        }
    
        #txtarea6
        {
            height: 83px;
            width: 341px;
        }
        
        .style4
        {
            height: 20px;
        }
        
        </style>
        <script type="text/javascript">
                function success()
        {
        	alert(" Data inserting  Sucessfully!");
            return true;
        }
        </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="questionID" 
    DataSourceID="QuesandAnsDB1" Width="515px" 
        onitemcommand="DataList1_ItemCommand">
        
        <ItemTemplate>
            
        
                <asp:Label ID="questionIDLabel" runat="server" Text='<%#Eval("questionID") %>' Visible="false"></asp:Label>
            <asp:Label ID="Label1" runat="server" Text="Ques" Font-Underline="true"></asp:Label>
                <br /><br /><asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' Font-Bold="true"></asp:Label>
                &nbsp;:&nbsp; &nbsp;<asp:Label ID="questionLabel" runat="server" Text='<%# Eval("question") %>' />
            
              
                  <br /><br /><br />
                       <u>Answers</u><br /><br />
              
              
                   
                       <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSourceAns">
                           <ItemTemplate>
                               
                               <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("username") %>' Font-Bold="true" />
                               &nbsp;:&nbsp;
                               
                               <asp:Label ID="answerLabel" runat="server" Text='<%# Eval("answer") %>' />
                               
                               
                               <%--<asp:Label ID="questionIDLabel" runat="server" 
                                   Text='<%# Eval("questionID") %>' />--%>
                               <br />
                               <br />
                           </ItemTemplate>
                       </asp:DataList>
                       
                       <asp:SqlDataSource ID="SqlDataSourceAns" runat="server" 
                           ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                           SelectCommand="SELECT Member.username, Answer.answer, Answer.questionID FROM Answer INNER JOIN Question ON Answer.questionID = Question.questionID INNER JOIN Member ON Answer.memberID = Member.memberID WHERE (Answer.questionID = @qid)">
                           <SelectParameters>
                               <asp:ControlParameter ControlID="questionIDLabel" Name="qid" 
                                   PropertyName="Text" />
                           </SelectParameters>
                       </asp:SqlDataSource>
             
            
                    <asp:Panel ID="answer" runat="server"  Visible='<%# isMember() %>' 
                        Width="366px">
                                        <u>Answer : </u><br /><br />
                                        <asp:TextBox ID="txtanswer" runat="server" Height="21px" 
                        Width="300px"></asp:TextBox>
                    <br />
                    <asp:Button ID="btnanswer" runat="server" onclick="btnanswer_Click1" 
                        Text="Post Your Answer"/>
                    </asp:Panel>
                        <br /><hr /><br />
                    
                
            
        </ItemTemplate>
        
    </asp:DataList>
            <asp:SqlDataSource ID="memDS" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
                SelectCommand="SELECT [email] FROM [Member]">
            </asp:SqlDataSource>
    <br />
    <asp:Label ID="labelquestion" runat="server">Enter Question</asp:Label><br />
        <asp:TextBox ID="txtquestion" runat="server" Height="21px" 
            Width="300px"></asp:TextBox>
        <br />
        <asp:Button ID="btnpostques" runat="server" onclick="btnpostques_Click" 
            Text="Post Your Question"/>
    <br />
    <br />
    <asp:SqlDataSource ID="QuesandAnsDB1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ITSocietyDBConnectionString %>" 
        SelectCommand="SELECT m.username,q.questionID,q.question FROM Question AS q ,Member AS m WHERE m.memberID=q.memberID">
</asp:SqlDataSource>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
        &nbsp;</p>

</asp:Content>

