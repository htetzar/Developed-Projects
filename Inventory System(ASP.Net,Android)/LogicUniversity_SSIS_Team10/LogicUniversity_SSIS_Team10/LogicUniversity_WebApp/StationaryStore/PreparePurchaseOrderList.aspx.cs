using LogicUniversityController.Controller;
using LogicUniversityDataModel;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Ei Ei Maw.
    //Team 10.

    public partial class PreparePurchaseOrderList : System.Web.UI.Page
    {
        PreparePurchaseOrderController preparePurchaseController = new PreparePurchaseOrderController();
        Staff user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            if (!IsPostBack)
            {
                if (user.RoleId == 4)
                {
                    GridView_Store.Visible = true;
                    GridView_Supervisor.Visible = false;
                    GridView_Store.DataSource = preparePurchaseController.GetOrderListByStoreClerk();
                    GridView_Store.DataBind();
                }
                if (user.RoleId == 5 || user.RoleId == 6)
                {
                    GridView_Store.Visible = false;
                    GridView_Supervisor.Visible = true;
                    GridView_Supervisor.DataSource = preparePurchaseController.GetOrderList();
                    GridView_Supervisor.DataBind();  
                }
            }
        }

        protected void GridView_Store_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Check the XXXX column - if empty, the YYYY needs highlighting!
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
                else if (e.Row.Cells[3].Text.ToLower() == "reject")
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

        protected void GridView_Supervisor_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Check the XXXX column - if empty, the YYYY needs highlighting!
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
                else if (e.Row.Cells[2].Text.ToLower() == "reject")
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

        protected void GridView_Store_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Store.PageIndex = e.NewPageIndex;
            user = (Staff)Session["User"];
            if (!IsPostBack)
            {
                if (user.RoleId == 4)
                {
                    GridView_Store.Visible = true;
                    GridView_Supervisor.Visible = false;
                    GridView_Store.DataSource = preparePurchaseController.GetOrderListByStoreClerk();
                    GridView_Store.DataBind();
                }
                if (user.RoleId == 5 || user.RoleId == 6)
                {
                    GridView_Store.Visible = false;
                    GridView_Supervisor.Visible = true;
                    GridView_Supervisor.DataSource = preparePurchaseController.GetOrderList();
                    GridView_Supervisor.DataBind();
                }
            }
        }

        protected void GridView_Supervisor_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView_Supervisor.PageIndex = e.NewPageIndex;
            user = (Staff)Session["User"];
            if (!IsPostBack)
            {
                if (user.RoleId == 4)
                {
                    GridView_Store.Visible = true;
                    GridView_Supervisor.Visible = false;
                    GridView_Store.DataSource = preparePurchaseController.GetOrderListByStoreClerk();
                    GridView_Store.DataBind();
                }
                if (user.RoleId == 5 || user.RoleId == 6)
                {
                    GridView_Store.Visible = false;
                    GridView_Supervisor.Visible = true;
                    GridView_Supervisor.DataSource = preparePurchaseController.GetOrderList();
                    GridView_Supervisor.DataBind();
                }
            }
        }
    }
}