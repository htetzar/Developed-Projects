using LogicUniversityDataModel;
using LogicUniversityDataModel.CustomModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{
    //Author Ei Ei Maw.
    //Team 10.
        public class ManageAuthorityDelegationController
        {
            ManageAuthorityDelegationDAOImpl delegationDaoImpl = new ManageAuthorityDelegationDAOImpl();
            public List<Staff> GetStaffNameByDepartmentId(string depId, string staffId)
            {
                return delegationDaoImpl.GetStaffNameByDepartmentId(depId, staffId);
            }
            public void SaveDelegateInfo(DelegateEmployee delegateInfo)
            {
                delegationDaoImpl.SaveDelegateInfo(delegateInfo);
            }
            public void SaveDelegateInfoMobile(DelegateEmployee delegateInfo, string staffName, string roleName)
            {
                delegationDaoImpl.SaveDelegateInfo(delegateInfo);
                SendMailToDelegatedStaff(staffName, roleName, delegateInfo.StaffName);
            }
            private void SendMailToDelegatedStaff(string staffName, string roleName, string delegatedStaff)
            {
                var userName = staffName;
                var userRole = roleName;
                String toEmail = "ssisdelegatestaff@gmail.com";
                String subj = "Delegation authority to " + delegatedStaff;
                String message = "I have delegated you as department head. " + "<br/><br/>" + "Best Regard" + "<br/>" + userName;
                EmailController.SendEmailToDelegatedStaff(toEmail, subj, message);
            }
            public LogicUniversityDataModel.Delegate CheckStatus(string departmentId)
            {
                return delegationDaoImpl.CheckStatus(departmentId);
            }
            public void TermiateEmployee(string depId)
            {
                delegationDaoImpl.TermiateEmployee(depId);
            }
            public LogicUniversityDataModel.Delegate CheckStatusByStaffId(string staffId)
            {
                return delegationDaoImpl.CheckStatusByStaffId(staffId);
            }
        }
}
