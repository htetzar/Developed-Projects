using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Successful : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["mid"].ToString() != "")
        {
            Page.MasterPageFile = "~/MemberMasterPage.master";
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            Page.MasterPageFile = "~/AdminMasterPage.master";
        }

        else
        {
            Page.MasterPageFile = "~/GuestMasterPage.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["page"].ToString() == "register")
            lblmsg.Text = "Welcome, " + Session["username"] + ". Thank you for registeration. Now, you can login with your email " + Session["email"] + ".";
        else if (Session["page"].ToString() == "enroll")
            lblmsg.Text = "Welcome, you are successfully enrolled.";
        else if (Session["page"].ToString()=="purchase")
            lblmsg.Text = "Thank you for purchasing.";
    }
}
