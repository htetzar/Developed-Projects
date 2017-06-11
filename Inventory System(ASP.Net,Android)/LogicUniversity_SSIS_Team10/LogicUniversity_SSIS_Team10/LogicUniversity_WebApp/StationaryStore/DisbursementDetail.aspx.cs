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
    public partial class DisbursementDetail : System.Web.UI.Page
    {
        private static List<DisbursementDeliveryList> disbursementDeailtList = new List<DisbursementDeliveryList>();
        DisbursementController controller = new DisbursementController();
        protected void Page_Load(object sender, EventArgs e)
        {
            var disbursementId = Request.QueryString["disbursementId"];
            BindGridView(disbursementId);
        }
        private void BindGridView(String disbursementId)
        {
            disbursementDeailtList = controller.GetDisbursementDetailList(disbursementId);
            gvDisbursementDetailList.DataSource = disbursementDeailtList;
            gvDisbursementDetailList.DataBind();
        }
    }
}