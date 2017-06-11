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

public partial class QuesANDAns : System.Web.UI.Page
{
    public static int aid,qid;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["mid"].ToString()!="")
        {
            Page.MasterPageFile = "~/MemberMasterPage.master";
        }
        else if (Session["AdminLogin"].ToString()!="")
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

            if (Session["mid"].ToString()=="")
            {
                txtquestion.Visible = false;
                btnpostques.Visible = false;
                labelquestion.Visible = false;
            }
    }
    protected bool isMember()
    {
        if (Session["mid"].ToString()=="")
        {
            return false;
        }
        else
            return true;
    }
    protected void btnpostques_Click(object sender, EventArgs e)
    {
        if (txtquestion.Text != "")
        {
            SqlConnection QuesandAnsDB6 = new SqlConnection(@"Data Source=laemon-pc\group3_server;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3");

            try
            {
                SqlCommand cmdQAns = new SqlCommand("Select max(questionID) from Question ", QuesandAnsDB6);
                QuesandAnsDB6.Open();
                Object obj = cmdQAns.ExecuteScalar();
                qid = int.Parse(obj.ToString());
                qid += 1;
            }
            catch (Exception)
            {
                qid = 1;
            }

            string s = @"INSERT INTO Question(questionID,memberID,question) VALUES(@qid,@mid,@ques)";
            SqlCommand cmdQAns4 = new SqlCommand(s, QuesandAnsDB6);
            cmdQAns4.Parameters.AddWithValue("@qid", qid);
            cmdQAns4.Parameters.AddWithValue("@mid", int.Parse(Session["mid"].ToString()));
            cmdQAns4.Parameters.AddWithValue("@ques", txtquestion.Text);
            cmdQAns4.ExecuteNonQuery();
            QuesandAnsDB6.Close();
            DataList1.DataBind();
            txtquestion.Text = "";
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "My Alert", "alert('Enter Question');", true);

    }
   
   

    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {
        if (e.CommandName == "mycommand")
        {
            if (((TextBox)DataList1.FindControl("txtanswer")).Text != "")
            {
                DataListItem item = DataList1.Items[e.Item.ItemIndex] as DataListItem;
                TextBox txtbox = item.FindControl("txtanswer") as TextBox;
                txtbox.Visible = false;
            }
        }
    }
  
    protected void btnanswer_Click1(object sender, EventArgs e)
    {
        Button b=(Button)sender;
        DataListItem d=(DataListItem)b.NamingContainer;
        TextBox t=(TextBox)d.FindControl("txtanswer");
        string a=t.Text;
        if (a!="")
        {
            SqlConnection con = new SqlConnection(@"Data Source=LAEMON-PC\group3_server;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");
            con.Open();
            try
            {
                SqlCommand cmdQAns = new SqlCommand("Select max(ansID) from Answer", con);
                Object obj = cmdQAns.ExecuteScalar();
                aid = Convert.ToInt32(obj.ToString());
                aid += 1;
            }
            catch (Exception)
            {
                aid = 1;
            }
            Button btn = (Button)sender;
            DataListItem dli = (DataListItem)btn.NamingContainer;
            TextBox txtbox = (TextBox)dli.FindControl("txtanswer");
            string ans = txtbox.Text;
            

            Label label1 = (Label)dli.FindControl("questionIDLabel");
            int qid = int.Parse(label1.Text);

            string s = @"INSERT INTO Answer (ansID,answer,questionID,memberID) VALUES (@aid,@ans,@qid,@mid)";
            SqlCommand cmdQAns3 = new SqlCommand(s, con);
            int qm = Convert.ToInt32(Session["mid"].ToString());
            cmdQAns3.Parameters.AddWithValue("@aid", aid);
            cmdQAns3.Parameters.AddWithValue("@ans", ans);
            cmdQAns3.Parameters.AddWithValue("@qid", qid);
            cmdQAns3.Parameters.AddWithValue("@mid", qm);
            int rows = cmdQAns3.ExecuteNonQuery();

            con.Close();
            DataList1.DataBind();

            DataList d2 = (DataList)dli.FindControl("DataList2");
            d2.DataBind();
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "my alert", "alert('Enter Answer');", true);
            
    }
}
