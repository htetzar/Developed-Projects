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

public partial class UploadJobVacanncy : System.Web.UI.Page
{
    string con_string = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3";
    bool flg = false;
    protected void Page_Load(object sender, EventArgs e)
    {
        imgJobVacancy.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
        if (flg)
            if (!(Server.MapPath("~/") + imgJobVacancy.ResolveClientUrl(imgJobVacancy.ImageUrl)).Equals(Server.MapPath("~/") + "App_Themes/Theme1/noimg.jpg"))
            {
                File.Delete(Server.MapPath("~/") + imgJobVacancy.ResolveClientUrl(imgJobVacancy.ImageUrl));
                imgJobVacancy.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
                flg = false;
            }
    }

    protected void btnUploadLogo_Click(object sender, EventArgs e)
    {
        try
        {
            if (fulLogo.HasFile)
            {
                /*upload image temporarily and store image in a binary format in ViewState "jobbytes"*/
                string path = Server.MapPath(@"~\" + fulLogo.FileName);
                ViewState["path"] = path;
                fulLogo.SaveAs(path);
                imgJobVacancy.ImageUrl = @"~\" + fulLogo.FileName;

                byte[] photo = fulLogo.FileBytes;
                ViewState["jobbytes"] = photo;
            }
        }
        catch (Exception ex)
        {
            lblStatus.ForeColor = System.Drawing.Color.Red;
            lblStatus.Text = "Followiing error occurs : " + ex.Message;
        }

    }
    protected void btnUploadJob_Click(object sender, EventArgs e)
    {

        //For Gender Checkbox list selected items
        string st = "";
        bool flag = false;
        foreach (ListItem li in chklsGender.Items)
        {
            if (li.Selected == true)
            {
                st += li.Value + "/";
                flag = true;
            }
        }

        //if not checked at least one of 2 gender, show alert msg
        if (flag == false)
        {
            lblStatus.Text = "You must choose gender.";
        }
        else
        {
            st = st.Remove(st.Length - 1);
            Session["gender"] = st;

            SqlConnection con = new SqlConnection(con_string);
            con.Open();

            //auto generate jobID
            int i;
            SqlCommand cmdmax = new SqlCommand(@"Select max(jobID) from Job", con);
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

            Session["jobid"] = i.ToString();

            if (ViewState["jobbytes"] == null)
            {
                Byte[] defimg = File.ReadAllBytes(Server.MapPath("~/") + imgJobVacancy.ResolveClientUrl(imgJobVacancy.ImageUrl));
                ViewState["jobbytes"] = defimg;
            }

            string sql = @"Insert into Job([jobID],[memberID],[category],[title],[salary],[address],[qualification],[description],[logo],[noofpost],[gender],[postedDate]) Values(@jobid,@memberid,@category,@title,@salary,@address,@qualification,@description,@logo,@noofpost,@gender,@posteddate)";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@jobid", int.Parse(Session["jobid"].ToString()));
            cmd.Parameters.AddWithValue("@memberid", int.Parse(Session["mid"].ToString()));
            cmd.Parameters.AddWithValue("@category", ddlJobCategory.SelectedValue.ToString());
            cmd.Parameters.AddWithValue("@title", txtJobTitle.Text);
            cmd.Parameters.AddWithValue("@salary", int.Parse(txtSalary.Text));
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@qualification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@logo", (byte[])ViewState["jobbytes"]);
            cmd.Parameters.AddWithValue("@noofpost", int.Parse(txtNoofPost.Text));

            cmd.Parameters.AddWithValue("@gender", Session["gender"].ToString());

            cmd.Parameters.AddWithValue("@posteddate", DateTime.Now.ToShortDateString());

            try
            {
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



                con.Close();
                flg = true;
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Following error occurs : " + ex.Message;
            }
        }
    }
    
        
   

    private void ResetData()
    {
        //clear data in controls
        ddlJobCategory.ClearSelection();
        txtJobTitle.Text = "";
        txtSalary.Text = "";
        txtAddress.Text = "";
        txtQualification.Text = "";
        txtDescription.Text = "";
        imgJobVacancy.ImageUrl = null;
        txtNoofPost.Text = "";
        chklsGender.ClearSelection();
        lblStatus.Text = "";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //for Cancel button
        ResetData();
    }
}
