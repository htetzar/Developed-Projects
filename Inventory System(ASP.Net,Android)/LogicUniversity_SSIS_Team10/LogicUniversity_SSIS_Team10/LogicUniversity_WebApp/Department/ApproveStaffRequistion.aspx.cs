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
    //Author Ei Ei Maw.
    //Team 10.
    public partial class ApproveStaffRequistion : System.Web.UI.Page
    {
        ManageAuthorityDelegationController delegateController = new ManageAuthorityDelegationController();
        ViewStationaryRequisitionController viewStationeryRequisitionController = new ViewStationaryRequisitionController();
        List<RequisitionDetail> requisitionDetails;
        Staff user;
        LogicUniversityDataModel.Delegate delegatedPerson;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            bool? status = viewStationeryRequisitionController.CheckDelegateStatus(user.StaffId);
            delegatedPerson = delegateController.CheckStatus(user.DepartmentId);
            if (user.RoleId == 1)
            {
                
                if (delegatedPerson != null)
                {
                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                    txtRemark.Visible = false;
                    lblRemark.Visible = false;
                   
                    if(DateTime.Now.Date < delegatedPerson.StartDate.Value.Date )
                    {
                            btnApprove.Visible = true;
                            btnReject.Visible = true;
                            txtRemark.Visible = true;
                            lblRemark.Visible = true;
                    }
                    if(DateTime.Now.Date > delegatedPerson.EndDate.Value.Date)
                    {
                        btnApprove.Visible = true;
                        btnReject.Visible = true;
                        txtRemark.Visible = true;
                        lblRemark.Visible = true;
                    }
                   
                }
                else if (delegatedPerson == null)
                {
                    btnApprove.Visible = true;
                    btnReject.Visible = true;
                    txtRemark.Visible = true;
                    lblRemark.Visible = true;
                }
            }
            else if (user.RoleId != 1)
            {
                if (status == true && delegatedPerson.StartDate.Value.Date >= DateTime.Now.Date)
                {
                    btnApprove.Visible = true;
                    btnReject.Visible = true;
                    txtRemark.Visible = true;
                    lblRemark.Visible = true;
                }
                if(status == true &&  delegatedPerson.EndDate.Value.Date <= DateTime.Now.Date)
                {
                    btnApprove.Visible = true;
                    btnReject.Visible = true;
                    txtRemark.Visible = true;
                    lblRemark.Visible = true;
                }

            }
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
            grv_req_head.DataSource = requisitionDetails.Select(x => new { x.Item.ItemName, x.Quantity });
            grv_req_head.DataBind();
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string stffReqId = lblRequisitionIDValue.Text;
            string remark = txtRemark.Text;
            viewStationeryRequisitionController.ApproveRequisitionList(stffReqId, requisitionDetails, remark, user.StaffId);
            //Response.Redirect("~/Department/ViewStationaryRequisitionList.aspx");
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Requisition Approved!') ;window.location = '" + "ViewStationaryRequisitionList.aspx';", true);
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            string stffReqId = lblRequisitionIDValue.Text;
            string remark = txtRemark.Text;
            viewStationeryRequisitionController.RejectRequisitionList(stffReqId, remark);
            Response.Redirect("~/Department/ViewStationaryRequisitionList.aspx");
        }
    }
}