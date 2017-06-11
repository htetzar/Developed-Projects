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

public partial class UploadSaleAndService : System.Web.UI.Page
{
    string con_string = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3";
    bool flg = false;
   
    protected void Page_Load(object sender, EventArgs e)
    {
        
        ImgSaleAndService.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
        if (flg)
        {
            if (!(Server.MapPath("~/") + ImgSaleAndService.ResolveClientUrl(ImgSaleAndService.ImageUrl)).Equals(Server.MapPath("~/") + "App_Themes/Theme1/noimg.jpg"))
            {
                File.Delete(Server.MapPath("~/") + ImgSaleAndService.ResolveClientUrl(ImgSaleAndService.ImageUrl));
                ImgSaleAndService.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
                flg = false;
            }
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        try
        {
            if (fulSaleAndService.HasFile)
            {
                /*upload image temporarily and store image in a binary format in ViewState "saleservicebytes"*/
                string path = Server.MapPath(@"~\" + fulSaleAndService.FileName);
                ViewState["path"] = path;
                fulSaleAndService.SaveAs(path);
                ImgSaleAndService.ImageUrl = @"~\" + fulSaleAndService.FileName;

                byte[] photo = fulSaleAndService.FileBytes;
                ViewState["saleservicebytes"] = photo;
            }
        }
        catch (Exception ex)
        {
            lblStatus.ForeColor = System.Drawing.Color.Red;
            lblStatus.Text = "Followiing error occurs : " + ex.Message;
        }
        


    }
    protected void btnUploadPost_Click(object sender, EventArgs e)
    {

        //For sale & service Checkbox list selected items
        string st = "";
        bool flag = false;
        foreach (ListItem li in chklsType.Items)
        {
            if (li.Selected == true)
            {
                st += li.Value + ",";
                flag = true;
            }
        }


        //if not checked at least one of 2 types, show alert msg
        if (flag == false)
        {
            lblType.Text = "You need to choose at least one type.";
        }
        else
        {
            //Remove last most comma
            st = st.Remove(st.Length - 1);
            Session["saleservice"] = st;

            SqlConnection con = new SqlConnection(con_string);
            con.Open();

            //auto generate centerID
            int i;
            SqlCommand cmdmax = new SqlCommand(@"Select max(centerID) from SaleandServiceCenter", con);
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

            Session["centerid"] = i.ToString();

            if (ViewState["saleservicebytes"] == null)
            {
                Byte[] defimg = File.ReadAllBytes(Server.MapPath("~/") + ImgSaleAndService.ResolveClientUrl(ImgSaleAndService.ImageUrl));
                ViewState["saleservicebytes"] = defimg;
            }

            string sql = @"Insert into SaleandServiceCenter([centerID],[memberID],[title],[centerName],[phone],[address],[type],[logo],[description],[email],[website],[postedDate]) Values(@centerid,@memberid,@title,@centername,@phone,@address,@type,@logo,@description,@email,@website,@posteddate)";


            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@centerid", int.Parse(Session["centerid"].ToString()));
            cmd.Parameters.AddWithValue("@memberid", int.Parse(Session["mid"].ToString()));
            cmd.Parameters.AddWithValue("@title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@centername", txtCenterName.Text);
            cmd.Parameters.AddWithValue("@phone", txtPhone.Text);
            cmd.Parameters.AddWithValue("@address", txtAddress.Text);
            cmd.Parameters.AddWithValue("@type", Session["saleservice"].ToString());
            cmd.Parameters.AddWithValue("@logo", (byte[])ViewState["saleservicebytes"]);
            cmd.Parameters.AddWithValue("@description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@website", txtWebsite.Text);
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



                con.Close();

                //After inserting data to DB, clear data in controls
                ResetData();

                flg = true;
                Page_Load(sender, e);
            }
            catch (Exception ex)
            {
                lblStatus.ForeColor = System.Drawing.Color.Red;
                lblStatus.Text = "Followiing error occurs : " + ex.Message;
            }

        }
    }

    private void ResetData()
    {
        //clear data in controls
        txtTitle.Text = "";
        txtCenterName.Text = "";
        txtPhone.Text = "";
        txtAddress.Text = "";
        chklsType.ClearSelection();
        ImgSaleAndService.ImageUrl = null;
        txtEmail.Text = "";
        txtWebsite.Text = "";
        txtDescription.Text = "";
        lblStatus.Text = "";
        lblType.Text = "";
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //For Cancel button
        ResetData();
    }
}
