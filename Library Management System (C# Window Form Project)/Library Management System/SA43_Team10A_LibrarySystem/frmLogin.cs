using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SA43_Team10A_LibrarySystem
{
    public partial class frmLogin : Form  
    {
        static int count = 3;           //3 attempts per session
        public frmLogin()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            SA43_Team10A_LibrarySystemEntities ctx = new SA43_Team10A_LibrarySystemEntities();
         
            
            string userName = txtUserID.Text;
            string passWord = txtPassword.Text;
            var login = ctx.EmpCredentials.Where(x => x.EmployeeName == userName && x.Password == passWord).FirstOrDefault();
            if(login == null)    //no match found for user name and password
            {
                count--;
                string remainingAttempt = Convert.ToString(count);                
                lblLoginPrompt.Visible = true;
               lblLoginPrompt.Text = "Incorrect User ID or Password. You have " + remainingAttempt + " more attempts"; 
            }
            else                 //successful login attempt
            {
                frmMain m = new frmMain();
                this.Hide();
                m.ShowDialog();
                this.Close();
            }    
              
           
            if(count ==0)        //failed 3 login consecutively in session
            {
                MessageBox.Show("You have reached your maximum attempt. Please try again later");
                this.Close();
            }

                  
        }
    }
 }

