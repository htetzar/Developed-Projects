using LogicUniversityDataModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{
    //Author Ei Ei Maw.
    //Team 10.
    public class PreparePurchaseOrderController
    {

        PreparePurchaseOrderDAOImpl purchaseOrderDAOImpl = new PreparePurchaseOrderDAOImpl();
        Order order = new LogicUniversityDataModel.Order();
        public long GetOrderId()
        {
            order = purchaseOrderDAOImpl.GetMaxOrderId();
            return order.OrderId;
        }
        public List<Supplier> GetSupplierList()
        {
            return purchaseOrderDAOImpl.GetSupplierList();

        }

        public List<PurchaseOrder> GetPurchaseOrderList(string supplierId)
        {
            return purchaseOrderDAOImpl.GetPurchaseOrderList(supplierId);
        }
        public List<Item> GetIItemListBySupplierId(string supplierId)
        {
            return purchaseOrderDAOImpl.getItemList(supplierId);
        }
        public double? getBalanceByItemId(string itemId)
        {
            double? balance = 0;
            StockCard stockCard = purchaseOrderDAOImpl.getBalanceByItemId(itemId);
            if (stockCard == null)
            {
                return balance;
            }
            else
            {
                balance = stockCard.Balance;
            }

            return balance;
        }
        public double? GetItemPrice(string itemId, string supplierId)
        {
            Supplier_Stock supplierStock = purchaseOrderDAOImpl.GetItemPrice(itemId, supplierId);
            return supplierStock.Price;
        }

        public void SavePurchaseOrderList(string supplierId, List<PurchaseOrder> orderList, string expectedReceivedDate, string userId)
        {
            purchaseOrderDAOImpl.SavePurchaseOrderList(supplierId, orderList, expectedReceivedDate, userId);
        }

        public List<Order> GetOrderList()
        {
            return purchaseOrderDAOImpl.GetOrderList();
        }
        public List<Order> GetOrderListByStoreClerk()
        {
            return purchaseOrderDAOImpl.GetOrderListByStoreClerk();
        }
        public List<PurchaseOrder> GetOrderDetail(long OrderId)
        {
            return purchaseOrderDAOImpl.GetPurChaseOrderDetail(OrderId);
        }

        public Order GetOrderInfo(long orderId)
        {
            return purchaseOrderDAOImpl.GetOrderInfo(orderId);
        }
        public Supplier GetSupplierInfo(string supplierId)
        {
            return purchaseOrderDAOImpl.GetSupplierName(supplierId);
        }
        public void Approve_Reject_OrderBySupervisor(long orderId, string reason, int status, string staffId)
        {
            purchaseOrderDAOImpl.Approve_Reject_OrderBySupervisor(orderId, reason, status, staffId);
        }
    }
}
