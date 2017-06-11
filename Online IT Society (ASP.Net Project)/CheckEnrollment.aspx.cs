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

public partial class CheckEnrollment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Check Enrollment Page";//naming page title;
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Session["eid"] = e.CommandArgument;
        
        SqlDataSourceEnrollments.Delete();
    }
}
