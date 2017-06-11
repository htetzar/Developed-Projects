using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LogicUniversityDataModel.DAOImpl;
using LogicUniversityDataModel;

namespace LogicUniversityController.Controller
{

    //Author Htet Zar Chi Aung.
    //Team 10.
    public class DisbursementController
    {
        DisbursementDAOImpl dao = new DisbursementDAOImpl();
        public List<DisbursementDeliveryList> GetDisbursementList()
        {
            return dao.GetDisbursementList();
        }

        public List<DisbursementDeliveryList> GetDisbursementDetailList(String disbursementId)
        {
            return dao.GetDisbursementDetailList(disbursementId);
        }

        public List<DisbursementDeliveryList> GetAcknowledgeDisbursementList(String departmentId)
        {
            return dao.GetAcknowledgeDisbursementList(departmentId);
        }

        public void UpdateAcknowledgeInformation(List<DisbursementDeliveryList> deliveryList, String remark)
        {
            dao.UpdateAcknowledgeInformation(deliveryList, remark);
        }
    }
}
