using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.Department
{
    //Author Htet Zar CHi Aung.
    //Team 10.
    public partial class AcknowledgeDisbursementList : System.Web.UI.Page
    {
        private static List<DisbursementDeliveryList> disbursementList = new List<DisbursementDeliveryList>();
        DisbursementController controller = new DisbursementController();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }
        private void BindGridView()
        {
            var user = (Staff)Session["User"];
            var departmentId = user.DepartmentId;
            disbursementList = controller.GetAcknowledgeDisbursementList(departmentId);
            gvAcknowledgeDisbursementList.DataSource = disbursementList;
            gvAcknowledgeDisbursementList.DataBind();
        }

        protected void gvAcknowledgeDisbursementList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = gvAcknowledgeDisbursementList.SelectedRow;
            var id = gvAcknowledgeDisbursementList.DataKeys[gr.RowIndex].Value.ToString();
            Response.Redirect("MaintainDisbursementDetail.aspx?DisbursementId=" + id);
        }

        protected void gvAcknowledgeDisbursementList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvAcknowledgeDisbursementList, "Select$" + e.Row.RowIndex);

                
            }
        }

        protected void gvAcknowledgeDisbursementList_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                if (e.Row.Cells[3].Text.ToLower() == "pending")
                {
                    string hex = "#5cb85c";
                    Color colorSuccess = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[3].ForeColor = colorSuccess;
                    e.Row.Cells[3].Font.Bold = true;
                }
                else if (e.Row.Cells[3].Text.ToLower() == "approved")
                {
                    string hex = "#428bca";
                    Color colorPrimary = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[3].ForeColor = colorPrimary;
                    e.Row.Cells[3].Font.Bold = true;
                }
                else if (e.Row.Cells[3].Text.ToLower() == "rejected")
                {
                    string hex = "#d9534f";
                    Color colorDanger = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[3].ForeColor = colorDanger;
                    e.Row.Cells[3].Font.Bold = true;
                }
                else
                {
                    string hex = "#5bc0de";
                    Color colorInfo = ColorTranslator.FromHtml(hex);
                    e.Row.Cells[3].ForeColor = colorInfo;
                    e.Row.Cells[3].Font.Bold = true;
                }
            }
            
        }
    }
}