using LogicUniversityDataModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class ProcessStationaryRequisitionController
    {
        ProcessStationaryRequisitionDAOImpl dao = new ProcessStationaryRequisitionDAOImpl();
        public List<StationaryRetrievalList> GetStationeryRetrievalList()
        {
            return dao.GetStationeryRetrievalList();
        }

        public double? GetStockCardBalance(String itemId)
        {
            return dao.GetStockCardBalance(itemId);
        }

        public void UpdateStockCard(StockCard sc)
        {
            dao.UpdateStockCard(sc);
        }

        public void UpdateDepartmentRequisition(string departmentRequisitionId, string itemId, String oldStatus, String newStatus, int? deptActual)
        {
            dao.UpdateDepartmentRequisition(departmentRequisitionId, itemId, oldStatus, newStatus, deptActual);
        }

        public void InsertDisbursement(Disbursement d, List<DisbursementDetail> details)
        {
            dao.InsertDisbursement(d, details);
        }
        public List<RetrievalItem> GetTotalItemNeeded()
        {
            return dao.GetTotalItemNeeded();
        }

        public List<DepartmentItem> GetDepartmentItemNeeded(String itemName)
        {
            return dao.GetDepartmentItemNeeded(itemName);
        }

        public void SaveRetrievalList(List<StationeryRetrievalUpdateList> deptItem)
        {
            dao.SaveRetrievalList(deptItem);
        }
    }
}
