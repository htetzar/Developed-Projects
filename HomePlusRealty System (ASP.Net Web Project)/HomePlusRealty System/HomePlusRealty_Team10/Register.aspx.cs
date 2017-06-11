using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
    {
        string username = CreateUserWizard1.UserName;
        string password = CreateUserWizard1.Password;

        if (Membership.ValidateUser(username, password))
        {
            FormsAuthentication.SetAuthCookie(username, false);
            Response.Redirect("~/UserAdmin/PropertyList_UserAdmin.aspx");
        }

    }
}