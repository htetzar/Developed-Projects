<%@ WebHandler Language="C#" Class="ForsaleHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class ForsaleHandler : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");

        try
        {
            if (context.Request.QueryString["iid"] != null)
            {
                int id = int.Parse(context.Request.QueryString["iid"]);

                SqlCommand salecmd = new SqlCommand("Select photo from Item where itemID=@Id", conn);
                salecmd.Parameters.AddWithValue("@Id", id);

                conn.Open();
                SqlDataReader salereader = salecmd.ExecuteReader();
                if (salereader.Read())
                {
                    context.Response.BinaryWrite((byte[])salereader[0]);
                }
            }

            if (context.Request.QueryString["jid"] != null)
            {
                int id = int.Parse(context.Request.QueryString["jid"]);

                SqlCommand jobcmd = new SqlCommand("Select logo from Job where jobID=@Id", conn);
                jobcmd.Parameters.AddWithValue("@Id", id);

                conn.Open();
                SqlDataReader jobreader = jobcmd.ExecuteReader();
                if (jobreader.Read())
                {
                    context.Response.BinaryWrite((byte[])jobreader[0]);
                }
            }
        }
        catch (Exception ex)
        { context.Response.Write(ex.Message); }
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}