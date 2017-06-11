using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel
{
    //Author Ei Ei Maw.
    //Team 10.
    public class PurchaseOrder
    {
        private string itemId;

        public string ItemId
        {
            get { return itemId; }
            set { itemId = value; }
        }
        private string itemName;

        public string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }
        private double? balance;
        public double? Balance { get; set; }

        private int? reorderQty;

        public int? ReorderQty
        {
            get { return reorderQty; }
            set { reorderQty = value; }
        }

        private double? unitPrice;
        public double? UnitPrice { get; set; }

        private double? amount;
        public double? Amount { get; set; }
    }
}
