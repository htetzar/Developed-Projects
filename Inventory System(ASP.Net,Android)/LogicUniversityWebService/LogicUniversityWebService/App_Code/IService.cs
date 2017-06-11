using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;


// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    [WebGet(UriTemplate = "/Login/{userId}/{password}", RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json)]
    WCFStaffModel LogIn(string userId, string password);
  
    [OperationContract]
    [WebGet(UriTemplate = "/GetRequisitionList/{depId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFStaffRequisitionModel> GetRequisitionList(string depId);

    [OperationContract]
    [WebGet(UriTemplate = "/GetRequisition/{staffId}", ResponseFormat = WebMessageFormat.Json)]
    WCFStaffRequisitionModel GetRequisition(string staffId);

    [OperationContract]
    [WebGet(UriTemplate = "/GetRequisitionDetail/{requisitionId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFStaffRequisitionDetailModel> GetRequisitionDetail(string requisitionId);

    [OperationContract]
    [WebInvoke(UriTemplate = "/ApproveRequisition", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
    void ApproveRequisition(List<WCFStaffRequisitionDetailModel> requisitionDetailModelList);

    [OperationContract]
    [WebGet(UriTemplate = "/RejectRequisition/{staffReqId}/{remark}", ResponseFormat = WebMessageFormat.Json)]
    void RejectRequisition(string staffReqId, string remark);


    // Get List Of Staff For Delegation
    [OperationContract]
    [WebGet(UriTemplate = "/GetStaffNameByDepartmentId/{depId}/{staffId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFStaffModel> GetStaffNameByDepartmentId(string depId, string staffId);

    [OperationContract]
    [WebGet(UriTemplate = "/CheckDelegationStatus/{depId}", ResponseFormat = WebMessageFormat.Json)]
    WCFStaffDelegationModel CheckDelegationStatus(string depId);

    [OperationContract]
    [WebInvoke(UriTemplate = "/SaveDelegationInfo", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
    void SaveDelegationInfo(WCFStaffDelegationModel delegation);
    
    [OperationContract]
    [WebGet(UriTemplate = "/TerminateDelegation/{deptId}", ResponseFormat = WebMessageFormat.Json)]
    string TermiateDelegation(string deptId);

    // Desbursement List

    [OperationContract]
    [WebGet(UriTemplate = "/GetDisbursementList", ResponseFormat = WebMessageFormat.Json)]
    List<WCFDisbursementDelivery> GetDisbursementList();

    [OperationContract]
    [WebGet(UriTemplate = "/GetDisbursementDetailList/{disbursementId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFDisbursementDelivery> GetDisbursementDetailList(string disbursementId);
    
    [OperationContract]
    [WebGet(UriTemplate = "/GetAcknowledgeDisbursementList/{departmentId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFDisbursementDelivery> GetAcknowledgeDisbursementList(string departmentId);

    [OperationContract]
    [WebInvoke(UriTemplate = "/UpdateAcknowledgeInformation", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
    void UpdateAcknowledgeInformation(List<WCFDisbursementDelivery> deliveryList);

    // Process Requisition
    [OperationContract]
    [WebGet(UriTemplate = "/GetItemNeeded/", ResponseFormat = WebMessageFormat.Json)]
    List<WCFStationeryRetrievalModel> GetTotalItemNeeded();

    [OperationContract]
    [WebGet(UriTemplate = "/GetDepartmentNeeded/{itemId}", ResponseFormat = WebMessageFormat.Json)]
    List<WCFStationeryRetrievalModel> GetDepartmentItemNeeded(String itemId);

    [OperationContract]
    [WebInvoke(UriTemplate = "/updateStationeryRetrievalList", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
    void UpdateStationeryRetrievalList(List<WCFStationeryRetrievalModel> stationeryRetrievalModelList);
}
// Staff Class

[DataContract]
public class WCFStaffModel
{
    
    [DataMember]
    public string StaffId { get; set; }

    [DataMember]
    public string Password { get; set; }

    [DataMember]
    public string StaffName { get; set; }

    [DataMember]
    public int RoleId { get; set; }

    [DataMember]
    public string DepartmentId { get; set; }

    [DataMember]
    public string Email { get; set; }

    [DataMember]
    public string PhoneNumber { get; set; }

    [DataMember]
    public string Address { get; set; }

    [DataMember]
    public string EmailPassword { get; set; }

    [DataMember]
    public string DepartmentName { get; set; }

    [DataMember]
    public string RoleName { get; set; }

    [DataMember]
    public string DepartmentHeadId { get; set; }

    }

[DataContract]

public class WCFStaffRequisitionModel
{

    [DataMember]
    public string StaffRequisitionId { get; set; }

    [DataMember]
    public string StaffRequisitionDate { get; set; }

    [DataMember]
    public string StaffRequisitionStatus { get; set; }

    [DataMember]
    public string StaffRequisitionStaffId { get; set; }
}

[DataContract]
public class WCFStaffRequisitionDetailModel
{
    [DataMember]
    public string StaffReqisitionId { get; set; }

    [DataMember]
    public string ItemCode { get; set; }

    [DataMember]
    public string ItemDescription { get; set; }

    [DataMember]
    public int ItemQuantity { get; set; }
    
    [DataMember]
    public string Remark { get; set; }

    [DataMember]
    public string StaffId { get; set; }
}

[DataContract]
public class WCFStaffDelegationModel
{
    [DataMember]
    public int DelegateId { get; set; }

    [DataMember]
    public string DepartmentHeadId { get; set; }

    [DataMember]
    public string StaffId { get; set; }

    [DataMember]
    public string StaffName { get; set; }

    [DataMember]
    public string RoleName { get; set; }

    [DataMember]
    public string StartDate { get; set; }

    [DataMember]
    public string EndDate { get; set; }

    [DataMember]
    public string Status { get; set; }

    //[DataMember]
    //public WCFStaffModel Staff { get; set; }
}


[DataContract]
public class WCFDisbursementDelivery
{
    [DataMember]
    public string DisbursementId { get; set; }

    [DataMember]
    public string CreateDate { get; set; }

    [DataMember]
    public string DepartmentRequisitionId { get; set; }

    [DataMember]
    public string[] ItemArr { get; set; }

    [DataMember]
    public string ItemDescription { get; set; }

    [DataMember]
    public string Status { get; set; }

    [DataMember]
    public string DepartmentName { get; set; }
    [DataMember]
    public string RepresentativeName { get; set; }

    [DataMember]
    public string CollectionPointName { get; set; }

    [DataMember]
    public string CollectionPointTime { get; set; }


    [DataMember]
    public string ItemId { get; set; }

    [DataMember]
    public string ItemName { get; set; }

    [DataMember]
    public int ActualQuantity { get; set; }

    [DataMember]
    public int NeededQuantity { get; set; }

    [DataMember]
    public string Remark { get; set; }

}

public class WCFStationeryRetrievalModel
{
    [DataMember]
    public String BinId { get; set; }

    [DataMember]
    public string ItemName { get; set; }

    [DataMember]
    public int? Quantity { get; set; }
    [DataMember]
    public String DepartmentId { get; set; }

    [DataMember]
    public string ItemId { get; set; }

    [DataMember]
    public int? NeededQuantity { get; set; }

    [DataMember]
    public int? ActualQuantity { get; set; }

    [DataMember]
    public String DepartmentRequisitionId { get; set; }

    
}