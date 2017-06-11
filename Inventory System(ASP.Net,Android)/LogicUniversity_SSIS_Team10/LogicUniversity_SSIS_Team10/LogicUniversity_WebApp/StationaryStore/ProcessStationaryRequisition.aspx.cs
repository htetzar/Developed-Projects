using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public partial class ProcessStationaryRequisition : System.Web.UI.Page
    {
        ProcessStationaryRequisitionController controller = new ProcessStationaryRequisitionController();
        public static List<StationaryRetrievalList> retrievalList = new List<StationaryRetrievalList>();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {
                retrievalList = controller.GetStationeryRetrievalList();
                BindGrid();
                int countGrid = gvRetrievalItem.Rows.Count;
                if (countGrid == 0)
                {
                    btnSubmit.Visible = false;
                }
                else { btnSubmit.Visible = true; }
            }
        }

        private void BindGrid()
        {
            foreach (var item in retrievalList.Select(lst => lst.ItemId).Distinct().ToList())
            {
                var totalRetrieved = retrievalList.Where(l => l.ItemId == item).Select(l => l.DepartmentActual).Sum();
                var totalNeeded = retrievalList.Where(l => l.ItemId == item).Select(l => l.DepartmentNeeded).Sum();

                retrievalList.Where(l => l.ItemId == item).ToList()
                                                                .ForEach(l =>
                                                                {
                                                                    l.TotalRetrieved = totalRetrieved;
                                                                    l.TotalNeeded = totalNeeded;
                                                                });
            }
            gvRetrievalItem.DataSource = retrievalList;

            gvRetrievalItem.DataBind();
            if (retrievalList.Count > 0)
            {
                GroupGridView(gvRetrievalItem.Rows, 0, 7);
            }
            var rc = gvRetrievalItem.Rows.Count;
            var cc = gvRetrievalItem.Columns.Count;

        }

        void GroupGridView(GridViewRowCollection gvrc, int startIndex, int total)
        {
            if (total == 0) return;
            int i, count = 1;
            ArrayList lst = new ArrayList();
            lst.Add(gvrc[0]);
            var ctrl = gvrc[0].Cells[startIndex];
            for (i = 1; i < gvrc.Count; i++)
            {
                TableCell nextCell = gvrc[i].Cells[startIndex];
                if (ctrl.Text == nextCell.Text)
                {
                    count++;
                    nextCell.Visible = false;
                    lst.Add(gvrc[i]);
                }
                else
                {
                    if (count > 1)
                    {
                        ctrl.RowSpan = count;
                        GroupGridView(new GridViewRowCollection(lst), startIndex + 1, total - 1);
                    }
                    count = 1;
                    lst.Clear();
                    ctrl = gvrc[i].Cells[startIndex];
                    lst.Add(gvrc[i]);
                }
            }
            if (count > 1)
            {
                ctrl.RowSpan = count;
                GroupGridView(new GridViewRowCollection(lst), startIndex + 1, total - 1);
            }
            count = 1;
            lst.Clear();
        }

        protected void gvRetrievalItem_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvRetrievalItem.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvRetrievalItem_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = gvRetrievalItem.Rows[e.RowIndex];
            String departmentRequisitionId = gvRetrievalItem.DataKeys[row.RowIndex].Value.ToString();
            String itemId = row.Cells[0].Text;
            var deleteItem = retrievalList.Where(r => r.DepartmentRequisitionId == departmentRequisitionId &&
                                                      r.ItemId == itemId).FirstOrDefault();
            retrievalList.Remove(deleteItem);
            BindGrid();
        }

        protected void gvRetrievalItem_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvRetrievalItem.Rows[e.RowIndex];
            TextBox txtDeptActual = (TextBox)row.FindControl("txtDeptActual");
            int deptActual = Int32.Parse(txtDeptActual.Text);
            String itemId = row.Cells[0].Text;
            String departmentRequisitionId = gvRetrievalItem.DataKeys[row.RowIndex].Value.ToString();
            UpdateRetrievalList(itemId, departmentRequisitionId, deptActual);
        }

        private void UpdateRetrievalList(String itemID, String departmentRequisitionId, int deptActual)
        {
            try
            {
                var lst = retrievalList.Where(l => l.ItemId == itemID && l.DepartmentRequisitionId == departmentRequisitionId).FirstOrDefault();
                lst.DepartmentActual = deptActual;
                var sum = retrievalList.Where(l => l.ItemId == itemID).Sum(l => l.DepartmentActual);
                var stockCardBal = controller.GetStockCardBalance(itemID);
                if (sum > stockCardBal)
                {
                    lblMsg.Text = "The current Stock Card balance of " + itemID + " is " + stockCardBal + ".\n" +
                                    "Your input is greater than current Stock Card balance." + "\n";
                }
                else
                {
                    var deptList = retrievalList.Where(l => l.ItemId == itemID).Select(l => l.DepartmentId);
                    foreach (var d in deptList)
                    {
                        retrievalList.Where(l => l.ItemId == itemID && l.DepartmentId == d)
                            .Select(c => { c.TotalRetrieved = sum; return c; }).ToList();

                    }
                    gvRetrievalItem.EditIndex = -1;
                    BindGrid();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void gvRetrievalItem_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvRetrievalItem.EditIndex = -1;
            gvRetrievalItem.DataSource = retrievalList;
            gvRetrievalItem.DataBind();
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            String oldItemId = "";
            var deptList = retrievalList.Select(r => r.DepartmentId).Distinct();
            Disbursement disbursement = null;
            List<LogicUniversityDataModel.DisbursementDetail> disbursementDetailList = null;
            foreach (var dept in deptList)
            {

                disbursement = new Disbursement();
                disbursement.DepartmentId = dept;
                disbursement.DepReqId = retrievalList.Where(r => r.DepartmentId == dept)
                                                                    .OrderByDescending(r => r.CreateDate)
                                                                    .Select(r => r.DepartmentRequisitionId).FirstOrDefault();
                disbursement.Status = StatusType.Pending.ToString();
                disbursement.CreateDate = DateTime.Now;
                var itList = new List<String>();
                var dpList = new List<String>();
                disbursementDetailList = new List<LogicUniversityDataModel.DisbursementDetail>();
                foreach (var it in retrievalList.Where(l => l.DepartmentId == dept))
                {
                    var itemIndex = itList.FindIndex(t => t == it.ItemId);
                    var deptIndex = dpList.FindIndex(d => d == dept);
                    if (itemIndex != -1 && deptIndex != -1 && itemIndex == deptIndex)
                    {
                        break;
                    }
                    itList.Add(it.ItemId);
                    dpList.Add(dept);
                    var disbursementDetail = new LogicUniversityDataModel.DisbursementDetail();

                    disbursementDetail.ItemId = it.ItemId;
                    //Actual
                    if (retrievalList.Where(l => l.ItemId == it.ItemId && l.DepartmentId == dept).Count() > 0)
                    {
                        disbursementDetail.Quantity = (int)retrievalList
                                                      .Where(l => l.ItemId == it.ItemId && l.DepartmentId == dept)
                                                      .Select(l => l.DepartmentActual).Sum();
                    }
                    else
                    {
                        disbursementDetail.Quantity = (int)retrievalList
                                                      .Where(l => l.ItemId == it.ItemId && l.DepartmentId == dept)
                                                      .FirstOrDefault().DepartmentActual;
                    }

                    disbursementDetail.Disbursement = disbursement;
                    disbursementDetailList.Add(disbursementDetail);
                }
                controller.InsertDisbursement(disbursement, disbursementDetailList);
            }

            foreach (var lst in retrievalList)
            {
                String status = "";
                if (lst.DepartmentNeeded > lst.DepartmentActual)
                {
                    status = StatusType.PartiallyCompleted.ToString();
                }
                else
                {
                    status = StatusType.Completed.ToString();
                }
                controller.UpdateDepartmentRequisition(lst.DepartmentRequisitionId, lst.ItemId, lst.Status, status, lst.DepartmentActual);
            }
            foreach (GridViewRow row in gvRetrievalItem.Rows)
            {
                StockCard sc = new StockCard();
                sc.ItemId = row.Cells[0].Text;
                if (oldItemId == String.Empty || oldItemId != sc.ItemId)
                {
                    oldItemId = sc.ItemId;
                }
                sc.Update_Date = DateTime.Now;
                sc.Description = row.Cells[6].Text;
                var bal = controller.GetStockCardBalance(sc.ItemId);
                var deptReqId = gvRetrievalItem.DataKeys[row.RowIndex].Value.ToString();
                sc.Quantity = ((int)retrievalList.Where(l => l.ItemId == sc.ItemId &&
                                                             l.DepartmentRequisitionId == deptReqId &&
                                                            l.DepartmentName == sc.Description).FirstOrDefault().DepartmentActual) * -1;
                sc.Balance = bal + sc.Quantity;

                controller.UpdateStockCard(sc);
            }
            retrievalList = controller.GetStationeryRetrievalList();
            BindGrid();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Submit successfully!');", true);
            btnSubmit.Visible = false;
        }

        public class RetrievalItem
        {
            private String departmentName;
            private String itemId;
            private int? quantity;

            public RetrievalItem(String departmentName, String itemId, int? quantity)
            {
                this.departmentName = departmentName;
                this.itemId = itemId;
                this.quantity = quantity;
            }
            public String DepartmentId
            {
                get { return departmentName; }
                set { departmentName = value; }
            }

            public String ItemId
            {
                get { return itemId; }
                set { itemId = value; }
            }
            public int? Quantity
            {
                get { return quantity; }
                set { quantity = value; }
            }
        }

        protected void gvRetrievalItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gvRetrievalItem.EditIndex)
            {
                lblMsg.Text = "";
                LinkButton btnDelete = (LinkButton)e.Row.FindControl("btnDelete");
                btnDelete.Attributes.Add("onclick", string.Format("return confirm('Are you sure you want to delete this?');"));

                if (e.Row.Cells[5].Text.ToLower() == "pending")
                {
                    string hex = "#5cb85c";
                    Color colorSuccess = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[5].ForeColor = colorSuccess;
                    e.Row.Cells[5].Font.Bold = true;
                }
                else if (e.Row.Cells[5].Text.ToLower() == "approved")
                {
                    string hex = "#428bca";
                    Color colorPrimary = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[5].ForeColor = colorPrimary;
                    e.Row.Cells[5].Font.Bold = true;
                }
                else if (e.Row.Cells[5].Text.ToLower() == "rejected")
                {
                    string hex = "#d9534f";
                    Color colorDanger = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[5].ForeColor = colorDanger;
                    e.Row.Cells[5].Font.Bold = true;
                }
                else
                {
                    string hex = "#5bc0de";
                    Color colorInfo = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[5].ForeColor = colorInfo;
                    e.Row.Cells[5].Font.Bold = true;
                }
            }
        }
    }
}