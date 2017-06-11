using LogicUniversityDataModel.CustomModel;
using LogicUniversityDataModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Zaw Myo Htet,Ei Ei Maw
    //Team 10.

    public class GenerateRequisitionTrendReportDAOImpl
    {
        LogicU_Data logicU_Data = new LogicU_Data();
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        public List<DepartmentRequisitionReport> GetReportByDepartment(List<string> months)
        {
            List<DepartmentRequisitionReport> departmentRequisitionReportList = new List<DepartmentRequisitionReport>();

            foreach (string month in months)
            {
                DepartmentRequisitionReport departmentRequisitionReport = logicU_Data.GetReportByDepartmentOnDate(month);

                if (departmentRequisitionReport.CommerceDept ==0 && departmentRequisitionReport.ComputerScience ==0 &&
                    departmentRequisitionReport.EnglishDept ==0 && departmentRequisitionReport.RegistrarDept ==0 
                    && departmentRequisitionReport.ZoologyDept == 0)
                {
                   
                }
                else
                {
                    departmentRequisitionReportList.Add(departmentRequisitionReport);
                }
                   
                
               
                
            }
            return departmentRequisitionReportList;
        }
    }
}
