using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class StationaryRetrievalList
    {
        private DateTime? createDate;

        public DateTime? CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        private String status;

        public String Status
        {
            get { return status; }
            set { status = value; }
        }

        private String departmentRequisitionId;

        public String DepartmentRequisitionId
        {
            get { return departmentRequisitionId; }
            set { departmentRequisitionId = value; }
        }

        private String departmentId;

        public String DepartmentId
        {
            get { return departmentId; }
            set { departmentId = value; }
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

        private String bin;

        public String Bin
        {
            get { return bin; }
            set { bin = value; }
        }
        private string departmentName;

        public string DepartmentName
        {
            get { return departmentName; }
            set { departmentName = value; }
        }
        private int? totalNeeded;

        public int? TotalNeeded
        {
            get { return totalNeeded; }
            set { totalNeeded = value; }
        }
        private double? totalRetrieved;

        public double? TotalRetrieved
        {
            get { return totalRetrieved; }
            set { totalRetrieved = value; }
        }
        
        private int? departmentNeeded;

        public int? DepartmentNeeded
        {
            get { return departmentNeeded; }
            set { departmentNeeded = value; }
        }
        private int? departmentActual;

        public int? DepartmentActual
        {
            get { return departmentActual; }
            set { departmentActual = value; }
        }

        public StationaryRetrievalList()
        {
        }

        public StationaryRetrievalList(String bin, string description, int? totalNeeded, double? totalRetrieved, string deptName, int? departmentNeeded, int? departmentActual)
        {
            this.bin = bin;
            this.departmentName = description;
            this.totalNeeded = totalNeeded;
            this.totalRetrieved = totalRetrieved;
            this.departmentName = deptName;
            this.departmentNeeded = departmentNeeded;
            this.departmentActual = departmentActual;
        }
    }
}
