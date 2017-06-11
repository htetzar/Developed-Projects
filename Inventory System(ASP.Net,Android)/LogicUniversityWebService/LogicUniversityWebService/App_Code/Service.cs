using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the class name "Service" in code, svc and config file together.
public class Service : IService
{

    public WCFStaffModel LogIn(string userId, string password)
    {
        return Data.LogIn(userId, password);
    }

    public List<WCFStaffRequisitionModel> GetRequisitionList(string depId)
    {
        return Data.GetRequisitionList(depId);
    }


    public WCFStaffRequisitionModel GetRequisition(string staffId)
    {
        return Data.GetRequisition(staffId);
    }

    public List<WCFStaffRequisitionDetailModel> GetRequisitionDetail(string requisitionId)
    {
        return Data.GetRequisitionDetail(requisitionId);
    }

    public void ApproveRequisition(List<WCFStaffRequisitionDetailModel> requisitionDetailModelList)
    {
        Data.ApproveRequisition(requisitionDetailModelList);
    }

    public void RejectRequisition(string staffReqId, string remark)
    {
        Data.RejectRequisition(staffReqId, remark);
    }

    public List<WCFStaffModel> GetStaffNameByDepartmentId(string depId, string staffId)
    {
        return Data.GetStaffNameByDepartmentId(depId, staffId);
    }

    public WCFStaffDelegationModel CheckDelegationStatus(string depId)
    {
        return Data.CheckDelegationStatus(depId);
    }

    public void SaveDelegationInfo(WCFStaffDelegationModel delegation)
    {
        Data.SaveDelegationInfo(delegation);
    }

    public string TermiateDelegation(string deptId)
    {
       return Data.TermiateDelegation(deptId);
    }

    public List<WCFDisbursementDelivery> GetDisbursementList()
    {
        return Data.GetDisbursementList();
    }
    public List<WCFDisbursementDelivery> GetDisbursementDetailList(string disbursementId)
    {
        return Data.GetDisbursementDetailList(disbursementId);
    }
    public List<WCFDisbursementDelivery> GetAcknowledgeDisbursementList(string departmentId)
    {
        return Data.GetAcknowledgeDisbursementList(departmentId);
    }

    public void UpdateAcknowledgeInformation(List<WCFDisbursementDelivery> deliveryList)
    {
        Data.UpdateAcknowledgeInformation(deliveryList);
    }

    public List<WCFStationeryRetrievalModel> GetTotalItemNeeded()
    {
        return Data.GetTotalItemNeeded();
    }

    public List<WCFStationeryRetrievalModel> GetDepartmentItemNeeded(String itemId)
    {
        return Data.GetDepartmentItemNeeded(itemId);

    }

    public void UpdateStationeryRetrievalList(List<WCFStationeryRetrievalModel> stationeryRetrievalModelList)
    {
        Data.UpdateStationeryRetrievalList(stationeryRetrievalModelList);
    }
}
