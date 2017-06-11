using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.CustomModel
{
    //Author Ei Ei Maw.
    //Team 10.
 public   class InventoryStatusReport
    {
        private string itemCode;

        public string ItemCode
        {
            get { return itemCode; }
            set { itemCode = value; }
        }
        private string itemName;

        public string ItemName
        {
            get { return itemName; }
            set { itemName = value; }
        }
        private string description;

        public string Description
        {
            get { return description; }
            set { description = value; }
        }
        private string location;

        public string Location
        {
            get { return location; }
            set { location = value; }
        }
        private double balance;

        public double Balance
        {
            get { return balance; }
            set { balance = value; }
        }
        private string unitOfMeasurement;

        public string UnitOfMeasurement
        {
            get { return unitOfMeasurement; }
            set { unitOfMeasurement = value; }
        }
        private int reorderLevel;

        public int ReorderLevel
        {
            get { return reorderLevel; }
            set { reorderLevel = value; }
        }

    }
}
