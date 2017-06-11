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
using System.IO;

public partial class CreateTrainer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                foreach (DataRowView dr in dv)
                {
                    txtTrainerName.Text = dr[0].ToString();
                    txtEmail.Text = dr[1].ToString();
                }
            }
        }
    }
    protected void btnCreate_Click2(object sender, EventArgs e)
    {
        int i = 0;
        try
        {
            DataView dv = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                i = int.Parse(dr[0].ToString());
            }
            i++;
        }
        catch
        {
            i = 1;
        }
        Session["id"] = i;

        byte[] defimg = File.ReadAllBytes(Server.MapPath("~/") + "App_Themes/Theme1/noimg.jpg");
        Session["logo"] = defimg;

        SqlDataSource3.Insert(); 
        DSdelRequest.Delete();

        string ss = "Trainer Name is: " + txtTrainerName.Text + " / Email to login: " + txtEmail.Text + " / Password to login: " + txtPassword.Text;
        Response.Redirect("mailto:" + txtEmail.Text + "&body=" + ss + "&subject=Trainer Account Successful");
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ViewReport.aspx");
    }
}
