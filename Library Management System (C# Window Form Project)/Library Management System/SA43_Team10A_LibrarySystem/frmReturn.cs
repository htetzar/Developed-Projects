using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace SA43_Team10A_LibrarySystem
{
    public partial class frmReturn : Form                         
    {
        SA43_Team10A_LibrarySystemEntities ctx;
        DataTable dt = new DataTable();
        public frmReturn()
        {
            InitializeComponent();
            ctx = new SA43_Team10A_LibrarySystemEntities();
            dataGridView1.AutoGenerateColumns = false;
            CreateDataTable();
        }
        private void CreateDataTable()
        {
            dt.Columns.Add("TransactionID", typeof(string));
            dt.Columns.Add("BookID", typeof(int));
            dt.Columns.Add("BookTitle", typeof(string));
            dt.Columns.Add("Author", typeof(string));
            dt.Columns.Add("BookType", typeof(string));
            dt.Columns.Add("DateIssue", typeof(DateTime));
            dt.Columns.Add("DateDue", typeof(DateTime));
        }     

        private void button1_Click(object sender, EventArgs e)
        {
            textBox2.Clear();
            try
            {
                dt.Rows.Clear();
                int memberid = int.Parse(textBox1.Text);
                MembersDetail mb = ctx.MembersDetails.Single(x => x.MemberID == memberid);
                if (mb == null)
                { toolStripStatusLabel1.Text = "Invalid ID"; }

                else { textBox2.Text = mb.MemberName; }

                var transactionInfos = ctx.LoanRecords.Where(x => x.MemberID.ToString() == textBox1.Text)
                                                       .Select(x => new { TransactionID = x.TransactionID, DateIssue = x.DateIssue, DateDue = x.DateDue }).ToList();
                foreach (var info in transactionInfos)
                {
                    var bookIDs = ctx.LoanTransDetails.Where(x => x.TransactionID == info.TransactionID && x.LoanStatus == "out").Select(x => x.BookID).ToList();
                    var books = ctx.BooksDetails.Where(x => bookIDs.Contains(x.BookID)).Select(x => new { BookID = x.BookID, BookTitle = x.BookTitle, Author = x.Author, BookType = x.BookType });
                    foreach (var b in books)
                    {
                        DataRow r = dt.NewRow();
                        r["TransactionID"] = info.TransactionID;
                        r["BookID"] = b.BookID;
                        r["BookTitle"] = b.BookTitle;
                        r["Author"] = b.Author;


                        r["BookType"] = b.BookType;
                        r["DateIssue"] = info.DateIssue;
                        r["DateDue"] = info.DateDue;
                        dt.Rows.Add(r);
                    }
                }
                dataGridView1.DataSource = dt;


                if (dataGridView1.RowCount == 0)                                                     //for members who have no books to return currently
                {
                    toolStripStatusLabel1.Text = "There is no book pending return currently.";
                }
                else
                {
                    toolStripStatusLabel1.Text = "Please select one or more books to return.";      //clear message if members have books to return
                }

            }
            catch (Exception obj)
            {
                toolStripStatusLabel1.Text = "Please input the correct MemberID";
                textBox2.Text = "";
            }
        }
        private void clearTable()
        {
            DataRow dr;
            dt.Clear();
            dr = dt.NewRow();
            dataGridView1.DataSource = dt;
        }      

        private void btnReturn_Click(object sender, EventArgs e)
        {

            Int32 selectedRowCount = dataGridView1.Rows.GetRowCount(DataGridViewElementStates.Selected);
            if (selectedRowCount > 0)
            {
                foreach (DataGridViewRow row in dataGridView1.SelectedRows)
                {


                    int bookID = Convert.ToInt32(row.Cells[1].Value);
                    BooksDetail bd = ctx.BooksDetails.Where(x => x.BookID == bookID).First();
                    bd.NumberLoaned = Convert.ToInt16(bd.NumberLoaned - 1);

                    int transactionID = Convert.ToInt32(row.Cells[0].Value);
                    LoanTransDetail loanTran = ctx.LoanTransDetails.Where(x => x.BookID == bookID && x.TransactionID == transactionID).First();
                    loanTran.LoanStatus = "In";
                    loanTran.DateActualReturn = DateTime.Now;
                    ctx.SaveChanges();
                    dataGridView1.Rows.RemoveAt(row.Index);
                }

            }

            toolStripStatusLabel1.Text = "Successfully Updated.";
        }       
    }
}
