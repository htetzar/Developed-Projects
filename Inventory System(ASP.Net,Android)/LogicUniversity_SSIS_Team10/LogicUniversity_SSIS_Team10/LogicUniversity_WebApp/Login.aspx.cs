using LogicUniversityController;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp
{
    public partial class Login : System.Web.UI.Page
    {
        private LoginController loginController;
        protected void Page_Load(object sender, EventArgs e)
        {
            alertLogin.Visible = false;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            loginController = new LoginController();
            Staff user;
            string userId = txtBoxUserName.Text.Trim();
            if (loginController.CheckUser(userId, txtBoxPassword.Text.Trim()) == true)
            {
                //These session values are just for demo purpose to show the user details on master page
                user = loginController.GetUser(userId);
                Session["User"] = user;

                //Let us now set the authentication cookie so that we can use that later.
                FormsAuthentication.SetAuthCookie(userId, false);

                //Login successful lets put him to requested page
                //string returnUrl = Request.QueryString["ReturnUrl"] as string;

                //if (returnUrl != null)
                //{
                //    Response.Redirect(returnUrl);
                //}
                //else
                //{
                //    //no return URL specified so lets kick him to home page
                //    Response.Redirect("Default.aspx");
                //}
                switch (user.Role.RoleName)
                {
                    case "StoreClerk": Response.Redirect("~/StationaryStore/ProcessStationaryRequisition.aspx"); break;
                    case "Supervisor": Response.Redirect("~/StationaryStore/PreparePurchaseOrderList.aspx"); break;
                    case "Manager": Response.Redirect("~/StationaryStore/PreparePurchaseOrderList.aspx"); break;
                    case "Staff": Response.Redirect("~/Department/ViewStationaryRequisitionList.aspx"); break;
                    case "DepartmentHead": Response.Redirect("~/Department/ViewStationaryRequisitionList.aspx"); break;
                    case "DepartmentRep": Response.Redirect("~/Department/AcknowledgeDisbursementList.aspx"); break;
                    default: Response.Redirect("Default.aspx"); break;
                }
            }
            else
            {
                alertLogin.Visible = true;
            }
        }
    }
}