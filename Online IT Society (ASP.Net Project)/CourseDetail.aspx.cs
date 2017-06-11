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

public partial class CourseDetail : System.Web.UI.Page
{
    string tid;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["login"].ToString() != "")
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
        tid = Request.QueryString["tid"];
    }


    protected void lbtnEnroll_Click(object sender, EventArgs e)
    {
        DataView dv=(DataView)CourseDS.Select(DataSourceSelectArguments.Empty);
        {
            foreach (DataRowView dr in dv)
            {
                if (DateTime.Today >= DateTime.Parse(dr[5].ToString()))  //Check Enroll Date with Start Date

                    lblMsg.Text = "This course can't enroll now!!";

                else
                    Response.Redirect("~/Enroll.aspx?cid=" + dr[7].ToString());
            }
        }
        
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/TrainingDetail.aspx?tid=" + tid);
    }
}
