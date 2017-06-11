using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public partial class DisbursementList : System.Web.UI.Page
    {
        private static List<DisbursementDeliveryList> disbursementList = new List<DisbursementDeliveryList>();
        DisbursementController controller = new DisbursementController();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGridView();
        }
        private void BindGridView()
        {
            disbursementList = controller.GetDisbursementList();
            gvDisbursementList.DataSource = disbursementList;
            gvDisbursementList.DataBind();
        }
        protected void gvDisbursementList_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gr = gvDisbursementList.SelectedRow;
            var id = gvDisbursementList.DataKeys[gr.RowIndex].Value.ToString();
            Response.Redirect("DisbursementDetail.aspx?disbursementId=" + id);
        }

        protected void gvDisbursementList_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                e.Row.Attributes["onmouseover"] = "this.style.cursor='pointer';this.style.textDecoration='underline';";
                e.Row.Attributes["onmouseout"] = "this.style.textDecoration='none';";
                e.Row.ToolTip = "Click to select row";
                e.Row.Attributes["onclick"] = this.Page.ClientScript.GetPostBackClientHyperlink(this.gvDisbursementList, "Select$" + e.Row.RowIndex);
            }
        }
    }
}