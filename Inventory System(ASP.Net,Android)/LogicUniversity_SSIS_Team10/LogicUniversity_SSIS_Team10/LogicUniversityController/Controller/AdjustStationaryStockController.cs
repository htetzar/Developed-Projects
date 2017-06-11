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
    public class AdjustStationaryStockController
    {
        AdjustStationaryStockDAOImpl dao = new AdjustStationaryStockDAOImpl();
        public List<Adjustment> GetAdjustmentList(String roleName)
        {
            return dao.GetAdjustmentList(roleName);
        }

        public List<AdjustmentDetail> GetAdjustmentDetail(String voucherId)
        {
            return dao.GetAdjustmentDetail(voucherId);
        }
        public void UpdateStockCard(List<StockCard> list)
        {
            dao.UpdateStockCard(list);
        }

        public void ApproveOrRejectAdjustment(String voucherId, String approveBy, String remark, String status)
        {
            dao.ApproveOrRejectAdjustment(voucherId, approveBy, remark, status);
        }
        public double GetItemPrice(String itemId)
        {
            return dao.GetItemPrice(itemId);
        }
        public String GenerateVoucherId()
        {
            return dao.GenerateVoucherId();
        }
        public void SaveDataToAdjustmentAndAdjustmentDetail(Adjustment adj, List<AdjustmentDetail> adjDetails)
        {
            dao.SaveDataToAdjustmentAndAdjustmentDetail(adj, adjDetails);
        }
    }
}
