using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using LogicUniversityDataModel;

namespace LogicUniversityController
{
    //Author Zaw Myo Htet.
    //Team 10.
 public class LoginController
    {
        private LoginDAOImpl loginDAOImpl = new LoginDAOImpl();

        public bool CheckUser(string userName, string password)
        {
            return loginDAOImpl.CheckUser(userName, password);
        }

        public Staff GetUser(string username)
        {
            return loginDAOImpl.GetUser(username);
        }
    }
}
