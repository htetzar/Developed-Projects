using LogicUniversityController;
using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using LogicUniversityDataModel.CustomModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Connect with the Controller to get the data.
/// </summary>
public class Data
{
    static string format = "yyyy/MM/d HH:mm";
    public static WCFStaffModel LogIn(string userId, string password)
    {
        WCFStaffModel wcfStaff = new WCFStaffModel();
        LoginController loginController = new LoginController();
        if (loginController.CheckUser(userId, password))
        {
            Staff staff = loginController.GetUser(userId);
            wcfStaff.StaffId = staff.StaffId;
            wcfStaff.Password = staff.Password;
            wcfStaff.StaffName = staff.StaffName;
            wcfStaff.RoleId = staff.RoleId;
            wcfStaff.RoleName = staff.Role.RoleName;
            wcfStaff.DepartmentId = staff.DepartmentId;
            if (wcfStaff.RoleId == 4 || wcfStaff.RoleId == 5 || wcfStaff.RoleId == 6)
            {
                wcfStaff.DepartmentName = "Stationary Store Department";
                wcfStaff.DepartmentHeadId = "";
            }
            else
            {
                wcfStaff.DepartmentName = staff.Department.DepartmentName;
                wcfStaff.DepartmentHeadId = staff.Department.DepartmentHead_ID;
            }

            wcfStaff.Email = staff.Email;
            wcfStaff.PhoneNumber = staff.PhoneNumber;
            wcfStaff.Address = staff.Address;
            wcfStaff.EmailPassword = staff.EmailPassword;


        }
        return wcfStaff;
    }

    public static List<WCFStaffRequisitionModel> GetRequisitionList(string depId)
    {
        ViewStationaryRequisitionController viewStationaryRequisitionController = new ViewStationaryRequisitionController();

        List<StaffRequisition> staffRequisitionList = viewStationaryRequisitionController.GetRequisitionListByAllStaff(depId);
        List<WCFStaffRequisitionModel> requisitionList = new List<WCFStaffRequisitionModel>();
        foreach (StaffRequisition s in staffRequisitionList)
        {
            WCFStaffRequisitionModel w = new WCFStaffRequisitionModel();
            w.StaffRequisitionId = s.StaffRequisitionId;
            w.StaffRequisitionDate = ((DateTime)s.CreateDate).ToString(format);
            w.StaffRequisitionStaffId = s.StaffId;
            w.StaffRequisitionStatus = s.Status;
            requisitionList.Add(w);
        }
        return requisitionList;
    }

    public static WCFStaffRequisitionModel GetRequisition(string staffId)
    {
        ViewStationaryRequisitionController viewStationaryRequisitionController = new ViewStationaryRequisitionController();

        List<StaffRequisition> staffRequisitionList = viewStationaryRequisitionController.GetRequisitionList(staffId);
        WCFStaffRequisitionModel w = new WCFStaffRequisitionModel();
        foreach (StaffRequisition s in staffRequisitionList)
        {
            w.StaffRequisitionId = s.StaffRequisitionId;
            w.StaffRequisitionDate = ((DateTime)s.CreateDate).ToString(format);
            w.StaffRequisitionStaffId = s.StaffId;
            w.StaffRequisitionStatus = s.Status;
        }
        return w;
    }

    public static List<WCFStaffRequisitionDetailModel> GetRequisitionDetail(string requisitionId)
    {
        ViewStationaryRequisitionController viewStationaryRequisitionController = new ViewStationaryRequisitionController();
        List<RequisitionDetail> requsitionDetailList = viewStationaryRequisitionController.GetRequisitionDetails(requisitionId);
        List<WCFStaffRequisitionDetailModel> wcfStaffRequsitionDetailList = new List<WCFStaffRequisitionDetailModel>();
        foreach (RequisitionDetail r in requsitionDetailList)
        {
            WCFStaffRequisitionDetailModel w = new WCFStaffRequisitionDetailModel();
            w.StaffReqisitionId = r.StaffReqisitionId;
            w.ItemCode = r.ItemId;
            w.ItemDescription = r.Item.ItemName;
            w.ItemQuantity = (int)r.Quantity;
            wcfStaffRequsitionDetailList.Add(w);
        }
        return wcfStaffRequsitionDetailList;
    }

