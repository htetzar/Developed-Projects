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

public partial class AdminUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ddlType_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlType.SelectedValue == "Ebook")
        {
            MultiView1.SetActiveView(View1);
        }
        else if (ddlType.SelectedValue == "News")
        {
            MultiView1.SetActiveView(View2);
        }
        else if (ddlType.SelectedValue == "Software")
        {
            MultiView1.SetActiveView(View3);
        }
    }

    #region Ebook

    public void AutoGenebook()
    {
        int i = 0;
        try
        {

            DataView dve = (DataView)EbookID_DS.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dre in dve)
            {
                i = int.Parse(dre[0].ToString());
                break;
            }
            i++;
        }
        catch
        {
            i = 1;
        }
        Session["bid"] = i.ToString();
    }

      //Clear Ebook Control
    public void clear()            
    {
        txtEBTitle.Text = "";
        txtAuthor.Text = "";
        lblbshow.Text = "";
        imgEbook.ImageUrl = "";

    }
    //Upload Ebook Photo
    protected void btnEBphoto_Click(object sender, EventArgs e)
    {
        string fname = fupEBPhoto.FileName;
        fupEBPhoto.SaveAs(Server.MapPath(@"~/App_Themes/Theme1/") + fname);
        imgEbook.ImageUrl = "~/App_Themes/Theme1/" + fname;
        byte[] photo = fupEBPhoto.FileBytes;
        Session["ephoto"] = photo;

    }
    //Upload Ebook
    protected void btnbookupload_Click(object sender, EventArgs e)
    {
        string book = fupEbook.FileName;
        fupEbook.SaveAs(Server.MapPath(@"~/Ebook/") + book);
        lblbook.Text = @"~/Ebook/" + book;
        string path = Server.MapPath(@"~/Ebook/");
        lblbshow.Text = path + book;
    }

    //Save Ebook
    protected void btnUploadEB_Click(object sender, EventArgs e)    
    {
        if (lblbook.Text != "" && lblbook.Text != null && Session["ephoto"] != null)
        {
            //if (lblEphoto.Text != "" && lblEphoto.Text != null)
            //{
            AutoGenebook();
            SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\Group3_Server;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Ebook] ([bookID],[author],[bookTitle],[savedPath],[photo]) VALUES (@bookID,@author,@bookTitle,@savedPath,@photo)", conn);
            cmd.Parameters.AddWithValue("@bookID", int.Parse(Session["bid"].ToString()));
            cmd.Parameters.AddWithValue("@author", txtAuthor.Text);
            cmd.Parameters.AddWithValue("@bookTitle", txtEBTitle.Text);
            cmd.Parameters.AddWithValue("@savedPath", lblbook.Text);
            cmd.Parameters.AddWithValue("@photo", (byte[])Session["ephoto"]);

            int row = cmd.ExecuteNonQuery();
            conn.Close();
            if (Session["ephoto"] != null)
                File.Delete(Session["ephoto"].ToString());
            clear();
            //}
            //else
            //{
            //    lblEphoto.Text = "Photo Required!";
            //    return;
            //}
        }
        else
        {
            lblbook.Text = "Upload File Required!";
            return;
        }
    }
    protected void btnCancelEbook_Click(object sender, EventArgs e)
    {
        clear();
    }

    #endregion


    #region News

    //Auto Generate NewID

    public void AutoGenNews()
    {
        int i = 0;
        try
        {

            DataView dvn = (DataView)NewidDs.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drn in dvn)
            {
                i = int.Parse(drn[0].ToString());
                break;
            }
            i++;
        }
        catch
        {
            i = 1;
        }
        Session["nid"] = i.ToString();
    }
    protected void btnNewPhoto_Click(object sender, EventArgs e)
    {
        string fname = fupNews.FileName;
        fupNews.SaveAs(Server.MapPath(@"~/App_Themes/Theme1/") + fname);
        imgNews.ImageUrl = ("~/App_Themes/Theme1/") + fname;
        byte[] photo=fupNews.FileBytes;
        Session["nphoto"] = photo;
    }
    protected void btnUploadNews_Click(object sender, EventArgs e)
    {
        if (Session["nphoto"] != null)
        {
            AutoGenNews();
            Session["ndate"] = DateTime.Now.ToString();
            SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\Group3_Server;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [News] ([newsID], [title], [description], [photo], [postedDate]) VALUES (@newsID, @title, @description, @photo, @postedDate)", conn);
            cmd.Parameters.AddWithValue("@newsID", int.Parse(Session["nid"].ToString()));
            cmd.Parameters.AddWithValue("@title", txtNews.Text);
            cmd.Parameters.AddWithValue("@description", txtNewsDes.Text);
            cmd.Parameters.AddWithValue("@photo", (byte[])Session["nphoto"]);
            cmd.Parameters.AddWithValue("@postedDate", DateTime.Parse(Session["ndate"].ToString()));
            int row = cmd.ExecuteNonQuery();
            conn.Close();
            if (Session["nphoto"] != null)
                File.Delete(Session["nphoto"].ToString());
            clear_news();
        }
    }

    private void clear_news()
    {
        txtNews.Text="";
        txtNewsDes.Text="";
        imgNews.ImageUrl="";
    }

    protected void btnCancelNews_Click(object sender, EventArgs e)
    {
        clear_news();
    }
    #endregion

    
    #region Software

    public void AutoGen()
    {
        int i = 0;
        try
        {

            DataView dv = (DataView)AdUpSWid_DS.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView dr in dv)
            {
                i = int.Parse(dr[0].ToString());
                break;
            }
            i++;
        }
        catch
        {
            i = 1;
        }
        Session["swid"] = i.ToString();
    }
    protected void btnSWPhoto_Click(object sender, EventArgs e)
    {
        string fname = fupSWphoto.FileName;
        fupSWphoto.SaveAs(Server.MapPath(@"~/App_Themes/Theme1/") + fname);
        imgSW.ImageUrl = "~/App_Themes/Theme1/" + fname;
        byte[] photo = fupSWphoto.FileBytes;
        Session["swphoto"] = photo;

    }
    protected void btnswupload_Click(object sender, EventArgs e)
    {
        string sw = fupSW.FileName;
        fupSW.SaveAs(Server.MapPath(@"~/Software/") + sw);
        lblsw.Text = @"~/Software/" + sw;
        string path = Server.MapPath(@"~/Software/");
        lblswshow.Text = path + sw;
    }
    protected void btnUploadSW_Click(object sender, EventArgs e)
    {
        if (Session["swphoto"] != null && lblsw.Text!="")
        {
            AutoGen();
            SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\Group3_Server;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
            conn.Open();
            SqlCommand cmd = new SqlCommand("INSERT INTO [Software] ([softwareID], [softwareName], [description], [photo], [savedPath]) VALUES (@softwareID, @softwareName, @description, @photo, @savedPath)", conn);
            cmd.Parameters.AddWithValue("@softwareID", int.Parse(Session["swid"].ToString()));
            cmd.Parameters.AddWithValue("@softwareName", txtSWtitle.Text);
            cmd.Parameters.AddWithValue("@description", txtSWDes.Text);
            cmd.Parameters.AddWithValue("@photo", (byte[])Session["swphoto"]);
            cmd.Parameters.AddWithValue("@savedPath", lblsw.Text);

            int row = cmd.ExecuteNonQuery();
            conn.Close();
            if (Session["swphoto"] != null)
                File.Delete(Session["swphoto"].ToString());
            clear_sw();
        }

    }

    private void clear_sw()
    {
        txtSWtitle.Text = "";
        txtSWDes.Text = "";
        lblswshow.Text = "";
        imgSW.ImageUrl = "";

    }

    protected void btnCancelSW_Click(object sender, EventArgs e)
    {
        clear_sw();
    }
    #endregion 
    
   
}
    


 

