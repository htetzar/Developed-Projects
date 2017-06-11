using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LogicUniversityDataModel;
using LogicUniversityDataModel.Model;
using LogicUniversityDataModel.CustomModel;

namespace LogicUniversityController.Controller
{
    //Author Ei Ei Maw.
    //Team 10.
   public  class InventoryStatusController
    {
       LogicU_Data logicU = new LogicU_Data();
       public List<InventoryStatusReport> GetInventoryList()
       {
           return logicU.GetInventoryStatusData();
       }
    }
}
