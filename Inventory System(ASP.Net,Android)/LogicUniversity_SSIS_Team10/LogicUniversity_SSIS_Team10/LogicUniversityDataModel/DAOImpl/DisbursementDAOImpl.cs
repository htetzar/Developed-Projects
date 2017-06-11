using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Htet Zar Chi Aung.
    //Team 10.
    public class DisbursementDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        public List<DisbursementDeliveryList> GetDisbursementList()
        {         

            DateTime today = DateTime.Today;
            int daysUntilMonday = (((int)DayOfWeek.Sunday - (int)today.DayOfWeek + 7) % 7) + 1;
            String nextMonday = today.AddDays(daysUntilMonday).ToShortDateString();

            var disbursementList = (from ds in context.Disbursements
                                    join dp in context.Departments on ds.DepartmentId equals dp.DepartmentId
                                    where ds.Status == StatusType.Pending.ToString()
                                    select new DisbursementDeliveryList()
                                    {
                                        DisbursementId = ds.DisbursementId,
                                        DepartmentRequisitionId = ds.DepReqId,
                                        DepartmentName = dp.DepartmentName,
                                        RepresentativeName = context.Staffs.Where(s => s.StaffId == dp.Representative_ID)
                                                            .FirstOrDefault().StaffName,
                                        CollectionPointName = dp.CollectionPoint.CollectionPoint_Name,
                                        CollectionPointTime = nextMonday + " " + dp.CollectionPoint.CollectionTime
                                    }).ToList();
            return disbursementList;

        }

        public List<DisbursementDeliveryList> GetDisbursementDetailList(String disbursementId)
        {
            
            var disbursementList = (from ds in context.DisbursementDetails
                                    join it in context.Items on ds.ItemId equals it.ItemId
                                    where ds.DisbursementId == disbursementId
                                    select new DisbursementDeliveryList()
                                    {
                                        DisbursementId = disbursementId,
                                        DepartmentRequisitionId = ds.Disbursement.DepReqId,
                                        ItemName = it.ItemName,
                                        ItemId = it.ItemId,
                                        NeededQuantity = context.DepartmentRequisitions.Where(dq => 
                                                        dq.DepartmentRequisitionId == ds.Disbursement.DepReqId &&
                                                        dq.ItemId == ds.ItemId).FirstOrDefault().Needed,
                                        ActualQuantity = ds.Quantity
                                    }).ToList();
            return disbursementList;

            //}
        }

        public List<DisbursementDeliveryList> GetAcknowledgeDisbursementList(String departmentId)
        {
            DateTime today = DateTime.Today;
            int daysUntilMonday = ((int)DayOfWeek.Monday - (int)today.DayOfWeek + 7) % 7;
            String nextMonday = today.AddDays(daysUntilMonday).ToShortDateString();

            var disbursementList = context.Disbursements.Where(d => d.DepartmentId == departmentId && d.Status == StatusType.Pending.ToString())
                                 .ToList().Select(d => new DisbursementDeliveryList()
            {
                DisbursementId = d.DisbursementId,
                DepartmentRequisitionId = d.DepReqId,
                ItemArr = d.DisbursementDetails.Select(dt => dt.Item.ItemName).Take(3).ToArray(),
                ItemDescription = String.Join("<br/>", d.DisbursementDetails.Select(dt => dt.Item.ItemName).Take(3).ToArray()),
                Status = d.Status,
                CollectionPointName = d.Department.CollectionPoint.CollectionPoint_Name,
                CollectionPointTime = nextMonday + " " + d.Department.CollectionPoint.CollectionTime


            }).ToList();
            return disbursementList;

        }

        public void UpdateAcknowledgeInformation(List<DisbursementDeliveryList> deliveryList, String remark)
        {
            foreach (var lst in deliveryList)
            {

                var previousGiven = context.DisbursementDetails.Where(d => d.DisbursementId == lst.DisbursementId &&
                                            d.ItemId == lst.ItemId).FirstOrDefault().Quantity; // 20
                var nowTaken = lst.ActualQuantity; // 15
                var difference = (previousGiven - nowTaken); // 5

                // StockCard
                if (difference != 0)
                {
                    var stockCardBal = context.StockCards.OrderByDescending(s => s.Update_Date)
                                             .Where(s => s.ItemId == lst.ItemId).FirstOrDefault().Balance;
                    var sc = new StockCard();
                    sc.ItemId = lst.ItemId;
                    sc.Update_Date = DateTime.Now;
                    sc.Description = "Return from Representative";
                    sc.Quantity = difference;
                    sc.Balance = stockCardBal + difference;
                    context.StockCards.Add(sc);
                    context.SaveChanges();
                }

                // DepartmentRequisition
                var dq = context.DepartmentRequisitions.Where(d => d.DepartmentRequisitionId == lst.DepartmentRequisitionId &&
                                                        d.ItemId == lst.ItemId).FirstOrDefault();
                dq.Actual = dq.Actual - difference;
                dq.Remark = remark;

                if (dq.Needed > dq.Actual)
                {
                    dq.Status = StatusType.PartiallyCompleted.ToString();
                }
                if (dq.Needed == dq.Actual)
                {
                    dq.Status = StatusType.Completed.ToString();
                }
                context.SaveChanges();

                // staff requisition
                foreach (var deptReqId in context.DepartmentRequisitions.Select(drq => drq.DepartmentRequisitionId).Distinct())
                {
                    if (context.DepartmentRequisitions.Where(drq => drq.DepartmentRequisitionId == deptReqId &&
                     dq.Status != StatusType.Completed.ToString()).Count() == 0)
                    {
                        context.StaffRequisitions.Where(sq => sq.DepartmentRequisitionId == deptReqId)
                                                 .ToList().ForEach(sq => sq.Status = StatusType.Completed.ToString());
                    }
                    else
                    {
                        context.StaffRequisitions.Where(sq => sq.DepartmentRequisitionId == deptReqId)
                                                 .ToList().ForEach(sq => sq.Status = StatusType.Approved.ToString());
                    }
                }

                // DisbursementDetails
                var dd = context.DisbursementDetails.Where(d => d.DisbursementId == lst.DisbursementId &&
                                                     d.ItemId == lst.ItemId).FirstOrDefault();
                dd.Quantity = lst.ActualQuantity;

                // Disbursements
                var disbursement = context.Disbursements.Where(d => d.DisbursementId == lst.DisbursementId).FirstOrDefault();
                disbursement.Status = StatusType.Completed.ToString();

                context.SaveChanges();
            }
        }
    }
}
