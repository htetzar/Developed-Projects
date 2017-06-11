using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp
{
    public partial class LogicUniversity : System.Web.UI.MasterPage
    {
        // Department Menu
        MenuItem menuAcknowledgeDisbursementList;
        MenuItem menuMaintainDepartmentInfo, menuManageAuthorityDelegation;
        MenuItem menuViewStationaryRequisitionList, menuViewStationaryRequisitionNew;

        // Statinary Store Menu
        MenuItem menuViewDisbursementList;
        MenuItem menuProcessStationaryRequisition;
        MenuItem menuAdjustStationaryStockList, menuAdustStationaryStockNew;
        MenuItem menuPreparePurchaseOrderList, menuPreparePruchaseOrderNew;
        MenuItem menuReceiveDelivery;
        MenuItem menuMaintainCatalogue;
        MenuItem menuGenerateReorderReportBySupplier, menuGenerateReorderReportByCategory, menuGenerateRequisitionTrendReport, menuInventoryStatusReport;
        ManageAuthorityDelegationController authorityDelegationController = new ManageAuthorityDelegationController();
        bool delegateStatus;
        Staff user;
        int flag;

        protected void lBtnLogOut_Click1(object sender, EventArgs e)
        {
            if (Request.Cookies[FormsAuthentication.FormsCookieName] != null)
            {
                HttpCookie myCookie = new HttpCookie(FormsAuthentication.FormsCookieName);
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
            FormsAuthentication.SignOut();
            Session.Abandon();
            Session.Clear();
            Response.Redirect("~/Login.aspx");//<---
        }

        string userName;
        string userRole;

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            if(user != null)
            {
                userName = user.StaffName;
                userRole = user.Role.RoleName;
                CheckDelegatePerson();
                LogicUniversityDataModel.Delegate delegateStaff = authorityDelegationController.CheckStatusByStaffId(user.StaffId);
                delegateStatus = CheckDelegate(delegateStaff);
                if (!IsPostBack)
                {
                    if (HttpContext.Current.User.Identity.IsAuthenticated)
                    {
                        lblUserName.Text = userName;
                        lblUserRole.Text = userRole;
                        LoadMenu();
                    }
                    else
                    {
                        lblUserName.Text = "No User Name";
                    }
                }
            }       
            else
            {
                Response.Redirect("~/Login.aspx");
            }
        }
        private bool CheckDelegate(LogicUniversityDataModel.Delegate delegateInfo)
        {
            if (delegateInfo != null)
            {
                if (delegateInfo.Status == true && delegateInfo.EndDate.Value.Date >= (DateTime.Now.Date))
                {
                    return true;
                }               
                else
                    return false;
            }
            else
                return false;
        }
        public void CheckDelegatePerson()
        {
          
            LogicUniversityDataModel.Delegate checkAuthority=authorityDelegationController.CheckStatus(user.DepartmentId);
            if(checkAuthority != null)
            {
                if(checkAuthority.EndDate.Value.Date < (DateTime.Now.Date))
                {
                    authorityDelegationController.TermiateEmployee(user.DepartmentId);
                   
                    
                }

            }
            
          

        }
        private void LoadMenu()
        {
            // Department Menu Initialization
            menuAcknowledgeDisbursementList = new MenuItem();
            menuAcknowledgeDisbursementList.NavigateUrl = "~/Department/AcknowledgeDisbursementList.aspx";
            menuAcknowledgeDisbursementList.Text ="<i class='glyphicon glyphicon-list'></i>"+"&nbsp;Acknowledge Disbursement";

            menuMaintainDepartmentInfo = new MenuItem();
            menuMaintainDepartmentInfo.NavigateUrl = "~/Department/MaintainDepartmentInfo.aspx";
            menuMaintainDepartmentInfo.Text = "<i class='fa fa-cogs'></i>" + "&nbsp;Maintain Department Info"; 

            menuManageAuthorityDelegation = new MenuItem();
            menuManageAuthorityDelegation.NavigateUrl = "~/Department/ManageAuthorityDelegation.aspx";
            menuManageAuthorityDelegation.Text = "<i class='fa fa-address-card-o'></i>" + "&nbsp;Delegate Authority"; 

            menuViewStationaryRequisitionList = new MenuItem();
            menuViewStationaryRequisitionList.NavigateUrl = "~/Department/ViewStationaryRequisitionList.aspx";
            menuViewStationaryRequisitionList.Text = "<i class='glyphicon glyphicon-list-alt'></i>" + "&nbsp;View Stationary Requisition";

            menuViewStationaryRequisitionNew = new MenuItem();
            menuViewStationaryRequisitionNew.NavigateUrl = "~/Department/ViewStationaryRequisitionNew.aspx"; 
            menuViewStationaryRequisitionNew.Text = "<i class='fa fa-book'></i>" + "&nbsp;New Stationary Requisition";


            // Stationary Store Menu Initialization
            menuViewDisbursementList = new MenuItem();
            menuViewDisbursementList.NavigateUrl = "~/StationaryStore/DisbursementList.aspx";
            menuViewDisbursementList.Text = "<i class='glyphicon glyphicon-indent-left'></i>" + "&nbsp;Disbursement List";

            menuProcessStationaryRequisition = new MenuItem();
            menuProcessStationaryRequisition.NavigateUrl = "~/StationaryStore/ProcessStationaryRequisition.aspx";
            menuProcessStationaryRequisition.Text = "<i class='glyphicon glyphicon-indent-left'></i>" + "&nbsp;Process Stationary Requisition";

            menuAdjustStationaryStockList = new MenuItem();
            menuAdjustStationaryStockList.NavigateUrl = "~/StationaryStore/AdjustStationaryStockList.aspx";
            menuAdjustStationaryStockList.Text = "<i class='glyphicon glyphicon-list-alt'></i>" + "&nbsp;View Adjustment";

            menuAdustStationaryStockNew = new MenuItem();
            menuAdustStationaryStockNew.NavigateUrl = "~/StationaryStore/AdjustStationaryStockNew.aspx";
            menuAdustStationaryStockNew.Text = "<i class='fa fa-plus-square-o'></i>" + "&nbsp;New Adjustment";

            menuPreparePurchaseOrderList = new MenuItem();
            menuPreparePurchaseOrderList.NavigateUrl = "~/StationaryStore/PreparePurchaseOrderList.aspx";
            menuPreparePurchaseOrderList.Text = "<i class='glyphicon glyphicon-th-list'></i>" + "&nbsp;View Purchase Order";

            menuPreparePruchaseOrderNew = new MenuItem();
            menuPreparePruchaseOrderNew.NavigateUrl = "~/StationaryStore/PreparePurchaseOrderNew.aspx";
            menuPreparePruchaseOrderNew.Text = "<i class='glyphicon glyphicon-shopping-cart'></i>" + "&nbsp;New Purchase Order";

            menuReceiveDelivery = new MenuItem();
            menuReceiveDelivery.NavigateUrl = "~/StationaryStore/ReceiveDelivery.aspx";
            menuReceiveDelivery.Text = "<i class='fa fa-truck'></i>" + "&nbsp;Receive Delivery";

            menuMaintainCatalogue = new MenuItem();
            menuMaintainCatalogue.NavigateUrl = "~/StationaryStore/MaintainCatalogue.aspx";
            menuMaintainCatalogue.Text = "<i class='glyphicon glyphicon-list'></i>"+"&nbsp;View Items Catalogue";

            menuInventoryStatusReport = new MenuItem();
            menuInventoryStatusReport.NavigateUrl = "~/StationaryStore/InventoryReport.aspx";
            menuInventoryStatusReport.Text = "<i class='fa fa-bar-chart'></i>" + "&nbsp;Generate Inventory Status Report";

            menuGenerateReorderReportBySupplier = new MenuItem();
            menuGenerateReorderReportBySupplier.NavigateUrl = "~/StationaryStore/GenerateReorderReportBySupplier.aspx";
            menuGenerateReorderReportBySupplier.Text = "<i class='fa fa-bar-chart'></i>" + "&nbsp;Generate Reorder Report By Supplier";

            menuGenerateReorderReportByCategory = new MenuItem();
            menuGenerateReorderReportByCategory.NavigateUrl = "~/StationaryStore/GenerateReorderReportByCategories.aspx";
            menuGenerateReorderReportByCategory.Text = "<i class='fa fa-area-chart'></i>" + "&nbsp;Generate Reorder Report By Category"; 

            menuGenerateRequisitionTrendReport = new MenuItem();
            menuGenerateRequisitionTrendReport.NavigateUrl = "~/StationaryStore/GenerateRequisitionTrendReport.aspx";
            menuGenerateRequisitionTrendReport.Text = "<i class='fa fa-line-chart'></i>" + "&nbsp;Generate Requisition Trend Report";

            if ("DepartmentHead".Equals(userRole))
            {
                Menu1.Items.Clear();
                menuViewStationaryRequisitionList.Text = "<i class='fa fa-handshake-o'></i>" + "&nbsp;Approve Stationery Requisition"; 
                Menu1.Items.Add(menuViewStationaryRequisitionList);
                Menu1.Items.Add(menuMaintainDepartmentInfo);
                Menu1.Items.Add(menuManageAuthorityDelegation);
            }
            else if ("DepartmentRep".Equals(userRole))
            {
                Menu1.Items.Clear();
                if (delegateStatus == true)
                {
                    menuViewStationaryRequisitionList.Text = "<i class='fa fa-handshake-o'></i>" + "&nbsp;Approve Stationery Requisition";
                }
                Menu1.Items.Add(menuViewStationaryRequisitionList);
                Menu1.Items.Add(menuViewStationaryRequisitionNew);
                Menu1.Items.Add(menuMaintainDepartmentInfo);
                Menu1.Items.Add(menuAcknowledgeDisbursementList);
            }
            else if ("Staff".Equals(userRole))
            {
                if (delegateStatus == true)
                {
                    menuViewStationaryRequisitionList.Text = "<i class='fa fa-handshake-o'></i>" + "&nbsp;Approve Stationary Requisition";
                }
                Menu1.Items.Clear();
                Menu1.Items.Add(menuViewStationaryRequisitionList);
                Menu1.Items.Add(menuViewStationaryRequisitionNew);
            }
            else if ("StoreClerk".Equals(userRole))
            {
                Menu1.Items.Clear();
                //if (delegateStatus == true)
                //{
                //    menuViewStationaryRequisitionList.Text = "<i class='fa fa-handshake-o'></i>" + "&nbsp;Approve Stationary Requisition";
                //}
                Menu1.Items.Add(menuViewDisbursementList);
                Menu1.Items.Add(menuProcessStationaryRequisition);
                Menu1.Items.Add(menuAdjustStationaryStockList);
                //Menu1.Items.Add(menuAdustStationaryStockNew);
                Menu1.Items.Add(menuPreparePurchaseOrderList);
                Menu1.Items.Add(menuPreparePruchaseOrderNew);
                Menu1.Items.Add(menuReceiveDelivery);
                Menu1.Items.Add(menuMaintainCatalogue);
                Menu1.Items.Add(menuInventoryStatusReport);
                Menu1.Items.Add(menuGenerateReorderReportBySupplier);
                Menu1.Items.Add(menuGenerateReorderReportByCategory);
                Menu1.Items.Add(menuGenerateRequisitionTrendReport);
            }
            else if ("Supervisor".Equals(userRole) || "Manager".Equals(userRole))
            {
                Menu1.Items.Clear();
                //if (delegateStatus == true)
                //{
                //    menuViewStationaryRequisitionList.Text = "<i class='fa fa-handshake-o'></i>" + "&nbsp;Approve Stationary Requisition";
                //}
                menuAdjustStationaryStockList.Text = "<i class='glyphicon glyphicon-check'></i>" + "&nbsp;Approve Adjustment";    
                menuPreparePurchaseOrderList.Text = "<i class='fa fa-cart-arrow-down'></i>" + "&nbsp;Approve Purchase Order"; 
                Menu1.Items.Add(menuAdjustStationaryStockList);
                Menu1.Items.Add(menuPreparePurchaseOrderList);
                Menu1.Items.Add(menuInventoryStatusReport);
                Menu1.Items.Add(menuGenerateReorderReportBySupplier);
                Menu1.Items.Add(menuGenerateReorderReportByCategory);
                Menu1.Items.Add(menuGenerateRequisitionTrendReport);
            }
        }
    }
}
