<%@ WebHandler Language="C#" Class="ViewReportHandler2" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class ViewReportHandler2 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int tid = int.Parse(context.Request.QueryString["tID"]);
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
        SqlCommand cmd = new SqlCommand("Select logo from Trainer where trainerID=@trainerID", conn);
        cmd.Parameters.AddWithValue("@trainerID", tid);

        conn.Open();
        SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            context.Response.BinaryWrite((byte[])reader[0]);
        }
        context.Response.ContentType = "text/plain";
        context.Response.Write("Hello World");
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}