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

public partial class MemberEditProfile : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void UpdateButton_DataBinding(object sender, EventArgs e)
    {
        //if (IsPostBack)
        //{
        //    DataView dv = (DataView)psw_DS.Select(DataSourceSelectArguments.Empty);
        //    foreach (DataRowView dr in dv)
        //    {
        //        str = dr[0].ToString();
        //        break;
        //    }
        //    string curr = ((TextBox)FormView1.FindControl("cur_psw")).Text;
        //    if (curr != str)
        //    {
        //        ((Label)FormView1.FindControl("lblerr")).Text = "Invalid Current Password!";
        //        return;
        //    }
        //}
        //if (IsPostBack)
        //{
        //    clear();
           
        //}
    }
    public void clear()
    {
        ((TextBox)FormView1.FindControl("usernameTextBox")).Text = "";
        ((RadioButtonList)FormView1.FindControl("rblgender")).ClearSelection();
        ((TextBox)FormView1.FindControl("dobTextBox")).Text = "";
        ((TextBox)FormView1.FindControl("cur_psw")).Text = "";
        ((TextBox)FormView1.FindControl("passwordTextBox")).Text = "";
        ((TextBox)FormView1.FindControl("con_psw")).Text = "";
        ((TextBox)FormView1.FindControl("bankaccountTextBox")).Text = "";
    }
    //protected void Delete_Click(object sender, EventArgs e)
    //{
    //    Delete_DS.Delete();
    //    ClientScript.RegisterStartupScript(this.GetType(), "Delete", "alert('" + "Are you sure to delete?" + "');", true);
    //    clear();
    //}
    string str;
    string cur;
   
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        int dob = (DateTime.Parse(((TextBox)FormView1.FindControl("dobTextBox")).Text)).Year;
        int now = DateTime.Now.Year;
        int age = now - dob;
        if (age >= 18)
        {
            args.IsValid = true;
        }
        else
        {
            args.IsValid = false;
        }

    }
    protected void FormView1_ItemUpdated1(object sender, FormViewUpdatedEventArgs e)
    {
        lblMsg.Text = "Update Successful...";
        
    }
    protected void UpdateButton_Click(object sender, EventArgs e)
    {
    //    if (IsPostBack)
    //    {
    //        DataView dv = (DataView)psw_DS.Select(DataSourceSelectArguments.Empty);
    //        foreach (DataRowView dr in dv)
    //        {
    //            str = dr[0].ToString();
    //            break;
    //        }
    //        string curr = ((TextBox)FormView1.FindControl("cur_psw")).Text;
    //        if (curr != str)
    //        {
    //            ((Label)FormView1.FindControl("lblerr")).Text = "Invalid Current Password!";
    //            return;
    //        }
    //    }
    //    if (IsPostBack)
    //    {
    //        clear();

    //    }
    }

    protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
    {
        DataView dv = (DataView)psw_DS.Select(DataSourceSelectArguments.Empty);
        foreach (DataRowView dr in dv)
        {
            str = dr[0].ToString();
            break;
        }
        string curr = ((TextBox)FormView1.FindControl("cur_psw")).Text;
        if (curr != str)
        {
            args.IsValid = false;
        }
        else
            args.IsValid = true;
    }
}
