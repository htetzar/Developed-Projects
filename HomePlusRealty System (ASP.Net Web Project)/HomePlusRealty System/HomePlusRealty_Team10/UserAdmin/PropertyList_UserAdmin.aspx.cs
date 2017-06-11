using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class UserAdmin_PropertyList_UserAdmin : System.Web.UI.Page
{
    aspnetdbEntities context = new aspnetdbEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Binding();
    }
    public void Binding()
    {
        //Testing
        if (User.IsInRole("Admin"))
        {
            var _p = context.Properties.ToList();
            _dataGrid.DataSource = _p;
            _dataGrid.DataBind();
        }
        else
        {
            string user = User.Identity.Name;
            var _p = context.Properties.Where(x => x.UserName == user).ToList();
            _dataGrid.DataSource = _p;
            _dataGrid.DataBind();
        }
    }
    protected void _dataGrid_ItemCommand(object source, DataGridCommandEventArgs e)
    { 
        int propertyID = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "View")
        {
                Response.Redirect("~/PropertyDetails.aspx?PID=" + propertyID);
        }
        else if (e.CommandName == "Edit")
        {
            Response.Redirect("~/UserAdmin/UpdateProperty.aspx?PID=" + propertyID);
        }
        else if (e.CommandName == "Delete")
        {
            Property deleteProperty = context.Properties.Where(x => x.PropertyID == propertyID).FirstOrDefault();
            try
            {
                context.Properties.Remove(deleteProperty);
                context.SaveChanges();
                Binding();
            }
            catch (Exception ex)
            {
                Response.Write("Delete Fail!" + ex);
            }
       }
    }

    protected void btnNew_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserAdmin/NewProperty.aspx");
    }

    protected void _lbNewProperty_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserAdmin/NewProperty.aspx");
    }
}