    public static void ApproveRequisition(List<WCFStaffRequisitionDetailModel> requisitionDetailModelList)
    {
        ViewStationaryRequisitionController viewStationaryRequisitionController = new ViewStationaryRequisitionController();
        //string staffReqId = requisitionDetailModelList.FirstOrDefault().StaffReqisitionId;
        //string remark = requisitionDetailModelList.FirstOrDefault().Remark;
        //string staffId = requisitionDetailModelList.FirstOrDefault().StaffId;
        String staffId = "";
        String remark = "";
        String staffReqId = "";

        List<RequisitionDetail> requisitionDetailList = new List<RequisitionDetail>();
        foreach (WCFStaffRequisitionDetailModel w in requisitionDetailModelList)
        {
            RequisitionDetail r = new RequisitionDetail();
            staffId = w.StaffId;
            remark = w.Remark;
            staffReqId = w.StaffReqisitionId;
            r.ItemId = w.ItemCode;
            r.Quantity = w.ItemQuantity;
            requisitionDetailList.Add(r);
        }
        viewStationaryRequisitionController.ApproveRequisitionList(staffReqId, requisitionDetailList, remark, staffId);
    }

    public static void RejectRequisition(string staffReqId, string remark)
    {
        ViewStationaryRequisitionController viewStationaryRequisitionController = new ViewStationaryRequisitionController();
        viewStationaryRequisitionController.RejectRequisitionList(staffReqId, remark);
    }

    // Delegate
    public static List<WCFStaffModel> GetStaffNameByDepartmentId(string depId, string staffId)
    {
        ManageAuthorityDelegationController manageAuthorityDelegationController = new ManageAuthorityDelegationController();
        List<Staff> staffList = manageAuthorityDelegationController.GetStaffNameByDepartmentId(depId, staffId);
        List<WCFStaffModel> wcfStaffList = new List<WCFStaffModel>();
        foreach (Staff s in staffList)
        {
            WCFStaffModel w = new WCFStaffModel();
            w.StaffId = s.StaffId;
            w.Password = s.Password;
            w.StaffName = s.StaffName;
            w.RoleId = s.RoleId;
            w.RoleName = s.Role.RoleName;
            w.DepartmentId = s.DepartmentId;
            w.DepartmentName = s.Department.DepartmentName;
            w.Email = s.Email;
            w.PhoneNumber = s.PhoneNumber;
            w.Address = s.Address;
            w.EmailPassword = s.EmailPassword;
            w.DepartmentHeadId = s.Department.DepartmentHead_ID;
            wcfStaffList.Add(w);
        }
        return wcfStaffList;
    }

    public static WCFStaffDelegationModel CheckDelegationStatus(string depId)
    {
        ManageAuthorityDelegationController manageAuthorityDelegationController = new ManageAuthorityDelegationController();
        LogicUniversityDataModel.Delegate delegation = manageAuthorityDelegationController.CheckStatus(depId);
        WCFStaffDelegationModel staffDelegation = new WCFStaffDelegationModel();
        if (delegation != null)
        {
           // if (DateTime.Now.Date <= delegation.StartDate.Value.Date)
          //  {

                staffDelegation.DelegateId = delegation.DelegateId;
                staffDelegation.DepartmentHeadId = delegation.DepartmentHeadId;
                staffDelegation.StaffId = delegation.StaffId;
                staffDelegation.StaffName = delegation.Staff.StaffName;
                staffDelegation.RoleName = delegation.Staff.Role.RoleName;
                staffDelegation.StartDate = ((DateTime)delegation.StartDate).ToString(format);
                staffDelegation.EndDate = ((DateTime)delegation.EndDate).ToString(format);
                if ((Boolean)delegation.Status)
                {
                    staffDelegation.Status = "TRUE";
                }
                else
                {
                    staffDelegation.Status = "FALSE";
                }
         //   }
            //if(DateTime.Now.Date > delegation.EndDate.Value.Date)
            //{
            //    staffDelegation.DelegateId = delegation.DelegateId;
            //    staffDelegation.DepartmentHeadId = delegation.DepartmentHeadId;
            //    staffDelegation.StaffId = delegation.StaffId;
            //    staffDelegation.StaffName = delegation.Staff.StaffName;
            //    staffDelegation.RoleName = delegation.Staff.Role.RoleName;
            //    staffDelegation.StartDate = ((DateTime)delegation.StartDate).ToString(format);
            //    staffDelegation.EndDate = ((DateTime)delegation.EndDate).ToString(format);
            //    if ((Boolean)delegation.Status)
            //    {
            //        staffDelegation.Status = "TRUE";
            //    }
            //    else
            //    {
            //        staffDelegation.Status = "FALSE";
            //    }

            //}
            //(DateTime.Now.Date > delegation.EndDate.Value.Date)
            
        }
        return staffDelegation;
    }

