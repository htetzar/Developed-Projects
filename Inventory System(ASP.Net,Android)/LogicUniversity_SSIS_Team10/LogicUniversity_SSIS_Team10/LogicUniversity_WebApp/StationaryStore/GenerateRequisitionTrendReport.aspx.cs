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
    public partial class GenerateRequisitionTrendReport : System.Web.UI.Page
    {
        private GenerateRequisitionTrendReportController generateRequisitionTrendReportController = new GenerateRequisitionTrendReportController();
        List<DepartmentRequisitionReport> departmentRequisitionReportList = new List<DepartmentRequisitionReport>();

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
                this.NumberOfCanlendarListControls = 0;

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
            try
            {
                var monthList = new List<String>();
                if (monthList.Count == 1)
                {
                    TextBox month =
                    Master.FindControl("body").FindControl("textbox" + 1) as TextBox;
                    if (month.Text != "")
                        monthList.Add(month.Text);
                }
                else
                {
                    for (int i = 1; i <= phMonth.Controls.Count; i++)
                    {
                        TextBox month =
                        Master.FindControl("body").FindControl("textbox" + i) as TextBox;
                        if (month.Text != "")
                            monthList.Add(month.Text);
                    }
                }
                if (monthList.Count > 0)
                {
                    departmentRequisitionReportList = generateRequisitionTrendReportController.GetReportByDepartment(monthList);
                }


                // Microsoft
                DataSetReorderBySupplier ds2 = new DataSetReorderBySupplier();
                DataTable t2 = ds2.Tables.Add("SupplierOrderReport");
                t2.Columns.Add("RequisitionDate", Type.GetType("System.String"));
                t2.Columns.Add("CommerceDept", Type.GetType("System.Int32"));
                t2.Columns.Add("ComputerScience", Type.GetType("System.Int32"));
                t2.Columns.Add("EnglishDept", Type.GetType("System.Int32"));
                t2.Columns.Add("RegistrarDept", Type.GetType("System.Int32"));
                t2.Columns.Add("ZoologyDept", Type.GetType("System.Int32"));

                DataRow r2;
                foreach (DepartmentRequisitionReport d in departmentRequisitionReportList)
                {
                    r2 = t2.NewRow();
                    r2["RequisitionDate"] = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(d.RequisitionDate.Month) + "-" + d.RequisitionDate.Year;
                    r2["CommerceDept"] = d.CommerceDept;
                    r2["ComputerScience"] = d.ComputerScience;
                    r2["EnglishDept"] = d.EnglishDept;
                    r2["RegistrarDept"] = d.RegistrarDept;
                    r2["ZoologyDept"] = d.ZoologyDept;
                    t2.Rows.Add(r2);
                }
                ReportDataSource rds = new ReportDataSource("DataSet1", t2);
                ReportViewer1.LocalReport.DataSources.Clear();
                ReportViewer1.LocalReport.DataSources.Add(rds);
                ReportViewer1.LocalReport.Refresh();
                pnlContents.Visible = true;
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong!')", true);
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int monthCount = Int32.Parse(ddlMonth.SelectedValue);
            createCDLControls(monthCount);
            ReportViewer1.LocalReport.DataSources.Clear();
        }
    }
}