using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LogicUniversityDataModel.CustomModel;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Krithiga Gunasekaran,Ei Ei Maw.
    //Team 10
   public class ViewStationaryRequisitionDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();

        public List<StaffRequisition> GetRequisitionList(string staffId)
        {
            return context.StaffRequisitions.Where(x => (x.Status == "Pending" || x.Status == "Reject") && x.StaffId.Equals(staffId)).ToList<StaffRequisition>();//x.StaffId == "userId" && 
        }
        public List<StaffRequisition> GetRequisitionListByAllStaff(string departmentId)
        {
            return context.StaffRequisitions.Where(x => (x.Status == "Pending") && x.DepartmentId.Equals(departmentId)).ToList<StaffRequisition>();
        }
        public List<Item> GetItemList()
        {
            return context.Items.ToList();
        }

        public Item GetItemName(string itemname)
        {
            return context.Items.Where(x => x.ItemName.Equals(itemname)).FirstOrDefault();
        }

        public string GetRequisitionId(string departmentCode)
        {
            string requisitionid = GenerateRequisitionId(departmentCode);
            return requisitionid;
        }

        public string GenerateRequisitionId(string departmentCode)
        {
            var list = context.StaffRequisitions.Select(a => a.StaffRequisitionId).ToList();
            char[] chrArr = new char[] { '-' };
            string RequisitionId = "0";
            if (list.Count > 0)
            {

                var currentId = context.StaffRequisitions.Select(a => a.StaffRequisitionId).ToList()
                    .Select(a => a.Split(chrArr)[2])
                    .Select(a => Convert.ToInt32(a)).Max() + 1;
                RequisitionId = departmentCode + "-" + "111" + "-" + currentId;

            }
            else
            {
                RequisitionId = departmentCode + "-" + "111" + "-" + "100";
            }
            return RequisitionId;
        }
        public string GenerateDepartmentRequisitionId(string departmentCode)
        {
            var list = context.StaffRequisitions.Select(a => a.StaffRequisitionId).ToList();
            char[] chrArr = new char[] { '-' };
            string RequisitionId = "0";
            if (list.Count > 0)
            {

                var currentId = context.StaffRequisitions.Select(a => a.StaffRequisitionId).ToList()
                    .Select(a => a.Split(chrArr)[2])
                    .Select(a => Convert.ToInt32(a)).Max() + 1;
                RequisitionId = departmentCode + "-" + currentId;

            }
            else
            {
                RequisitionId = departmentCode + "-" + "001";
            }
            return RequisitionId;
        }
        public void saveDataToRequisition(StaffRequisition requisition, List<RequisitionDetail> requisitiondetails)
        {
            context.StaffRequisitions.Add(requisition);
            context.SaveChanges();
            foreach (RequisitionDetail req in requisitiondetails)
            {              
                RequisitionDetail reqDetail = context.RequisitionDetails.Where(x => x.StaffReqisitionId.Equals(req.StaffReqisitionId) && x.ItemId.Equals(req.ItemId)).FirstOrDefault();
                if(reqDetail != null)
                {
                    reqDetail.Quantity += req.Quantity;
                    context.SaveChanges();
                }
                else
                {
                    RequisitionDetail d = new RequisitionDetail();
                    d.StaffReqisitionId = req.StaffReqisitionId;
                    d.ItemId = req.ItemId;
                    d.Quantity = req.Quantity;
                    context.RequisitionDetails.Add(d);
                    context.SaveChanges();
                }
            
            }
           
            
        }

        public List<RequisitionDetail> GetRequisitionDetails(string requisitionId)
        {
            StaffRequisition requisition = context.StaffRequisitions.Where(x => x.StaffRequisitionId == requisitionId && x.Status == "Pending" || x.Status == "Reject").FirstOrDefault();
            List<RequisitionDetail> requisitionDetailList = requisition.RequisitionDetails.ToList<RequisitionDetail>();
            return requisitionDetailList;

        }

        public void updateRequisitionItem(RequisitionDetail requisitionDetail)
        {
            RequisitionDetail oldRequisitionDetail = context.RequisitionDetails.Where(x => x.StaffReqisitionId == requisitionDetail.StaffReqisitionId && x.ItemId == requisitionDetail.ItemId).FirstOrDefault();
            oldRequisitionDetail.StaffRequisition.Status = StatusType.Pending.ToString();
            oldRequisitionDetail.Quantity = requisitionDetail.Quantity;
            context.SaveChanges();
        }

        public void DeleteRequisitionDetail(StaffRequisition requisition)
        {
            StaffRequisition oldRequisition = context.StaffRequisitions.Where(x => x.StaffRequisitionId == requisition.StaffRequisitionId).FirstOrDefault();
            context.StaffRequisitions.Remove(oldRequisition);
            context.SaveChanges();
        }
        public bool? CheckDelegateStatus(string staffId)
        {
            Delegate delegatePerson = context.Delegates.Where(x => x.StaffId == staffId && x.Status == true).FirstOrDefault();
            if (delegatePerson != null)
            {
                return delegatePerson.Status;
            }
            return false;
        }
        public void ApproveRequisitionList(string staffReqId, List<RequisitionDetail> requisitionDetailList, string remark, string staffId)
        {

            StaffRequisition staffRequisition = context.StaffRequisitions.Where(x => x.StaffRequisitionId.Equals(staffReqId)).FirstOrDefault();
            string depReqId = GenerateDepartmentRequisitionId(staffRequisition.DepartmentId);
            if (staffRequisition != null)
            {
                staffRequisition.DepartmentRequisitionId = depReqId;
                staffRequisition.Status = StatusType.Approved.ToString();
                staffRequisition.ApproveBy = staffId;
                staffRequisition.ApproveDate = Convert.ToDateTime(DateTime.Now.ToString());
                staffRequisition.Remark = remark;
                context.SaveChanges();
            }

            foreach (RequisitionDetail req in requisitionDetailList)
            {
                DepartmentRequisition depRequisition = context.DepartmentRequisitions.Where(x => x.DepartmentId.Equals(staffRequisition.DepartmentId) && x.ItemId.Equals(req.ItemId) && x.Status.Equals(StatusType.Pending.ToString())).FirstOrDefault();

                if (depRequisition != null)
                {
                    depRequisition.Needed += req.Quantity;
                    context.SaveChanges();
                }
                else
                {
                    DepartmentRequisition departmentReq = new DepartmentRequisition();
                    departmentReq.DepartmentRequisitionId = depReqId;
                    departmentReq.DepartmentId = staffRequisition.DepartmentId;
                    departmentReq.ItemId = req.ItemId;
                    departmentReq.Needed = req.Quantity;
                    departmentReq.Actual = 0;
                    departmentReq.Status = StatusType.Approved.ToString();
                    departmentReq.Remark = remark;
                    departmentReq.CreateDate = DateTime.Now;
                    context.DepartmentRequisitions.Add(departmentReq);
                    context.SaveChanges();
                }
            }
        }
        public void RejectRequisitionList(string staffReqId, string remark)
        {
            StaffRequisition staffRequisition = context.StaffRequisitions.Where(x => x.StaffRequisitionId.Equals(staffReqId)).FirstOrDefault();
            staffRequisition.Status = StatusType.Reject.ToString();
            staffRequisition.Remark = remark;
            context.SaveChanges();

        }
    }

}
