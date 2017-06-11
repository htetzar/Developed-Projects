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

public partial class homeItem : System.Web.UI.Page
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

    protected void Page_LoadComplete(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlpost.SelectedIndex = 0;

            lvVisible(true, lvItem);
            lvVisible(false, lvNews, lvJob, lvExpoWS, lvCenter, lvSeminar);

            pagerVisible(true, itemDP);
            pagerVisible(false, newsDP, jobDP, expowsDP, centerDP, semDP);

            hyperlinkVisible(true, hlItem);
            hyperlinkVisible(false, hlNews, hlJob, hlExpo, hlCenter, hlSem);
        }
    }

    //show part of news
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

    //show only date
    protected string shortdate(object pd)
    {
        DateTime d = Convert.ToDateTime(pd.ToString());

        string sdate = d.ToLongDateString();
        return sdate;
    }


    //chosing posts
    protected void ddlpost_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlpost.SelectedValue == "News")
        {
            lvVisible(true, lvNews);
            lvVisible(false, lvItem, lvJob, lvExpoWS, lvCenter, lvSeminar);

            pagerVisible(true, newsDP);
            pagerVisible(false, itemDP, jobDP, expowsDP, centerDP, semDP);

            hyperlinkVisible(true, hlNews);
            hyperlinkVisible(false, hlItem, hlJob, hlExpo, hlCenter, hlSem);
        }
        else if (ddlpost.SelectedValue == "Available Items")
        {
            lvVisible(true, lvItem);
            lvVisible(false, lvNews, lvJob, lvExpoWS, lvCenter, lvSeminar);

            pagerVisible(true, itemDP);
            pagerVisible(false,newsDP, jobDP, expowsDP, centerDP, semDP);

            hyperlinkVisible(true, hlItem);
            hyperlinkVisible(false,hlNews, hlJob, hlExpo, hlCenter, hlSem);
        }
        else if (ddlpost.SelectedValue == "Job Vacancies")
        {
            lvVisible(true, lvJob);
            lvVisible(false, lvNews, lvItem, lvExpoWS, lvCenter, lvSeminar);

            pagerVisible(true, jobDP);
            pagerVisible(false, newsDP, itemDP, expowsDP, centerDP, semDP);

            hyperlinkVisible(true, hlJob);
            hyperlinkVisible(false, hlNews, hlItem, hlExpo, hlCenter, hlSem);
        }
        else if (ddlpost.SelectedValue == "Sale and Service Centers")
        {
            lvVisible(true, lvCenter );
            lvVisible(false, lvNews, lvItem, lvExpoWS,lvJob , lvSeminar);

            pagerVisible(true,centerDP );
            pagerVisible(false, newsDP, itemDP, expowsDP, jobDP, semDP);

            hyperlinkVisible(true,hlCenter );
            hyperlinkVisible(false, hlNews, hlItem, hlExpo, hlJob, hlSem);
        }
        else if (ddlpost.SelectedValue == "Seminar")
        {
            lvVisible(true,lvSeminar );
            lvVisible(false, lvNews, lvItem, lvExpoWS, lvJob, lvCenter);

            pagerVisible(true,semDP );
            pagerVisible(false, newsDP, itemDP, expowsDP, jobDP, centerDP);

            hyperlinkVisible(true,hlSem );
            hyperlinkVisible(false, hlNews, hlItem, hlExpo, hlJob, hlCenter);
        }
        else if (ddlpost.SelectedValue == "Exhibition/Workshop")
        {
            lvVisible(true,lvExpoWS );
            lvVisible(false, lvNews, lvItem, lvSeminar, lvJob, lvCenter);

            pagerVisible(true,expowsDP );
            pagerVisible(false, newsDP, itemDP, semDP, jobDP, centerDP);

            hyperlinkVisible(true,hlExpo );
            hyperlinkVisible(false, hlNews, hlItem, hlSem, hlJob, hlCenter);
        }
    }

    #region visibility of ctrl

    private void lvVisible(bool status, params ListView[] lvs)
    {
        foreach (ListView lv in lvs)
        {
            lv.Visible = status;
        }
    }

    private void pagerVisible(bool status, params DataPager[] dpr)
    {
        foreach (DataPager dp in dpr)
        {
            dp.Visible = status;
        }
    }

    private void hyperlinkVisible(bool status, params HyperLink[] hpl)
    {
        foreach (HyperLink hl in hpl)
        {
            hl.Visible = status;
        }
    }

    #endregion

    #region go to detail page
    protected void lvNews_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "nws";
        Response.Redirect("~/Detail.aspx?type=" + page + "&newsid=" + id);
    }

    
    protected void lvItem_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "itm";
        Response.Redirect("~/ItemDetail.aspx?itemid=" + id);
    }

    protected void lvJob_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "jv";
        Response.Redirect("~/Detail.aspx?type=" + page + "&jobid=" + id);

    }

    protected void lvExpoWS_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "expo";
        Response.Redirect("~/Detail.aspx?type=" + page + "&ewid=" + id);

    }

    protected void lvSeminar_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "sem";
        Response.Redirect("~/Detail.aspx?type=" + page + "&seminarid=" + id);

    }

    protected void lvCenter_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string id = e.CommandArgument.ToString();
        string page = "ss";
        Response.Redirect("~/Detail.aspx?type=" + page + "&centerid=" + id);

    }
#endregion


}
