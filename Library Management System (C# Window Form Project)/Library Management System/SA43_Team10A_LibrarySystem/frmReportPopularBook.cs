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
    public partial class frmReportPopularBook : Form             
    {
        public frmReportPopularBook()
        {
            InitializeComponent();
        }

        private void frmReportPopularBook_Load(object sender, EventArgs e)
        {
            DataSetBookInfo ds = new DataSetBookInfo();
            DataSetBookInfoTableAdapters.PopularbookTableAdapter ta = new DataSetBookInfoTableAdapters.PopularbookTableAdapter();
            ta.Fill(ds.Popularbook);
            CrystalReportPopularbook cr = new CrystalReportPopularbook();
            cr.SetDataSource(ds);
            crystalReportViewer1.ReportSource = cr;
            //.popular6TableAdapter ta = new DataSetpopularbookTableAdapters.popular6TableAdapter();
            //ta.Fill(ds.popular6);



            //CrystalReportpopularbook cr = new CrystalReportpopularbook();
            ////CrystalReportpopularbook1 cr = new CrystalReportpopularbook1();
            //cr.SetDataSource(ds);
            //crystalReportViewer1.ReportSource = cr;
        }
    }
}
