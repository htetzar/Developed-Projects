using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicUniversityController.Controller;
using LogicUniversityDataModel.CustomModel;
using System.Data;
using Microsoft.Reporting.WebForms;

namespace LogicUniversity_WebApp.StationaryStore
{
    //Author Ei Ei Maw.
    //Team 10.
    public partial class InventoryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                InventoryStatusController inventory = new InventoryStatusController();
                List<InventoryStatusReport> inventoryList = inventory.GetInventoryList();


                // Microsoft
                DataSetReorderBySupplier ds2 = new DataSetReorderBySupplier();
                DataTable t2 = ds2.DataTable4;

                DataRow r2;
                foreach (InventoryStatusReport s in inventoryList)
                {
                    r2 = t2.NewRow();

                    r2["ItemCode"] = s.ItemCode;
                    r2["ItemName"] = s.ItemName;
                    r2["Description"] = s.Description;
                    r2["Location"] = s.Location;
                    r2["Balance"] = s.Balance;
                    r2["UnitOfMeasurement"] = s.UnitOfMeasurement;
                    r2["ReorderLevel"] = s.ReorderLevel;
                    t2.Rows.Add(r2);
                }

                ReportDataSource rds = new ReportDataSource("DataSet1", t2);
                reportViewer1.LocalReport.DataSources.Clear();
                reportViewer1.LocalReport.DataSources.Add(rds);
                reportViewer1.LocalReport.Refresh();               
            }
           
        }
    }
}