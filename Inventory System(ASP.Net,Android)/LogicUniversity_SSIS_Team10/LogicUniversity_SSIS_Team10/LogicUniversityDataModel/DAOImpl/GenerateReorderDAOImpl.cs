using LogicUniversityDataModel.CustomModel;
using LogicUniversityDataModel.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Zaw Myo Htet,Ei Ei Maw
    //Team 10.
    public class GenerateReorderDAOImpl
    {
        LogicU_Data logicU_Data = new LogicU_Data();
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        List<CategoryOrderReport> categoryOrderReportList = new List<CategoryOrderReport>();
        List<CategoryOrderReport> categoryOrderList = new List<CategoryOrderReport>();
        public List<SupplierOrderReport> GetReportBySupplier(string itemId, List<string> months)
        {
            List<SupplierOrderReport> supplierOrderReportList = new List<SupplierOrderReport>();

          
                supplierOrderReportList = logicU_Data.GetReportBySupplierOnDate(itemId, months);          
             
           return supplierOrderReportList;
        }

        public List<Item> GetItemList()
        {
            return context.Items.Where(x => x.First_SupplierId == "ALPA" && x.Second_SupplierId == "BANE" && x.Third_SupplierId == "CHEP").ToList<Item>();
        }

        public List<Category> GetCategoryList()
        {
            List<Category> categoryList = context.Categories.ToList<Category>();
            return categoryList;
        }
        public List<CategoryOrderReport>    GetReportByCategory(List<string> categoryList, List<string> lstDateTimeString)
        {

            var test = context.OrderDetails.Where(x => categoryList.Contains(x.Item.Category.CategoryName) && lstDateTimeString.Contains(x.Order.OrderDate.ToString().Substring(0, 7))).ToList();
            List<Temp> tempList = context.OrderDetails.Where(x => categoryList.Contains(x.Item.Category.CategoryName) && lstDateTimeString.Contains(x.Order.OrderDate.ToString().Substring(0, 7)))
                                 .GroupBy(x => new
                                 {
                                     id = x.Item.Category.CategoryId,
                                     date = x.Order.OrderDate.ToString().Substring(0, 7)
                                 }).ToList()
                                 .Select(y => new Temp
                                 {
                                     OrderDate = y.Select(a => Convert.ToDateTime(a.Order.OrderDate)).FirstOrDefault(),
                                     QuantitySum = y.Sum(z => z.Order_Quantity),
                                     CategoryName = y.Select(z => z.Item.Category.CategoryName).FirstOrDefault()
                                 }).ToList<Temp>();
            foreach (Temp t in tempList)
            {
                CategoryOrderReport categoryOrderReport = new CategoryOrderReport();
                categoryOrderReport.OrderDate = t.OrderDate;
                switch (t.CategoryName)
                {
                    case "Clip": categoryOrderReport.Clip = t.QuantitySum; break;

                    case "Envelope": categoryOrderReport.Envelope = t.QuantitySum; break;

                    case "Eraser": categoryOrderReport.Eraser = t.QuantitySum; break;

                    case "Exercise": categoryOrderReport.Exercise = t.QuantitySum; break;

                    case "File": categoryOrderReport.File = t.QuantitySum; break;

                    case "Pen": categoryOrderReport.Pen = t.QuantitySum; break;

                    case "Puncher": categoryOrderReport.Puncher = t.QuantitySum; break;

                    case "Pad": categoryOrderReport.Pad = t.QuantitySum; break;

                    case "Paper": categoryOrderReport.Paper = t.QuantitySum; break;

                    case "Ruler": categoryOrderReport.Ruler = t.QuantitySum; break;

                    case "Scissors": categoryOrderReport.Scissors = t.QuantitySum; break;

                    case "Tape": categoryOrderReport.Tape = t.QuantitySum; break;

                    case "Sharpener": categoryOrderReport.Sharpener = t.QuantitySum; break;

                    case "Shorthand": categoryOrderReport.Shorthand = t.QuantitySum; break;

                    case "Stapler": categoryOrderReport.Stapler = t.QuantitySum; break;

                    case "Tacks": categoryOrderReport.Tacks = t.QuantitySum; break;

                    case "Tparency": categoryOrderReport.Tparency = t.QuantitySum; break;

                    case "Tray": categoryOrderReport.Tray = t.QuantitySum; break;

                    default: break;
                }
                if (categoryOrderReportList.Count ==0)
                {
                    categoryOrderReportList.Add(categoryOrderReport);
                }
                else
                {
                    CheckDuplicateDate(categoryOrderReport);
                }
                
            }
         
          
            return categoryOrderReportList;
        }
        public void CheckDuplicateDate(CategoryOrderReport categrory)
        {
            foreach (CategoryOrderReport c1 in categoryOrderReportList.ToList())
            {
               if(c1.OrderDate.Equals(categrory.OrderDate))
               {
                   if(categrory.Clip != 0)
                   {
                       c1.Clip = categrory.Clip;
                   }
                   if (categrory.Envelope != 0)
                   {
                       c1.Envelope = categrory.Envelope;
                   }
                   if (categrory.Eraser != 0)
                   {
                       c1.Eraser = categrory.Eraser;
                   }
                   if (categrory.Exercise != 0)
                   {
                       c1.Exercise = categrory.Exercise;
                   }
                   if (categrory.File != 0)
                   {
                       c1.File = categrory.File;
                   }
                   if (categrory.Pen != 0)
                   {
                       c1.Pen = categrory.Pen;
                   }
                   if (categrory.Puncher != 0)
                   {
                       c1.Puncher = categrory.Puncher;
                   }
                   if (categrory.Pad != 0)
                   {
                       c1.Pad = categrory.Pad;
                   }
                   if (categrory.Paper != 0)
                   {
                       c1.Paper = categrory.Paper;
                   }
                   if (categrory.Ruler != 0)
                   {
                       c1.Ruler = categrory.Ruler;
                   }
                   if (categrory.Scissors != 0)
                   {
                       c1.Scissors = categrory.Scissors;
                   }
                   if (categrory.Tape != 0)
                   {
                       c1.Tape = categrory.Tape;
                   }
                   if (categrory.Sharpener != 0)
                   {
                       c1.Sharpener = categrory.Sharpener;
                   }
                   if (categrory.Shorthand != 0)
                   {
                       c1.Shorthand = categrory.Shorthand;
                   }
                   if (categrory.Stapler != 0)
                   {
                       c1.Stapler = categrory.Stapler;
                   }
                   if (categrory.Tacks != 0)
                   {
                       c1.Tacks = categrory.Tacks;
                   }
                   if (categrory.Tparency != 0)
                   {
                       c1.Tparency = categrory.Tparency;
                   }
                   if (categrory.Tray != 0)
                   {
                       c1.Tray = categrory.Tray;
                   }
               }
               else
               {
                   categoryOrderReportList.Add(categrory);
               }
            }
        }
    }

    class Temp
    {
        public DateTime OrderDate { get; set; }

        public int QuantitySum { get; set; }

        public string CategoryName { get; set; }
    }

  
}
