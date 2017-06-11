using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public partial class AdjustStationaryStockList : System.Web.UI.Page
    {
        AdjustStationaryStockController controller = new AdjustStationaryStockController();
        public static List<Adjustment> list = new List<Adjustment>();
        protected void Page_Load(object sender, EventArgs e)
        {
            var user = (Staff)Session["User"];
            if (user != null)
            {
                var userName = user.StaffName;
                var userRole = user.Role.RoleName;
                if (userRole == "StoreClerk")
                {
                    btnAdjustmentNew.Visible = true;
                }
                else
                {
                    btnAdjustmentNew.Visible = false;
                }
                BindGridView();
            }
        }
        private void BindGridView()
        {
            var user = (Staff)Session["User"];
            list = controller.GetAdjustmentList(user.Role.RoleName);
            var displayList = new List<Adjustment>();
            displayList.AddRange(list.Where(l => l.Status == "Pending").ToList());
            displayList.AddRange(list.Where(l => l.Status == "Approved").ToList());
            displayList.AddRange(list.Where(l => l.Status == "Rejected").ToList());
            gvwList.DataSource = displayList;
            gvwList.DataBind();
        }
        protected void gvwList_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (gvwList.EditIndex != -1)
            {              
                e.Cancel = true;
                // Display an error message.
                int newPageNumber = e.NewPageIndex + 1;
            }
            else
            {
                this.BindGridView();
                gvwList.PageIndex = e.NewPageIndex;
                gvwList.DataBind();
            }
        }

        protected void gvwList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvwList, "Select$" + e.Row.RowIndex);
            }
        }

        protected void gvwList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = gvwList.SelectedRow;
            var id = gvwList.DataKeys[gr.RowIndex].Value.ToString();
            Response.Redirect("AdjustStationaryStockDetail.aspx?VoucherId=" + id);
        }

        protected void gvwList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowIndex < 0)
                return;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {                
                if (e.Row.Cells[2].Text.ToLower() == "pending")
                {
                    string hex = "#5cb85c";
                    Color colorSuccess = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[2].ForeColor = colorSuccess;
                    e.Row.Cells[2].Font.Bold = true;
                }
                else if (e.Row.Cells[2].Text.ToLower() == "approved")
                {
                    string hex = "#428bca";
                    Color colorPrimary = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[2].ForeColor = colorPrimary;
                    e.Row.Cells[2].Font.Bold = true;
                }
                else if (e.Row.Cells[2].Text.ToLower() == "rejected")
                {
                    string hex = "#d9534f";
                    Color colorDanger = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[2].ForeColor = colorDanger;
                    e.Row.Cells[2].Font.Bold = true;
                }
                else
                {
                    string hex = "#5bc0de";
                    Color colorInfo = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[2].ForeColor = colorInfo;
                    e.Row.Cells[2].Font.Bold = true;
                }
            }
        }

        protected void btnAdjustmentNew_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdjustStationaryStockNew.aspx");
        }
    }
}