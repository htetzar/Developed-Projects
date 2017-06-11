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

public partial class MemberProfile : System.Web.UI.Page
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["Login"].ToString() == "aa")
        {
            Page.MasterPageFile = "~/MemberMasterPage.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView cv = (DataView)mypost_DS.Select(DataSourceSelectArguments.Empty);
        if (cv.Count == 0)
        {
            PanelCV.Visible = false;
        }
        DataView expo = (DataView)mypost_DS2.Select(DataSourceSelectArguments.Empty);
        if (expo.Count == 0)
        {
            PanelExpo.Visible = false;
        }
        DataView item = (DataView)mypost_DS3.Select(DataSourceSelectArguments.Empty);
        if (item.Count == 0)
        {
            PanelItem.Visible = false;
        }
        DataView job = (DataView)mypost_DS4.Select(DataSourceSelectArguments.Empty);
        if (job.Count == 0)
        {
            PanelJob.Visible = false;
        }
        DataView ss = (DataView)mypost_DS5.Select(DataSourceSelectArguments.Empty);
        {
            if (ss.Count == 0)
            {
                PanelSS.Visible = false;
            }
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}
