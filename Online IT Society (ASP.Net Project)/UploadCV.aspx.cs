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
using System.IO;

public partial class UploadCV : System.Web.UI.Page
{
    string con_string = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3";

    bool flag = false;

    protected void Page_Load(object sender, EventArgs e)
    {
            ImgCV.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
            if (flag)
                if (!(Server.MapPath("~/") + ImgCV.ResolveClientUrl(ImgCV.ImageUrl)).Equals(Server.MapPath("~/") + "App_Themes/Theme1/noimg.jpg"))
                {
                    File.Delete(Server.MapPath("~/") + ImgCV.ResolveClientUrl(ImgCV.ImageUrl));
                    ImgCV.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
                    flag = false;
                }
         
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtDOB.Attributes["readonly"] = "readonly";
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {

        try
        {
        if (fulCV.HasFile)
        {
            /*upload image temporarily and store image in a binary format in ViewState "cvbytes"*/
            string path = Server.MapPath(@"~\" + fulCV.FileName);
            ViewState["path"] = path;
            fulCV.SaveAs(path);
            ImgCV.ImageUrl = @"~\" + fulCV.FileName;
            byte[] photo = fulCV.FileBytes;
            ViewState["cvbytes"] = photo;
        }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Following error occurs : " + ex.Message;
        }

      
    }
    protected void btnUploadCV_Click(object sender, EventArgs e)
    {
        
        SqlConnection con = new SqlConnection(con_string);
        con.Open();

        //auto generate cvID
        int i;
        SqlCommand cmdmax = new SqlCommand(@"Select max(cvID) from CV", con);
        Object objmax = cmdmax.ExecuteScalar();
        if (objmax == DBNull.Value) //if there is no record in table, we insert autogenerate no. 1
        {
            i = 1;
        }
        else   //if other, we get max id and add 1
        {
            i = int.Parse(objmax.ToString());
            i++;
        }

        Session["cvid"]=i.ToString();

        if(ViewState["cvbytes"]==null)
        {
        Byte[] defimg = File.ReadAllBytes(Server.MapPath("~/") + ImgCV.ResolveClientUrl(ImgCV.ImageUrl));
        
        ViewState["cvbytes"] = defimg;
        }

        string sql = @"Insert into CV([cvID],[memberID],[title],[personName],[dob],[gender],[nrc],[maritalStatus],[fatherName],[qualification],[otherQual],[experience],[expectedSalary],[email],[address],[phone],[photo],[postedDate]) Values(@cvid,@memberid,@title,@personname,@dob,@gender,@nrc,@maritalStatus,@fathername,@qualification,@otherqual,@experience,@expectedsalary,@email,@address,@phone,@photo,@posteddate)";
       
        SqlCommand cmd = new SqlCommand(sql, con);
        cmd.Parameters.AddWithValue("@cvid", int.Parse(Session["cvid"].ToString()));
        cmd.Parameters.AddWithValue("@memberid", int.Parse(Session["mid"].ToString()));
        cmd.Parameters.AddWithValue("@title",txtTitle.Text);
        cmd.Parameters.AddWithValue("@personname", txtName.Text);
        cmd.Parameters.AddWithValue("@dob", DateTime.Parse(txtDOB.Text));
        cmd.Parameters.AddWithValue("@gender", rdlGender.SelectedValue.ToString());
        cmd.Parameters.AddWithValue("@nrc", txtNRC.Text);
        cmd.Parameters.AddWithValue("@maritalStatus", rdlStatus.Text);
        cmd.Parameters.AddWithValue("@fathername", txtFatherName.Text);
        cmd.Parameters.AddWithValue("@qualification", txtQualification.Text);
        cmd.Parameters.AddWithValue("@otherqual", txtOtherQualification.Text);
        cmd.Parameters.AddWithValue("@experience", txtExperience.Text);
        cmd.Parameters.AddWithValue("@expectedsalary", int.Parse(txtSalary.Text));
        cmd.Parameters.AddWithValue("@email", txtEmail.Text);
        cmd.Parameters.AddWithValue("@address", txtAddress.Text);
        cmd.Parameters.AddWithValue("@phone", txtContactPhone.Text);
        cmd.Parameters.AddWithValue("@photo", (byte[])ViewState["cvbytes"]);
        //cmd.Parameters.AddWithValue("@photo", defimg);

        cmd.Parameters.AddWithValue("@posteddate", DateTime.Now);
        try
        {
            if(Page.IsValid)
            {
                flag = true;

                //insert data into Job Table
                int insertcount = cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Upload Successful!');", true);



                //we delete temporarily upload image
                if (ViewState["path"] != null)
                {
                    File.Delete(ViewState["path"].ToString());
                }

                //After inserting data to DB, clear data in controls
                ResetData();

            }

        }
        catch (Exception ex)
        {
            lblStatus.Text = "Followiing error occurs : " + ex.Message;
        }

        con.Close();
        Page_Load(sender, e);


    }

    private void ResetData()
    {
        //clear data in controls
        txtName.Text="";
        txtTitle.Text="";
        txtDOB.Text="";
        rdlGender.ClearSelection();
        txtNRC.Text="";
        rdlStatus.ClearSelection();
        txtFatherName.Text="";
        txtQualification.Text="";
        txtOtherQualification.Text="";
        txtExperience.Text="";
        txtSalary.Text="";
        txtEmail.Text="";
        txtAddress.Text="";
        txtContactPhone.Text="";
        ImgCV.ImageUrl = null;
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //After inserting data to DB, clear data in controls
        ResetData();
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
        catch { }
    }
    
}
