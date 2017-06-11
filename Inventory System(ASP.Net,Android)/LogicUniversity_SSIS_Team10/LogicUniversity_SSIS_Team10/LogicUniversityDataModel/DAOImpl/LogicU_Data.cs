using LogicUniversityDataModel.CustomModel;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.Model
{
    //Author Zaw Myo Htet,Ei Ei Maw
    //Team 10.
    public class LogicU_Data
    {
        string con = "data source=(local);integrated security=true;initial catalog=LogicU_Inventory_System";
        SqlConnection sqlCon;
        SqlCommand cmd;
        SqlDataReader rd;

        public List<PurchaseOrder> GetPurchaseOrderList(string supplierId)
        {
            string con = "data source=(local);integrated security=true;initial catalog=LogicU_Inventory_System";
            SqlConnection sqlCon = new SqlConnection(con);
            SqlCommand cmd = new SqlCommand();
            sqlCon.Open();
            cmd.Connection = sqlCon;
            cmd.CommandText = "select stc.ItemId,stc.ItemName,StockCard.Balance,stc.reorder,ss.Price from StockCard join"
                               + "  (select st.ItemId,ItemList.ItemName,Max(Update_Date) as Udate,ItemList.ReorderLevel as reorder from StockCard st"
                               + "  inner join "
                               + "  (select ItemId,ItemName,ReorderLevel from Item "
                               + "   where First_SupplierId='" + supplierId
                               + "'  or Second_SupplierId='" + supplierId
                               + "'  or Third_SupplierId='" + supplierId + "') as ItemList on"
                               + "  st.ItemId=ItemList.ItemId  where st.Balance <= ItemList.ReorderLevel"
                              + "   group by st.ItemId,ItemList.ItemName,ItemList.ReorderLevel)as Stc"

                               + "  on Stc.Udate=StockCard.Update_Date AND Stc.ItemId = StockCard.ItemId"
                               + " join Supplier_Stock ss"
                              + "  on StockCard.ItemId=ss.ItemId"
                              + "  where ss.SupplierId= '" + supplierId + "'";
            SqlDataReader rd = cmd.ExecuteReader();
            List<PurchaseOrder> purchaseLst = new List<PurchaseOrder>();

            while (rd.Read())
            {
                PurchaseOrder order = new PurchaseOrder();
                order.ItemId = rd["ItemId"].ToString();
                order.ItemName = rd["ItemName"].ToString();
                order.Balance = (double)rd["Balance"];
                order.ReorderQty = (int)rd["reorder"];
                order.UnitPrice = (double)rd["Price"];
                order.Amount = order.ReorderQty * order.UnitPrice;

                purchaseLst.Add(order);
            }
            rd.Close();
            return purchaseLst;
        }
        public List<SupplierOrderReport> GetReportBySupplierOnDate(string itemId, List<string> monthList)
        {
            List<SupplierOrderReport> supplierList = new List<SupplierOrderReport>();
            foreach (string m in monthList)
            {
                string[] monthArray = m.Split('-');
                string month = monthArray[1];
                string year = monthArray[0];
                SupplierOrderReport supplierReorderReport = new SupplierOrderReport();

                OpenConnection();
                cmd.CommandText = "select * from ("
                    + " select [Supplier].SupplierName as SupplierName, [Order].OrderDate, Order_Quantity"
                    + " from OrderDetail"
                    + " join [Order]"
                    + " on OrderDetail.OrderId= [Order].OrderId"
                    + " join Supplier"
                    + " on Supplier.SupplierId=[Order].SupplierId"
                    + " where Month([Order].OrderDate)= '" + month + "'and YEAR([Order].OrderDate)='" + year
                    + "' and [Order].SupplierId='ALPA' "
                    + " and [Supplier].SupplierId='ALPA'"
                    + " and [OrderDetail].ItemId='" + itemId
                    + " ' group by [Order].SupplierId, [Order].OrderDate,Order_Quantity,SupplierName"
                    + " union all"
                    + " select [Supplier].SupplierName as SupplierName , [Order].OrderDate, Order_Quantity"
                    + " from OrderDetail"
                    + " join [Order]"
                    + " on OrderDetail.OrderId= [Order].OrderId"
                    + " join Supplier"
                    + " on Supplier.SupplierId=[Order].SupplierId"
                    + " where Month([Order].OrderDate)= '" + month + "'and YEAR([Order].OrderDate)='" + year
                    + "' and [Order].SupplierId='BANE' "
                    + " and [OrderDetail].ItemId='" + itemId
                    + " ' group by [Order].SupplierId, [Order].OrderDate,Order_Quantity,SupplierName"
                    + " union all"
                    + " select  [Supplier].SupplierName as SupplierName, [Order].OrderDate,Order_Quantity"
                    + " from OrderDetail"
                    + " join [Order]"
                    + " on OrderDetail.OrderId= [Order].OrderId"
                    + " join Supplier"
                    + " on Supplier.SupplierId=[Order].SupplierId"
                    + " where Month([Order].OrderDate)= '" + month + "'and YEAR([Order].OrderDate)='" + year
                    + "' and [Order].SupplierId='CHEP' "
                    + " and [OrderDetail].ItemId='" + itemId
                    + " ' group by [Order].SupplierId, [Order].OrderDate,Order_Quantity,SupplierName"
                    + " ) As Sourtable"
                    + " PIVOT"
                    + " (  SUM(Order_Quantity) FOR SupplierName IN ([ALPHA Office Supplies],[BANES Shop],[Cheap Stationer])) AS p";
                rd = cmd.ExecuteReader();
                if (rd.HasRows)
                {
                    while (rd.Read())
                    {
                        //  supplierReorderReport.OrderDate = rd.GetDateTime(0);                        
                        supplierReorderReport.OrderDate = Convert.ToDateTime(rd["OrderDate"].ToString());
                        if (rd[1] != DBNull.Value)
                        {
                            supplierReorderReport.SupplierOne += rd.GetInt32(1);
                        }                       
                        if (rd[2] != DBNull.Value)
                        {
                            supplierReorderReport.SupplierTwo += rd.GetInt32(2);
                        }                      

                        if (rd[3] != DBNull.Value)
                        {
                            supplierReorderReport.SupplierThree += rd.GetInt32(3);
                        }                       
                    }                    
                    supplierList.Add(supplierReorderReport);          

                }
                CloseConnection();   
            }
                
            return supplierList;
        }
        public DepartmentRequisitionReport GetReportByDepartmentOnDate(string monthList)
        {
            string[] monthArray = monthList.Split('-');
            string month = monthArray[1];
            string year = monthArray[0];
            DepartmentRequisitionReport departmentRequisitionReport = new DepartmentRequisitionReport();
            List<DepartmentRequisitionReport> departmentRequisitionReportList = new List<DepartmentRequisitionReport>();
            OpenConnection();

            cmd.CommandText = "select * from( "
                            + " select re.StaffRequisitionId as TotalRequisition,d.DepartmentName from "
                            + " StaffRequisition re join Department d "
                            + " on "
                            + " re.DepartmentId=d.DepartmentId "
                            + " where Month(re.ApproveDate)='" + month + "' and YEAR(re.ApproveDate)= '" + year
                            + " ' group by re.DepartmentId,re.StaffRequisitionId,d.DepartmentName) As SourceTable "
                            + " PIVOT "
                            + " (Count(TotalRequisition) FOR DepartmentName IN ([English Dept],[Commerce Dept],[Computer Science],[Registrar Dept],[Zoology Dept])) AS p "; ;
            rd = cmd.ExecuteReader();
            if (rd.HasRows)
            {
                while (rd.Read())
                {
                    departmentRequisitionReport.RequisitionDate = new DateTime(Convert.ToInt32(year), Convert.ToInt32(month), 1);

                    if (rd[0] != DBNull.Value)
                    {
                        departmentRequisitionReport.EnglishDept = Convert.ToInt32(rd[0]);
                    }

                    if (rd[1] != DBNull.Value)
                    {
                        departmentRequisitionReport.CommerceDept = Convert.ToInt32(rd[1]);
                    }

                    if (rd[2] != DBNull.Value)
                    {
                        departmentRequisitionReport.ComputerScience = Convert.ToInt32(rd[2]);
                    }

                    if (rd[3] != DBNull.Value)
                    {
                        departmentRequisitionReport.RegistrarDept = Convert.ToInt32(rd[3]);
                    }
                    if (rd[4] != DBNull.Value)
                    {
                        departmentRequisitionReport.ZoologyDept = Convert.ToInt32(rd[4]);
                    }
                    
                }
            }
            CloseConnection();
            return departmentRequisitionReport;
        }
        private void OpenConnection()
        {
            sqlCon = new SqlConnection(con);
            cmd = new SqlCommand();
            try
            {
                sqlCon.Open();
                cmd.Connection = sqlCon;
            }
            catch (Exception e)
            {
                Console.WriteLine("SQL OPEN CONNECTION ERROR: " + e.Message);
            }

        }

        private void CloseConnection()
        {
            rd.Close();
            try
            {
                sqlCon.Close();
            }
            catch (Exception e)
            {
                Console.WriteLine("SQL CLOSE CONNECTION ERROR: " + e.Message);
            }

        }
        public List<InventoryStatusReport>  GetInventoryStatusData()
        {
            List<InventoryStatusReport> inventoryList = new List<InventoryStatusReport>();
             OpenConnection();

             cmd.CommandText = "select ss.ItemId as ItemCode,ite.ItemName as ItemName,"
                                     + " ss.Description,ite.BinId as Location,ss.Balance,ite.UOM as UnitOfMeasurement,ite.ReorderLevel"
                                     + " from Item ite"
                                     + " join StockCard ss"
                                     + " on ite.ItemId=ss.ItemId"
                                     + " join"
                                     + " (select Max(Update_Date) as UpdateDate from StockCard"
                                     + " group by ItemId) as st"
                                     + " on ss.Update_Date=st.UpdateDate group by ss.ItemId,ite.ItemName,"
                                     + "ss.Description,ite.BinId,ss.Balance,ite.UOM,ite.ReorderLevel";
                rd = cmd.ExecuteReader();
                while (rd.Read())
                {
                    InventoryStatusReport inventory = new InventoryStatusReport();
                    if (rd["ItemCode"] != DBNull.Value)
                    {
                        inventory.ItemCode =rd["ItemCode"].ToString();
                    }
                    if (rd["ItemName"] != DBNull.Value)
                    {
                        inventory.ItemName = rd["ItemName"].ToString();
                    }
                    if (rd["Description"] != DBNull.Value)
                    {
                        inventory.Description = rd["Description"].ToString();
                    }
                    if (rd["Location"] != DBNull.Value)
                    {
                        inventory.Location = rd["Location"].ToString();
                    }
                    if (rd["Balance"] != DBNull.Value)
                    {
                        inventory.Balance = Convert.ToInt64(rd["Balance"].ToString());
                    }
                    if (rd["UnitOfMeasurement"] != DBNull.Value)
                    {
                        inventory.UnitOfMeasurement = rd["UnitOfMeasurement"].ToString();
                    }
                    if (rd["ReorderLevel"] != DBNull.Value)
                    {
                        inventory.ReorderLevel = Convert.ToInt32(rd["ReorderLevel"].ToString());
                    }
                    inventoryList.Add(inventory);

                }
                CloseConnection();
                return inventoryList;                                    
        }
    }
}
