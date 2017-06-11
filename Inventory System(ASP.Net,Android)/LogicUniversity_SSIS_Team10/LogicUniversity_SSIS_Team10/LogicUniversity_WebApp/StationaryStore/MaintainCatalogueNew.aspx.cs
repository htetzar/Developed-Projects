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

    //Author Liu Hui Qiu
    //Team 10.
    public partial class MaintainCatalogueNew : System.Web.UI.Page
    {
        MaintainCatalogueController maintainCatalogueController = new MaintainCatalogueController();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                retrievedata();
            }               
        }
        public void retrievedata()
        {
            DropDownListsupplier1.DataSource = maintainCatalogueController.GetSupplierList();
            DropDownListsupplier1.DataTextField = "SupplierName";
            DropDownListsupplier1.DataValueField = "SupplierId";
            DropDownListsupplier1.DataBind();

            DropDownListsupplier2.DataSource = maintainCatalogueController.GetSupplierList();
            DropDownListsupplier2.DataTextField = "SupplierName";
            DropDownListsupplier2.DataValueField = "SupplierId";
            DropDownListsupplier2.DataBind();

            DropDownListsupplier3.DataSource = maintainCatalogueController.GetSupplierList();
            DropDownListsupplier3.DataTextField = "SupplierName";
            DropDownListsupplier3.DataValueField = "SupplierId";
            DropDownListsupplier3.DataBind();

            DropDownListCategory.DataSource = maintainCatalogueController.GetCategoryList();
            DropDownListCategory.DataTextField = "CategoryName";
            DropDownListCategory.DataValueField = "CategoryId";
            DropDownListCategory.DataBind();

            DropDownListuom.DataSource = maintainCatalogueController.GetUomList();
            DropDownListuom.DataBind();
        }

        public bool CheckItemId()
        {

            string description = txtDescription.Text;
            string itemid = txtItemId.Text;
            Char[] descriptionchar = description.ToCharArray();
            Char[] itemchar = itemid.ToCharArray();
            Item i = maintainCatalogueController.GetItemByItemId(itemid);
            try
            {
                if (itemchar[0] != descriptionchar[0])
                {
                    lblMsg.Text = "Must start with-<span class='badge'>" + itemchar[0] + "</span>-letter";
                    return false;
                }
                else if (i != null)
                {
                    lblidVal.Text = "ID is already exist!";
                    return false;
                }
                else
                {
                    lblidVal.Text = "Invalid";
                    return true;
                }
            }
            catch
            {
                return false;
            }
        }
        public bool CheckSuppliers()
        {
            bool isError = true;
            if (DropDownListsupplier1.SelectedItem.Value.Equals(DropDownListsupplier2.SelectedItem.Value))
            {
                if (DropDownListsupplier1.SelectedItem.Value.Equals(DropDownListsupplier3.SelectedItem.Value))
                {
                    lblchecksupplier1.Text = "Error";
                    lblchecksupplier2.Text = "Error";
                    lblchecksupplier3.Text = "Error";
                    isError = false;
                }
                else
                {
                    lblchecksupplier1.Text = "Error";
                    lblchecksupplier2.Text = "Error";
                    lblchecksupplier3.Text = "";
                    isError = false;
                }
            }
            else if (DropDownListsupplier1.SelectedItem.Value.Equals(DropDownListsupplier3.SelectedItem.Value))
            {
                lblchecksupplier1.Text = "Error";
                lblchecksupplier2.Text = "";
                lblchecksupplier3.Text = "Error";
                isError = false;
            }
            else if (DropDownListsupplier2.SelectedItem.Value.Equals(DropDownListsupplier3.SelectedItem.Value))
            {
                lblchecksupplier1.Text = "";
                lblchecksupplier2.Text = "Error";
                lblchecksupplier3.Text = "Error";
                isError = false;
            }
            else
            {
                lblchecksupplier1.Text = "";
                lblchecksupplier2.Text = "";
                lblchecksupplier3.Text = "";
                return isError;
            }
            return isError;
        }

        public void Clear()
        {
            txtDescription.Text = "";
            txtItemId.Text = "";
            lblidVal.Text = "";
            txtReorderLev.Text = "";
            txtreorderqty.Text = "";
            txtbinno.Text = "";
            lblchecksupplier1.Text = "";
            lblchecksupplier2.Text = "";
            lblchecksupplier3.Text = "";
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            CheckItemId();
            CheckSuppliers();
            Page.Validate();
            if (Page.IsValid && CheckItemId() && CheckSuppliers())
            {
                try
                {
                    Item item = new Item();
                    item.ItemId = txtItemId.Text;
                    item.CategoryId = Convert.ToInt32(DropDownListCategory.SelectedValue);
                    item.ItemName = txtDescription.Text;
                    item.BinId = txtbinno.Text;
                    item.ReorderLevel = Convert.ToInt32(txtReorderLev.Text);
                    item.ReorderQty = Convert.ToInt32(txtreorderqty.Text);
                    item.UOM = DropDownListuom.SelectedValue;
                    item.First_SupplierId = DropDownListsupplier1.SelectedValue;
                    item.Second_SupplierId = DropDownListsupplier2.SelectedValue;
                    item.Third_SupplierId = DropDownListsupplier3.SelectedValue;
                    item.Status = false;
                    maintainCatalogueController.AddNewItem(item);
                    Clear();
                    retrievedata();
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", 
                        "alert('Create successfully') ;window.location = '"+"MaintainCatalogue.aspx';", true);
                }
                catch
                {
                    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Same ItemID!')", true);
                }
            }
        }
    }
}