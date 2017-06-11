using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    
    public class ProcessStationaryRequisitionDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        public List<StationaryRetrievalList> GetStationeryRetrievalList()
        {
            var retrievalList = from dq in context.DepartmentRequisitions
                                join it in context.Items on dq.ItemId equals it.ItemId
                                where dq.Status != StatusType.Completed.ToString()
                                && dq.Status != StatusType.Pending.ToString()
                                group new { dq, it } by dq.ItemId into gp
                                select new { gp = gp };

            var currentStationeryRetrievalList = new List<StationaryRetrievalList>();
            foreach (var list in retrievalList)
            {
                int? currentBal = 0;
                bool firstTime = true;
                foreach (var item in list.gp.OrderBy(x => x.dq.CreateDate))
                {
                    StationaryRetrievalList lst = new StationaryRetrievalList();
                    var balance = context.StockCards.OrderByDescending(s => s.Update_Date)
                                       .Where(s => s.ItemId == item.it.ItemId).Select(s => s.Balance).FirstOrDefault();
                    if (balance == null || balance == 0)
                    {
                        break;
                    }
                    if (firstTime)
                    {
                        currentBal = (int)balance;
                    }
                    var department = context.Departments.Where(d => d.DepartmentId == item.dq.DepartmentId).FirstOrDefault();
                    lst.Status = item.dq.Status;
                    lst.DepartmentRequisitionId = item.dq.DepartmentRequisitionId;
                    lst.ItemId = item.it.ItemId;
                    lst.ItemName = item.it.ItemName;
                    lst.Bin = item.it.BinId;
                    lst.DepartmentName = department.DepartmentName;
                    lst.DepartmentId = department.DepartmentId;
                    lst.CreateDate = item.dq.CreateDate;
                    lst.DepartmentNeeded = item.dq.Needed - item.dq.Actual;

                    if (currentBal >= lst.DepartmentNeeded)
                    {
                        lst.DepartmentActual = lst.DepartmentNeeded;
                        currentBal -= lst.DepartmentNeeded;
                    }
                    else
                    {
                        lst.DepartmentActual = currentBal;
                        currentBal -= lst.DepartmentActual;
                    }

                    currentStationeryRetrievalList.Add(lst);
                    firstTime = false;
                }
            }

            return currentStationeryRetrievalList;
        }

        public double? GetStockCardBalance(String itemId)
        {
            var balance = context.StockCards.OrderByDescending(s => s.Update_Date)
                                      .Where(s => s.ItemId == itemId).Select(s => s.Balance).FirstOrDefault();
            return balance;
        }

        public void UpdateStockCard(StockCard sc)
        {
            context.StockCards.Add(sc);
            context.SaveChanges();
        }
        public void UpdateDepartmentRequisition(string departmentRequisitionId, string itemId, String oldStatus, String newStatus, int? actual)
        {
            var deptRequest = context.DepartmentRequisitions.Where(d => d.DepartmentRequisitionId == departmentRequisitionId &&
                                                                        d.ItemId == itemId && d.Status == oldStatus).FirstOrDefault();
            deptRequest.Status = newStatus;
            deptRequest.Actual = deptRequest.Actual + actual;
            context.SaveChanges();
            var notCompleteCount = from sq in context.StaffRequisitions.Where(d => d.DepartmentRequisitionId == departmentRequisitionId)
                                   join dq in context.DepartmentRequisitions on sq.DepartmentRequisitionId equals dq.DepartmentRequisitionId into result
                                   select new
                                   {

                                       PostCount = result.Count(r => r.Status != StatusType.Completed.ToString())
                                   };
            if (notCompleteCount.First().PostCount == 0)
            {
                context.StaffRequisitions.ToList().ForEach(sq => sq.Status = StatusType.Completed.ToString());
            }
            context.SaveChanges();
        }

        public void InsertDisbursement(Disbursement d, List<DisbursementDetail> details)
        {
            String disbursementIdFormat = "DB-xxx";
            var list = context.Disbursements.Select(a => a.DisbursementId).ToList();
            String currentDisbursementId = "DB-100";
            char[] chrArr = new char[] { '-' };
            if (list.Count > 0)
            {
                var currentId = list
                                    .Select(a => a.Split(chrArr)[1])
                                    .Select(a => Convert.ToInt32(a)).Max() + 1;
                currentDisbursementId = disbursementIdFormat.Replace("xxx", currentId.ToString());
            }
            d.DisbursementId = currentDisbursementId;
            context.Disbursements.Add(d);
            context.SaveChanges();
            foreach (var dt in details)
            {
                dt.DisbursementId = d.DisbursementId;
            }
            context.DisbursementDetails.AddRange(details);
            context.SaveChanges();
        }

        public List<RetrievalItem> GetTotalItemNeeded()
        {
            //var retrievalItemList = new List<RetrievalItem>();
            //var list = context.DepartmentRequisitions.Where(d => d.Status != StatusType.Pending.ToString()
            //           && d.Status != StatusType.Completed.ToString())
            //           .GroupBy(d => d.Item.ItemId);
            //foreach (var group in list)
            //{
            //    var item = new RetrievalItem();
            //    foreach (var value in group)
            //    {
            //        item.BinId = value.Item.BinId;
            //        item.Quantity = group.Select(g => g.Needed - g.Actual).Sum();
            //        item.ItemName = value.Item.ItemName;
            //    }
            //    retrievalItemList.Add(item);
            //}
            //return retrievalItemList;

            var retrievalItemList = new List<RetrievalItem>();
            var itemList = new List<String>();
            var items = context.DepartmentRequisitions.Select(i => i.ItemId).Distinct();
            foreach (var it in items)
            {
                var balance = context.StockCards.OrderByDescending(s => s.Update_Date)
                                       .Where(s => s.ItemId == it).Select(s => s.Balance).FirstOrDefault();
                if (balance == null || balance == 0)
                {
                    break;
                }
                else
                {
                    itemList.Add(it);
                }
            }
            var list = context.DepartmentRequisitions.Where(d => d.Status != StatusType.Pending.ToString()
                         && d.Status != StatusType.Completed.ToString()
                         && itemList.Contains(d.ItemId))
                        .GroupBy(d => d.Item.ItemId);
            foreach (var group in list)
            {
                var item = new RetrievalItem();
                foreach (var value in group)
                {
                    item.BinId = value.Item.BinId;
                    item.Quantity = group.Select(g => g.Needed - g.Actual).Sum();
                    item.ItemName = value.Item.ItemName;
                }
                retrievalItemList.Add(item);
            }
            return retrievalItemList;
        }

        public List<DepartmentItem> GetDepartmentItemNeeded(String itemName)
        {
            var retrievalItemList = new List<DepartmentItem>();
            var list = context.DepartmentRequisitions.Where(d => d.Status != StatusType.Pending.ToString()
                       && d.Status != StatusType.Completed.ToString() && d.Item.ItemName == itemName)
                       .GroupBy(d => d.DepartmentId);
            var itemId = context.Items.Where(it => it.ItemName == itemName).FirstOrDefault().ItemId;
            var lastBal = GetStockCardBalance(itemId);
            foreach (var group in list)
            {
                var item = new DepartmentItem();
                foreach (var value in group)
                {
                    item.DepartmentId = value.DepartmentId;
                    item.ItemId = value.Item.ItemId;
                    item.NeededQuantity = group.Select(g => g.Needed - g.Actual).Sum();

                    if (lastBal >= item.NeededQuantity)
                    {
                        item.ActualQuantity = item.NeededQuantity;
                        lastBal -= item.NeededQuantity;
                    }
                    else
                    {
                        item.ActualQuantity = (int)lastBal;
                        lastBal -= item.ActualQuantity;
                    }

                    item.DepartmentRequisitionId = group.Select(g => g.DepartmentRequisitionId).Last();
                }
                retrievalItemList.Add(item);
            }
            return retrievalItemList;
        }

        // mobile update retrieval list
        public void SaveRetrievalList(List<StationeryRetrievalUpdateList> deptItem)
        {
            //deptId itemId acutalquantity deptReqId
            foreach (var item in deptItem)
            {
                var itemId = context.Items.Where(i => i.ItemName == item.ItemName).FirstOrDefault().ItemId;
                var bal = GetStockCardBalance(itemId);

                // Stock Card
                StockCard sc = new StockCard();
                sc.ItemId = itemId;
                sc.Update_Date = DateTime.Now;
                sc.Description = context.Departments.Where(d => d.DepartmentId == item.DepartmentId).FirstOrDefault().DepartmentName;
                sc.Quantity = item.ActualQuanity;
                sc.Balance = bal - sc.Quantity;
                context.StockCards.Add(sc);
                context.SaveChanges();

                // departmentRequisition    
                var deptReqRecord = context.DepartmentRequisitions.Where(d => d.DepartmentRequisitionId == item.DepartmentRequisitionId &&
                                   d.ItemId == itemId).FirstOrDefault();
                var previousActual = deptReqRecord.Actual;
                var currentNeeded = deptReqRecord.Needed - deptReqRecord.Actual;
                if (currentNeeded >= item.ActualQuanity)
                {
                    deptReqRecord.Actual += item.ActualQuanity;
                    item.ActualQuanity = 0;
                }
                else
                {
                    deptReqRecord.Actual = deptReqRecord.Needed;
                    item.ActualQuanity = item.ActualQuanity - currentNeeded;

                }

                if (deptReqRecord.Needed == deptReqRecord.Actual)
                {
                    deptReqRecord.Status = StatusType.Completed.ToString();
                }


                context.SaveChanges();
                var nowActual = deptReqRecord.Actual;

                // staff requisition
                foreach (var deptReqId in context.DepartmentRequisitions.Select(dq => dq.DepartmentRequisitionId).Distinct())
                {
                    if (context.DepartmentRequisitions.Where(dq => dq.DepartmentRequisitionId == deptReqId &&
                    dq.Status != StatusType.Completed.ToString()).Count() == 0)
                    {
                        context.StaffRequisitions.Where(sq => sq.DepartmentRequisitionId == deptReqId)
                                                 .ToList().ForEach(sq => sq.Status = StatusType.Completed.ToString());
                    }
                }

                context.SaveChanges();

                // Disbursement
                var exist = from dq in context.DepartmentRequisitions
                            join d in context.Disbursements on dq.DepartmentRequisitionId equals d.DepReqId
                            where dq.DepartmentRequisitionId == item.DepartmentRequisitionId
                            && dq.ItemId == itemId
                            && dq.Actual == 0
                            select d;
                if (exist.Count() == 0)
                {
                    var disbursement = new Disbursement();
                    String disbursementIdFormat = "DB-xxx";
                    var list = context.Disbursements.Select(a => a.DisbursementId).ToList();
                    String currentDisbursementId = "DB-100";
                    char[] chrArr = new char[] { '-' };
                    if (list.Count > 0)
                    {
                        var currentId = list
                                            .Select(a => a.Split(chrArr)[1])
                                            .Select(a => Convert.ToInt32(a)).Max() + 1;
                        currentDisbursementId = disbursementIdFormat.Replace("xxx", currentId.ToString());
                    }
                    disbursement.DisbursementId = currentDisbursementId;
                    disbursement.DepReqId = item.DepartmentRequisitionId;
                    disbursement.Status = StatusType.Pending.ToString();
                    disbursement.DepartmentId = item.DepartmentId;
                    disbursement.CreateDate = DateTime.Now;
                    context.Disbursements.Add(disbursement);
                    var disbursementDetail = new DisbursementDetail();
                    disbursementDetail.DisbursementId = currentDisbursementId;
                    disbursementDetail.Disbursement = disbursement;
                    disbursementDetail.ItemId = itemId;
                    disbursementDetail.Quantity = nowActual - previousActual;
                    context.DisbursementDetails.Add(disbursementDetail);
                    context.SaveChanges();
                }
                else
                {
                    var disbursementDetail = new DisbursementDetail();
                    var disbursement = context.Disbursements.Where(d => d.DepReqId == item.DepartmentRequisitionId &&
                                                                          d.DepartmentId == item.DepartmentId).FirstOrDefault();
                    disbursementDetail.DisbursementId = disbursement.DisbursementId;
                    disbursementDetail.ItemId = itemId;
                    disbursementDetail.Quantity = item.ActualQuanity;
                    disbursementDetail.Disbursement = disbursement;
                    context.DisbursementDetails.Add(disbursementDetail);
                    context.SaveChanges();

                }

            }
        }

    }
}
