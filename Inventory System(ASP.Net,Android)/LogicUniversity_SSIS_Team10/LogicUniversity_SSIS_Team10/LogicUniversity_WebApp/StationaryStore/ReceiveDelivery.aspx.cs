using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using LogicUniversityDataModel.Model;
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

    public partial class ReceiveDelivery : System.Web.UI.Page
    {
        ReceiveDeliveryController receveDeliveryController = new ReceiveDeliveryController();
        PreparePurchaseOrderController preparePurchaseController = new PreparePurchaseOrderController();
        List<Item> itemList = new List<Item>();
        List<StockCard> stockCardList = new List<StockCard>();
        public static List<ReceivedOrder> receiveOrderListByOrderId = new List<ReceivedOrder>();
        public static List<ReceivedOrder> receiveOrderList = new List<ReceivedOrder>();
        public long indexOrder = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlOrderNo.DataTextField = "OrderId";
                ddlOrderNo.DataValueField = "OrderId";
                ddlOrderNo.DataSource = receveDeliveryController.GetOrderIdList();
                ddlOrderNo.DataBind();
                ddlOrderNo.Items.Insert(0, "Select Order No");
            }
        }
        protected void ddlOrderNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            indexOrder = ddlOrderNo.SelectedIndex;
            if (ddlOrderNo.SelectedIndex == 0 || ddlOrderNo.SelectedIndex == -1)
            {
                grv_ReceivedOrder.DataSource = null;
                grv_ReceivedOrder.DataBind();
                lblSupplierName.Text = "";
            }


            else
            {
                long receiveOrderId = Convert.ToInt64(ddlOrderNo.SelectedValue.ToString());
                receiveOrderListByOrderId = receveDeliveryController.GetOrderList(receiveOrderId);  
                List<Order> orderList = receveDeliveryController.GetOrderIdList();
                Order ord = orderList.Where(x => x.OrderId == receiveOrderId).FirstOrDefault();
                Supplier supName = preparePurchaseController.GetSupplierInfo(ord.SupplierId);
                lblSupplierName.Text = supName.SupplierName;
                grv_ReceivedOrder.DataSource = receiveOrderListByOrderId;
                grv_ReceivedOrder.DataBind();
            }
        }
        protected void grv_ReceivedOrder_RowEditing(object sender, GridViewEditEventArgs e)
        {

            grv_ReceivedOrder.EditIndex = e.NewEditIndex;
            grv_ReceivedOrder.DataSource = receiveOrderListByOrderId;
            grv_ReceivedOrder.DataBind();
        }

        protected void grv_ReceivedOrder_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                long orderId = Convert.ToInt64(((Label)grv_ReceivedOrder.Rows[e.RowIndex].FindControl("lblOrderId")).Text);

                string itemId = ((Label)grv_ReceivedOrder.Rows[e.RowIndex].FindControl("lblItemId")).Text;
                string receivedQty = ((TextBox)grv_ReceivedOrder.Rows[e.RowIndex].FindControl("txtReceivedQty")).Text;

                foreach (ReceivedOrder reO in receiveOrderListByOrderId)
                {
                    if (reO.OrderId == orderId && reO.ItemId.Equals(itemId))
                    {
                        reO.ReceivedDate = DateTime.Now;
                        reO.ReceivedQuantity = Convert.ToInt32(receivedQty);
                        receveDeliveryController.SaveReceiveOrder(reO);
                    }
                }

                grv_ReceivedOrder.EditIndex = -1;
                grv_ReceivedOrder.DataSource = receiveOrderListByOrderId;
                grv_ReceivedOrder.DataBind();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong!')", true);
            }
        }

        protected void grv_ReceivedOrder_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grv_ReceivedOrder.EditIndex = -1;
            grv_ReceivedOrder.DataSource = receiveOrderListByOrderId;
            grv_ReceivedOrder.DataBind();
        }
    }
}