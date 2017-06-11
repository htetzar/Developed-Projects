<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        System.Web.UI.ScriptManager.ScriptResourceMapping.AddDefinition
    ("jquery",
     new System.Web.UI.ScriptResourceDefinition
     {
         Path = "~/Scripts/js/jquery.js",
         DebugPath = "~/Scripts/js/jquery.js",
         CdnPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.min.js",
         CdnDebugPath = "http://ajax.microsoft.com/ajax/jQuery/jquery-1.12.4.js"
     }
    );
    }

    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }

    protected void FormsAuthentication_OnAuthenticate(Object sender, FormsAuthenticationEventArgs e)
    {
        LogicUniversityController.LoginController loginController = new LogicUniversityController.LoginController();

        if (FormsAuthentication.CookiesSupported == true)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                try
                {
                    //let us take out the username now                
                    string userId = FormsAuthentication.Decrypt(Request.Cookies[FormsAuthentication.FormsCookieName].Value).Name;

                    //let us extract the roles from our own custom cookie
                    string roles = loginController.GetUser(userId).Role.RoleName;
                    //Let us set the Pricipal with our user specific details
                    e.User = new System.Security.Principal.GenericPrincipal(new System.Security.Principal.GenericIdentity(userId, "Forms"), roles.Split(';'));

                }
                catch (Exception)
                {
                    //somehting went wrong
                }
            }
        }
    }
</script>
