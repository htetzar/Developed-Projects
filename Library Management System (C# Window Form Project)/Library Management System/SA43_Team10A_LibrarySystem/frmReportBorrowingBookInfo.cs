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
    public partial class frmReportBorrowingBookInfo : Form               
    {
        CrystalReportBorrowingBookInfo report;
        public frmReportBorrowingBookInfo(CrystalReportBorrowingBookInfo report)
        {
            InitializeComponent();
            this.report = report;
        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {

        }

        private void frmReportBorrowingBookInfo_Load(object sender, EventArgs e)
        {
            this.crystalReportViewer1.ReportSource = report;
        }
    }
}