    public static void SaveDelegationInfo(WCFStaffDelegationModel delegation)
    {
        ManageAuthorityDelegationController manageAuthorityDelegationController = new ManageAuthorityDelegationController();
        DelegateEmployee delegateStaff = new DelegateEmployee();
        delegateStaff.DepartmentheadId = delegation.DepartmentHeadId;
        delegateStaff.StaffId = delegation.StaffId;
        delegateStaff.StaffName = delegation.StaffName;
        delegateStaff.StartDate = Convert.ToDateTime(delegation.StartDate);
        delegateStaff.EndDate = Convert.ToDateTime(delegation.EndDate);
        delegateStaff.Status = true;

        String roleName = delegation.RoleName;
        // manageAuthorityDelegationController.SaveDelegateInfo(delegateStaff);
        manageAuthorityDelegationController.SaveDelegateInfoMobile(delegateStaff, delegateStaff.StaffName, roleName);
    }

    public static string TermiateDelegation(string deptId)
    {
        ManageAuthorityDelegationController manageAuthorityDelegationController = new ManageAuthorityDelegationController();
        manageAuthorityDelegationController.TermiateEmployee(deptId);
        return deptId;
    }

    // Disbursement

    public static List<WCFDisbursementDelivery> GetDisbursementList()
    {
        DisbursementController disbursementController = new DisbursementController();
        List<DisbursementDeliveryList> disbursementList = disbursementController.GetDisbursementList();
        List<WCFDisbursementDelivery> wcfDisbursementList = new List<WCFDisbursementDelivery>();
        foreach (DisbursementDeliveryList ds in disbursementList)
        {
            WCFDisbursementDelivery w = new WCFDisbursementDelivery();
            w.DisbursementId = ds.DisbursementId;
            w.DepartmentRequisitionId = ds.DepartmentRequisitionId;
            w.DepartmentName = ds.DepartmentName;
            w.RepresentativeName = ds.RepresentativeName;
            w.CollectionPointName = ds.CollectionPointName;
            w.CollectionPointTime = ds.CollectionPointTime;
            wcfDisbursementList.Add(w);

        }
        return wcfDisbursementList;
    }

    public static List<WCFDisbursementDelivery> GetDisbursementDetailList(string disbursementId)
    {
        DisbursementController disbursementController = new DisbursementController();
        List<DisbursementDeliveryList> disbursementList = disbursementController.GetDisbursementDetailList(disbursementId);
        // Compose a string that consists of three lines.
        int count = disbursementList.Count;
        List<WCFDisbursementDelivery> wcfDisbursementList = new List<WCFDisbursementDelivery>();
        try
        {
            foreach (DisbursementDeliveryList ds in disbursementList)
            {
                WCFDisbursementDelivery w = new WCFDisbursementDelivery();
                w.DepartmentRequisitionId = ds.DepartmentRequisitionId;
                w.DepartmentName = ds.DepartmentName;
                w.RepresentativeName = ds.RepresentativeName;
                w.CollectionPointName = ds.CollectionPointName;
                w.CollectionPointTime = ds.CollectionPointTime;
                //needed
                w.NeededQuantity = (int)ds.NeededQuantity;
                //actual
                w.ActualQuantity = (int)ds.ActualQuantity;
                w.ItemId = ds.ItemId;
                w.ItemName = ds.ItemName;
                w.DisbursementId = disbursementId;
                wcfDisbursementList.Add(w);

            }
        }
        catch (Exception ex)
        {
            count = wcfDisbursementList.Count;
            System.IO.StreamWriter file = new System.IO.StreamWriter("D:\\test.txt");

            file.WriteLine(ex.Message);

            file.Close();
        }

        return wcfDisbursementList;
    }
    public static List<WCFDisbursementDelivery> GetAcknowledgeDisbursementList(string departmentId)
    {
        DisbursementController disbursementController = new DisbursementController();
        List<DisbursementDeliveryList> disbursementList = disbursementController.GetAcknowledgeDisbursementList(departmentId);
        List<WCFDisbursementDelivery> wcfDisbursementList = new List<WCFDisbursementDelivery>();
        foreach (DisbursementDeliveryList ds in disbursementList)
        {
            WCFDisbursementDelivery w = new WCFDisbursementDelivery();
            w.DisbursementId = ds.DisbursementId;
            w.DepartmentRequisitionId = ds.DepartmentRequisitionId;
            w.DepartmentName = ds.DepartmentName;
            w.RepresentativeName = ds.RepresentativeName;
            w.CollectionPointName = ds.CollectionPointName;
            w.CollectionPointTime = ds.CollectionPointTime;
            if (ds.NeededQuantity == null)
            {
                w.NeededQuantity = 0;
            }
            else
            {
                w.NeededQuantity = (int)ds.NeededQuantity;
            }
            if (ds.ActualQuantity == null)
            {
                w.ActualQuantity = 0;
            }
            else
            {
                w.ActualQuantity = (int)ds.ActualQuantity;
            }

            w.ItemId = ds.ItemId;
            w.ItemName = ds.ItemName;
            wcfDisbursementList.Add(w);

        }

        return wcfDisbursementList;
    }

