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

public partial class SetAlert : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{
        //    AutoGen();
        //}
        txtEmail.Text = Session["login"].ToString();
    }

    protected void Page_PreRender(object sender, EventArgs e)
    {
        txtDate.Attributes["readonly"] = "readonly";
    }

    protected void ddlLooking_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBrand.Items.Clear();
        ddlBrand.DataBind();
   
    }
    private void clear()
    {
        ddlLooking.SelectedIndex = -1;
        ddlBrand.SelectedIndex = -1;
        txtModel.Text = "";
        txtMax.Text = "";
        txtMin.Text = "";
        txtEmail.Text = Session["login"].ToString();
        

        txtDate.Text = "";
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        clear();
       
    }
    protected void btnSetAlert_Click(object sender, EventArgs e)
    {
            AutoGen();
            setalert_SaveDS.Insert();
            lblmsg.Text = "Alert Successful....";
            clear();
      
      
    }
    public void AutoGen()
    {
        int i=0;
        DataView dv=(DataView)setalert_GenerateidDS.Select(DataSourceSelectArguments.Empty);
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
        
        Session["alertid"] = i.ToString();
    }

    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        if (DateTime.Today < DateTime.Parse(txtDate.Text))
        {
            args.IsValid = true;
        }
    }
}
