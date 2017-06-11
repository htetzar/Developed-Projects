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
    //Author Krithiga Gunasekaran.
    //Team 10

    public partial class ViewStationaryRequisitionNew : System.Web.UI.Page
    {
        private ViewStationaryRequisitionController viewStationeryRequisitionController;
        List<Item> itemList;
        DataTable dt;
        Staff user;
        protected void Page_Load(object sender, EventArgs e)
        {
            viewStationeryRequisitionController = new ViewStationaryRequisitionController();
            dt = new DataTable();
            itemList = viewStationeryRequisitionController.GetItemList();
            user = (Staff)Session["User"];

            if (!IsPostBack)
            {
                BindDropDownList();
                btnSubmit.Visible = false;
                lblRequisition.Text = viewStationeryRequisitionController.GetRequisitionId(user.DepartmentId);
                lblDate.Text = DateTime.Now.ToString("yyyy/MM/dd");
                lblUOM.Text = itemList.Where(x => x.ItemId == ddlDescription.SelectedValue).FirstOrDefault().UOM;
            }
        }
        public void BindDropDownList()
        {
            ddlDescription.DataSource = itemList;
            Item newItem = new Item();            
            ddlDescription.DataTextField = "ItemName";
            ddlDescription.DataValueField = "ItemId";
            ddlDescription.DataBind();
        }

        protected void ddlDescription_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!ddlDescription.SelectedValue.Equals("-1"))
            lblUOM.Text = itemList.Where(x => x.ItemId == ddlDescription.SelectedValue).FirstOrDefault().UOM;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            btnSubmit.Visible = true;          
            dt.Columns.Add("ItemId");
            dt.Columns.Add("ItemDescription");
            dt.Columns.Add("UnitofMeasure");
            dt.Columns.Add("Quantity");
            DataRow rw = null;

            if (ViewState["items"] != null)
            {
                dt = (DataTable)ViewState["items"];

                if (dt.Rows.Count > 0)
                {
                    rw = dt.NewRow();
                    rw["ItemId"] = ddlDescription.SelectedValue;
                    rw["ItemDescription"] = ddlDescription.SelectedItem.Text;
                    rw["UnitofMeasure"] = lblUOM.Text;
                    rw["Quantity"] = txtQuantity.Text;
                    dt.Rows.Add(rw);
                    gv_Items.DataSource = dt;
                    gv_Items.DataBind();
                }
            }
            else
            {
                rw = dt.NewRow();
                rw["ItemId"] = ddlDescription.SelectedValue;
                rw["ItemDescription"] = ddlDescription.SelectedItem.Text;
                rw["UnitofMeasure"] = lblUOM.Text;
                rw["Quantity"] = txtQuantity.Text;
                dt.Rows.Add(rw);
                gv_Items.DataSource = dt;
                gv_Items.DataBind();
            }
            ViewState["items"] = dt;
            txtQuantity.Text = "";           
        }

        protected void gv_Items_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int indexrow = e.RowIndex;
            DataTable dt = ViewState["items"] as DataTable;
            dt.Rows[indexrow].Delete();
            if (gv_Items.Rows.Count == 1)
            {
                ViewState.Clear();
                btnSubmit.Visible = false;
            }
            else
            {
                ViewState["items"] = dt;
            }
            gv_Items.DataSource = dt;
            gv_Items.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            StaffRequisition requisition = new StaffRequisition();
            List<RequisitionDetail> requisitiondetails = new List<RequisitionDetail>();
            requisition.StaffRequisitionId = lblRequisition.Text;
            requisition.DepartmentId = user.DepartmentId;
            requisition.StaffId = user.StaffId;
            requisition.CreateDate = Convert.ToDateTime(lblDate.Text);
            requisition.Status = "Pending";
            foreach (GridViewRow row in gv_Items.Rows)
            {
                RequisitionDetail details = new RequisitionDetail();
                details.StaffReqisitionId = lblRequisition.Text;
                details.ItemId = gv_Items.DataKeys[row.RowIndex].Value.ToString();
                details.Quantity = Convert.ToInt32(row.Cells[3].Text);
                requisitiondetails.Add(details);
            }
            viewStationeryRequisitionController.saveDataToRequisition(requisition, requisitiondetails);
            dt = null;
            gv_Items.DataSource = dt;
            gv_Items.DataBind();
            btnSubmit.CssClass = "btn btn-success disabled";
            btnSubmit.Attributes.Add("disabled","disabled");
            btnSubmit.Text = "Sent";

            txtQuantity.Text = "";
            lblUOM.Text = "";
            BindDropDownList();
            SendMailToDepartmentHead();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Submit successfully') ;window.location = '" + "ViewStationaryRequisitionList.aspx';", true);
        }
        private void SendMailToDepartmentHead()
        {
            String toEmail = "zawmyohtet2016.mandalay@gmail.com";
            String subj = "To Approve Stationery Requisition Form (" + lblRequisition.Text + ")";
            String message = "Please see Stationery Requisition form and approve /reject for this form" + "<br/><br/>" + "Best Regard" + "<br/>" + user.StaffName;
            EmailController.SendEmail(toEmail, subj, message);
        }
    }
}