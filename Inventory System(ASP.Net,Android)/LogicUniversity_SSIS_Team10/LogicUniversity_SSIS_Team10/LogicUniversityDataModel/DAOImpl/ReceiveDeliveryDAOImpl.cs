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
    public class ReceiveDeliveryDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
       // public static List<String> orderNoList = new List<string>();

        // public Item GetItemList()
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
        public List<Item> GetItemListBySupplierId(string supplierId)
        {
            List<Item> itemList = context.Items.Where(x => x.First_SupplierId == supplierId || x.Second_SupplierId == supplierId || x.Third_SupplierId == supplierId).ToList<Item>();
            return itemList;
        }
        public StockCard GetBalanceByItemId(string itemId)
        {
            StockCard st = context.StockCards.Where(x => x.ItemId == itemId).OrderByDescending(x => x.Update_Date).FirstOrDefault();
            return st;
        }
        public List<Order> GetOrderIdList()
        {

            List<Order> orderIdList = context.Orders.Where(x => x.OrderStatus.Equals("Approved") || x.OrderStatus.Equals("Completed")).Distinct().ToList<Order>();
            return orderIdList;
        }
        public List<ReceivedOrder> GetOrderList(long orderId)
        {
            List<ReceivedOrder> recOrderList = new List<ReceivedOrder>();
            var orderList = from ode in context.OrderDetails
                            where
                            //ode.Order.OrderStatus == "Approve" || ode.Order.OrderStatus == "Completed" 
                            ode.Order.OrderId == orderId
                            select new
                            {

                                ode.OrderId,
                                ode.ItemId,
                                ode.Item.ItemName,
                                OrderDate = (DateTime?)ode.Order.OrderDate,
                                ReceivedDate = (DateTime?)ode.Order.ReceivedDate,
                                ode.Order_Quantity,
                                ode.Received_Quantity,
                                ode.Price
                            };


            foreach (var p in orderList)
            {
                ReceivedOrder order = new ReceivedOrder();
                order.OrderId = p.OrderId;
                order.ItemId = p.ItemId;
                order.ItemName = p.ItemName;
                order.OrderDate = p.OrderDate;
                order.ReceivedDate = p.ReceivedDate;
                order.OrderQuantity = p.Order_Quantity;
                order.ReceivedQuantity = p.Received_Quantity;
                order.Price = p.Price;
                recOrderList.Add(order);

            }

            return recOrderList;
        }


        public void SaveReceiveOrder(ReceivedOrder receiveOrder)
        {

            if (receiveOrder.ReceivedDate != null && receiveOrder.ReceivedQuantity != null)
            {
                String orderId = receiveOrder.OrderId.ToString();
               // orderNoList.Add(orderId);
              // bool checkDuplicate = CheckOrderNo(orderId);
                Order ord = context.Orders.Where(x => x.OrderId == receiveOrder.OrderId).FirstOrDefault();
                ord.ReceivedDate = receiveOrder.ReceivedDate;
                ord.OrderStatus = "Completed";
                context.SaveChanges();

                OrderDetail orde = context.OrderDetails.Where(x => x.OrderId == receiveOrder.OrderId && x.ItemId.Equals(receiveOrder.ItemId)).FirstOrDefault();
                orde.Received_Quantity = receiveOrder.ReceivedQuantity;
                context.SaveChanges();


                StockCard stoCard = context.StockCards.OrderByDescending(x => x.Update_Date).Where(x => x.ItemId.Equals(receiveOrder.ItemId)).FirstOrDefault();

                
                StockCard scd = new StockCard();
                scd.ItemId = receiveOrder.ItemId;
                scd.Update_Date = (DateTime)receiveOrder.ReceivedDate;
               
                Supplier supp = context.Suppliers.Where(x => x.SupplierId == ord.SupplierId).FirstOrDefault();
                scd.Description = supp.SupplierName;
                scd.Quantity = receiveOrder.ReceivedQuantity;

                if (stoCard != null )
                {
                    if (stoCard.Update_Date.Date.Equals(scd.Update_Date.Date))
                    {
                        if (stoCard.Update_Date.Hour.Equals(scd.Update_Date.Hour))
                        {
                            stoCard.Balance = receiveOrder.ReceivedQuantity;
                            stoCard.Quantity = receiveOrder.ReceivedQuantity;
                            context.SaveChanges();
                        }
                    }                     
                    else
                     {
                         scd.Balance = stoCard.Balance + receiveOrder.ReceivedQuantity;
                         context.StockCards.Add(scd);
                         context.SaveChanges();
                     }
                    
                }
               
                else if (stoCard == null)
                {
                    scd.Balance = receiveOrder.ReceivedQuantity;
                    context.StockCards.Add(scd);
                    context.SaveChanges();
                }
                
                
            }
           
        }
        
    }
}
