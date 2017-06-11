using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Threading;

public partial class UserAdmin_NewProperty : System.Web.UI.Page
{
    aspnetdbEntities context;
    protected void Page_Load(object sender, EventArgs e)
    {
        context = new aspnetdbEntities();
    }

    protected void ButtonSummit_Click(object sender, EventArgs e)
    {
        Property property = new Property();
        property.UserName = User.Identity.Name;
        property.PropertyName = TextBoxName.Text;
        property.Address = TextBoxAddress.Text;
        property.FloorSize = Convert.ToInt32(TextBoxSize.Text);
        property.Type = DropDownListtype.SelectedValue;
        property.Price = Convert.ToDecimal(TextBoxPrice.Text);
        property.Tenure = Convert.ToDecimal(TextBoxTenure.Text);

        string str = "";
        foreach (ListItem item in CheckBoxList1.Items)
        {
            if (item.Selected)
            {
                str += item.Value + ",";
            }
        }
        property.NearByFacility = str;
        property.CreatedDate = DateTime.Now;
        property.Developer = TextBoxDeveloper.Text;
        property.NoOfBathRoom = Convert.ToInt32(TextBoxBathroom.Text);
        property.NoOfRoom = Convert.ToInt32(TextBoxRoom.Text);
        property.Description = TextBoxDescription.Text;

        if (FileUploadImagepath.HasFile)
        {
            try
            {
                string filename = FileUploadImagepath.FileName;
                FileUploadImagepath.SaveAs(Server.MapPath("~/Image/") + filename);
                property.ImagePath = "~/Image/" + filename;
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }
        
        try
        {
            context.Properties.Add(property);
            Thread.Sleep(3000);
            context.SaveChanges();
            Response.Redirect("~/UserAdmin/PropertyList_UserAdmin.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Unsuccess!" + ex);
        }
        
    }
}