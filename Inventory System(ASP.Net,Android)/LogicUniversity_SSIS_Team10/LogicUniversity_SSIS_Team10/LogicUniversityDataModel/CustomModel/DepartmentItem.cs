using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class DepartmentItem
    {
        public string DepartmentRequisitionId { get; set; }
        public string DepartmentId { get; set; }
        public string ItemId { get; set; }

        public int? NeededQuantity { get; set; }

        public int? ActualQuantity { get; set; }
    }
}
