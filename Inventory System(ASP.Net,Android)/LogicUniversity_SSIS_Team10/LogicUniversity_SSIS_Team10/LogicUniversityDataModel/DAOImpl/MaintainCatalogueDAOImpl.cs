using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.DAOImpl
{
    //Author Liu Hui Qiu,Mai Chi Cuong
    //Team 10.
    public class MaintainCatalogueDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();
        public List<Item> getMaintainCatalogueList()
        {
            return context.Items.ToList();
        }
        public void SaveItem(Item item)
        {
            try
            {
                Item oldItem = context.Items.Single(c => c.ItemId == item.ItemId);
                oldItem.ItemName = item.ItemName;
                oldItem.ReorderLevel = item.ReorderLevel;
                oldItem.ReorderQty = item.ReorderQty;
                context.SaveChanges();
            }
            catch(Exception e)
            {
                throw e;
            }
        }
        public void DeleteItem(Item item)
        {
            try
            {
                Item oldItem = context.Items.SingleOrDefault(c => c.ItemId == item.ItemId);
                context.Items.Remove(oldItem);
                context.SaveChanges();
            }
            catch (Exception e)
            {
                throw e;
            }
        }
        //New Stationery code
        public List<Supplier> GetSupplierList()
        {
            return context.Suppliers.ToList();
        }

        public List<Category> GetCategoryList()
        {
            return context.Categories.ToList();
        }

        public void AddNewItem(Item item)
        {
            context.Items.Add(item);
            context.SaveChanges();

        }

        public List<Item> GetItemList()
        {
            return context.Items.ToList();

        }

        public List<Item> GetItemListByCategory(int categoryId)
        {
            var q = context.Items.Where(x => x.CategoryId == categoryId).ToList();
            q.Reverse();
            return q;
        }

        public Item GetItemByItemId(string itemid)
        {
            return context.Items.Where(x => x.ItemId == itemid).FirstOrDefault();
        }

        public List<string> GetUomList()
        {
            return context.Items.GroupBy(x => x.UOM).Select(x => x.Key).ToList();
        }
    }
}
