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
    public partial class frmMemberMaintenance : Form                  //coding done by Krithiga Gunasekaran
    {
        SA43_Team10A_LibrarySystemEntities ctx = new SA43_Team10A_LibrarySystemEntities();
        List<MembersDetail> memberLst;
        int posn = 0;
        

        public frmMemberMaintenance()
        {
            InitializeComponent();
            memberLst = ctx.MembersDetails.ToList();
            dtpBirthDate.Format = DateTimePickerFormat.Custom;
            dtpBirthDate.CustomFormat = " ";
            toolStripLabel.Text = "Load the data.";
            
        }

        private void memberShipToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void buttonLoad_Click(object sender, EventArgs e)
        {
            
            PopulateText(posn);

        }

        private void PopulateText(int posn)
        {
            

            
            if (posn > memberLst.Count - 1)
            {
                toolStripLabel.Text = "Last Record";
            }
            else
            {
                txtMemberID.Text = memberLst[posn].MemberID.ToString();
                txtMemberName.Text = memberLst[posn].MemberName;
                if (memberLst[posn].Birthdate == null)
                {
                    dtpBirthDate.Format = DateTimePickerFormat.Custom;
                    dtpBirthDate.CustomFormat = " ";
                    dtpBirthDate.Text = memberLst[posn].Birthdate.ToString() ?? " ";
                }
                else
                {
                    dtpBirthDate.Format = DateTimePickerFormat.Long;
                    dtpBirthDate.Text = memberLst[posn].Birthdate.ToString();
                }
                txtEmailAddress.Text = memberLst[posn].EmailAddress;
                txtAddress.Text = memberLst[posn].Address;
                txtPostalCode.Text = memberLst[posn].PostalCode;
                txtPhoneNumber.Text = memberLst[posn].PhoneNumber;
                toolStripLabel.Text = "Record: " + posn;
            }

            
        }

        private void buttonNext_Click(object sender, EventArgs e)
        {
            
            posn++;
            PopulateText(posn);
            toolStripStatus.Text = "Record: " + posn;
            

        }

        private void buttonPrevious_Click(object sender, EventArgs e)
        {
            
                if (posn > 0)
                {
                    posn--;
                    PopulateText(posn);
                    toolStripLabel.Text = "Record: " + posn;
                }
                else
                {
                    toolStripLabel.Text = "This is First Record";

                }
            
        }

        private void buttonLastRecord_Click(object sender, EventArgs e)
        {
            
            posn = memberLst.Count - 1;
            PopulateText(posn);
            toolStripLabel.Text = "Record: " + posn;
            
        }

        private void buttonFirstRecord_Click(object sender, EventArgs e)
        {
            

                posn = 0;
                PopulateText(posn);
                toolStripLabel.Text = "Record: " + posn;
            

        }

        private void buttonDelete_Click(object sender, EventArgs e)
        {
            
                int CurRec = posn;
                MembersDetail m = memberLst[CurRec];
                ctx.MembersDetails.Remove(m);
                ctx.SaveChanges();
                if (posn > 0) posn--;
                PopulateText(posn);
            
        }

        private void buttonUpdate_Click(object sender, EventArgs e)
        {
            
                RetrieveText(posn);
                ctx.SaveChanges();
                dtpBirthDate.Format = DateTimePickerFormat.Long;
                toolStripLabel.Text = "Updated Successfully.... ";
            
        }

        private void RetrieveText(int posn)
        {
           memberLst[posn].MemberID = Convert.ToInt32(txtMemberID.Text);
            memberLst[posn].MemberName = txtMemberName.Text;
            if (memberLst[posn].Birthdate == null)
            {
                dtpBirthDate.Format = DateTimePickerFormat.Custom;
                dtpBirthDate.CustomFormat = " ";
                dtpBirthDate.Text = memberLst[posn].Birthdate.ToString() ?? " ";
            }
            else
            {
                dtpBirthDate.Format = DateTimePickerFormat.Long;
            }
          
            memberLst[posn].Address = txtAddress.Text;
            memberLst[posn].EmailAddress = txtEmailAddress.Text;
            memberLst[posn].PostalCode = txtPostalCode.Text;
            memberLst[posn].PhoneNumber = txtPhoneNumber.Text;
            toolStripLabel.Text = "Record: " + posn;
            

        }

        private void buttonAdd_Click(object sender, EventArgs e)
        {
           
                MembersDetail m = new MembersDetail();
                txtMemberID.Text = Convert.ToString(" ");
                txtMemberName.Text = " ";
                dtpBirthDate.Format = DateTimePickerFormat.Custom;
                dtpBirthDate.CustomFormat = " ";
                txtEmailAddress.Text = "";
                txtAddress.Text = "";
                txtPostalCode.Text = "";
                txtPhoneNumber.Text = "";
                memberLst.Add(m);
                ctx.MembersDetails.Add(m);
                posn = memberLst.Count - 1;
                PopulateText(posn);
                dtpBirthDate.Format = DateTimePickerFormat.Long;
            

        }

        private void buttonFind_Click(object sender, EventArgs e)
        {
            
                int id = Convert.ToInt32(txtFind.Text);
                MembersDetail md = memberLst.SingleOrDefault(m => m.MemberID == id);
                if (memberLst.SingleOrDefault(m => m.MemberID == id) == null)
                {
                    toolStripLabel.Text = "No records exists in table";
                }
                else
                {
                    for (int i = 0; i < memberLst.Count; i++)
                    {

                        if (txtFind.Text == memberLst[i].MemberID.ToString())
                        {
                            posn = i;
                            toolStripLabel.Text = "Records: " + posn;
                            break;
                        }
                        PopulateText(posn);

                    }
                
            }
                
        }
        private void chkBirthDate_CheckedChanged(object sender, EventArgs e)
        {
            
                if (chkBirthDate.Checked == true)
                {

                    memberLst[posn].Birthdate = dtpBirthDate.Value;
                }
                else
                {
                    
                    memberLst[posn].Birthdate = null;
                }
            }
        }

        
    
}
