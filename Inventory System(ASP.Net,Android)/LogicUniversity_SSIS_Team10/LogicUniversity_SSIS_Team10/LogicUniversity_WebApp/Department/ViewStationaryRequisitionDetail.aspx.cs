using LogicUniversityController;
using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.Department
{
    //Author Krithiga Gunasekaran,Zaw Myo Htet,Ei Ei Maw.
    //Team 10.

    public partial class ViewStationaryRequisitionDetail : System.Web.UI.Page
    {
        ViewStationaryRequisitionController viewStationeryRequisitionController = new ViewStationaryRequisitionController();
        List<RequisitionDetail> requisitionDetails;
        Staff user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            string requisitionId = Request["requisitionId"];
            lblRequisitionIDValue.Text = requisitionId;
            string Date = Request["Date"];
            lblDateValue.Text = Date;
            string Status = Request["Status"];
            lblStatusValue.Text = Status;
            DataTable dt = new DataTable();
            requisitionDetails = viewStationeryRequisitionController.GetRequisitionDetails(requisitionId);
            if (!IsPostBack)
            {
                BindGridViewList();
            }
            if (lblStatusValue.Text.ToLower() == "pending")
            {
                lblStatusValue.CssClass = "label label-success";
            }
        }
        public void BindGridViewList()
        {
            gv_List.DataSource = requisitionDetails.Select(x => new { x.Item.ItemName, x.Quantity });
            gv_List.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int rowCount = gv_List.Rows.Count;
            List<RequisitionDetail> newRequisitionList = requisitionDetails;
            for (int i = 0; i < rowCount; i++)
            {
                RequisitionDetail newRequisitionDetails = newRequisitionList[i];
                int quantity = Convert.ToInt32(((TextBox)gv_List.Rows[i].FindControl("txtQuantityID")).Text);
                newRequisitionDetails.Quantity = quantity;

            }
            viewStationeryRequisitionController.modifyRequisitionDetails(newRequisitionList);
            SendMailToDepartmentHead();
            Response.Redirect("~/Department/ViewStationaryRequisitionList.aspx");
        }
        private void SendMailToDepartmentHead()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "cuong090694@gmail.com";
            String subj = "To Approve Stationery Requisition Form (" + lblRequisitionIDValue.Text + ")";
            String message = "Please see Stationery Requisition form and approve /reject for this form" + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmail(toEmail, subj, message);
            btnSubmit.CssClass = "btn btn-success disabled";
            btnSubmit.Attributes.Add("disabled","disabled");
            btnSubmit.Text = "Sent";
        }
    }
}