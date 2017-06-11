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

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtDOB.Attributes["readonly"] = "readonly";
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
#region auto generating id

        DataView dv = (DataView)memDS.Select(DataSourceSelectArguments.Empty);
        int i = 0;
        try
        {
            foreach (DataRowView dr in dv)
            {
                i = int.Parse(dr[0].ToString()); break;
            }
            i++;
        }
        catch { i = 1; }

#endregion
        Session["id"] = i.ToString();
        Session["username"] = txtName.Text;
        Session["email"] = txtEmail.Text;
        Session["page"] = "register";

#region check for unique email address

        dv = (DataView)checkmemDB.Select(DataSourceSelectArguments.Empty);
        if (dv.Count == 0)
        {

            try
            {
                if (Page.IsValid)
                {
                    memDS.Insert();
                    clrCtrl();
                    Response.Redirect("Successful.aspx");
                }
            }
            catch
            {
                lblmsg.Text = "Register failed.";

            }
        }

        else
        {
            lblmsg.Text = "This email address is already existed. Try another one.";
        }

#endregion
    }

    //clear controls
    private void clrCtrl()
    {
        txtName.Text = "";
        rdlGender.ClearSelection();
        txtDOB.Text = "";
        txtEmail.Text = "";
        lblmsg.Text = "";
        
    }

    //check age for registeration (only 18 and above are allowed for registeration)
    protected void AgeValidator_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int dob = (DateTime.Parse(txtDOB.Text)).Year;
        int now = DateTime.Now.Year;
        int age = now - dob;
        if (age >= 18)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }
    }
}
