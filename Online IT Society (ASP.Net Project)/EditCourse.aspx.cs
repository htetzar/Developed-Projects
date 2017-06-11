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

public partial class EditCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
            Response.Redirect("Trainer.aspx");
    }//go to trainer page;
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        DetailDS.DataBind();
        Response.Redirect("Trainer.aspx");
    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        DetailDS.DataBind();
    }
}
