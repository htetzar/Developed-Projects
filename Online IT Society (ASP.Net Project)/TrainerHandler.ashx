<%@ WebHandler Language="C#" Class="TrainerHandler" %>

using System;
using System.Web;
using System.Data.SqlClient;

public class TrainerHandler : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {

        //int t_id = int.Parse(context.Request.QueryString["tid"]);

        //SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");
        //SqlCommand cmd = new SqlCommand("Select logo from trainer where trainerID=@tId", conn);
        //cmd.Parameters.AddWithValue("@tId", t_id);

        //conn.Open();
        //SqlDataReader reader = cmd.ExecuteReader();
        //if (reader.Read())
        //{
        //    context.Response.BinaryWrite((byte[])reader[0]);
        //}
    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}