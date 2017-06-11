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

public partial class UploadActivities : System.Web.UI.Page
{
    string con_string = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3";

    
    protected void Page_Load(object sender, EventArgs e)
    {

        //For Seminar type
        if (ddlActivityType.SelectedValue == "1")
        {
            MultiView1.SetActiveView(View1);
        }
        else   //For exhibition or workshop type
        {
            MultiView1.SetActiveView(View2);
        }
        
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtSemDate.Attributes["readonly"] = "readonly";
        txtEWStartDate.Attributes["readonly"] = "readonly";
        txtEWEndDate.Attributes["readonly"] = "readonly";
    }

    protected void ddlActivityType_SelectedIndexChanged(object sender, EventArgs e)
    {
        //if user selected "Seminar" from drop downlist
        if (ddlActivityType.SelectedValue == "1")
        {
            MultiView1.SetActiveView(View1);
        }
        else    //if user selected "Exhibition or Workshop" from drop downlist
        {
            MultiView1.SetActiveView(View2);
        }
        
    }
    protected void btnPost_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(con_string);
        con.Open();
        
        //For Seminar type
        if (ddlActivityType.SelectedValue == "1")
        {
            
            //auto generate seminarid
            int i;
            SqlCommand cmdmax = new SqlCommand(@"Select max(seminarID) from Seminar", con);
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

            
            Session["seminarid"] = i.ToString();
            string sqlseminar = @"Insert into Seminar([seminarID],[memberID],[title],[seminarDate],[fromTime],[toTime],[place],[presenter],[description],[postedDate]) Values(@seminarid,@memberid,@title,@seminardate,@fromtime,@totime,@place,@presenter,@description,@posteddate)";
            SqlCommand cmdseminar = new SqlCommand(sqlseminar, con);

            cmdseminar.Parameters.AddWithValue("@seminarid", int.Parse(Session["seminarid"].ToString()));
            cmdseminar.Parameters.AddWithValue("@memberid", int.Parse(Session["mid"].ToString()));
            cmdseminar.Parameters.AddWithValue("@title", txtSemTitle.Text);
            cmdseminar.Parameters.AddWithValue("@seminardate", DateTime.Parse(txtSemDate.Text));

            string from = null, to = null;
            from = txtSemStartTime.Text + " " + ddlSemStartAMPM.SelectedItem.Text;
            cmdseminar.Parameters.AddWithValue("@fromtime", from);
            to = txtSemFinishTime.Text + " " + ddlSemSemFinishAMPM.SelectedItem.Text;
            cmdseminar.Parameters.AddWithValue("@totime", to);

            cmdseminar.Parameters.AddWithValue("@place", txtSemPlace.Text);
            cmdseminar.Parameters.AddWithValue("@presenter", txtSemPresenter.Text);
            cmdseminar.Parameters.AddWithValue("@description", txtSemDescription.Text);
            cmdseminar.Parameters.AddWithValue("@posteddate", DateTime.Now);
            
            try
            {
                if(Page.IsValid)
                {
                    //insert data into Seminar Table
                    cmdseminar.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Upload Successful!');", true);
                //After inserting data to DB, clear data in controls
                ResetData();
                }

                
            }
            catch (Exception ex)
            {
                lblStatusSeminar.ForeColor = System.Drawing.Color.Red;
                lblStatusSeminar.Text = "Followiing error occurs : " + ex.Message;
            }
            con.Close();


        }
        else   //For exhibition or workshop type
        {
           
            //auto generate ewID
            int i;
            SqlCommand cmdmax = new SqlCommand(@"Select max(ewID) from ExhibitionWS", con);
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

            Session["ewid"]=i.ToString();

            string sqlew = @"Insert into ExhibitionWS([ewID],[memberID],[title],[startDate],[endDate],[fromTime],[toTime],[place],[description],[postedDate]) Values(@ewid,@memberid,@title,@startdate,@enddate,@fromtime,@totime,@place,@description,@posteddate)";

            SqlCommand cmdew = new SqlCommand(sqlew, con);
            cmdew.Parameters.AddWithValue("@ewid", int.Parse(Session["ewid"].ToString()));
            cmdew.Parameters.AddWithValue("@memberid", int.Parse(Session["mid"].ToString()));
            cmdew.Parameters.AddWithValue("@title", txtEWTitle.Text);
            cmdew.Parameters.AddWithValue("@startdate", DateTime.Parse(txtEWStartDate.Text));
            cmdew.Parameters.AddWithValue("@enddate", DateTime.Parse(txtEWEndDate.Text));

            string from = null, to = null;
            from = txtEWStartTime.Text + " " + ddlEWStartAMPM.SelectedItem.Text;
            cmdew.Parameters.AddWithValue("@fromtime", from);
            to = txtEWFinishTime.Text + " " + ddlEWFinishAMPM2.SelectedItem.Text;
            cmdew.Parameters.AddWithValue("@totime", to);
            cmdew.Parameters.AddWithValue("@place", txtEWPlace.Text);
            cmdew.Parameters.AddWithValue("@description", txtEWDescription.Text);
            cmdew.Parameters.AddWithValue("@posteddate", DateTime.Now);

            try
            {
                if(Page.IsValid)
                {
                    //insert data into ExhibitionWS Table
                    cmdew.ExecuteNonQuery();
                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Upload Successful!');", true);

                    //After inserting data to DB, clear data in controls
                    ResetData();
                }

            }
            catch (Exception ex)
            {
                lblStatusExhibitionWS.ForeColor = System.Drawing.Color.Red;
                lblStatusExhibitionWS.Text = "Followiing error occurs : " + ex.Message;
            }
            con.Close();

        }
        
    }

    private void ResetData()
    {
        //For Seminar type, clear data in controls
        if (ddlActivityType.SelectedValue == "1")
        {
            txtSemTitle.Text = "";
            txtSemPresenter.Text = "";
            txtSemPlace.Text = "";
            txtSemDate.Text = "";
            txtSemStartTime.Text = "";
            ddlSemStartAMPM.ClearSelection();
            txtSemFinishTime.Text = "";
            ddlSemSemFinishAMPM.ClearSelection();
            txtSemDescription.Text = "";
            lblStatusSeminar.Text = "";
        }
        else   //For exhibition or workshop type, clear data in controls
        {
            txtEWTitle.Text="";
            txtEWStartDate.Text="";
            txtEWEndDate.Text="";
            txtEWStartTime.Text="";
            ddlEWStartAMPM.ClearSelection();
            txtEWFinishTime.Text="";
            ddlEWFinishAMPM2.ClearSelection();
            txtEWPlace.Text="";
            txtEWDescription.Text="";
            lblStatusExhibitionWS.Text = "";
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //For Cancel for Seminar
        if (ddlActivityType.SelectedValue == "1")
        {
            ResetData();
        }
        else   //For Cancel button for Exhibition,WorkShop
        {
            ResetData();
        }
    }

    protected void CustValSeminarDate_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid=false;
        if (DateTime.Parse(txtSemDate.Text) >= DateTime.Today)
        {
            args.IsValid = true;
        }
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if(DateTime.Parse(txtEWEndDate.Text)>=DateTime.Parse(txtEWStartDate.Text))
        {
            args.IsValid=true;
        }
    }
    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (DateTime.Parse(txtEWStartDate.Text)>=DateTime.Today)
        {
            args.IsValid = true;
        }
    }
}
