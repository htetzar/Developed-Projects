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

public partial class Enroll : System.Web.UI.Page
{
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

    }
    protected void btnEnroll_Click(object sender, EventArgs e)
    {
        if(Page.IsValid)
        {
            GenerateEnrollID();
            Session["enrolldate"] = DateTime.Now;
        
            sqlDSEnroll.Insert();

            ClearText();
            Session["page"] = "enroll";
            Response.Redirect("~/Successful.aspx");
        }
    }

   //Control's Text Clear Method
    protected void ClearText()
    {
        txtName.Text = "";
        rdlGender.ClearSelection();
        txtNRC.Text = "";
        txtDOB.Text = "";
        txtEmail.Text = "";
        txtFatherName.Text = "";
        txtPhone.Text = "";
        txtQualification.Text = "";
        txtAddress.Text = "";
    }
    
    //AutoGenerate Enroll ID Method
    protected void GenerateEnrollID()
    {
        int i = 0;
        DataView dv = (DataView)sqlDSEnroll.Select(DataSourceSelectArguments.Empty);
        try
        {
            foreach (DataRowView dr in dv)

                i = int.Parse(dr[0].ToString());
            i++;

        }
        catch
        {
            i = 1;
        }
        Session["EnrollID"] = i.ToString();
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
       int i =int.Parse(Request.QueryString["cid"].ToString());  //Get Course ID For Previous Page
       Response.Redirect("~/CourseDetail.aspx?cid="+i);          //Go to Previous Page with course id
   
    }
    protected void CustValDOB_ServerValidate(object source, ServerValidateEventArgs args)
    {
        try
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
        catch(Exception ex) 
        {
            lblStatus.Text = "Error : " + ex.Message;
        }
    }
}
