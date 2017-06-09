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
    public partial class frmMain : Form //coding by Kun Mei Ching
    {
        public frmMain()
        {
            InitializeComponent();
            frmBorrow b = new frmBorrow();
            b.Show();
            b.MdiParent = this;
            b.WindowState = FormWindowState.Maximized;
        }

        private void bookToolStripMenuItem_Click(object sender, EventArgs e)
        {
            {
                bool exist = false;
                foreach (Form b in this.MdiChildren)
                {
                    if (b.Name == "frmBookMaintenance")
                    {
                        b.Activate();
                        exist = true;
                        break;
                    }
                }
                if (!exist)
                {

                    frmBookMaintenance bk = new frmBookMaintenance();
                    bk.MdiParent = this;
                    bk.Show();
                }
            }
        }

        private void memberToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmMemberMaintenance")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {
                frmMemberMaintenance m = new frmMemberMaintenance();
                m.MdiParent = this;
                m.Show();
            }
        }

        private void borrowToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmBorrow")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {
                frmBorrow b = new frmBorrow();
                b.MdiParent = this;
                b.Show();
            }
        }

        private void returnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmReturn")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {

                frmReturn r = new frmReturn();
                r.MdiParent = this;
                r.Show();
            }
        }

        private void searchToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmSearch")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {

                frmSearch s = new frmSearch();
                s.MdiParent = this;
                s.Show();
            }
        }

        private void frmMain_FormClosing(object sender, FormClosingEventArgs e)
        {
            string message = "Would you like to exit the program?";
            string caption = "Exit Library Management System";
            MessageBoxButtons buttons = MessageBoxButtons.YesNo;
            DialogResult result;

            result = MessageBox.Show(this, message, caption, buttons);
            if (result == DialogResult.No)
            {
                e.Cancel = true;                                        //keep form open
            }
        }

        private void bookListToolStripMenuItem_Click(object sender, EventArgs e)
        {
            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmReportBookInfo")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {

                frmReportBookInfo rbi = new frmReportBookInfo();
                rbi.MdiParent = this;
                rbi.Show();
            }
        }

        private void mostPopularTitleToolStripMenuItem_Click(object sender, EventArgs e)
        {

            bool exist = false;
            foreach (Form b in this.MdiChildren)
            {
                if (b.Name == "frmReportPopularBook")
                {
                    b.Activate();
                    exist = true;
                    break;
                }
            }
            if (!exist)
            {

                frmReportPopularBook rpb = new frmReportPopularBook();
                rpb.MdiParent = this;
                rpb.Show();
            }
        }
    }
}
