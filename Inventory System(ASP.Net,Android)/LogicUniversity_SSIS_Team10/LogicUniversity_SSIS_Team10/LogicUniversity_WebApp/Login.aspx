<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LogicUniversity_WebApp.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
    <title>Login</title>
    <link href="Scripts/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background-image: url("img/bg2.jpg");
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" ID="sm"></asp:ScriptManager>
        <div class="container"><br />
            <div class="row vertical-offset-100">
                <div class="col-md-4 col-md-offset-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h2 class="panel-title">Please login to access.....</h2>
                        </div>
                        <div class="panel-body">
                            <fieldset>
                                <div class="form-group">
                                    <%--<input class="form-control" placeholder="Username" name="id" type="text"/>--%>
                                    <asp:TextBox ID="txtBoxUserName" CssClass="form-control" runat="server" placeholder="Username"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <%--<input class="form-control" placeholder="Password" name="password" type="password" value=""/>--%>
                                    <asp:TextBox ID="txtBoxPassword" CssClass="form-control" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                                </div>
                                <%--<input class="btn btn-lg btn-success btn-block" type="submit" value="Login"/>--%>
                                <asp:Button ID="btnLogin" CssClass="btn btn-lg btn-success btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" /><br />
                                <div class="alert alert-danger" role="alert" runat="server" id="alertLogin">
                                    <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
                                    <span class="sr-only">Error:</span>
                                    Login Failed! Try again!
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="Scripts/js/bootstrap.min.js"></script>
</body>
</html>
