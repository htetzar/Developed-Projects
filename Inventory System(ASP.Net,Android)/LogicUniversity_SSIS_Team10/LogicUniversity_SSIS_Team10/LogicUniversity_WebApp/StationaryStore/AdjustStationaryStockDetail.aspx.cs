using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public partial class AdjustStationaryStockDetail : System.Web.UI.Page
    {
        AdjustStationaryStockController controller = new AdjustStationaryStockController();
        public static List<AdjustmentDetail> list = new List<AdjustmentDetail>();
        Staff user;
        String userName;
        String userRole;
        String currentStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var voucherId = Request.QueryString["VoucherId"];
                BindData(voucherId);
            }
            currentStatus = lblStatus.Text;
            user = (Staff)Session["User"];
            if (user != null)
            {
                userName = user.StaffName;
                userRole = user.Role.RoleName;
                if (userRole == "Supervisor" || userRole == "Manager")
                {
                    if (currentStatus.ToLower() == "approved" || currentStatus.ToLower() == "rejected")
                    {
                        btnApprove.Visible = true;
                        btnApprove.CssClass = "btn btn-primary disabled";
                        btnApprove.Attributes.Add("disabled", "disabled");
                        btnReject.Visible = true;
                        btnReject.CssClass = "btn btn-danger disabled";
                        btnReject.Attributes.Add("disabled", "disabled");
                    }
                    else
                    {
                        btnApprove.Visible = true;
                        btnReject.Visible = true;
                    }    
                }
                else
                {
                    btnApprove.Visible = false;
                    btnReject.Visible = false;
                }

                if (ViewState["rejectBtnClick"] != null && (Boolean)ViewState["rejectBtnClick"] == true)
                {
                    this.CreateControls();
                }
            }
        }
        private void BindData(String voucherId)
        {
            list = controller.GetAdjustmentDetail(voucherId);
            gvwAdjustDetailList.DataSource = list;
            gvwAdjustDetailList.DataBind();

                Session["voucherId"] = list.First().VoucherId;
                lblVoucher.Text = voucherId;             
                lblDateIssue.Text = Convert.ToDateTime(list.First().Adjustment.IssueDate).ToString("yyyy/MM/dd hh:mm tt");
                lblAuthorise.Text = list.First().Adjustment.ApprovedBy;
                lblStatus.Text = list.First().Adjustment.Status;

                if (lblStatus.Text.ToLower() == "pending")
                {
                    lblStatus.CssClass = "label label-success";
                }
                else if (lblStatus.Text.ToLower() == "approved")
                {
                    lblStatus.CssClass = "label label-primary";
                }
                else if (lblStatus.Text.ToLower() == "rejected")
                {
                    lblStatus.CssClass = "label label-danger";
                }
                else{ lblStatus.CssClass = "label label-info"; }
          
        }
        private void CreateControls()
        {
            if (phRemark.Controls.Count == 0)
            {
                TextBox txtRemark = new TextBox();
                txtRemark.ID = "txtRemark";
                txtRemark.Attributes.Add("placeholder","Remark(Optional)");
                txtRemark.CssClass = "form-control";
                phRemark.Controls.Add(txtRemark);

                Button btnSave = new Button();
                btnSave.ID = "btnSave";
                btnSave.Text = "Save";
                btnSave.CssClass = "btn btn-default";
                btnSave.Click += new EventHandler(btnSave_Click);
                phRemark.Controls.Add(btnSave);
            }
        }
        void btnSave_Click(object sender, EventArgs e)
        {
            TextBox txtRemark =
            Master.FindControl("body").FindControl("txtRemark") as TextBox;
            string status = "Rejected";
            string approveBy = userName;
            String remark = txtRemark.Text;
            String voucherId = (String)Session["voucherId"];
            controller.ApproveOrRejectAdjustment(voucherId, approveBy, remark, status);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage","alert('Remark Saved!');", true);
        }

        protected void btnApprove_Click(object sender, EventArgs e)
        {
            string status = "Approved";
            string approveBy = userName;
            String remark = null;
            String voucherId = (String)Session["voucherId"];
            controller.ApproveOrRejectAdjustment(voucherId, approveBy, remark, status);
            var stockCardList = new List<StockCard>();
            foreach (var l in list)
            {
                var sc = new StockCard();
                sc.ItemId = l.ItemId;
                sc.Update_Date = DateTime.Now;
                sc.Description = "Stock Adjustment";
                sc.Quantity = (int)l.Quantity_Adjusted;
                stockCardList.Add(sc);
            }
            controller.UpdateStockCard(stockCardList);
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Adjustment is approved!');", true);
            this.BindData(voucherId);
            btnReject.CssClass = "btn btn-danger disabled";
            btnReject.Attributes.Add("disabled", "disabled");
            btnApprove.CssClass = "btn btn-primary disabled";
            btnApprove.Attributes.Add("disabled", "disabled");
        }

        protected void btnReject_Click(object sender, EventArgs e)
        {
            ViewState["rejectBtnClick"] = true;
            string status = "Rejected";
            string approveBy = userName;
            String remark = "";
            String voucherId = (String)Session["voucherId"];
            controller.ApproveOrRejectAdjustment(voucherId, approveBy, remark, status);
            this.BindData(voucherId);
            btnReject.CssClass = "btn btn-danger disabled";
            btnReject.Attributes.Add("disabled","disabled");
            btnApprove.CssClass = "btn btn-primary disabled";
            btnApprove.Attributes.Add("disabled","disabled");
            CreateControls();
        }

        protected void gvwAdjustDetailList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvwAdjustDetailList.EditIndex != -1)
            {
                e.Cancel = true;
                int newPageNumber = e.NewPageIndex + 1;
            }
            else
            {
                var voucherId = Request.QueryString["VoucherId"];
                this.BindData(voucherId);
                gvwAdjustDetailList.PageIndex = e.NewPageIndex;
                gvwAdjustDetailList.DataBind();
            }
        }
    }
}