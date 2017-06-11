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

public partial class GuestMasterPage : System.Web.UI.MasterPage
{
    string OnlineUser;
    string OnlineUserID;
    protected void Page_Load(object sender, EventArgs e)
    {
        DELabove2wksItemDS.Delete();
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        DataView dv = (DataView)memDS.Select(DataSourceSelectArguments.Empty);
        if (dv.Count != 0)
        {
            dv = (DataView)memValidDS.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                foreach (DataRowView dr in dv)
                {
                    Session["UserName"] = dr[2].ToString();
                    Session["mid"] = dr[3].ToString();
                    break;
                }

                Session["login"] = txtemail.Text;
                string login = Session["login"].ToString();

                if (Application["OnlineUserID"] != "")
                {
                    bool flag = false;
                    string OnlineID = Application["OnlineUserID"].ToString();
                    string CurrentID = Session["mid"].ToString();
                    string[] strarr = OnlineID.Split(" ".ToCharArray());
                    foreach (string s in strarr)
                    {
                        if (s != "")
                        {
                            if (System.Text.RegularExpressions.Regex.IsMatch(s, CurrentID))
                            {
                                flag = true;
                                string OverLapUser = Application["OverLapUser"].ToString();
                                OverLapUser += Session["UserName"].ToString() + "\n";
                                Application["OverLapUser"] = OverLapUser;
                            }
                        }
                    }
                    if (flag == false)
                    {
                        if (Application["OnlineUser"] != null)
                        {
                            OnlineUser = Application["OnlineUser"].ToString();
                        }
                        OnlineUser += Session["UserName"].ToString() + "\n";
                        Application["OnlineUser"] = OnlineUser;

                        OnlineUserID = Application["OnlineUserID"].ToString();
                        OnlineUserID += Session["mid"].ToString() + " ";
                        Application["OnlineUserID"] = OnlineUserID;

                    }
                    //else
                    //{
                    //    OnlineUserID = Application["OnlineUserID"].ToString();
                    //    OnlineUserID += Session["mid"].ToString() + " ";
                    //    Application["OnlineUserID"] = OnlineUserID;

                    //}
                }
                else
                {
                    if (Application["OnlineUser"] != null)
                    {
                        OnlineUser = Application["OnlineUser"].ToString();
                    }
                    OnlineUser += Session["UserName"].ToString() + "\n";
                    Application["OnlineUser"] = OnlineUser;

                    OnlineUserID = Application["OnlineUserID"].ToString();
                    OnlineUserID += Session["mid"].ToString() + " ";
                    Application["OnlineUserID"] = OnlineUserID;

                }

                Response.Redirect("Home.aspx");
            }
            else { lblmsg.Text = "Incorrect Login"; }
        }
        else
        {
            dv = (DataView)trainerDS.Select(DataSourceSelectArguments.Empty);
            if (dv.Count != 0)
            {
                dv = (DataView)trainerValidDS.Select(DataSourceSelectArguments.Empty);
                if (dv.Count != 0)
                {
                    Session["login"] = txtemail.Text;
                    Response.Redirect("Trainer.aspx");
                }
                else { lblmsg.Text = "Incorrect Login"; }
            }
            else
            { lblmsg.Text = "Register first"; }
        }
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
