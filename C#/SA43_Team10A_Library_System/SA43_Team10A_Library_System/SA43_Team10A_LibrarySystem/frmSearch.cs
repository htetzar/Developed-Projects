using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace SA43_Team10A_LibrarySystem
{
    public partial class frmSearch : Form                      //coding done by Krithiga Gunasekaran
    {
        SA43_Team10A_LibrarySystemEntities ctx = new SA43_Team10A_LibrarySystemEntities();
        List<BooksDetail> bookLst ;
        
        public frmSearch()
        {
            InitializeComponent();
            bookLst = ctx.BooksDetails.ToList();
        }

        
        private void buttonSearch_Click(object sender, EventArgs e)
        {
           for (int i = 0; i < bookLst.Count; i++)
            {            
                if (bookLst[i].BookTitle.ToLower().Contains(txtBookTilte.Text.ToLower()) || 
                    bookLst[i].Author.ToLower().Contains(txtAuthor.Text.ToLower()) ||
                    bookLst[i].BookType.ToLower().Contains(txtBookType.Text.ToLower()))
                {
                    var list = ctx.BooksDetails.Where(x => x.BookTitle.ToLower().Contains(txtBookTilte.Text.ToLower()) ||
                                                                 x.Author.ToLower().Contains(txtAuthor.Text.ToLower()) ||
                                                                 x.BookType.ToLower().Contains(txtBookType.Text.ToLower())).Select(x => new { x.BookTitle, x.Author, x.BookType, x.ISBN }).ToList();
                    dgvSearchLst.DataSource = list;
                    toolStripLabelSearch.Text = "Record Found";
                }
                else if (txtBookTilte.Text == "" && txtAuthor.Text == "" && txtBookType.Text == "")
                {
                    toolStripLabelSearch.Text = "Please Enter the Search Keywords";
                }

                toolStripLabelSearch.Text = "No Record"; 
            } 
        }

        private void buttonCancel_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
