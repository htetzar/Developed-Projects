using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PropertyDetails : System.Web.UI.Page
{
    aspnetdbEntities context;
    
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated)
        {
            this.MasterPageFile = "~/UserAdmin/UserAdmin.master";
        }
        else
        {
            this.MasterPageFile = "~/Anonymous.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new aspnetdbEntities();
        int pID = Convert.ToInt32(Request.QueryString["PID"]);
        DetailsView1.DataSource = context.Properties.Where(x => x.PropertyID == pID).ToList();
        DetailsView1.DataBind();
    }
}