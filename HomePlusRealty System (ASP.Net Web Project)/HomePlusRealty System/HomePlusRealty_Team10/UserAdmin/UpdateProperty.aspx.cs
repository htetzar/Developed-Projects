using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserAdmin_UpdateProperty : System.Web.UI.Page
{
    aspnetdbEntities context = new aspnetdbEntities();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            int pID = Convert.ToInt32(Request.QueryString["PID"]);
            Property p = context.Properties.Where(x => x.PropertyID == pID).FirstOrDefault();
            TextBoxName.Text = p.PropertyName;
            TextBoxAddress.Text = p.Address;
            TextBoxSize.Text = p.FloorSize.ToString();
            CheckBoxList1.SelectedValue = p.Type;
            TextBoxBathroom.Text = p.NoOfBathRoom.ToString();
            TextBoxRoom.Text = p.NoOfRoom.ToString();
            TextBoxDescription.Text = p.Description;
            TextBoxPrice.Text = p.Price.ToString();
            TextBoxTenure.Text = p.Tenure.ToString();
            TextBoxDeveloper.Text = p.Developer;

            string str = p.NearByFacility;
            string[] nByFacility = str.Split(',');

            foreach (string s in nByFacility)
            {
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Value == s)
                    {
                        item.Selected = true;
                        break;
                    }
                }

            }
        }

    }

    protected void ButtonUpdate_Click1(object sender, EventArgs e)
    {
        int pID = Convert.ToInt32(Request.QueryString["PID"]);
        Property p = context.Properties.Where(x => x.PropertyID == pID).FirstOrDefault();
        p.PropertyName = TextBoxName.Text;
        p.Type = CheckBoxList1.SelectedValue;
        p.Address = TextBoxAddress.Text;
        p.FloorSize = Convert.ToInt32(TextBoxSize.Text);
        p.Price = Convert.ToDecimal(TextBoxPrice.Text);
        p.Tenure = Convert.ToDecimal(TextBoxTenure.Text);

        string str = "";
        foreach (ListItem item in CheckBoxList1.Items)
        {
            if (item.Selected)
            {
                str += item.Value + ",";
            }
        }
        p.NearByFacility = str;
        p.Developer = TextBoxDeveloper.Text;
        p.NoOfBathRoom = Convert.ToInt32(TextBoxBathroom.Text);
        p.NoOfRoom = Convert.ToInt32(TextBoxRoom.Text);
        p.Description = TextBoxDescription.Text;

        if (FileUploadImagepath.HasFile)
        {
            try
            {
                string filename = FileUploadImagepath.FileName;
                FileUploadImagepath.SaveAs(Server.MapPath("~/Image/") + filename);
                p.ImagePath = "~/Image/" + filename;
            }
            catch (Exception ex)
            {
                Response.Write(ex);
            }
        }

        try
        {
            context.SaveChanges();
            Response.Redirect("~/UserAdmin/PropertyList_UserAdmin.aspx");
        }
        catch (Exception ex)
        {
            Response.Write("Unsuccess!" + ex);
        }
    }
}