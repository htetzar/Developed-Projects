using LogicUniversityDataModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Ei Ei Maw.
    //Team 10.
    public class PreparePurchaseOrderDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();

        public Order GetMaxOrderId()
        {
            Order order = new Order();
            order = context.Orders.OrderByDescending(x => x.OrderId).FirstOrDefault();
            if (order == null)
            {
                Order order1 = new Order();
                order1.OrderId = 200000067;
                return order1;
            }
           
            return order;

        }
        public List<Supplier> GetSupplierList()
        {
            List<Supplier> supplierList = new List<Supplier>();
            var q = from x in context.Suppliers select new { x.SupplierId, x.SupplierName };
            foreach (var s in q.ToList())
            {
                Supplier supplier = new Supplier();
                supplier.SupplierId = s.SupplierId;
                supplier.SupplierName = s.SupplierName;
                supplierList.Add(supplier);
            }
            return supplierList;
        }
        public void SavePurchaseOrderList(string supplierId, List<PurchaseOrder> orderList, string expectedReceivedDate, string userId)
        {
            Order order = new Order();
            order.SupplierId = supplierId;
            order.OrderDate = Convert.ToDateTime(DateTime.Now.Date);
            order.Expected_DeliveryDate = Convert.ToDateTime(expectedReceivedDate);
            order.OrderedBy = userId;
            order.OrderStatus = "Pending";
            context.Orders.Add(order);
            context.SaveChanges();

            Order lastOrder = context.Orders.OrderByDescending(x => x.OrderId).FirstOrDefault();
            long lastOrderId = lastOrder.OrderId;

            foreach (PurchaseOrder p in orderList)
            {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.OrderId = lastOrderId;
                orderDetail.ItemId = p.ItemId;
                orderDetail.Order_Quantity = (int)p.ReorderQty;
                orderDetail.Price = p.UnitPrice;
                context.OrderDetails.Add(orderDetail);
                context.SaveChanges();
            }



        }

        public StockCard getBalanceByItemId(string itemId)
        {
            StockCard st = context.StockCards.Where(x => x.ItemId == itemId).OrderByDescending(x => x.Update_Date).FirstOrDefault();
            return st;
        }
        public Supplier_Stock GetItemPrice(string itemId, string supplierId)
        {
            Supplier_Stock supplierStock = context.Supplier_Stock.Where(x => x.ItemId == itemId && x.SupplierId == supplierId).First();
            return supplierStock;
        }
        public List<Item> getItemList(string supplierId)
        {
            List<Item> itemList = context.Items.Where(x => x.First_SupplierId == supplierId || x.Second_SupplierId == supplierId || x.Third_SupplierId == supplierId).ToList<Item>();
            return itemList;
        }
        public List<PurchaseOrder> GetPurchaseOrderList(string supplierId)
        {
            List<PurchaseOrder> purchaseList = new List<PurchaseOrder>();
            LogicU_Data logicU = new LogicU_Data();
            purchaseList = logicU.GetPurchaseOrderList(supplierId);


            return purchaseList;
        }

        public List<Order> GetOrderList()
        {
            List<Order> orderList = new List<Order>();
            var q = context.Orders.OrderByDescending(x => x.OrderDate).Where(x => x.OrderStatus == "Pending").ToList();

            foreach (Order o in q)
            {
                Order order = new Order();
                order.OrderDate = o.OrderDate;
                order.OrderId = o.OrderId;
                order.OrderedBy = context.Staffs.Where(x => x.StaffId == o.OrderedBy).FirstOrDefault().StaffName;

                order.OrderStatus = o.OrderStatus;
                order.Reason = o.Reason;
                orderList.Add(order);
            }
            return orderList;
        }
        public List<Order> GetOrderListByStoreClerk()
        {
            List<Order> orderList = new List<Order>();
            var q = context.Orders.OrderByDescending(x => x.OrderDate).Where(x => x.OrderStatus == "Pending" || x.OrderStatus == "Approved" || x.OrderStatus == "Reject").ToList();

            foreach (Order o in q)
            {
                Order order = new Order();
                order.OrderDate = o.OrderDate;
                order.OrderId = o.OrderId;
                order.OrderedBy = context.Staffs.Where(x => x.StaffId == o.OrderedBy).FirstOrDefault().StaffName;

                order.OrderStatus = o.OrderStatus;
                order.Reason = o.Reason;
                orderList.Add(order);
            }
            return orderList;
        }

        public List<PurchaseOrder> GetPurChaseOrderDetail(long orderId)
        {
            Order order = context.Orders.Where(x => x.OrderId == orderId).FirstOrDefault();

            List<PurchaseOrder> purchaseOrderList = new List<PurchaseOrder>();
            foreach (OrderDetail orderDetail in order.OrderDetails)
            {
                PurchaseOrder purchaseOrder = new PurchaseOrder();
                purchaseOrder.ItemId = orderDetail.ItemId;
                purchaseOrder.ItemName = orderDetail.Item.ItemName;
                purchaseOrder.ReorderQty = orderDetail.Order_Quantity;
                purchaseOrder.UnitPrice = orderDetail.Price;
                purchaseOrder.Amount = purchaseOrder.ReorderQty * purchaseOrder.UnitPrice;
                purchaseOrderList.Add(purchaseOrder);
            }

            return purchaseOrderList;
        }

        public Order GetOrderInfo(long orderId)
        {
            Order orderInfo = new Order();

            Order order = context.Orders.Where(x => x.OrderId == orderId).FirstOrDefault();

            orderInfo.OrderId = order.OrderId;
            orderInfo.SupplierId = order.SupplierId;
            orderInfo.Expected_DeliveryDate = order.Expected_DeliveryDate;
            orderInfo.OrderedBy = context.Staffs.Where(x => x.StaffId == order.OrderedBy).FirstOrDefault().StaffName;
            orderInfo.Reason = order.Reason;
            orderInfo.OrderDate = order.OrderDate;

            return orderInfo;

        }
        public Supplier GetSupplierName(string supplierId)
        {

            Supplier supplier = new Supplier();
            supplier = context.Suppliers.Where(x => x.SupplierId == supplierId).FirstOrDefault();
            return supplier;
        }

        public void Approve_Reject_OrderBySupervisor(long orderId, string reason, int status, string staffId)
        {
            Order order = context.Orders.Where(x => x.OrderId == orderId).FirstOrDefault();
            if (status == 1)
            {
                order.OrderStatus = "Approved";

            }
            else if (status == 0)
            {
                order.OrderStatus = "Reject";
            }
            order.ApprovedBy = staffId;
            order.ApprovedDate = DateTime.Now.Date;
            order.Reason = reason;
            context.SaveChanges();

        }

    }
}
