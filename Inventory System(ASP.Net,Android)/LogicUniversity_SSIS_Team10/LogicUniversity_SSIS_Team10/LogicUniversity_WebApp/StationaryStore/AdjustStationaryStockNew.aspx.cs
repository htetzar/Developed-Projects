using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{   
    //Author Htet Zar Chi Aung.
    //Team 10.
    public partial class AdjustStationaryStockNew : System.Web.UI.Page
    {
        AdjustStationaryStockController controller = new AdjustStationaryStockController();
        protected void Page_Load(object sender, EventArgs e)
        {
            var voucherId = controller.GenerateVoucherId();
            lblVoucher.Text = voucherId;
            lblDateIssue.Text = DateTime.Now.ToString("yyyy/MM/dd");   
        }
        private void ClearGridView() {
            ArrayList list = new ArrayList();
            Session["AdjustList"] = null;
            list = (ArrayList)Session["AdjustList"];
            gvAdjustNew.DataSource = list;
            gvAdjustNew.DataBind();
        }
        private void BindGridView()
        {
            try
            {
                bool duplicate = false;
                ArrayList list = new ArrayList();
                if (Session["AdjustList"] != null)
                {
                    list = (ArrayList)Session["AdjustList"];
                }
                foreach(var item in list)
                {
                    var adjData = (AdjustData)item;
                    if(txtItemCode.Text == adjData.ItemCode)
                    {
                        duplicate = true;
                        ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Duplicated Item Code!');", true);
                    }
                }
                if (!duplicate)
                {
                    String amount = (double.Parse(txtQuantityAdjusted.Text) * double.Parse(hiddenUnitPrice.Value)).ToString();
                    AdjustData r = new AdjustData(txtItemCode.Text, txtQuantityAdjusted.Text, hiddenUnitPrice.Value, amount, txtReason.Text);
                    list.Add(r);
                    Session["AdjustList"] = list;
                    gvAdjustNew.DataSource = list;
                    gvAdjustNew.DataBind();
                    txtItemCode.Text = "";
                    txtQuantityAdjusted.Text = "";
                    txtReason.Text = "";
                }
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong. Try again!')", true);
            }
            
        }
        protected void txtItemCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                hiddenUnitPrice.Value = controller.GetItemPrice(txtItemCode.Text).ToString();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Item Code!')", true);
                txtItemCode.Text = String.Empty;
            }
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            BindGridView();
            btnSubmit.CssClass = "btn btn-success";
            btnSubmit.Attributes.Remove("disabled");
        }

        protected void gvAdjustNew_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvAdjustNew.EditIndex != -1)
            {
                e.Cancel = true;
                int newPageNumber = e.NewPageIndex + 1;
            }
            else
            {
                this.BindGridView();
                gvAdjustNew.PageIndex = e.NewPageIndex;
                gvAdjustNew.DataBind();
            }
        }

        protected void gvAdjustNew_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex < 0)
                return;
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            bool toMgr = false;
            Adjustment adj = new Adjustment();
            List<AdjustmentDetail> adjDetails = new List<AdjustmentDetail>();
            adj.VoucherId = lblVoucher.Text;
            adj.IssueDate = Convert.ToDateTime(DateTime.Now.ToShortDateString());
            adj.Status = StatusType.Pending.ToString();
            foreach (GridViewRow row in gvAdjustNew.Rows)
            {
                AdjustmentDetail detail = new AdjustmentDetail();
                detail.VoucherId = lblVoucher.Text;
                detail.ItemId = row.Cells[0].Text;
                detail.Quantity_Adjusted = Double.Parse(row.Cells[1].Text);
                detail.Reason = row.Cells[4].Text;
                adjDetails.Add(detail);
            }
            controller.SaveDataToAdjustmentAndAdjustmentDetail(adj, adjDetails);
            foreach (GridViewRow row in gvAdjustNew.Rows)
            {
                String data = row.Cells[3].Text;
                double absData = Math.Abs(double.Parse(data));
                if (absData > 250)
                {
                    toMgr = true;
                }
                if (toMgr == true)
                {
                    SentMailToManager();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Submit successfully');", true);
                    ClearGridView();
                }
                else
                {
                    SendMailToSupervisor();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Submit successfully');", true);
                    ClearGridView();
                }
            }
        }
        private void SentMailToManager()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "htetzar1@gmail.com"; //change email here
            String subj = "To Approve Adjustment Voucher (" + lblVoucher.Text + ")";
            String message = "Please see adjustment information and approve/ reject this voucher" + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmail(toEmail, subj, message);

        }
        private void SendMailToSupervisor()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "zawmyohtet2016.mandalay@gmail.com"; 
            String subj = "To Approve Adjustment Voucher (" + lblVoucher.Text + ")";
            String message = "Please see adjustment information and approve/ reject this voucher" + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmail(toEmail, subj, message);

        }

        protected void gvAdjustNew_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                var id = gvAdjustNew.DataKeys[e.RowIndex].Value.ToString();
                ((ArrayList)Session["AdjustList"]).RemoveAt(e.RowIndex);
                gvAdjustNew.DataSource = (ArrayList)Session["AdjustList"];
                gvAdjustNew.DataBind();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong!')", true);
            }
        }

        protected void gvAdjustNew_DataBound(object sender, EventArgs e)
        {
            btnSubmit.Visible = gvAdjustNew.Rows.Count > 0;
        }
    }
    public class AdjustData
    {
        private String itemCode;
        private String qtyAdjusted;
        private String unitPrice;
        private String amount;
        private String reason;

        public AdjustData(String itemCode, String qtyAdjusted, String unitPrice, String amount, String reason)
        {
            this.itemCode = itemCode;
            this.qtyAdjusted = qtyAdjusted;
            this.unitPrice = unitPrice;
            this.amount = amount;
            this.reason = reason;
        }

        public String ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }

        public String QtyAdjusted
        {
            get { return qtyAdjusted; }
            set { qtyAdjusted = value; }
        }

        public String UnitPrice
        {
            get { return unitPrice; }
            set { unitPrice = value; }
        }

        public String Amount
        {
            get { return amount; }
            set { amount = value; }
        }

        public String Reason
        {
            get { return reason; }
            set { reason = value; }
        }
    }
}