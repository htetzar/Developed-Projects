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
    //Author Liu Hui Qiu,Mai Chi Cuong
    //Team 10.
    public partial class MaintainCatalogue : System.Web.UI.Page
    {
        public static List<Item> itemLst = new List<Item>();
        MaintainCatalogueController maintainCatalogueController = new MaintainCatalogueController();
        void BindData()
        {
            gdvMaintainCata.DataSource = maintainCatalogueController.getMaintainCatalogueList().Select(c => new
            {
                ItemId = c.ItemId,
                CategoryName = c.Category.CategoryName,
                ItemName = c.ItemName,
                ReOrderLevel = c.ReorderLevel,
                ReOrderQty = c.ReorderQty,
                UOM = c.UOM
            }).ToList();
            gdvMaintainCata.DataBind();
        } 
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindData();
            }
        }

        protected void gdvMaintainCata_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gdvMaintainCata.PageIndex = e.NewPageIndex;
            BindData();
        }

        protected void gdvMaintainCata_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gdvMaintainCata.EditIndex = e.NewEditIndex;
            BindData();
        }

        protected void gdvMaintainCata_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gdvMaintainCata.EditIndex = -1;
            BindData();
        }

        protected void gdvMaintainCata_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = gdvMaintainCata.Rows[e.RowIndex];
                TextBox txtItemName = (TextBox)row.FindControl("txtItemName");
                TextBox txtReorderLvl = (TextBox)row.FindControl("txtReorderLvl");
                TextBox txtReorderQty = (TextBox)row.FindControl("txtReorderQty");
                string itemid = gdvMaintainCata.DataKeys[e.RowIndex].Value.ToString();
                string itemname = txtItemName.Text;
                int reorderlvl = Int32.Parse(txtReorderLvl.Text);
                int reorderqty = Int32.Parse(txtReorderQty.Text);

                Item i = maintainCatalogueController.getMaintainCatalogueList().Single(c => c.ItemId == itemid);
                i.ItemName = itemname;
                i.ReorderLevel = reorderlvl;
                i.ReorderQty = reorderqty;
                maintainCatalogueController.SaveUpdatedItem(i);
                gdvMaintainCata.EditIndex = -1;
                BindData();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong!')", true);
                BindData();
            }
        }

        protected void gdvMaintainCata_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string itemid = gdvMaintainCata.DataKeys[e.RowIndex].Value.ToString();
                Item i = maintainCatalogueController.getMaintainCatalogueList().SingleOrDefault(c => c.ItemId == itemid);
                maintainCatalogueController.DeleteItem(i);              
                BindData();
            }
            catch
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Something wrong!')", true);
            }
        }
                
        protected void gdvMaintainCata_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if(e.CommandName == "Select")
            {
                Session["Itemid"] = e.CommandArgument.ToString();
                string id = Session["Itemid"].ToString();
                Item i = maintainCatalogueController.getMaintainCatalogueList().FirstOrDefault(c => c.ItemId == id);
                lblitemid.Text = i.ItemId;
                lblDescription.Text = i.ItemName;
                lblBin.Text = i.BinId;
                lblUOM.Text = i.UOM;
                lblSup1.Text = i.First_SupplierId;
                lblSup2.Text = i.Second_SupplierId;
                lblSup3.Text = i.Third_SupplierId;
                List<StockCard> storkCardList = i.StockCards.ToList<StockCard>();
                GridView1.DataSource = storkCardList.Select(x=> new {
                    Date=x.Update_Date,
                    Description=x.Description,
                    Quantity=x.Quantity,
                    Balance = x.Balance
                });
                GridView1.DataBind();
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#detailsModal').modal('show');", true);
            }
        }
    }
}