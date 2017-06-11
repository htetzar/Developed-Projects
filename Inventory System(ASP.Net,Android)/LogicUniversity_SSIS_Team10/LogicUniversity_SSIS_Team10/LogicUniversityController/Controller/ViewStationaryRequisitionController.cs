using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LogicUniversityDataModel;
using LogicUniversityDataModel.CustomModel;
using LogicUniversityDataModel.DAOImpl;

namespace LogicUniversityController
{
    //Author Ei Ei Maw,Krithiga Gunasekaran
    //Team 10.
    public class ViewStationaryRequisitionController
    {
        private ViewStationaryRequisitionDAOImpl viewStationaryRequisitionDAOImpl = new ViewStationaryRequisitionDAOImpl();

        public List<StaffRequisition> GetRequisitionList(string staffId)
        {
            return viewStationaryRequisitionDAOImpl.GetRequisitionList(staffId);
        }

        public List<RequisitionDetail> GetRequisitionDetails(string requisitionId)
        {
            return viewStationaryRequisitionDAOImpl.GetRequisitionDetails(requisitionId);
        }

        public List<Item> GetItemList()
        {
            return viewStationaryRequisitionDAOImpl.GetItemList();
        }

        public string GetRequisitionId(string departmentCode)
        {
            return viewStationaryRequisitionDAOImpl.GetRequisitionId(departmentCode);
        }

        public void saveDataToRequisition(StaffRequisition requisition, List<RequisitionDetail> requisitiondetails)
        {
            viewStationaryRequisitionDAOImpl.saveDataToRequisition(requisition, requisitiondetails);
        }

        public Item GetItemName(string ItemName)
        {
            return viewStationaryRequisitionDAOImpl.GetItemName(ItemName);
        }

        public void modifyRequisitionDetails(List<RequisitionDetail> requisitionDetailList)
        {
            foreach (RequisitionDetail r in requisitionDetailList)
                viewStationaryRequisitionDAOImpl.updateRequisitionItem(r);
        }

        public void RemoveRequisitionDetail(StaffRequisition requisition)
        {
            viewStationaryRequisitionDAOImpl.DeleteRequisitionDetail(requisition);
        }
        public bool? CheckDelegateStatus(string staffId)
        {
            return viewStationaryRequisitionDAOImpl.CheckDelegateStatus(staffId);
        }
        
        public List<StaffRequisition> GetRequisitionListByAllStaff(string departmentId)
        {
            return viewStationaryRequisitionDAOImpl.GetRequisitionListByAllStaff(departmentId);
        }
        public void ApproveRequisitionList(string staffReqId, List<RequisitionDetail> requisitionDetailList, string remark, string staffId)
        {
            viewStationaryRequisitionDAOImpl.ApproveRequisitionList(staffReqId, requisitionDetailList, remark, staffId);
        }
        public void RejectRequisitionList(string staffReqId, string remark)
        {
            viewStationaryRequisitionDAOImpl.RejectRequisitionList(staffReqId, remark);
        }
    }
}
