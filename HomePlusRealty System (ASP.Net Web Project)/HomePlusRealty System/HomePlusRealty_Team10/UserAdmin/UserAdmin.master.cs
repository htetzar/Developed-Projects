using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Security.Principal;

public partial class UserAdmin_UserAdmin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        _txtUsername.Text = HttpContext.Current.User.Identity.Name;

    }

    protected void _lbSale_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserAdmin/PropertyList_UserAdmin.aspx");
    }
    protected void _logoutBtn_Click(object sender, EventArgs e)
    {
        FormsAuthentication.SignOut();
        _txtUsername.Text = "";
        Response.Redirect("~/PropertyList_Anonymous.aspx");
    }
}
