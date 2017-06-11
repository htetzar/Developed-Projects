using LogicUniversityDataModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{

    //Author Liu Hui Qiu,Mai Chi Cuong.
    //Team 10.
    public class MaintatinDepartmentInfoController
    {
        MaintatinDepartmentInfoDAOImpl maintainDeptInfoImpl = new MaintatinDepartmentInfoDAOImpl();

        public List<CollectionPoint> getCollectionPointList()
        {
            return maintainDeptInfoImpl.getCollectionPointList();
        }
        public List<Staff> getStaffList()
        {
            return maintainDeptInfoImpl.getStaffList();
        }

        public void maintainDepartmentInfo(string departmentCode, string collectionPointId, string newRepId)
        {
            maintainDeptInfoImpl.maintainDepartmentInfo(departmentCode, collectionPointId, newRepId);
        }
        public void changeDepartmentInfo(string departmentCode, string collectionPointId, string newRepId)
        {
            maintainDeptInfoImpl.maintainDepartmentInfo(departmentCode, collectionPointId, newRepId);
        }
    }
}
