using AjaxControlToolkit;
using LogicUniversityController.Controller;
using LogicUniversityDataModel.CustomModel;
using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{

    //Author Zaw Myo Htet,Ei Ei Maw
    //Team 10.

    public partial class GenerateReorderReportBySupplier : System.Web.UI.Page
    {
        private GenerateReorderController generateReorderController = new GenerateReorderController();
        List<String> monthList = new List<String>();
        List<SupplierOrderReport> supplierOrderReport = new List<SupplierOrderReport>();
        protected int NumberOfDropDownListControls
        {
            get { return (int)ViewState["DropDownListControls"]; }
            set { ViewState["DropDownListControls"] = value; }
        }

        protected int NumberOfCanlendarListControls
        {
            get { return (int)ViewState["CanlendarListControls"]; }
            set { ViewState["CanlendarListControls"] = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //Initiate the counter of dynamically added controls
                this.NumberOfDropDownListControls = 0;
                this.NumberOfCanlendarListControls = 0;
                ddlItems.DataTextField = "ItemName";
                ddlItems.DataValueField = "ItemId";
                ddlItems.DataSource = generateReorderController.GetItemList();
                ddlItems.DataBind();

                ddlMonth.Items.Add(new ListItem("1", "1"));
                ddlMonth.Items.Add(new ListItem("2", "2"));
                ddlMonth.Items.Add(new ListItem("3", "3"));
                ddlMonth.Items.Add(new ListItem("4", "4"));
                ddlMonth.Items.Add(new ListItem("5", "5"));

            }

            if (phMonth.Controls.Count == 0)
            {               
                this.createCDLControls(Int32.Parse(ddlMonth.SelectedValue));
            }
        }
        private void createCDLControls(int monthCount)
        {
            if (phMonth.Controls.Count == 0)
            {
                for (int i = 0; i < monthCount; i++)
                {
                    HtmlGenericControl div = new HtmlGenericControl("div");
                    int id = i + 1;
                    TextBox textbox = new TextBox();
                    CalendarExtender calendar = new CalendarExtender();
                    calendar.EnableViewState = true;
                    calendar.ID = "calender" + id;
                    textbox.ID = "textbox" + id;
                    textbox.CssClass = "form-control";
                    textbox.Attributes.Add("placeholder", "Month " + id);
                    textbox.Attributes.Add("onkeydown", "return false;");
                    div.Attributes.Add("class", "col-lg-3");
                    phMonth.Controls.Add(div);
                    div.Controls.Add(textbox);
                    calendar.TargetControlID = textbox.ID;
                    calendar.DefaultView = CalendarDefaultView.Months;
                    calendar.Format = "yyyy-MM";
                    phMonth.Controls.Add(div);
                    div.Controls.Add(calendar);
                    this.NumberOfCanlendarListControls++;
                }
            }
        }


        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            
            if (phMonth.Controls.Count == 1)
            {
                TextBox month =
                Master.FindControl("body").FindControl("textbox" + 1) as TextBox;
                if(month.Text !="")
                monthList.Add(month.Text);
            }
            else
            {
                for (int i = 1; i <= phMonth.Controls.Count; i++)
                {
                    TextBox month =
                    Master.FindControl("body").FindControl("textbox" + i) as TextBox;
                    if (month.Text != "")
                    {
                        if (monthList.Count != 0)
                        {
                            if (!CheckDuplicate(month.Text))
                            {
                                monthList.Add(month.Text);
                            }
                        }
                        else
                        {
                            monthList.Add(month.Text);
                        }
                    }
                }
            }

            if (monthList.Count > 0)
            {
                 supplierOrderReport = generateReorderController.GetReportBySupplier(ddlItems.SelectedValue, monthList);
            }            
            DataSetReorderBySupplier ds2 = new DataSetReorderBySupplier();
            DataTable t2 = ds2.DataTable1;

            DataRow r2;
            foreach (SupplierOrderReport s in supplierOrderReport)
            {
                r2 = t2.NewRow();
                r2["OrderDate"] = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(s.OrderDate.Month) + "-" + s.OrderDate.Year;
                r2["SupplierOne"] = s.SupplierOne;
                r2["SupplierTwo"] = s.SupplierTwo;
                r2["SupplierThree"] = s.SupplierThree;
                t2.Rows.Add(r2);
            }

            ReportDataSource rds = new ReportDataSource("DataSet1", t2);
            ReportViewer1.LocalReport.DataSources.Clear();
            ReportViewer1.LocalReport.DataSources.Add(rds);
            ReportViewer1.LocalReport.Refresh();
            pnlContents.Visible = true;
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int monthCount = Int32.Parse(ddlMonth.SelectedValue);
            createCDLControls(monthCount);
            ReportViewer1.LocalReport.DataSources.Clear();
        }
        private bool CheckDuplicate(string month)
        {
            foreach (String m in monthList)
            {
                if(m.Equals(month))
                {
                    return true;
                }
            }
            return false;
        }
    }
}