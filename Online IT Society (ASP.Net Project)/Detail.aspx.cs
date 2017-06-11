using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class Detail : System.Web.UI.Page
{
    string source = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3";
    SqlConnection conn;

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
        string type = Request.QueryString["type"];
        
        if (type == "jv")
        {
            MultiViewDetailPage.SetActiveView(ViewJob);
            Page.Title = "Job Vacancy Detail";
           
        }
        else if (type == "cv")
        {
            MultiViewDetailPage.SetActiveView(ViewCV);
            Page.Title = "CV Detail";
        }
        else if (type == "ss")
        {
            MultiViewDetailPage.SetActiveView(ViewSaleAndService);
            Page.Title = "Sale & Service Center Detail";
        }
        else if (type == "nws")
        {
            MultiViewDetailPage.SetActiveView(ViewNews);
            Page.Title = "News Detail";
        }
        else if (type == "sem")
        {
            MultiViewDetailPage.SetActiveView(ViewSeminar);
            Page.Title = "Seminar Detail";
        }
        else if (type == "expo")
        {
            MultiViewDetailPage.SetActiveView(ViewExhibition);
            Page.Title = "Exhibition Detail";
        }
        else if (type == "myalt")
        {
            MultiViewDetailPage.SetActiveView(ViewMyAlert);
            Page.Title = "My Alert Detail";
        }
    }

    protected bool IsMemberJV(object jid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID,logo from Job where jobID=@jid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@jid", int.Parse(jid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            Session["logo"] =(byte[])rad[1];
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
        
        
    }

    protected bool IsMemberAdminJV(object jid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from Job where jobID=@jid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@jid", int.Parse(jid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {

            conn.Close();
            return true;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberCV(object cvid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID,photo,gender from CV where cvID=@cvid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@cvid", int.Parse(cvid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            Session["photo"] = (byte[])rad[1];

            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
        
    }

    protected bool IsMemberAdminCV(object cvid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from CV where cvID=@cvid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@cvid", int.Parse(cvid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberSS(object cid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID,logo from SaleandServiceCenter where centerID=@cid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@cid", int.Parse(cid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            Session["logo"] = (byte[])rad[1];

            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberAdminSS(object cid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from SaleandServiceCenter where centerID=@cid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@cid", int.Parse(cid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberSem(object sid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from Seminar where seminarID=@sid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@sid", int.Parse(sid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberAdminSem(object sid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from Seminar where seminarID=@sid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@sid", int.Parse(sid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberEx(object eid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from ExhibitionWS where ewID=@eid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@eid", int.Parse(eid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsMemberAdminEx(object eid)
    {
        conn = new SqlConnection(source);
        conn.Open();
        string str = "select memberID from ExhibitionWS where ewID=@eid";
        SqlCommand cmd = new SqlCommand(str, conn);
        cmd.Parameters.AddWithValue("@eid", int.Parse(eid.ToString()));
        SqlDataReader rad = cmd.ExecuteReader();
        rad.Read();
        if (Session["mid"].ToString() == rad[0].ToString())
        {
            conn.Close();
            return true;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            conn.Close();
            return true;
        }
        else
        {
            conn.Close();
            return false;
        }
    }

    protected bool IsAdminLogin()
    {

        if (Session["AdminLogin"].ToString() != "")
        {
            return true;
        }
        else
        {
            return false;
        }
    }

    protected void FormViewJob_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "upload")
        {
            if (((FileUpload)(FormViewJob.FindControl("FileUploadJob"))).HasFile)
            {
                string fname = ((FileUpload)FormViewJob.FindControl("FileUploadJob")).FileName;
                ((FileUpload)FormViewJob.FindControl("FileUploadJob")).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
                ((Image)FormViewJob.FindControl("Image2")).ImageUrl = "~/App_Themes/Theme1/" + fname;


                byte[] photo = ((FileUpload)(FormViewJob.FindControl("FileUploadJob"))).FileBytes;
                
                Session["logo"] = photo;

                //File.Delete("~/App_Themes/Theme1/" + fname);
            }            
        }


        
    }

    protected void FormViewCV_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "upload")
        {
            if (((FileUpload)(FormViewCV.FindControl("FileUploadCV"))).HasFile)
            {
                string fname = ((FileUpload)FormViewCV.FindControl("FileUploadCV")).FileName;
                ((FileUpload)FormViewCV.FindControl("FileUploadCV")).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
                ((Image)FormViewCV.FindControl("Image4")).ImageUrl = "~/App_Themes/Theme1/" + fname;


                byte[] photo = ((FileUpload)(FormViewCV.FindControl("FileUploadCV"))).FileBytes;
                Session["photo"] = photo;
                //File.Delete("~/App_Themes/Theme1/" + fname);
            }

        }
    }

    protected void rdlGender_SelectedIndexChanged1(object sender, EventArgs e)
    {
        if (((RadioButtonList)FormViewCV.FindControl("rdlGender")).SelectedValue == "Male")
        {
            ((TextBox)FormViewCV.FindControl("genderTextBox")).Text = "Male";
        }
        else if (((RadioButtonList)FormViewCV.FindControl("rdlGender")).SelectedValue == "Female")
        {
            ((TextBox)FormViewCV.FindControl("genderTextBox")).Text = "Female";
        }
    }

    protected void FormViewSaleandService_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "upload")
        {
            if (((FileUpload)(FormViewSaleandService.FindControl("FileUploadSS"))).HasFile)
            {
                string fname = ((FileUpload)FormViewSaleandService.FindControl("FileUploadSS")).FileName;
                ((FileUpload)FormViewSaleandService.FindControl("FileUploadSS")).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
                ((Image)FormViewSaleandService.FindControl("Image5")).ImageUrl = "~/App_Themes/Theme1/" + fname;


                byte[] photo = ((FileUpload)(FormViewSaleandService.FindControl("FileUploadSS"))).FileBytes;
                Session["logo"] = photo;
                //File.Delete("~/App_Themes/Theme1/" + fname);
            }
        }
    }


    protected void FormViewMyAlert_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Session["brandID"] = ((DropDownList)FormViewMyAlert.FindControl("ddlBrand")).SelectedValue;
        Session["expDate"] = DateTime.Parse(((TextBox)FormViewMyAlert.FindControl("expireDateTextBox")).Text);
    }

    protected void FormViewCV_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Session["Date"] = DateTime.Parse(((TextBox)FormViewCV.FindControl("dobTextBox")).Text);
    }
    protected void FormViewSeminar_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Session["Date"] = DateTime.Parse(((TextBox)FormViewSeminar.FindControl("seminarDateTextBox")).Text);
    }
    protected void FormViewExhitbition_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Session["sDate"] = DateTime.Parse(((TextBox)FormViewExhitbition.FindControl("startDateTextBox")).Text);
        Session["eDate"] = DateTime.Parse(((TextBox)FormViewExhitbition.FindControl("endDateTextBox")).Text);
    }

 
}
