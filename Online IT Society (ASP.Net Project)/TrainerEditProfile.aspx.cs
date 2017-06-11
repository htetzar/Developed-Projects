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

public partial class TrainerEditProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Trainer Edit Profile Page";//naming page title;
    }
    protected void btmUpload_Click(object sender, EventArgs e)
    {
       
    }
    protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        string fname;
        if (e.CommandName == "aa")
        {
             fname=((FileUpload)FormView1.FindControl("FileUpload1")).FileName;
             ((FileUpload)FormView1.FindControl("FileUpload1")).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
            ((Image )FormView1 .FindControl ("Image1")).ImageUrl ="~/App_Themes/Theme1/"+fname;
            byte[] photo = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
            Session["logo"] = photo;
        }
        if (e.CommandName == "Cancel")
            Response.Redirect("trainer.aspx");

        //fname = ((FileUpload)FormView1.FindControl("FileUpload1")).FileName;
        //((FileUpload)FormView1.FindControl("FileUpload1")).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
        //((Image)FormView1.FindControl("Image1")).ImageUrl = "~/App_Themes/Theme1/" + fname;
        //byte[] photo = ((FileUpload)FormView1.FindControl("FileUpload1")).FileBytes;
        //Session["logo"] = photo;
    }//photo upload;
    protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
    {
        Response.Redirect("Trainer.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        string str = string.Empty;
        DataView dv = (DataView)PWDS.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in dv)
        {
            str = dr[0].ToString();
            break;
        }
        string curr = ((TextBox)FormView1.FindControl("cur_psw")).Text;
        if (curr != str)
        {
            args.IsValid = false;
        }
        else
            args.IsValid = true;
    }
    protected void FormView1_DataBound(object sender, EventArgs e)
    {
        string email = Session["login"].ToString();
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
        SqlCommand cmd = new SqlCommand("select logo from Trainer where email=@email", conn);
        cmd.Parameters.AddWithValue("@email", email);
        conn.Open();
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        Session["logo"] = (byte[])rad[0];
        conn.Close();
    }
}
