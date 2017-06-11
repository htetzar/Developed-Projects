using LogicUniversityDataModel.CustomModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{

    //Author Zaw Myo Htet.
    //Team 10
    public class GenerateRequisitionTrendReportController
    {
        private GenerateRequisitionTrendReportDAOImpl generateRequisitionDAOImpl = new GenerateRequisitionTrendReportDAOImpl();
        public List<DepartmentRequisitionReport> GetReportByDepartment(List<string> months)
        {
            return generateRequisitionDAOImpl.GetReportByDepartment(months);
        }
    }
}
