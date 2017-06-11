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
    public partial class frmMemberSearch : Form                 
    {
        SA43_Team10A_LibrarySystemEntities ctx;
        private string selectedMemberID;
        private string selectedMemberName;
        public string SelectedMemberID
        {
            get { return selectedMemberID; }
            private set { selectedMemberID = value; }
        }

        public string SelectedMemberName
        {
            get { return selectedMemberName; }
            private set { selectedMemberName = value; }
        }
        public frmMemberSearch()
        {
            InitializeComponent();
            ctx = new SA43_Team10A_LibrarySystemEntities();
            dgvMemberInfo.AutoGenerateColumns = false;
        }

        private void btnSearchByName_Click(object sender, EventArgs e)
        {            
            if (txtMemberName.Text == "")
            {
                dgvMemberInfo.DataSource = ctx.MembersDetails.ToList();
            }
            else
            {
                dgvMemberInfo.DataSource = ctx.MembersDetails
                                              .Where(m => m.MemberName.ToLower().Contains(txtMemberName.Text.ToLower())).ToList();                
            }           
        }

        private void dgvMemberInfo_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            this.Close();
            SelectedMemberID = dgvMemberInfo.CurrentRow.Cells[0].Value.ToString();
            selectedMemberName = dgvMemberInfo.CurrentRow.Cells[1].Value.ToString();
        }

        private void frmMemberSearch_Load(object sender, EventArgs e)
        {
            txtMemberName.Focus();
        }

        private void txtMemberName_TextChanged(object sender, EventArgs e)
        {
            string text = txtMemberName.Text;
            bool hasChar = false;
            foreach (char letter in text)
            {
                if (char.IsLetter(letter))
                {
                    hasChar = true;
                    break;
                }
            }            
            if (!hasChar)
            {
                errorProvider1.SetError(txtMemberName, "Can only input character!");
            }
            else
            {
                errorProvider1.Clear();
            }
        }        
    }
}
