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

public partial class ViewReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        MultiView1.ActiveViewIndex = 0;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "1")
            MultiView1.ActiveViewIndex = -1;
        else if (DropDownList1.SelectedValue == "2")
            MultiView1.ActiveViewIndex = 0;
        else if (DropDownList1.SelectedValue == "3")
            MultiView1.ActiveViewIndex = 1;
        else if (DropDownList1.SelectedValue == "4")
            MultiView1.ActiveViewIndex = 2;
        else if (DropDownList1.SelectedValue == "5")
            MultiView1.ActiveViewIndex = 3;
    }
    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string rid = e.CommandArgument.ToString();
        Session["rid"] = rid;
        Response.Redirect("CreateTrainer.aspx");
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
