using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.Model
{
    //Author Ei Ei Maw.
    //Team 10.
    public class ReceivedOrder
    {
        private long orderId;

        public long OrderId
        {
            get { return orderId; }
            set { orderId = value; }
        }

        private String itemId;

        public String ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }

        private String itemName;

        public String ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }

        private DateTime? orderDate;

        public DateTime? OrderDate
        {
            get { return orderDate; }
            set { orderDate = value; }
        }

        private DateTime? receivedDate;

        public DateTime? ReceivedDate
        {
            get { return receivedDate; }
            set { receivedDate = value; }
        }

        private int? orderQuantity;

        public int? OrderQuantity
        {
            get { return orderQuantity; }
            set { orderQuantity = value; }
        }

        private int? receivedQuantity;

        public int? ReceivedQuantity
        {
            get { return receivedQuantity; }
            set { receivedQuantity = value; }
        }

        private double? price;

        public double? Price
        {
            get { return price; }
            set { price = value; }
        }
    }
}
