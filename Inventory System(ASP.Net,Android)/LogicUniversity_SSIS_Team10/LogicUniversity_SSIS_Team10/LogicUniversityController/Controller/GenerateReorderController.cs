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

    //Author Zaw Myo Htet,Ei Ei Maw.
    //Team 10.
    public class GenerateReorderController
    {
        private GenerateReorderDAOImpl generateReorderDAOImpl = new GenerateReorderDAOImpl();

        public List<SupplierOrderReport> GetReportBySupplier(string itemId, List<string> months)
        {
            return generateReorderDAOImpl.GetReportBySupplier(itemId, months);
        }
        public List<Item> GetItemList()
        {
            return generateReorderDAOImpl.GetItemList();
        }

        public List<CategoryOrderReport> GetReportByCategory(List<string> categoryList, List<string> lstDateTimeString)
        {
            return generateReorderDAOImpl.GetReportByCategory(categoryList, lstDateTimeString);
        }

        public List<Category> GetCategoryList()
        {
            return generateReorderDAOImpl.GetCategoryList();
        }
    }
}
