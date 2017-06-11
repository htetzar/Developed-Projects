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

public partial class AdvanceSearch : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["mid"].ToString() != "")
        {
            Page.MasterPageFile = "~/MemberMasterPage.master";
        }

        else
        {
            Page.MasterPageFile = "~/GuestMasterPage.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string type = Request.QueryString["type"];
        if (type == "fs")
        {
            
            MultiView1.SetActiveView(ViewFS);

        }
        else if (type == "jv")
        {
            MultiView1.SetActiveView(ViewJV);
        }
        else if (type == "cv")
        {
            MultiView1.SetActiveView(ViewCV);
        }
        else if (type == "tra")
        {
            MultiView1.SetActiveView(ViewTr);
        }
        else if (type == "ss")
        {
            MultiView1.SetActiveView(ViewSS);
        }
        else if (type == "eb")
        {
            MultiView1.SetActiveView(ViewEbook);
        }
        else if (type == "sw")
        {
            MultiView1.SetActiveView(ViewSW);
        }
    }
    protected void ListViewSS_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("Detail.aspx?type=ss&centerid=" + e.CommandArgument);
    }
    protected void LiseViewItem_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("ItemDetail.aspx?itemid=" + e.CommandArgument);
    }
    protected void ListViewJV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("Detail.aspx?type=jv&jobid=" + e.CommandArgument);
    }
    protected void ListViewTraining_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("TrainingDetail.aspx?tid=" + e.CommandArgument);
    }
    protected void ListViewCV_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("Detail.aspx?type=cv&cvid=" + e.CommandArgument);
    }

    protected void ListViewSW_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("~/DownloadDetail.aspx?type=sw&softwareid=" + e.CommandArgument);
    }
    protected void ListViewEbook_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        Response.Redirect("~/DownloadDetail.aspx?type=eb&bookid=" + e.CommandArgument);
    }
}
