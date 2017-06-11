using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Configuration;

namespace LogicUniversityDataModel
{
    //Author Zaw Myo Htet.
    //Team 10.
    public class LoginDAOImpl
    {
        LogicUniversityDataModel context = new LogicUniversityDataModel();

        public bool CheckUser(string username, string password)
        {
            Staff user = context.Staffs.Where(x => x.StaffId == username && x.Password == password.Trim()).FirstOrDefault<Staff>();
            if (user != null)
            {
                //user id found and password is matched too so lets do soemthing now
                return true;
            }
            else
            {
                Console.WriteLine("No User");
            }
            //user id not found, lets treat him as a guest        
            return false;
        }

        // Get the User Name for this particular user
        public Staff GetUser(string userId)
        {
            Staff user = context.Staffs.Where(x => x.StaffId == userId).FirstOrDefault<Staff>();
            if (user != null)
            {
                return user;
            }
            //user id not found, lets treat him as a guest        
            return null;
        }
    }
}
