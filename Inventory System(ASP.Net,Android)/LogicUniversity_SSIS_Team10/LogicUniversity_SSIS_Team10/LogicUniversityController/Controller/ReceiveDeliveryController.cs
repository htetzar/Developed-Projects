using LogicUniversityDataModel;
using LogicUniversityDataModel.DAOImpl;
using LogicUniversityDataModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{
    //Author Ei Ei Maw.
    //Team 10.
    public class ReceiveDeliveryController
    {
        ReceiveDeliveryDAOImpl receiveDAOImpl = new ReceiveDeliveryDAOImpl();
        public List<Supplier> GetSupplierList()
        {
            return receiveDAOImpl.GetSupplierList();

        }

        public List<Item> GetItemListBySupplierId(string supplierId)
        {
            return receiveDAOImpl.GetItemListBySupplierId(supplierId);
        }
        public double? GetBalanceByItemId(string itemId)
        {
            double? balance = 0;
            StockCard stockCard = receiveDAOImpl.GetBalanceByItemId(itemId);            
            balance = stockCard.Balance;
            
            return balance;
        }

        public List<ReceivedOrder> GetOrderList(long receiveOrderId)
        {
            return receiveDAOImpl.GetOrderList(receiveOrderId);
        }
        public List<Order> GetOrderIdList()
        {

            return receiveDAOImpl.GetOrderIdList();
        }
        public void SaveReceiveOrder(ReceivedOrder receiveOrder)
        {
            receiveDAOImpl.SaveReceiveOrder(receiveOrder);
        }
    }
}
