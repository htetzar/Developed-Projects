using LogicUniversityDataModel;
using LogicUniversityDataModel.DAOImpl;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityController.Controller
{
    //Author Mai Chi Cuong,Liu Hui Qiu
    //Team 10
    public class MaintainCatalogueController
    {
        MaintainCatalogueDAOImpl maintainCatalogueImpl = new MaintainCatalogueDAOImpl();
        public List<Item> getMaintainCatalogueList()
        {
            return maintainCatalogueImpl.getMaintainCatalogueList();
        }
        public void SaveUpdatedItem(Item item)
        {
            maintainCatalogueImpl.SaveItem(item);
        }
        public void DeleteItem(Item item)
        {
            maintainCatalogueImpl.DeleteItem(item);
        }
        //New Stationery 
        public List<Supplier> GetSupplierList()
        {
            return maintainCatalogueImpl.GetSupplierList();
        }

        public List<Category> GetCategoryList()
        {
            return maintainCatalogueImpl.GetCategoryList();
        }

        public void AddNewItem(Item item)
        {
            maintainCatalogueImpl.AddNewItem(item);
        }

        public List<Item> GetItemList()
        {
            return maintainCatalogueImpl.GetItemList();
        }

        public List<Item> GetItemListByCategory(int categoryId)
        {
            return maintainCatalogueImpl.GetItemListByCategory(categoryId);
        }

        public Item GetItemByItemId(string itemid)
        {
            return maintainCatalogueImpl.GetItemByItemId(itemid);
        }

        public List<string> GetUomList()
        {
            return maintainCatalogueImpl.GetUomList();
        }
    }
}
