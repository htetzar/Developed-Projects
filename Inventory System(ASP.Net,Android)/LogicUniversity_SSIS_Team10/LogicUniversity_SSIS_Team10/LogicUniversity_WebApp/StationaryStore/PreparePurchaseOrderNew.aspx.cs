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

    public partial class PreparePurchaseOrderNew : System.Web.UI.Page
    {
        PreparePurchaseOrderController preparePurchaseController = new PreparePurchaseOrderController();
        public static String supplierId;
        public static List<PurchaseOrder> orderList = new List<PurchaseOrder>();
        List<Item> itemList = new List<Item>();


        Staff user;
        protected void Page_Load(object sender, EventArgs e)
        {
            preparePurchaseController = new PreparePurchaseOrderController();
            long lastOrderId = preparePurchaseController.GetOrderId() + 1;
            lblPONumber.Text = lastOrderId.ToString();
            
            user = (Staff)Session["User"];

            if (!IsPostBack)
            {
                ddLstSupplier.Items.Add(new ListItem("Select Item", "-1"));
                List<Supplier> supplierList = preparePurchaseController.GetSupplierList();
                Supplier s = new Supplier();
                s.SupplierId = "-1";
                s.SupplierName = "Select Supplier";
                supplierList.Insert(0, s);
                ddLstSupplier.DataSource = supplierList;
                ddLstSupplier.DataTextField = "SupplierName";
                ddLstSupplier.DataValueField = "SupplierId";
                ddLstSupplier.DataBind();
            }

        }
        protected void Send_Click(object sender, EventArgs e)
        {
            string receivedDate;
            if (textDate.Text == "")
            {
                receivedDate = (DateTime.Now.Date.AddDays(3)).ToString();
            }
            else
            {
                receivedDate = textDate.Text;
            }

            preparePurchaseController.SavePurchaseOrderList(supplierId, orderList, receivedDate, user.StaffId);
            GridView1.DataSource = null;
            GridView1.DataBind();
            lblTotal.Visible = false;
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage",
                        "alert('Submit Successfully!') ;window.location = '" + "PreparePurchaseOrderList.aspx';", true);
        }

        protected void ddLstSupplier_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddLstSupplier.SelectedIndex != 0)
            {
                supplierId = ddLstSupplier.SelectedValue.ToString();
                orderList = preparePurchaseController.GetPurchaseOrderList(supplierId);
                GridView1.DataSource = orderList;
                GridView1.DataBind();
                lblTotal.Text = CalculateTotal().ToString();
            }
        }
        public void BindGrid()
        {
            GridView1.DataSource = orderList;
            GridView1.DataBind();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {

            GridView1.EditIndex = e.NewEditIndex;
            BindGrid();
            lblTotal.Text = CalculateTotal().ToString();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int indexrow = e.RowIndex;
            string itemId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblItemCode")).Text;
            foreach (PurchaseOrder p in orderList.ToList())
            {

                if (p.ItemId.Equals(itemId))
                {
                    orderList.Remove(p);
                }
            }
            GridView1.DataSource = orderList;
            GridView1.DataBind();
            lblTotal.Text = CalculateTotal().ToString();

        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string reOrderQty = ((TextBox)GridView1.Rows[e.RowIndex].FindControl("txtReorderQty")).Text;
            int qty = Convert.ToInt32(reOrderQty);
            string itemId = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblItemCode")).Text;

            foreach (PurchaseOrder p in orderList)
            {
                if (p.ItemId.Equals(itemId))
                {
                    p.ReorderQty = qty;
                    p.Amount = qty * p.UnitPrice;
                }
            }
            GridView1.EditIndex = -1;
            GridView1.DataSource = orderList;
            GridView1.DataBind();
            lblTotal.Text = CalculateTotal().ToString();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GridView1.DataSource = orderList;
            GridView1.DataBind();
            lblTotal.Text = CalculateTotal().ToString();
        }
        private double? CalculateTotal()
        {
            double? totalAmount = 0.0;
            foreach (PurchaseOrder p in orderList)
            {
                totalAmount += p.Amount;
            }
            return totalAmount;
        }
        public List<Item> GetItemBySupplierId(string supplierId)
        {
            itemList = preparePurchaseController.GetIItemListBySupplierId(supplierId);
            return itemList;
        }
        protected void btnAddNewItem_Click(object sender, EventArgs e)
        {
            ddlItemName.DataSource = preparePurchaseController.GetIItemListBySupplierId(supplierId);
            ddlItemName.DataTextField = "ItemName";
            ddlItemName.DataValueField = "ItemId";
            ddlItemName.DataBind();
            ddlItemName.Items.Insert(0,"Select Item");

            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#orderModal').modal('show');", true);
        }
        
        protected void ddlItemName_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if(ddlItemName.SelectedIndex == 0)
            {
                txtReorderQty.Text = "0";
            }
            string itemId = ddlItemName.SelectedValue.ToString();
            txtBalance.Text = Convert.ToString(preparePurchaseController.getBalanceByItemId(itemId));
            List<Item> iList = GetItemBySupplierId(supplierId);
            foreach (Item itm in iList)
            {
                if (itm.ItemId.Equals(itemId))
                {
                    txtReorderQty.Text = itm.ReorderQty.ToString();
                    break;
                }
            }
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#orderModal').modal('show');", true);
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {

            string itemId = ddlItemName.SelectedValue.ToString();
            int reorderQty = Convert.ToInt32(txtReorderQty.Text);

            if (checkItemId(itemId))
            {
                foreach (PurchaseOrder p in orderList)
                {

                    if (p.ItemId.Equals(itemId))
                    {
                        p.ReorderQty += reorderQty;
                        p.Amount = p.ReorderQty * p.UnitPrice;
                    }
                }

            }
            else
            {
                PurchaseOrder order = new PurchaseOrder();
                order.ItemId = itemId;
                order.ItemName = ddlItemName.SelectedItem.Text;
                order.Balance = preparePurchaseController.getBalanceByItemId(order.ItemId);
                order.UnitPrice = preparePurchaseController.GetItemPrice(order.ItemId, supplierId);
                order.ReorderQty = reorderQty;
                order.Amount = order.ReorderQty * order.UnitPrice;
                orderList.Add(order);
            }
            lblTotal.Text = CalculateTotal().ToString();
            GridView1.DataSource = null;
            GridView1.DataBind();
            GridView1.DataSource = orderList;
            GridView1.DataBind();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#orderModal').modal('hide');", true);
        }

        private Boolean checkItemId(string itemId)
        {
            foreach (PurchaseOrder p in orderList)
            {

                if (p.ItemId.Equals(itemId))
                {
                    return true;
                }
            }
            return false;
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != GridView1.EditIndex)
            {
                LinkButton LnkBtnDelete = (LinkButton)e.Row.FindControl("LnkBtnDelete");
                Label lblItemName = e.Row.FindControl("lblItemName") as Label;
                LnkBtnDelete.Attributes.Add("onclick", string.Format("return confirm('Are you sure you want to delete {0}?');", lblItemName.Text));
            }
        }
    }
}