    public static void UpdateAcknowledgeInformation(List<WCFDisbursementDelivery> deliveryList)
    {
        DisbursementController disbursementController = new DisbursementController();
        List<DisbursementDeliveryList> disburList = new List<DisbursementDeliveryList>();
        string remark = null;
        foreach (WCFDisbursementDelivery w in deliveryList)
        {
            DisbursementDeliveryList disbu = new DisbursementDeliveryList();
            disbu.DisbursementId = w.DisbursementId;
            disbu.DepartmentRequisitionId = w.DepartmentRequisitionId;
            disbu.ItemId = w.ItemId;
            disbu.ItemName = w.ItemName;
            disbu.ActualQuantity = w.ActualQuantity;
            disbu.NeededQuantity = w.NeededQuantity;
            remark = w.Remark;
            disburList.Add(disbu);
        }
        disbursementController.UpdateAcknowledgeInformation(disburList, remark);
    }

    // Process Requisition
    public static List<WCFStationeryRetrievalModel> GetTotalItemNeeded()
    {
        ProcessStationaryRequisitionController controller = new ProcessStationaryRequisitionController();
        var retrievalItemList = controller.GetTotalItemNeeded();

        var list = new List<WCFStationeryRetrievalModel>();
        if (retrievalItemList != null)
        {
            foreach (var it in retrievalItemList)
            {
                var item = new WCFStationeryRetrievalModel();
                item.BinId = it.BinId;
                item.ItemName = it.ItemName;
                item.Quantity = it.Quantity;
                list.Add(item);
            }
        }
        return list;
    }

    public static List<WCFStationeryRetrievalModel> GetDepartmentItemNeeded(String itemId)
    {
        ProcessStationaryRequisitionController controller = new ProcessStationaryRequisitionController();
        var departmentItemList = controller.GetDepartmentItemNeeded(itemId);

        var list = new List<WCFStationeryRetrievalModel>();
        if (departmentItemList != null)
        {
            foreach (var it in departmentItemList)
            {
                var item = new WCFStationeryRetrievalModel();
                item.DepartmentId = it.DepartmentId;
                item.ItemId = it.ItemId;
                item.ActualQuantity = it.ActualQuantity;
                item.NeededQuantity = it.NeededQuantity;
                item.DepartmentRequisitionId = it.DepartmentRequisitionId;
                list.Add(item);
            }
        }
        return list;
    }

    public static void UpdateStationeryRetrievalList(List<WCFStationeryRetrievalModel> stationeryRetrievalModelList)
    {
        ProcessStationaryRequisitionController processStationaryRequisitionController = new ProcessStationaryRequisitionController();

        List<StationeryRetrievalUpdateList> stationeryRetrievalUpdateList = new List<StationeryRetrievalUpdateList>();
        foreach (WCFStationeryRetrievalModel w in stationeryRetrievalModelList)
        {
            StationeryRetrievalUpdateList r = new StationeryRetrievalUpdateList();
            r.ItemName = w.ItemName;
            r.ActualQuanity = w.ActualQuantity;
            r.DepartmentId = w.DepartmentId;
            r.DepartmentRequisitionId = w.DepartmentRequisitionId;
            stationeryRetrievalUpdateList.Add(r);
        }
        processStationaryRequisitionController.SaveRetrievalList(stationeryRetrievalUpdateList);
    }
}
