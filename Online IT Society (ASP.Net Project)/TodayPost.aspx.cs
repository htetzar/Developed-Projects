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

public partial class TodayPost : System.Web.UI.Page
{
    //Panel Choice
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView Item_dv = (DataView)Item_DS.Select(DataSourceSelectArguments.Empty);
        if (Item_dv.Count == 0)
        {
            ItemPanel.Visible = false;
        }
        DataView Job_dv = (DataView)Job_DS.Select(DataSourceSelectArguments.Empty);
        if (Job_dv.Count == 0)
        {
            JobPanel.Visible = false;
        }
        DataView Cv_dv = (DataView)CV_DS.Select(DataSourceSelectArguments.Empty);
        if (Cv_dv.Count == 0)
        {
            CVPanel.Visible = false;
        }
        DataView C_dv = (DataView)Center_DS.Select(DataSourceSelectArguments.Empty);
        if (C_dv.Count == 0)
        {
            CenterPanel.Visible = false;
        }
        DataView S_dv = (DataView)Seminer_DS.Select(DataSourceSelectArguments.Empty);
        if (S_dv.Count == 0)
        {
            SeminarPanel.Visible = false;
        }
        DataView Ex_dv = (DataView)Ex_DS.Select(DataSourceSelectArguments.Empty);
        if (Ex_dv.Count == 0)
        {
            ExhibitionPanel.Visible = false;
        }
    }


    #region To Detail Page


    protected void ItemLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string item_id = e.CommandArgument.ToString();
        Response.Redirect("ItemDetail.aspx?itemid=" +item_id);
    }  
    protected void JobLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string j_id = e.CommandArgument.ToString();
        Response.Redirect("Detail.aspx?jobid=" + j_id + "&type=jv");
    }
    protected void CvLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string cv_id = e.CommandArgument.ToString();
        Response.Redirect("Detail.aspx?cvid=" + cv_id + "&type=cv");
    }
    protected void CenterLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string c_id = e.CommandArgument.ToString();
        Response.Redirect("Detail.aspx?centerid=" + c_id + "&type=ss");
    }
    protected void SeminarLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string s_id = e.CommandArgument.ToString();
        Response.Redirect("Detail.aspx?seminarid=" + s_id + "&type=sem");
    }
    protected void ExhibitionLView_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        string ex_id = e.CommandArgument.ToString();
        Response.Redirect("Detail.aspx?ewid=" + ex_id + "&type=expo");
    }
    #endregion


}
