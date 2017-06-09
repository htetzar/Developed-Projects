using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.Entity.Infrastructure;

namespace SA43_Team10A_LibrarySystem
{
    public partial class frmBookMaintenance : Form       //coding done by Kun Mei Ching
    {
        static int posn;
        SA43_Team10A_LibrarySystemEntities ctx;
        List<BooksDetail> blst;
        
        public frmBookMaintenance()
        {
            InitializeComponent();
        }

        private void frmBookMaintenance_Load(object sender, EventArgs e)
        {
            ctx = new SA43_Team10A_LibrarySystemEntities();
            blst = ctx.BooksDetails.ToList();
            InitialState();
            
        }

     
        private void PopulateTextBoxes()
        {
            txtBookID.Text = Convert.ToString(blst[posn].BookID);
            txtBookTitle.Text = blst[posn].BookTitle;
            txtAuthor.Text = blst[posn].Author;
            txtBookType.Text = blst[posn].BookType;
            txtISBN.Text = Convert.ToString(blst[posn].ISBN);
            txtTotalStock.Text = Convert.ToString(blst[posn].TotalStock);
            txtNumberOnLoan.Text = Convert.ToString(blst[posn].NumberLoaned);
            string bookRecord = Convert.ToString(posn + 1);
            tslblBookMaintenance.Text = "Record: " + bookRecord;
        }

        private void RetrieveTextBoxes()
        {            
            //BookID is an identity column
            blst[posn].BookTitle = txtBookTitle.Text;  
            blst[posn].Author = txtAuthor.Text;
            blst[posn].BookType = txtBookType.Text ;
            blst[posn].ISBN = Convert.ToInt64(txtISBN.Text);
            blst[posn].TotalStock = Convert.ToInt16(txtTotalStock.Text);
            blst[posn].NumberLoaned = Convert.ToInt16(txtNumberOnLoan.Text);
            
            
        }

        private void btnLoad_Click(object sender, EventArgs e)
        {
            posn = 0;
            PopulateTextBoxes();
            AfterLoad();
        }

        private void btnFind_Click(object sender, EventArgs e)
        {
            int IDinput = Convert.ToInt32(txtFind.Text.Trim());
            int i = blst.FindIndex(x => x.BookID == IDinput);
            if (i >= 0)
            {
                posn = i;
                PopulateTextBoxes();
            }
            else
            {
                tslblBookMaintenance.Text = "No record found.";
            }
        }

        private void btnPrevious_Click(object sender, EventArgs e)
        {
            if(posn > 0)
            {
                posn--;
                PopulateTextBoxes();
            }
            else
            {
                tslblBookMaintenance.Text = "This is the first record.";
            }
            
        }

        private void btnFirst_Click(object sender, EventArgs e)
        {
            if(posn > 0)
            {
                posn = 0;
                PopulateTextBoxes();
            }
            else
            {
                tslblBookMaintenance.Text = "This is the first record.";
            }
        }

        private void btnNext_Click(object sender, EventArgs e)
        {
            if(posn<blst.Count-1)
            {
                posn++;
                PopulateTextBoxes();
            }
            else
            {
                tslblBookMaintenance.Text = "This is the last record.";
            }
        }

        private void btnLast_Click(object sender, EventArgs e)
        {
            if (posn < blst.Count-1)
            {
                posn = blst.Count-1;
                PopulateTextBoxes();
            }
            else
            {
                tslblBookMaintenance.Text = "This is the last record.";
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            BooksDetail b = new BooksDetail();
            
            b.BookTitle = "";
            b.Author = "";
            b.BookType = "";
            b.ISBN = null;
            b.TotalStock = null;
            b.NumberLoaned = null;
            blst.Add(b);
            ctx.BooksDetails.Add(b);
            posn = blst.Count - 1;
            PopulateTextBoxes();
            txtBookID.Text = "";
           
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            int count = 0;
            try
            {
                RetrieveTextBoxes();
            }
            catch (FormatException ex)
            {
                MessageBox.Show("Please enter numeric value!");
                count++;
            }
            if (count == 0)
            {
                ctx.SaveChanges();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int curPos = posn;
            BooksDetail b = blst[curPos];
            try
            {
                ctx.BooksDetails.Remove(b);
                ctx.SaveChanges();
                if (posn > 0)
                {
                    posn--;
                    PopulateTextBoxes();
                }
            }
            catch(DbUpdateException db)                    //rows linked to loan tran details cannot be deleted due to relationship
            {
                MessageBox.Show("This books have previous loan records.", "Unable to delete record");
            }
        }

        private void txtISBN_TextChanged(object sender, EventArgs e) //warning to enter numerical input only 
        {
                       
            string text = txtISBN.Text;
            bool isNumeric = false;
            foreach (char input in text)
            {
                if (char.IsDigit(input))
                {
                    isNumeric = true;
                    break;
                }
            }
            if (isNumeric || text == "")
            {
                errorProviderISBN.Clear();

            }
            else
            {
                errorProviderISBN.SetError(txtISBN, "Please enter in numerical format");
            }           
        }

        private void txtTotalStock_TextChanged(object sender, EventArgs e) //warning to enter numerical input only  
        {
            string text = txtTotalStock.Text;
            bool isNumeric = false;
            foreach(char input in text)
            {
                if(char.IsDigit(input))
                {
                    isNumeric = true;
                    break;
                }
            }
  
            if (isNumeric || text =="")
            {
                errorProviderTotalStock.Clear();
                
            }
            else
            {
                errorProviderTotalStock.SetError(txtTotalStock, "Please enter in numerical format");
            }

        }

        private void txtNumberOnLoan_TextChanged(object sender, EventArgs e) //warning to enter numerical input only 
        {
            string text = txtNumberOnLoan.Text;
            bool isNumeric = false;
            foreach (char input in text)
            {
                if(char.IsDigit(input))
                {
                    isNumeric = true;
                    break;
                }
            }
          
            if (isNumeric || text == "")
            {
                errorProviderNumberLoaned.Clear();

            }
            else
            {
                errorProviderNumberLoaned.SetError(txtNumberOnLoan, "Please enter in numerical format");               
            }
        }


        private void txtFind_TextChanged(object sender, EventArgs e) //warning to enter numerical input only 
        {
            string text = txtFind.Text;
            bool isNumeric = false;
            foreach(char input in text)
            {
                if(char.IsDigit(input))
                {
                    isNumeric = true;
                    break;
                }
            }
            if(isNumeric || text == "")
            {
                errorProviderFindID.Clear();
            }
            else
            {
                errorProviderFindID.SetError(txtFind, "Please enter in numerical format");
            }

        }
        private void InitialState()   // only load button enabled after form is initialised
        {
            btnAdd.Enabled = false;
            btnDelete.Enabled = false;
            btnFind.Enabled = false;
            btnFirst.Enabled = false;
            btnLast.Enabled = false;
            btnNext.Enabled = false;
            btnPrevious.Enabled = false;
            btnUpdate.Enabled = false;
        }

        private void AfterLoad() // all options available
        {
            btnAdd.Enabled = true;
            btnDelete.Enabled = true;
            btnFind.Enabled = true;
            btnFirst.Enabled = true;
            btnLast.Enabled = true;
            btnNext.Enabled = true;
            btnPrevious.Enabled = true;
            btnUpdate.Enabled = true;
        }
        
    }
}
