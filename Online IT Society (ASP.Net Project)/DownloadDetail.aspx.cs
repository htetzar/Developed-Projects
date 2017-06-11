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

public partial class DownloadDetail : System.Web.UI.Page
{
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

        
        if (Request.QueryString["type"] == "eb")
        {
      
            fvEbookDetail.Visible = true;
            fvSWDetail.Visible = false;

            //((LinkButton)fvEbookDetail.FindControl("bookDeleteButton")).Visible = btnvisible();

        }
        else if (Request.QueryString["type"] == "sw")
        {
            fvEbookDetail.Visible = false;
            fvSWDetail.Visible = true;

           // ((LinkButton)fvSWDetail.FindControl("swDeleteButton")).Visible = btnvisible();

        }
    }

    //private bool btnvisible()
    //{
    //    if (Session["AdminLogin"] != null)
    //    {
    //        lbutdl.Visible = false;
    //        return true;
    //    }
    //    else return false;
    //}
    protected void lbutdl_Click(object sender, EventArgs e)
    {

        if (Request.QueryString["type"] == "eb")
        {
            try
            {
                string book = "";
                string ext = "";
                string path = "";
                DataView dv = (DataView)homeebookDS.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView dr in dv)
                {
                    book = dr[1].ToString();
                    path = dr[3].ToString();
                    break;
                }

                ext = path.Substring(path.Length - 3, 3);

                //string FilePath = Server.MapPath(@"~\Ebook\" + book);
                string FilePath = Server.MapPath(path);
                string name = Path.GetFileName(FilePath);

                Response.AppendHeader("content-disposition", "attachment; filename=" + name);

                Response.ContentType = "Application/" + ext;
                //Response.WriteFile(FilePath + "." + ext);
                Response.WriteFile(FilePath);
                Response.End();
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("Could not find"))
                {
                    lblmsg.Text = "Could not find file.";
                    fvEbookDetail.Visible = false;
                    lbutdl.Visible = false;
                }
            }
        }
        else if (Request.QueryString["type"] == "sw")
        {
            try
            {
                string software = "";
                string ext = "";
                string path = "";
                DataView dv = (DataView)homeSWds.Select(DataSourceSelectArguments.Empty);
                foreach (DataRowView dr in dv)
                {
                    software = dr[1].ToString();
                    //ext = dr[3].ToString();
                    path = dr[3].ToString();
                    break;
                }

                ext = path.Substring(path.Length - 3, 3);

                //string FilePath = Server.MapPath(@"~\Software\" + software);
                string FilePath = Server.MapPath(path);
                string name = Path.GetFileName(FilePath);

                Response.AppendHeader("content-disposition", "attachment; filename=" + name);

                Response.ContentType = "Application/" + ext;
                //Response.WriteFile(FilePath+"."+ext);
                Response.WriteFile(FilePath);
                Response.End();
            }
            catch (Exception ex)
            { 
                if(ex.Message.Contains("Could not find"))
                {
                lblmsg.Text="Could not find file.";
                fvSWDetail.Visible = false;
                lbutdl.Visible = false;
                }
            }
            
        }
    }

    protected void fvSWDetail_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Delete")
        {
            homeSWds.Delete();
        }
    }
   
    protected void fvEbookDetail_ItemCommand(object sender, FormViewCommandEventArgs e)
    {
        if(e.CommandName=="Delete")
        {
            homeebookDS.Delete();
        }
        
    }
    protected bool IsAdmin()
    {
        if (Session["AdminLogin"].ToString() != "")
            return true;
        else
            return false;
    }
   
}
