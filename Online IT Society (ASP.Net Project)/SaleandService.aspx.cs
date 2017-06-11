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
using System.Data.SqlClient;

public partial class SaleandService : System.Web.UI.Page
{
    public static int centerid;
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
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Sales and Services Center";
        Session["datetime"] = DateTime.Now.Day - 14;
        Session["date"] = DateTime.Now;
    }
    protected void listViewSAS_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        //SqlConnection SASDB2 = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
        //SqlCommand cmd = new SqlCommand("Select centerID from SaleandServiceCenter ", SASDB2);
        //SASDB2.Open();
        //SqlDataReader reader = cmd.ExecuteReader();
        //if (reader.Read())
        //{
        //    centerid = int.Parse(reader[0].ToString());
        //}

        if (e.CommandName == "sasdetail")
        {
            Response.Redirect("Detail.aspx?type=ss&centerid=" + e.CommandArgument);
        }
    }
}
