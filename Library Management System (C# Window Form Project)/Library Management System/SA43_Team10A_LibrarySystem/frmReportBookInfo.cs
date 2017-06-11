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
    public partial class frmReportBookInfo : Form            
    {
        public frmReportBookInfo()
        {
            InitializeComponent();
        }

        private void frmReportBookInfo_Load(object sender, EventArgs e)
        {
            DataSetBookInfo ds = new DataSetBookInfo();
            DataSetBookInfoTableAdapters.BookInfoTableAdapter dst = new DataSetBookInfoTableAdapters.BookInfoTableAdapter();
            dst.Fill(ds.BookInfo);

            CrystalReportBookInfo cr = new CrystalReportBookInfo();
            cr.SetDataSource(ds);
            crystalReportViewer.ReportSource = cr;
        }
    }
}
