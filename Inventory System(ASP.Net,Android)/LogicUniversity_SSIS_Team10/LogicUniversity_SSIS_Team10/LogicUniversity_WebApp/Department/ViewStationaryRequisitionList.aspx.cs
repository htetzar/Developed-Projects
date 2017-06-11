using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicUniversityController;
using LogicUniversityDataModel;
using System.Data;
using System.Drawing;
using LogicUniversityController.Controller;

namespace LogicUniversity_WebApp.Department
{
    //Author Krithiga Gunasekaran,Zaw Myo Htet,Ei Ei Maw
    //Team 10

    public partial class ViewStationaryRequisitionList : System.Web.UI.Page
    {
        ViewStationaryRequisitionController viewStationeryRequisitionController = new ViewStationaryRequisitionController();
        ManageAuthorityDelegationController delegateController = new ManageAuthorityDelegationController();
        public List<StaffRequisition> requisitionList = new List<StaffRequisition>();
        Staff user;
        LogicUniversityDataModel.Delegate deleInfoStatus;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            deleInfoStatus = delegateController.CheckStatusByStaffId(user.StaffId);
            BindGridView();
        }
        private void BindGridView()
        {
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;   
           
         
             if (user.RoleId == 1)
             {               
              
                requisitionList = viewStationeryRequisitionController.GetRequisitionListByAllStaff(user.DepartmentId);
                List<StationaryRequisition> stationaryRequisitionList = new List<StationaryRequisition>();

                foreach (StaffRequisition r in requisitionList)
                {
                    StationaryRequisition sr = new StationaryRequisition();
                    sr.RequisitionId = r.StaffRequisitionId;
                    sr.CreatedDate = (DateTime)r.CreateDate;
                    sr.Status = r.Status;
                    int count = 0;
                    foreach (RequisitionDetail rd in r.RequisitionDetails)
                    {
                        if (count < 3)
                        {
                            sr.ItemName += rd.Item.ItemName + "<br>";
                            count++;
                        }
                    }
                    stationaryRequisitionList.Add(sr);
                }
                gv_List.DataSource = stationaryRequisitionList;
                gv_List.DataBind();
            }
            else 
            {
                if(deleInfoStatus != null)
                {
                    requisitionList = viewStationeryRequisitionController.GetRequisitionListByAllStaff(user.DepartmentId);
                    List<StationaryRequisition> stationaryRequisitionList = new List<StationaryRequisition>();

                    foreach (StaffRequisition r in requisitionList)
                    {
                        StationaryRequisition sr = new StationaryRequisition();
                        sr.RequisitionId = r.StaffRequisitionId;
                        sr.CreatedDate = (DateTime)r.CreateDate;
                        sr.Status = r.Status;
                        int count = 0;
                        foreach (RequisitionDetail rd in r.RequisitionDetails)
                        {
                            if (count < 3)
                            {
                                sr.ItemName += rd.Item.ItemName + "<br>";
                                count++;
                            }
                        }
                        stationaryRequisitionList.Add(sr);
                    }
                    gv_List.DataSource = stationaryRequisitionList;
                    gv_List.DataBind();
                  }else
                       {
                         requisitionList = viewStationeryRequisitionController.GetRequisitionList(user.StaffId);
                        List<StationaryRequisition> stationaryRequisitionList = new List<StationaryRequisition>();

                        foreach (StaffRequisition r in requisitionList)
                        {
                            StationaryRequisition sr = new StationaryRequisition();
                            sr.RequisitionId = r.StaffRequisitionId;
                            sr.CreatedDate = (DateTime)r.CreateDate;
                            sr.Status = r.Status;
                            int count = 0;
                            foreach (RequisitionDetail rd in r.RequisitionDetails)
                            {
                                if (count < 3)
                                {
                                    sr.ItemName += rd.Item.ItemName + "<br/>";
                                    count++;
                                }
                            }
                            stationaryRequisitionList.Add(sr);
                        }
                        gv_List.DataSource = stationaryRequisitionList;
                        gv_List.DataBind();

                }
           
            }
        }
        protected void gv_List_RowEditing(object sender, GridViewEditEventArgs e)
        {
            int index = e.NewEditIndex;
            string requisitionId = ((Label)gv_List.Rows[index].FindControl("lblRequisitionsID")).Text;
            string Date = ((Label)gv_List.Rows[index].FindControl("lblDateID")).Text;
            string Status = ((Label)gv_List.Rows[index].FindControl("lblStatusID")).Text;
            if (user.RoleId == 1 || deleInfoStatus != null)
            {
                Response.Redirect("~/Department/ApproveStaffRequistion.aspx?requisitionId=" + requisitionId + "&Date=" + Date + "&Status=" + Status);
            }
            else
            {
                Response.Redirect("~/Department/ViewStationaryRequisitionDetail.aspx?requisitionId=" + requisitionId + "&Date=" + Date + "&Status=" + Status);
            }

        }

        protected void gv_List_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            viewStationeryRequisitionController.RemoveRequisitionDetail(requisitionList[e.RowIndex]);
            BindGridView();
        }

        protected void gv_List_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gv_List.EditIndex)
            {
                LinkButton LnkBtnDelete = (LinkButton)e.Row.FindControl("LnkBtnDelete");
                LnkBtnDelete.Attributes.Add("onclick", string.Format("return confirm('Are you sure you want to delete this?');"));

                string hex = "#5cb85c";
                Color colorInfo = ColorTranslator.FromHtml(hex);
                e.Row.Cells[3].ForeColor = colorInfo;
                e.Row.Cells[3].Font.Bold = true;
            }
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (user.RoleId == 1)
                {
                    LinkButton LnkBtnDelete = (LinkButton)e.Row.FindControl("LnkBtnDelete");
                    LnkBtnDelete.Visible = false;
                }
                if(user.RoleId != 1 && deleInfoStatus != null)
                {
                    LinkButton LnkBtnDelete = (LinkButton)e.Row.FindControl("LnkBtnDelete");
                    LnkBtnDelete.Visible = false;
                }
            }
        }

        protected void gv_List_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv_List.PageIndex = e.NewPageIndex;
            gv_List.DataBind();
        }
    }
}