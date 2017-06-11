using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{

    //Author Mai Chi Cuong
    //Team 10.
    public class MaintatinDepartmentInfoDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        public List<CollectionPoint> getCollectionPointList()
        {
            return context.CollectionPoints.ToList();
        }
        public List<Staff> getStaffList()
        {
            return context.Staffs.ToList();
        }

        public void maintainDepartmentInfo(string departmentCode, string collectionPointId, string newRepId)
        {
            Department oldDepartment = context.Departments.Where(x => x.DepartmentId == departmentCode).FirstOrDefault();

            string oldRepId = oldDepartment.Representative_ID;
            Staff oldRep = context.Staffs.Where(x => x.StaffId.Equals(oldRepId)).FirstOrDefault();
            oldRep.RoleId = context.Roles.Where(x => x.RoleName.Equals("Staff")).FirstOrDefault().RoleId;

            Staff newRep = context.Staffs.Where(x => x.StaffId.Equals(newRepId)).FirstOrDefault();
            newRep.RoleId = context.Roles.Where(x => x.RoleName.Equals("DepartmentRep")).FirstOrDefault().RoleId;

            oldDepartment.CollectionPointId = Convert.ToInt32(collectionPointId);
            oldDepartment.Representative_ID = newRepId;
            context.SaveChanges();
        }
    }
}
