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

public partial class ContactUs : System.Web.UI.Page
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
    //protected void Page_Load(object sender, EventArgs e)
    //{

    //}
    //protected void btnsubmit_Click(object sender, EventArgs e)
    //{
    //    int i = 0;
    //    try
    //    {
    //        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
    //        foreach (DataRowView dr in dv)
    //        {
    //            i = int.Parse(dr[0].ToString());
    //            break;
    //        }
    //        i++;
    //    }
    //    catch
    //    {
    //        i = 1;
    //    }
    //    Session["id"] = i.ToString();
    //    SqlDataSource2.Insert();
    //}
    //protected void btnCancel_Click(object sender, EventArgs e)
    //{
    //    txtname.Text = "";
    //    txtAdd.Text = "";
    //    txtEmail.Text = "";
    //    txtCity.Text = "";
    //    ddlregion.ClearSelection();
    //    txtph.Text = "";
    //    txtEnquiry.Text = "";

    //}
}
