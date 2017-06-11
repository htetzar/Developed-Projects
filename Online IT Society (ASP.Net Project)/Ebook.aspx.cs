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

public partial class Ebook : System.Web.UI.Page
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
    protected string desclength(object d)
    {
        string s = d.ToString();
        if (s.Length > 200)
        {
            string ss = s.Substring(0, 200);
            return ss + "...";
        }
        else
            return s + "...";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void EbookListView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "eb";
        Response.Redirect("~/DownloadDetail.aspx?type=" + page + "&bookid=" + id);
    }
}
