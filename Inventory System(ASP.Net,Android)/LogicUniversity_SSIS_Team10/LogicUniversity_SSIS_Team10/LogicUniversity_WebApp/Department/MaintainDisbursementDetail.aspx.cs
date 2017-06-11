using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.Department
{
    //Author Het Zar Chi Aung
    //Team 10.
    public partial class MaintainDisbursementDetail : System.Web.UI.Page
    {
        DisbursementController controller = new DisbursementController();
        public static List<DisbursementDeliveryList> disbursementDetailList = new List<DisbursementDeliveryList>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var disbursementId = Request.QueryString["DisbursementId"];
                disbursementDetailList = controller.GetDisbursementDetailList(disbursementId);
                BindGridView();
                btnAcknowledge.Visible = true;
            }
        }

        private void BindGridView()
        {
            gvDisbursementDetail.DataSource = disbursementDetailList;
            gvDisbursementDetail.DataBind();

        }

        protected void btnAcknowledge_Click(object sender, EventArgs e)
        {
            List<DisbursementDeliveryList> list2 = new List<DisbursementDeliveryList>();
            list2 = disbursementDetailList;
            controller.UpdateAcknowledgeInformation(list2.ToList(), txtRemark.Text);
            btnAcknowledge.Enabled = false;
            btnAcknowledge.Text = "Acknowledged";
        }

        protected void gvDisbursementDetail_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            e.Cancel = true;
            gvDisbursementDetail.EditIndex = -1;
            BindGridView();
        }
        protected void gvDisbursementDetail_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvDisbursementDetail.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gvDisbursementDetail_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gvDisbursementDetail.Rows[e.RowIndex];
            TextBox txtActaulQuantity = (TextBox)row.FindControl("txtActualQuantity");
            int actualQuantity = Int32.Parse(txtActaulQuantity.Text);
            String disbursementId = gvDisbursementDetail.DataKeys[e.RowIndex].Values[0].ToString();
            String itemId = gvDisbursementDetail.DataKeys[e.RowIndex].Values[1].ToString();

            disbursementDetailList.First(l => l.DisbursementId == disbursementId && l.ItemId == itemId).ActualQuantity = actualQuantity;
            BindGridView();
        }
    }
}