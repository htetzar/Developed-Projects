using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class AdjustStationaryStockDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        String voucherFormat = "[AV/22222/xx]";
        public List<Adjustment> GetAdjustmentList(String roleName)
        {
            var adjustmentList = new List<Adjustment>();
            if (roleName == "Manager")
            {           
            foreach(var a in context.Adjustments.ToList())
                {
                    if (a.AdjustmentDetails.Any(ad => Math.Abs(ad.Quantity_Adjusted * ad.Item.Supplier_Stock.First().Price) > 250))
                    {
                        adjustmentList.Add(a);
                    }
                }

            }
            else if(roleName == "Supervisor")
            {
                foreach (var a in context.Adjustments.ToList())
                {
                    if(a.AdjustmentDetails.All(ad => Math.Abs(ad.Quantity_Adjusted * ad.Item.Supplier_Stock.First().Price) < 250))
                    {
                        adjustmentList.Add(a);
                    }
                }
            }
            else
            {
                var adjustments = from a in context.Adjustments.ToList()
                                  group a by new { a.Status } into g
                                  select new { adj = g };
                adjustmentList = adjustments.SelectMany(a => a.adj.Select(j => new Adjustment
                {
                    VoucherId = j.VoucherId,
                    IssueDate = j.IssueDate,
                    Status = j.Status
                })).ToList();
               
            }

            return adjustmentList;           
        }

        public List<AdjustmentDetail> GetAdjustmentDetail(String voucherId)
        {
            var details = context.AdjustmentDetails.Where(adj => adj.VoucherId == voucherId).ToList();
            return details;
        }

        public void UpdateStockCard(List<StockCard> list)
        {
            foreach(var sc in list)
            {
                var hasExist = context.StockCards.Where(it => it.ItemId == sc.ItemId).FirstOrDefault();
                if (hasExist != null)
                {
                    var lastBal = context.StockCards.Where(s => s.ItemId == s.ItemId)
                                   .OrderByDescending(s => s.Update_Date).FirstOrDefault().Balance;
                    sc.Balance = sc.Quantity+ lastBal;
                }
                else
                {
                    sc.Balance = sc.Quantity;
                }
                context.StockCards.Add(sc);
            }
            context.SaveChanges();
        }

        public void ApproveOrRejectAdjustment(String voucherId, String approveBy, String remark, String status)
        {
            var adjustmentObj = context.Adjustments.Single(adj => adj.VoucherId == voucherId);
            if (status == StatusType.Approved.ToString())
            {
                adjustmentObj.Status = status;
                adjustmentObj.ApprovedBy = approveBy;
            }
            else
            {
                adjustmentObj.Status = status;
                adjustmentObj.ApprovedBy = approveBy;
                adjustmentObj.Remark = remark;
            }           
            context.SaveChanges();
        }

        public double GetItemPrice(String itemId)
        {
            var price = context.Supplier_Stock.Where(s => s.ItemId == itemId).First().Price;
            return (double)price;
        }

        public String GenerateVoucherId()
        {
            var list = context.Adjustments.Select(a => a.VoucherId).ToList();
            String currentVoucherId = "[AV/22222/90]";
            char[] chrArr = new char[] { '[', '/', ']' };
            if (list.Count > 0)
            {
                var currentId = list
                                    .Select(a => a.Split(chrArr)[3])
                                    .Select(a => Convert.ToInt32(a)).Max() + 1;
                currentVoucherId = voucherFormat.Replace("xx", currentId.ToString());
            }
            return currentVoucherId;
        }

        public void SaveDataToAdjustmentAndAdjustmentDetail(Adjustment adj, List<AdjustmentDetail> adjDetails)
        {

            context.Adjustments.Add(adj);
            context.AdjustmentDetails.AddRange(adjDetails);
            context.SaveChanges();
        }

    }
}
