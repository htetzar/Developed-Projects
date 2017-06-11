using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Transactions;

namespace SA43_Team10A_LibrarySystem
{
    public partial class frmBorrow : Form                   
    {
        DataTable dt = new DataTable();
        SA43_Team10A_LibrarySystemEntities ctx;
        int transactionID;
        int memberID;
        List<int> bookList = new List<int>();
        DateTime dateIssue;
        DateTime dateDue;
        public frmBorrow()
        {
            InitializeComponent();
            CreateBorrowInfoTable();
            dgvBorrowInfo.AutoGenerateColumns = false;
            ctx = new SA43_Team10A_LibrarySystemEntities();
        }

        private void CreateBorrowInfoTable()
        {
            dt.Columns.Add("MemberID", typeof(int));
            dt.Columns.Add("BookID", typeof(int));
            dt.Columns.Add("DateIssue", typeof(DateTime));
            dt.Columns.Add("DueDate", typeof(DateTime));
            dt.Columns.Add("Remarks", typeof(string));
            DataGridViewLinkColumn Deletelink = new DataGridViewLinkColumn();
            Deletelink.UseColumnTextForLinkValue = true;
            Deletelink.DataPropertyName = "linkColumn";
            Deletelink.LinkBehavior = LinkBehavior.SystemDefault;
            Deletelink.Text = "Delete";
            dgvBorrowInfo.Columns.Add(Deletelink);

        }

        private void btnMemberSearch_Click(object sender, EventArgs e)
        {
            frmMemberSearch frm = new frmMemberSearch();
            frm.ShowDialog();
            if (frm.SelectedMemberID != "" && frm.SelectedMemberName != "")
            {
                txtMemberID.Text = frm.SelectedMemberID;
                txtMemberName.Text = frm.SelectedMemberName;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            toolStripLabel1.Text = "";
            List<int> transactionIds = ctx.LoanRecords.Where(x => x.MemberID.ToString() == txtMemberID.Text).Select(x => x.TransactionID).ToList();

            bool canNotRent = ctx.BooksDetails.Any(x => x.BookID.ToString() == txtBookID.Text && x.TotalStock == x.NumberLoaned);

            int count = ctx.LoanTransDetails.Count(x => transactionIds.Contains(x.TransactionID) && x.LoanStatus == "Out");
            if (count >= 3)
            {
                toolStripLabel1.Text = "Already borrowed three books!";
            }

            else if (canNotRent)
            {
                toolStripLabel1.Text = "There is no more books left to rent.All books are rented!";
            }            
             
            else if (dgvBorrowInfo.Rows.Count == 3)
            {
                toolStripLabel1.Text = "Cannot borrow more than three books!";
            }
            else
            {
                var row = dt.NewRow();
                row["MemberID"] = txtMemberID.Text;
                row["BookID"] = txtBookID.Text;
                row["DateIssue"] = dtpDateIssue.Value;
                row["DueDate"] = dtpDueDate.Value;
                row["Remarks"] = txtRemarks.Text;
                dt.Rows.Add(row);
                dgvBorrowInfo.DataSource = dt;
                txtBookID.Text = "";
                txtRemarks.Text = "";
            }
            
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            using (TransactionScope ts = new TransactionScope())
            {

                LoanRecord rec = new LoanRecord();
                rec.MemberID = Convert.ToInt32(txtMemberID.Text);
                this.memberID = rec.MemberID;
                rec.DateIssue = dtpDateIssue.Value;
                this.dateIssue = dtpDateIssue.Value;
                rec.DateDue = dtpDueDate.Value;
                this.dateDue = dtpDueDate.Value;
                rec.Remarks = txtRemarks.Text;
                ctx.LoanRecords.Add(rec);
                int transactionID = ctx.SaveChanges();
                for (int i = 0; i < dgvBorrowInfo.Rows.Count; i++)

                {
                    LoanTransDetail detail = new LoanTransDetail();
                    detail.TransactionID = rec.TransactionID;
                    this.transactionID = detail.TransactionID;                   
                    int bookID = Convert.ToInt32(dgvBorrowInfo.Rows[i].Cells[1].Value);
                    bookList.Add(bookID);
                    detail.BookID = bookID;
                    detail.LoanStatus = "Out";
                    ctx.LoanTransDetails.Add(detail);
                    ctx.BooksDetails.Where(b => b.BookID == bookID).First().NumberLoaned++;
                }
                ctx.SaveChanges();
                ts.Complete();
            }

            txtMemberID.Text = "";
            txtMemberName.Text = "";
            txtBookID.Text = "";
            txtRemarks.Text = "";
            dt.Rows.Clear();

        }

        private void dgvBorrowInfo_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.ColumnIndex == 5)
            {
                if (DialogResult.OK == MessageBox.Show("Are you sure to delete this row?", "Delete", MessageBoxButtons.OKCancel))
                {
                    dt.Rows.RemoveAt(e.RowIndex);
                    dgvBorrowInfo.DataSource = null;
                    dgvBorrowInfo.DataSource = dt;
                }
            }
        }

