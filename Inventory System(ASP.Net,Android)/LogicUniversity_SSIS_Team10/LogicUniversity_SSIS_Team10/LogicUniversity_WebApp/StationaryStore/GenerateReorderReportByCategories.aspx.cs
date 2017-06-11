using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using LogicUniversityDataModel.CustomModel;
using System.Data;
using Microsoft.Reporting.WebForms;
using System.Globalization;
using System.Web.UI.HtmlControls;
using System.Text;

namespace LogicUniversity_WebApp.StationaryStore
{

    //Author Zaw Myo Htet,Ei Ei Maw
    //Team 10.
    public partial class GenerateReorderReportByCategories : System.Web.UI.Page
    {
        private GenerateReorderController generateReorderController = new GenerateReorderController();
        private List<Category> categoryList;
        List<CategoryOrderReport> categpryOrderReport = new List<CategoryOrderReport>();
        protected int NumberOfCheckBoxListControls
        {
            get { return (int)ViewState["CheckBoxListControls"]; }
            set { ViewState["CheckBoxListControls"] = value; }
        }

        protected int NumberOfCanlendarListControls
        {
            get { return (int)ViewState["CanlendarListControls"]; }
            set { ViewState["CanlendarListControls"] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            categoryList = generateReorderController.GetCategoryList();

            if (!Page.IsPostBack)
            {
                //Initiate the counter of dynamically added controls
                this.NumberOfCheckBoxListControls = categoryList.Count;
                this.NumberOfCanlendarListControls = 0;

                ddlMonth.Items.Add(new ListItem("1", "1"));
                ddlMonth.Items.Add(new ListItem("2", "2"));
                ddlMonth.Items.Add(new ListItem("3", "3"));
                ddlMonth.Items.Add(new ListItem("4", "4"));
                ddlMonth.Items.Add(new ListItem("5", "5"));
            }

            if (phCategory.Controls.Count == 0 && phMonth.Controls.Count == 0)
            {

                this.createCDLControls(Int32.Parse(ddlMonth.SelectedValue));
                this.createCheckBoxControls(categoryList.Count);
                int monthCount = Int32.Parse(ddlMonth.SelectedValue);
                createCDLControls(monthCount);
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
                    textbox.Attributes.Add("placeholder","Month "+id);
                    textbox.Attributes.Add("onkeydown", "return false;");
                    div.Attributes.Add("class","col-lg-3");
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

        private void createCheckBoxControls(int checkBoxCount)
        {
            if (phCategory.Controls.Count == 0)
            {
                for (int i = 0; i < checkBoxCount; i++)
                {
                    HtmlGenericControl li = new HtmlGenericControl("li");
                    int id = i + 1;
                    CheckBox checkBox = new CheckBox();
                    checkBox.ID = "checkBox" + id;
                    checkBox.Text = categoryList[i].CategoryName;
                    phCategory.Controls.Add(li);
                    li.Controls.Add(checkBox);
                    this.NumberOfCheckBoxListControls++;
                }
            }
        }

        protected void ddlMonth_SelectedIndexChanged(object sender, EventArgs e)
        {
            int monthCount = Int32.Parse(ddlMonth.SelectedValue);
            createCDLControls(monthCount);
            ReportViewer2.LocalReport.DataSources.Clear();
        }

        protected void btnGenerate_Click(object sender, EventArgs e)
        {
            var monthList = new List<String>();
            var categoryStringList = new List<String>();
          
            if(phMonth.Controls.Count == 1)
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
                    if(month.Text !="")
                    monthList.Add(month.Text);
                }

            }         
            
            for (int i = 1; i <= phCategory.Controls.Count; i++)
            {
                CheckBox category =
                Master.FindControl("body").FindControl("checkBox" + i) as CheckBox;
                if(category.Checked)
                categoryStringList.Add(category.Text);
            }
            if (monthList.Count > 0)
            {
                categpryOrderReport = generateReorderController.GetReportByCategory(categoryStringList, monthList);
            }
            DataSetReorderBySupplier ds2 = new DataSetReorderBySupplier();     
            DataTable t = ds2.DataTable2;
            foreach (CategoryOrderReport c in categpryOrderReport)
            {
                DataRow r2 = t.NewRow();
                r2["OrderDate"] = CultureInfo.CurrentCulture.DateTimeFormat.GetMonthName(c.OrderDate.Month) + "-" + c.OrderDate.Year; 
                r2["Clip"] = c.Clip;
                r2["Envelope"] = c.Envelope;
                r2["Eraser"] = c.Eraser;
                r2["Exercise"] = c.Exercise;
                r2["File"] = c.File;
                r2["Pen"] = c.Pen;
                r2["Puncher"] = c.Puncher;
                r2["Pad"] = c.Pad;
                r2["Paper"] = c.Paper;
                r2["Ruler"] = c.Ruler;
                r2["Scissors"] = c.Scissors;
                r2["Tape"] = c.Tape;
                r2["Sharpener"] = c.Sharpener;
                r2["Shorthand"] = c.Shorthand;
                r2["Stapler"] = c.Stapler;
                r2["Tacks"] = c.Tacks;
                r2["Tparency"] = c.Tparency;
                r2["Tray"] = c.Tray;
                t.Rows.Add(r2);
            }
            ReportDataSource rds = new ReportDataSource("DataSet1", t);
            ReportViewer2.LocalReport.DataSources.Clear();
            ReportViewer2.LocalReport.DataSources.Add(rds);
            ReportViewer2.LocalReport.Refresh();
            pnlContents.Visible = true;
        }
    }
}