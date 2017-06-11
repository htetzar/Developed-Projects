<%@ WebHandler Language="C#" Class="ViewReportHandler1" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class ViewReportHandler1 : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        int pid = int.Parse(context.Request.QueryString["pID"]);
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");
        SqlCommand cmd = new SqlCommand("Select photo from Purchase where purchaseID=@purchaseID", conn);
        cmd.Parameters.AddWithValue("@purchaseID", pid);

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