        private void frmBorrow_Load(object sender, EventArgs e)
        {

        }

        private void txtBookID_PreviewKeyDown(object sender, PreviewKeyDownEventArgs e)
        {  
            try
            {

            if (e.KeyData == Keys.Tab)
            {
                BooksDetail bd = ctx.BooksDetails.Where(x => x.BookID.ToString() == txtBookID.Text).First();
                txtBookTitle.Text = bd.BookTitle;
            }
            }
            catch (InvalidOperationException)
            {
                txtBookTitle.Text = "";
                toolStripLabel1.Text = "Please enter a valid Book ID before pressing tab";
            }


        }

        private void dtpDueDate_ValueChanged(object sender, EventArgs e)
        {

            if (dtpDueDate.Value < dtpDateIssue.Value)
            {
                errorProvider1.SetError(dtpDueDate, "Due Date should be later than Issue Date!");
            }
            else
            {
                errorProvider1.Clear();
            }
        }

        private void txtMemberName_PreviewKeyDown(object sender, PreviewKeyDownEventArgs e)
        {

        }

        private void txtMemberID_PreviewKeyDown(object sender, PreviewKeyDownEventArgs e)
        {
            try
            {

            if(e.KeyData == Keys.Tab)
            {
                MembersDetail md = ctx.MembersDetails.Where(x => x.MemberID.ToString() == txtMemberID.Text).First();
                txtMemberName.Text = md.MemberName;
            }
            }
            catch (InvalidOperationException)
            {
                txtBookTitle.Text = "";
                toolStripLabel1.Text = "Please enter a valid Member ID before pressing tab";
            }

        }

        private void btnPrint_Click(object sender, EventArgs e)
        {
            DataSetBookInfo ds = new DataSetBookInfo();
            DataSetBookInfoTableAdapters.ReceiptTableAdapter adapter = new DataSetBookInfoTableAdapters.ReceiptTableAdapter();            
            adapter.Fill(ds.Receipt);
            CrystalReportBorrowingBookInfo cr = new CrystalReportBorrowingBookInfo();
            var aa = ds.Receipt.Where(x => x.TransactionID == transactionID && x.MemberID == memberID && bookList.Contains(x.BookID)).ToList();
            cr.SetDataSource(ds.Receipt.Where(x => x.TransactionID == transactionID && x.MemberID == memberID && bookList.Contains(x.BookID))
                                       .Select(x => new { MemberID = x.MemberID, BookID = x.BookID, BookTitle = x.BookTitle, Author = x.Author, BookType = x.BookType, DateIssue = x.DateIssue, DateDue = x.DateDue }).ToList());
            frmReportBorrowingBookInfo viewer = new frmReportBorrowingBookInfo(cr);
            viewer.Show();

        }
    }
}
