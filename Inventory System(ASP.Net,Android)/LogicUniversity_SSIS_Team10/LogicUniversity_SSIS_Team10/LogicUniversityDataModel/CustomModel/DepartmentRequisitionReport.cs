using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.CustomModel
{
    //Author Zaw Myo Htet.
    //Team 10.
    public class DepartmentRequisitionReport
    {
        public DateTime RequisitionDate { get; set; }

        public int CommerceDept { get; set; }

        public int ComputerScience { get; set; }

        public int EnglishDept { get; set; }

        public int RegistrarDept { get; set; }

        public int ZoologyDept { get; set; }
    }
}
