using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class DisbursementDeliveryList
    {
        private String disbursementId;

        public String DisbursementId
        {
            get { return disbursementId; }
            set { disbursementId = value; }
        }

        private DateTime? createDate;

        public DateTime? CreateDate
        {
            get { return createDate; }
            set { createDate = value; }
        }

        private String departmentRequisitionId;
        public String DepartmentRequisitionId
        {
            get { return departmentRequisitionId; }
            set { departmentRequisitionId = value; }
        }
        private String[] itemArr;
        public String[] ItemArr
        {
            get { return itemArr; }
            set { itemArr = value; }
        }

        private String itemDescription;
        public String ItemDescription
        {
            get { return itemDescription; }
            set { itemDescription = value; }
        }

        private String status;
        public String Status
        {
            get { return status; }
            set { status = value; }
        }

        private String departmentName;
        public String DepartmentName
        {
            get { return departmentName; }
            set { departmentName = value; }
        }

        private String representativeName;
        public String RepresentativeName
        {
            get { return representativeName; }
            set { representativeName = value; }
        }

        private String collectionPointName;
        public String CollectionPointName
        {
            get { return collectionPointName; }
            set { collectionPointName = value; }
        }

        private String collectionPointTime;
        public String CollectionPointTime
        {
            get { return collectionPointTime; }
            set { collectionPointTime = value; }
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

        private int? actualQuantity;
        public int? ActualQuantity
        {
            get { return actualQuantity; }
            set { actualQuantity = value; }
        }

        private int? neededQuantity;
        public int? NeededQuantity
        {
            get { return neededQuantity; }
            set { neededQuantity = value; }
        }
        public DisbursementDeliveryList() { }

        public DisbursementDeliveryList(int? actualQuantity, int? retrievedQuantity, String disbursementId, String itemDescription,
                                        String itemName, String departmentRequisitionId, String departmentName, String status,
                                        String representativeName, String collectionPointName, String collectionPointTime)
        {
            this.DisbursementId = disbursementId;
            this.DepartmentRequisitionId = departmentRequisitionId;
            this.DepartmentName = departmentName;
            this.RepresentativeName = representativeName;
            this.CollectionPointName = collectionPointName;
            this.CollectionPointTime = collectionPointTime;
            this.ItemName = itemName;
            this.ActualQuantity = actualQuantity;
            this.neededQuantity = retrievedQuantity;
            this.ItemDescription = itemDescription;
            this.Status = status;
        }
    }
}
