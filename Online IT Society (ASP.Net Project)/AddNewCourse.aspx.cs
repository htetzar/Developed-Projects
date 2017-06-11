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

public partial class AddNewCourse : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Page.Title = "Add New Course Page";//naming page's title;
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtSdate.Attributes["readonly"] = "readonly";
    }

    protected void btmInsert_Click(object sender, EventArgs e)
    {
       
            int i = 0;
            DataView dv = (DataView)AddnewcourseDS.Select(DataSourceSelectArguments.Empty);
            try
            {
                foreach (DataRowView dr in dv)
                {
                    i = int.Parse(dr[0].ToString());
                    break;
                }
                i++;
            }
            catch { i = 0; }

            Session["id"] = i.ToString();//auto generate Id;

            string time1 = null;
            time1 = txtTime.Text + DropDownList1.SelectedItem.Text + Label9.Text + txtTime1.Text + DropDownList2.Text;
            Session["mytime"] = time1;

            //if (DateTime.Today <= DateTime.Parse(txtSdate .Text )) 
             
            
            //  {
            //    lblMsg.Text = "Start date must greater than today date!!";
            //  }


            if (Page.IsValid)
            {
                 AddnewcourseDS.Insert();//insert data to course table;
                 Server.Transfer("trainer.aspx");
            }
       
       

    }
    protected void btmCancel_Click(object sender, EventArgs e)
    {
       
        Response.Redirect("trainer.aspx");
    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {

        //if (DateTime.Parse(txtSdate.Text) >= DateTime.Now)
     
        //    args.IsValid = true;
        //else
        //    args.IsValid = false;



        args.IsValid = false;
        if (DateTime.Parse(txtSdate.Text) >= DateTime.Today)
        {
            args.IsValid = true;
        }
    }
   
}
