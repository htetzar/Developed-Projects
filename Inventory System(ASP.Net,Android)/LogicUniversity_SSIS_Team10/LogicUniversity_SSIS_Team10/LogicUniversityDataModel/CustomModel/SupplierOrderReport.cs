using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.CustomModel
{
    //Author Zaw Myo Htet.
    //Team 10.

   public class SupplierOrderReport
    {
        public SupplierOrderReport()
        {

        }

        public SupplierOrderReport(DateTime orderDate, int supplierOne, int supplierTwo, int supplierThree)
        {
            this.OrderDate = orderDate;
            this.SupplierOne = supplierOne;
            this.SupplierTwo = supplierTwo;
            this.SupplierThree = supplierThree;
        }

        public DateTime OrderDate { get; set; }

        public int SupplierOne { get; set; }

        public int SupplierTwo { get; set; }

        public int SupplierThree { get; set; }
    }
}
