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
    //Author Ei Ei Maw.
    //Team 10.

    public partial class PreparePurchaseOrderDetail : System.Web.UI.Page
    {
        PreparePurchaseOrderController preparePurchaseController = new PreparePurchaseOrderController();
        List<PurchaseOrder> purchaseOrderList = new List<PurchaseOrder>();
        long orId;
        Staff user;
        static string format = "yyyy/MM/dd";
        protected void Page_Load(object sender, EventArgs e)
        {
            string orderId = Request["orderId"];
            orId = Convert.ToInt64(orderId);
            user = (Staff)Session["User"];
            if (!IsPostBack)
            {
                purchaseOrderList = preparePurchaseController.GetOrderDetail(orId);
                GridView_Detail.DataSource = purchaseOrderList;
                GridView_Detail.DataBind();

                Order order = preparePurchaseController.GetOrderInfo(orId);
                Supplier supplier = preparePurchaseController.GetSupplierInfo(order.SupplierId);
                lblPONumber.Text = orderId;
                lblSupplier.Text = supplier.SupplierName;
                lblSupplyDate.Text =((DateTime) order.Expected_DeliveryDate).ToString(format);
                lblOrderBy.Text = order.OrderedBy;
                LblOrderDate.Text =((DateTime) order.OrderDate).ToString(format);
                lblTotalPrice.Text = CalculateTotal(purchaseOrderList).ToString();
                txtReason.Text = order.Reason;
            }
        }
        protected void Btn_Approve_Click(object sender, EventArgs e)
        {
            string reason = txtReason.Text;
            preparePurchaseController.Approve_Reject_OrderBySupervisor(orId, reason, 1, user.StaffId);
            SendMailToSupplier();
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Approved order!') ;window.location = '" + "PreparePurchaseOrderList.aspx';", true);
        }

        protected void Btn_Reject_Click(object sender, EventArgs e)
        {
            string reason = txtReason.Text;
            preparePurchaseController.Approve_Reject_OrderBySupervisor(orId, reason, 0, user.StaffId);
            Response.Redirect("~/StationaryStore/PreparePurchaseOrderList.aspx");
        }

        private double? CalculateTotal(List<PurchaseOrder> orderList)
        {
            double? totalAmount = 0.0;
            foreach (PurchaseOrder p in orderList)
            {
                totalAmount += p.Amount;
            }
            return totalAmount;
        }

        private void SendMailToSupplier()
        {
            String toEmail = "zawmyohtet2016.mandalay@gmail.com";
            String subj = "Orders From Logic University";
            String message = "Dear  " + lblSupplier.Text + ", " + "<br/><br/>I would like to order the products and attached with order detail file.<br/><br/>" + "Best Regard" + "<br/>" + user.StaffName;
            EmailController.SendEmail(toEmail, subj, message);
        }
    }
}