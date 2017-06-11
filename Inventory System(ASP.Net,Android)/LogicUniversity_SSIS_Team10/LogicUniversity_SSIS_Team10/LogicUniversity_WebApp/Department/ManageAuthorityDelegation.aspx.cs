using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using LogicUniversityDataModel.CustomModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.Department
{
    //Author Ei Ei Maw.
    //Team 10.

    public partial class ManageAuthorityDelegation : System.Web.UI.Page
    {
        Staff user;
        ManageAuthorityDelegationController delegateController = new ManageAuthorityDelegationController();
        protected void Page_Load(object sender, EventArgs e)
        {
            var sdate = new DateTime(DateTime.Today.Year, DateTime.Today.Month, DateTime.Today.Day);
            CalendarExtender1.StartDate = sdate;
            CalendarExtender2.StartDate = sdate;
            user = (Staff)Session["User"];
            if (!IsPostBack)
            {

                lblDepartmentName.Text = user.Department.DepartmentName;
                List<Staff> staffList = delegateController.GetStaffNameByDepartmentId(user.DepartmentId, user.StaffId);
                ddlEmpList.DataSource = staffList;
                ddlEmpList.DataValueField = "StaffId";
                ddlEmpList.DataTextField = "StaffName";
                ddlEmpList.DataBind();
                ddlEmpList.Items.Insert(0, "Select Employee Name");

                LogicUniversityDataModel.Delegate deleInfoStatus = delegateController.CheckStatus(user.DepartmentId);

                if (deleInfoStatus == null)
                {
                    btnDeletegate.Enabled = true;
                    
                }
                else
                {
                    btnDeletegate.Enabled = false;
                    btnDeletegate.Text = "Delegated";
                    btnDeletegate.CssClass = "btn btn-danger";
                    List<DelegateEmployee> delegateEmployee = new List<DelegateEmployee>();
                    DelegateEmployee emp = new DelegateEmployee();
                    emp.StaffId = deleInfoStatus.StaffId;
                    emp.StaffName = deleInfoStatus.Staff.StaffName;
                    emp.StartDate = deleInfoStatus.StartDate;
                    emp.EndDate = deleInfoStatus.EndDate;
                    delegateEmployee.Add(emp);
                    grv_delegate.DataSource = delegateEmployee;
                    grv_delegate.DataBind();
                }
            }
        }
        protected void btnDeletegate_Click(object sender, EventArgs e)
        {
            List<DelegateEmployee> delegateEmpList = new List<DelegateEmployee>();
            DelegateEmployee delegeEmployee = new DelegateEmployee();
            if (ddlEmpList.SelectedIndex != 0)
            {
                if (txtSDate.Text != "" && txtEDate.Text != "")
                {
                    delegeEmployee.DepartmentheadId = user.StaffId;

                    delegeEmployee.StaffId = ddlEmpList.SelectedValue.ToString();

                    delegeEmployee.StaffName = Convert.ToString(ddlEmpList.SelectedItem.Text);

                    delegeEmployee.StartDate = Convert.ToDateTime(txtSDate.Text.ToString());
                    delegeEmployee.EndDate = Convert.ToDateTime(txtEDate.Text.ToString());
                    delegeEmployee.Status = true;
                    delegateEmpList.Add(delegeEmployee);
                    delegateController.SaveDelegateInfo(delegeEmployee);
                    grv_delegate.DataSource = delegateEmpList;
                    grv_delegate.DataBind();
                    SendMailToDelegatedStaff();
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Delegation authority mail has been sent successfully!');", true);
                    btnDeletegate.Enabled = false;
                    btnDeletegate.Text = "Delegated";
                    btnDeletegate.CssClass = "btn btn-danger";
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Please choose an Employee!');", true);
            }

        }

        protected void btn_terminate_Click(object sender, EventArgs e)
        {
            delegateController.TermiateEmployee(user.DepartmentId);
            grv_delegate.DataSource = null;
            grv_delegate.DataBind();
            SendMailToTeminateAuthority();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Termination authority mail has been sent successfully!');", true);
            btnDeletegate.Enabled = true;
            btnDeletegate.Text = "Delegate";
            btnDeletegate.CssClass = "btn btn-primary";
        }
        private void SendMailToDelegatedStaff()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "zawmyohtet2016.mandalay@gmail.com";
            String subj = "Delegation authority to " + ddlEmpList.SelectedItem.Text + "";
            String message = "I have delegated you as department head. " + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmailToDelegatedStaff(toEmail, subj, message);
        }
        private void SendMailToTeminateAuthority()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "zawmyohtet2016.mandalay@gmail.com";
            String subj = "Termination authority to " + ddlEmpList.SelectedItem.Text + "";
            String message = "I have terminated your authority as department head. Thank you for your supporting. " + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmailToDelegatedStaff(toEmail, subj, message);
        }
    }
}