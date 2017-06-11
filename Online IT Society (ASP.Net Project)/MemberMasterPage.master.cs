using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Xml.Linq;

public partial class MemberMasterPage : System.Web.UI.MasterPage
{
    string OnlineUserID;
    //    protected void Page_Preinit(object sender, EventArgs e)
    //    {
    //        Page.MasterPageFile = "~/GuestMasterPage.master";
    //    }
    protected void Page_Load(object sender, EventArgs e)
    {
        lblmsg.Text = Session["login"].ToString();
    }
    protected void lbtnLogout_Click(object sender, EventArgs e)
    {
        bool flag = false;
        bool flag1 = true;
        string CurrentUser = Session["UserName"].ToString();
        string OverLapUser = Application["OverLapUser"].ToString();
        string[] sarr = OverLapUser.Split("\n".ToCharArray());
        string SOvl = string.Empty;
        foreach (string s in sarr)
        {
            if (s != "")
            {
                if (System.Text.RegularExpressions.Regex.IsMatch(CurrentUser, s))
                {
                    flag = true;
                    if (flag1)
                    {
                        flag1 = false;
                        continue;
                    }
                }
                SOvl += s + "\n";
            }
        }
        if (flag == false)
        {
            string OnlineID = Application["OnlineUserID"].ToString();
            string CurrentID = Session["mid"].ToString();
            string[] OnlineIDarr = OnlineID.Split(" ".ToCharArray());
            string SOnlineID = string.Empty;
            foreach (string s in OnlineIDarr)
            {
                if (s != "")
                {
                    if (System.Text.RegularExpressions.Regex.IsMatch(CurrentID, s))
                    {
                        continue;
                    }
                    SOnlineID += s + " ";
                }
            }

            string OnlineUsers = Application["OnlineUser"].ToString();
            string[] strarr = OnlineUsers.Split("\n".ToCharArray());
            string ss = string.Empty;
            foreach (string s in strarr)
            {
                if (s != "")
                {
                    if (System.Text.RegularExpressions.Regex.IsMatch(CurrentUser, s))
                    {
                        continue;
                    }
                    ss += s + "\n";
                }
            }
            Application["OnlineUser"] = ss;
            Application["OnlineUserID"] = SOnlineID;
        }
        Application["OverLapUser"] = SOvl;

        Session["login"] = "";
        Session["UserName"] = "";
        Session["mid"] = "";
        Session["AdminLogin"] = "";
        lblmsg.Text = "";
        lbtnLogout.Visible = false;
        Response.Redirect("Home.aspx");
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "fs")
        {
            PanelForSale.Visible = true;
            PanelJobVacancy.Visible = false;
            PanelCV.Visible = false;
            PanelTra.Visible = false;
            PanelSS.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "jv")
        {
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = true;
            PanelCV.Visible = false;
            PanelTra.Visible = false;
            PanelSS.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "cv")
        {
            PanelCV.Visible = true;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelTra.Visible = false;
            PanelSS.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "tra")
        {
            PanelTra.Visible = true;
            PanelCV.Visible = false;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelSS.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "ss")
        {
            PanelSS.Visible = true;
            PanelTra.Visible = false;
            PanelCV.Visible = false;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "eb")
        {
            PanelSS.Visible = false;
            PanelTra.Visible = false;
            PanelCV.Visible = false;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelEbook.Visible = true;
            PanelSW.Visible = false;
        }
        else if (DropDownList1.SelectedValue == "sw")
        {
            PanelSS.Visible = false;
            PanelTra.Visible = false;
            PanelCV.Visible = false;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = true;
        }
        else
        {
            PanelSS.Visible = false;
            PanelTra.Visible = false;
            PanelCV.Visible = false;
            PanelForSale.Visible = false;
            PanelJobVacancy.Visible = false;
            PanelEbook.Visible = false;
            PanelSW.Visible = false;
        }
    }
    protected void btnSearchForSale_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?brand=" + ddlBrand.SelectedValue + "&minprice=" + txtMinPrice.Text + "&maxprice=" + txtMaxPrice.Text + "&region=" + ddlRegion.SelectedValue + "&type=fs");
    }
    protected void btnSearchJobVacancy_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?jobcat=" + ddlJobCategory.SelectedValue + "&minsal=" + txtMinSalary.Text + "&maxsal=" + txtMaxSalary.Text + "&type=jv");
    }
    protected void btnSearchCV_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?minage=" + txtMinAge.Text + "&maxage=" + txtMaxAge.Text + "&quali=" + txtQualification.Text + "&type=cv");
    }
    protected void btnSearchTraining_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?training=" + txtTrainingName.Text + "&type=tra");
    }
    protected void btnSearchSS_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?center=" + txtCenterName.Text + "&centertype=" + ddlType.SelectedValue + "&type=ss");
    }
    protected void btnSearchEbook_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?bname=" + txtBookTitle.Text + "&type=eb");
    }
    protected void btnSearchSW_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/AdvanceSearch.aspx?swname=" + txtSW.Text + "&type=sw");
    }
    protected void txtMinPrice_TextChanged(object sender, EventArgs e)
    {
        RangeValidatorMaxPrice.MinimumValue = txtMinPrice.Text;
    }
    protected void txtMaxPrice_TextChanged(object sender, EventArgs e)
    {
        if (int.Parse(txtMinPrice.Text) > int.Parse(txtMaxPrice.Text))
        {
            RangeValidatorMaxPrice.ToolTip = "Must be greater than Minimum Price";
        }
        else
        {
            RangeValidatorMaxPrice.ToolTip = "Must be integer";
        }
    }
    protected void txtMinSalary_TextChanged(object sender, EventArgs e)
    {
        RangeValidatorMaxSal.MinimumValue = txtMinSalary.Text;
    }
    protected void txtMaxSalary_TextChanged(object sender, EventArgs e)
    {
        if (int.Parse(txtMinSalary.Text) > int.Parse(txtMaxSalary.Text))
            RangeValidatorMaxSal.ToolTip = "Must be greater than Minimum Salary";
        else
            RangeValidatorMaxSal.ToolTip = "Must be integer";
    }
    protected void txtMinAge_TextChanged(object sender, EventArgs e)
    {
        RangeValidatorMaxAge.MinimumValue = txtMaxAge.Text;
    }
    protected void txtMaxAge_TextChanged(object sender, EventArgs e)
    {
        if (int.Parse(txtMinAge.Text) > int.Parse(txtMaxAge.Text))
            RangeValidatorMaxAge.ToolTip = "Must be greater than Minimum Age";
        else
            RangeValidatorMaxAge.ToolTip = "Must be integer";
    }

}
