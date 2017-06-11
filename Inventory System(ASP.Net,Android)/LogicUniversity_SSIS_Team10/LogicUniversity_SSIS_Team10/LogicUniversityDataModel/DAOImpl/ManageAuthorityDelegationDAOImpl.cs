using LogicUniversityDataModel.CustomModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Ei Ei Maw.
    //Team 10.
    public class ManageAuthorityDelegationDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();

        public List<Staff> GetStaffNameByDepartmentId(string depId, string staffId)
        {
            List<Staff> staffList = context.Staffs.Where(x => x.DepartmentId == depId && x.StaffId != staffId).ToList();
            return staffList;
        }
        public void SaveDelegateInfo(DelegateEmployee delegateInfo)
        {
            if (delegateInfo != null)
            {
                Delegate delegateStaff = new Delegate();
                delegateStaff.DepartmentHeadId = delegateInfo.DepartmentheadId;
                delegateStaff.StaffId = delegateInfo.StaffId;
                delegateStaff.StartDate = delegateInfo.StartDate;
                delegateStaff.EndDate = delegateInfo.EndDate;
                delegateStaff.Status = delegateInfo.Status;
                context.Delegates.Add(delegateStaff);
                context.SaveChanges();

            }

        }
        public Delegate CheckStatus(string depId)
        {
            Delegate deleInfoStatus = context.Delegates.Where(x => x.Status == true && x.Staff.DepartmentId == depId).FirstOrDefault();
            return deleInfoStatus;
        }
        public Delegate CheckStatusByStaffId(string staffId)
        {
            Delegate deleInfoStatus = context.Delegates.Where(x => x.Status == true && x.StaffId.Equals(staffId)).FirstOrDefault();
            return deleInfoStatus;
        }

        public void TermiateEmployee(string depId)
        {
            Delegate deleEmp = CheckStatus(depId);
            deleEmp.Status = false;
            context.SaveChanges();
        }
       
    }
}
