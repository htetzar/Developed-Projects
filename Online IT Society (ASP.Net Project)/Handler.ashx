<%@ WebHandler Language="C#" Class="Handler" %>

using System;
using System.Web;
using System.Data;
using System.Data.SqlClient;

public class Handler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) 
    {
                SqlConnection con = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");

       
                try
                {
                    //news list view
                    if (context.Request.QueryString["nid"] != null)
                    {

                        string nid = context.Request.QueryString["nid"].ToString();
                        int id = Convert.ToInt32(nid);
                        con.Open();
                        SqlCommand cmdnews = new SqlCommand("select photo from News where newsID=@nid", con);
                        cmdnews.Parameters.AddWithValue("@nid", id);
                        SqlDataReader rdnews = cmdnews.ExecuteReader();
                        if (rdnews.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdnews[0]);
                        }
                        con.Close();
                    }

                    //cv view
                    if (context.Request.QueryString["cvid"] != null)
                    {

                        string cvid = context.Request.QueryString["cvid"].ToString();
                        int id = Convert.ToInt32(cvid);
                        con.Open();
                        SqlCommand cmdcv = new SqlCommand("select photo from CV where cvID=@cvid", con);
                        cmdcv.Parameters.AddWithValue("@cvid", id);
                        SqlDataReader rdcv = cmdcv.ExecuteReader();
                        if (rdcv.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdcv[0]);
                        }
                        con.Close();
                    }

                    //sale item list view
                    if (context.Request.QueryString["iid"] != null)
                    {
                        int itemid = int.Parse(context.Request.QueryString["iid"]);
                        SqlCommand cmditem = new SqlCommand("select photo from Item where itemID=@iid", con);
                        cmditem.Parameters.AddWithValue("@iid", itemid);
                        con.Open();
                        SqlDataReader rditem = cmditem.ExecuteReader();
                        if (rditem.Read())
                        {
                            context.Response.BinaryWrite((byte[])rditem[0]);
                        }
                        con.Close();
                    }

                    //job vacancy list view
                    if (context.Request.QueryString["jid"] != null)
                    {
                        int jobid = int.Parse(context.Request.QueryString["jid"]);
                        SqlCommand cmdjob = new SqlCommand("select logo from Job where jobID=@jid", con);
                        cmdjob.Parameters.AddWithValue("@jid", jobid);
                        con.Open();
                        SqlDataReader rdjob = cmdjob.ExecuteReader();
                        if (rdjob.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdjob[0]);
                        }
                        con.Close();
                    }

                    //training list view
                    if (context.Request.QueryString["tid"] != null)
                    {
                        int trainingid = int.Parse(context.Request.QueryString["tid"]);
                        SqlCommand cmdtng = new SqlCommand("select logo from Trainer where trainerID=@tid", con);
                        cmdtng.Parameters.AddWithValue("@tid", trainingid);
                        con.Open();
                        SqlDataReader rdtng = cmdtng.ExecuteReader();
                        if (rdtng.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdtng[0]);
                        }
                        con.Close();
                    }

                    //center list view
                    if (context.Request.QueryString["cid"] != null)
                    {
                        string cid = context.Request.QueryString["cid"].ToString();
                        int id = Convert.ToInt32(cid);
                        SqlCommand cmdctr = new SqlCommand("select logo from SaleandServiceCenter where centerID=@cid", con);
                        cmdctr.Parameters.AddWithValue("@cid", id);
                        con.Open();
                        SqlDataReader rdctr = cmdctr.ExecuteReader();
                        if (rdctr.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdctr[0]);
                        }
                        con.Close();
                    }

                    //book list view
                    if (context.Request.QueryString["bid"] != null)
                    {
                        //int bookid = int.Parse(context.Request.QueryString["bID"]);
                        string bid = context.Request.QueryString["bid"].ToString();
                        int id = Convert.ToInt32(bid);
                        SqlCommand cmdbk = new SqlCommand("select photo from Ebook where bookID=@bid", con);
                        cmdbk.Parameters.AddWithValue("@bid", id);
                        con.Open();
                        SqlDataReader rdbk = cmdbk.ExecuteReader();
                        if (rdbk.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdbk[0]);
                        }
                        con.Close();
                    }

                    //software list view
                    if (context.Request.QueryString["swid"] != null)
                    {
                        string swid = context.Request.QueryString["swid"].ToString();
                        int id = Convert.ToInt32(swid);
                        SqlCommand cmdsw = new SqlCommand("select photo from Software where softwareID=@swid", con);
                        cmdsw.Parameters.AddWithValue("@swid", id);
                        con.Open();
                        SqlDataReader rdsw = cmdsw.ExecuteReader();
                        if (rdsw.Read())
                        {
                            context.Response.BinaryWrite((byte[])rdsw[0]);
                        }
                        con.Close();
                    }
                }
                catch (Exception ex)
                { context.Response.Write(ex.Message); }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}