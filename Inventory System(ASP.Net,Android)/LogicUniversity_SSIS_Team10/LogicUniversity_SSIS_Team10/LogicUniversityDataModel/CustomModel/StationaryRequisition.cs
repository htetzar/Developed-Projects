using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class StationaryRequisition
    {
        public string RequisitionId { get; set; }
        public string ItemName { get; set; }

        public DateTime CreatedDate { get; set; }

        public string Status { get; set; }
    }
}
