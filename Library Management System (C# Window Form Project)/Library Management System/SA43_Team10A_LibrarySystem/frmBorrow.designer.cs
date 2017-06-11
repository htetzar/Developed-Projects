namespace SA43_Team10A_LibrarySystem
{
    partial class frmBorrow
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.lblMemberID = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.txtMemberID = new System.Windows.Forms.TextBox();
            this.txtRemarks = new System.Windows.Forms.TextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.txtMemberName = new System.Windows.Forms.TextBox();
            this.txtBookID = new System.Windows.Forms.TextBox();
            this.btnMemberSearch = new System.Windows.Forms.Button();
            this.dgvBorrowInfo = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column4 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column5 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.dtpDateIssue = new System.Windows.Forms.DateTimePicker();
            this.dtpDueDate = new System.Windows.Forms.DateTimePicker();
            this.errorProvider1 = new System.Windows.Forms.ErrorProvider(this.components);
            this.txtBookTitle = new System.Windows.Forms.TextBox();
            this.toolStripLabel1 = new System.Windows.Forms.ToolStripLabel();
            this.tspToolStrip = new System.Windows.Forms.ToolStrip();
            this.label3 = new System.Windows.Forms.Label();
            this.lblMemberName = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.gbMember = new System.Windows.Forms.GroupBox();
            this.gbBook = new System.Windows.Forms.GroupBox();
            this.btnPrint = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.dgvBorrowInfo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).BeginInit();
            this.tspToolStrip.SuspendLayout();
            this.gbMember.SuspendLayout();
            this.gbBook.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblMemberID
            // 
            this.lblMemberID.BackColor = System.Drawing.Color.Aquamarine;
            this.lblMemberID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMemberID.Location = new System.Drawing.Point(30, 30);
            this.lblMemberID.Name = "lblMemberID";
            this.lblMemberID.Size = new System.Drawing.Size(100, 23);
            this.lblMemberID.TabIndex = 24;
            this.lblMemberID.Text = "Member ID";
            this.lblMemberID.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label2
            // 
            this.label2.BackColor = System.Drawing.Color.Aquamarine;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(29, 27);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(100, 23);
            this.label2.TabIndex = 25;
            this.label2.Text = "Book ID";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label4
            // 
            this.label4.BackColor = System.Drawing.Color.Aquamarine;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label4.Location = new System.Drawing.Point(230, 267);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(100, 23);
            this.label4.TabIndex = 27;
            this.label4.Text = "Date Issue";
            this.label4.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label5
            // 
            this.label5.BackColor = System.Drawing.Color.Aquamarine;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label5.Location = new System.Drawing.Point(230, 302);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(100, 23);
            this.label5.TabIndex = 28;
            this.label5.Text = "Due Date";
            this.label5.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label6
            // 
            this.label6.BackColor = System.Drawing.Color.Aquamarine;
            this.label6.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label6.Location = new System.Drawing.Point(230, 351);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(100, 23);
            this.label6.TabIndex = 29;
            this.label6.Text = "Remarks";
            this.label6.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtMemberID
            // 
            this.txtMemberID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMemberID.Location = new System.Drawing.Point(174, 28);
            this.txtMemberID.Name = "txtMemberID";
            this.txtMemberID.Size = new System.Drawing.Size(100, 22);
            this.txtMemberID.TabIndex = 0;
            this.txtMemberID.PreviewKeyDown += new System.Windows.Forms.PreviewKeyDownEventHandler(this.txtMemberID_PreviewKeyDown);
            // 
            // txtRemarks
            // 
            this.txtRemarks.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtRemarks.Location = new System.Drawing.Point(374, 352);
            this.txtRemarks.Multiline = true;
            this.txtRemarks.Name = "txtRemarks";
            this.txtRemarks.Size = new System.Drawing.Size(238, 59);
            this.txtRemarks.TabIndex = 6;
            // 
            // btnAdd
            // 
            this.btnAdd.BackColor = System.Drawing.Color.Aquamarine;
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(259, 437);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(75, 30);
            this.btnAdd.TabIndex = 7;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.BackColor = System.Drawing.Color.Aquamarine;
            this.btnUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdate.Location = new System.Drawing.Point(372, 437);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(75, 30);
            this.btnUpdate.TabIndex = 8;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // txtMemberName
            // 
            this.txtMemberName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMemberName.Location = new System.Drawing.Point(174, 69);
            this.txtMemberName.Name = "txtMemberName";
            this.txtMemberName.Size = new System.Drawing.Size(234, 22);
            this.txtMemberName.TabIndex = 1;
            // 
            // txtBookID
            // 
            this.txtBookID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBookID.Location = new System.Drawing.Point(173, 27);
            this.txtBookID.Name = "txtBookID";
            this.txtBookID.Size = new System.Drawing.Size(100, 22);
            this.txtBookID.TabIndex = 2;
            this.txtBookID.PreviewKeyDown += new System.Windows.Forms.PreviewKeyDownEventHandler(this.txtBookID_PreviewKeyDown);
            // 
            // btnMemberSearch
            // 
            this.btnMemberSearch.Location = new System.Drawing.Point(280, 27);
            this.btnMemberSearch.Name = "btnMemberSearch";
            this.btnMemberSearch.Size = new System.Drawing.Size(27, 23);
            this.btnMemberSearch.TabIndex = 41;
            this.btnMemberSearch.Text = "...";
            this.btnMemberSearch.UseVisualStyleBackColor = true;
            this.btnMemberSearch.Click += new System.EventHandler(this.btnMemberSearch_Click);
            // 
            // dgvBorrowInfo
            // 
            this.dgvBorrowInfo.AllowUserToAddRows = false;
            this.dgvBorrowInfo.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvBorrowInfo.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvBorrowInfo.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3,
            this.Column4,
            this.Column5});
            this.dgvBorrowInfo.Location = new System.Drawing.Point(57, 504);
            this.dgvBorrowInfo.Name = "dgvBorrowInfo";
            this.dgvBorrowInfo.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.CellSelect;
            this.dgvBorrowInfo.Size = new System.Drawing.Size(820, 252);
            this.dgvBorrowInfo.TabIndex = 42;
            this.dgvBorrowInfo.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvBorrowInfo_CellContentClick);
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "MemberID";
            this.Column1.HeaderText = "MemberID";
            this.Column1.Name = "Column1";
            // 
            // Column2
            // 
            this.Column2.DataPropertyName = "BookID";
            this.Column2.HeaderText = "BookID";
            this.Column2.Name = "Column2";
            // 
            // Column3
            // 
            this.Column3.DataPropertyName = "DateIssue";
            this.Column3.HeaderText = "DateIssue";
            this.Column3.Name = "Column3";
            // 
            // Column4
            // 
            this.Column4.DataPropertyName = "DueDate";
            this.Column4.HeaderText = "DueDate";
            this.Column4.Name = "Column4";
            // 
            // Column5
            // 
            this.Column5.DataPropertyName = "Remarks";
            this.Column5.HeaderText = "Remarks";
            this.Column5.Name = "Column5";
            // 
            // dtpDateIssue
            // 
            this.dtpDateIssue.Font = new System.Drawing.Font("Microsoft Sans Serif", 8.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpDateIssue.Location = new System.Drawing.Point(374, 270);
            this.dtpDateIssue.Name = "dtpDateIssue";
            this.dtpDateIssue.Size = new System.Drawing.Size(238, 20);
            this.dtpDateIssue.TabIndex = 4;
            // 
            // dtpDueDate
            // 
            this.dtpDueDate.Location = new System.Drawing.Point(374, 311);
            this.dtpDueDate.Name = "dtpDueDate";
            this.dtpDueDate.Size = new System.Drawing.Size(238, 20);
            this.dtpDueDate.TabIndex = 5;
            this.dtpDueDate.ValueChanged += new System.EventHandler(this.dtpDueDate_ValueChanged);
            // 
            // errorProvider1
            // 
            this.errorProvider1.ContainerControl = this;
            // 
            // txtBookTitle
            // 
            this.txtBookTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBookTitle.Location = new System.Drawing.Point(174, 68);
            this.txtBookTitle.Multiline = true;
            this.txtBookTitle.Name = "txtBookTitle";
            this.txtBookTitle.Size = new System.Drawing.Size(234, 45);
            this.txtBookTitle.TabIndex = 3;
            // 
            // toolStripLabel1
            // 
            this.toolStripLabel1.Name = "toolStripLabel1";
            this.toolStripLabel1.Size = new System.Drawing.Size(0, 22);
            // 
            // tspToolStrip
            // 
            this.tspToolStrip.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.tspToolStrip.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel1});
            this.tspToolStrip.Location = new System.Drawing.Point(0, 768);
            this.tspToolStrip.Name = "tspToolStrip";
            this.tspToolStrip.Size = new System.Drawing.Size(842, 25);
            this.tspToolStrip.TabIndex = 43;
            this.tspToolStrip.Text = "toolStrip1";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Aquamarine;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(367, 11);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(108, 20);
            this.label3.TabIndex = 44;
            this.label3.Text = "Borrow Books";
            // 
            // lblMemberName
            // 
            this.lblMemberName.BackColor = System.Drawing.Color.Aquamarine;
            this.lblMemberName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMemberName.Location = new System.Drawing.Point(30, 69);
            this.lblMemberName.Name = "lblMemberName";
            this.lblMemberName.Size = new System.Drawing.Size(100, 23);
            this.lblMemberName.TabIndex = 45;
            this.lblMemberName.Text = "Member Name";
            this.lblMemberName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Aquamarine;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(29, 68);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 46;
            this.label1.Text = "Book Title";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // gbMember
            // 
            this.gbMember.BackColor = System.Drawing.Color.Transparent;
            this.gbMember.Controls.Add(this.lblMemberID);
            this.gbMember.Controls.Add(this.txtMemberID);
            this.gbMember.Controls.Add(this.lblMemberName);
            this.gbMember.Controls.Add(this.txtMemberName);
            this.gbMember.Controls.Add(this.btnMemberSearch);
            this.gbMember.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbMember.Location = new System.Drawing.Point(205, 34);
            this.gbMember.Name = "gbMember";
            this.gbMember.Size = new System.Drawing.Size(432, 105);
            this.gbMember.TabIndex = 47;
            this.gbMember.TabStop = false;
            this.gbMember.Text = "Member";
            // 
            // gbBook
            // 
            this.gbBook.BackColor = System.Drawing.Color.Transparent;
            this.gbBook.Controls.Add(this.label2);
            this.gbBook.Controls.Add(this.txtBookID);
            this.gbBook.Controls.Add(this.label1);
            this.gbBook.Controls.Add(this.txtBookTitle);
            this.gbBook.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.gbBook.Location = new System.Drawing.Point(205, 140);
            this.gbBook.Name = "gbBook";
            this.gbBook.Size = new System.Drawing.Size(432, 119);
            this.gbBook.TabIndex = 48;
            this.gbBook.TabStop = false;
            this.gbBook.Text = "Book";
            // 
            // btnPrint
            // 
            this.btnPrint.BackColor = System.Drawing.Color.Aquamarine;
            this.btnPrint.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPrint.Location = new System.Drawing.Point(485, 437);
            this.btnPrint.Name = "btnPrint";
            this.btnPrint.Size = new System.Drawing.Size(75, 30);
            this.btnPrint.TabIndex = 49;
            this.btnPrint.Text = "Print";
            this.btnPrint.UseVisualStyleBackColor = false;
            this.btnPrint.Click += new System.EventHandler(this.btnPrint_Click);
            // 
            // frmBorrow
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::SA43_Team10A_LibrarySystem.Properties.Resources.Picture1;
            this.ClientSize = new System.Drawing.Size(842, 793);
            this.Controls.Add(this.btnPrint);
            this.Controls.Add(this.gbBook);
            this.Controls.Add(this.gbMember);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.tspToolStrip);
            this.Controls.Add(this.dtpDueDate);
            this.Controls.Add(this.dtpDateIssue);
            this.Controls.Add(this.dgvBorrowInfo);
            this.Controls.Add(this.btnUpdate);
            this.Controls.Add(this.btnAdd);
            this.Controls.Add(this.txtRemarks);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Name = "frmBorrow";
            this.Text = "Borrow Books";
            this.Load += new System.EventHandler(this.frmBorrow_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvBorrowInfo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errorProvider1)).EndInit();
            this.tspToolStrip.ResumeLayout(false);
            this.tspToolStrip.PerformLayout();
            this.gbMember.ResumeLayout(false);
            this.gbMember.PerformLayout();
            this.gbBook.ResumeLayout(false);
            this.gbBook.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblMemberID;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.TextBox txtMemberID;
        private System.Windows.Forms.TextBox txtRemarks;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.TextBox txtMemberName;
        private System.Windows.Forms.TextBox txtBookID;
        private System.Windows.Forms.Button btnMemberSearch;
        private System.Windows.Forms.DataGridView dgvBorrowInfo;
        private System.Windows.Forms.DateTimePicker dtpDateIssue;
        private System.Windows.Forms.DateTimePicker dtpDueDate;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column4;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column5;
        private System.Windows.Forms.ErrorProvider errorProvider1;
        private System.Windows.Forms.TextBox txtBookTitle;
        private System.Windows.Forms.ToolStrip tspToolStrip;
        private System.Windows.Forms.ToolStripLabel toolStripLabel1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label lblMemberName;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.GroupBox gbBook;
        private System.Windows.Forms.GroupBox gbMember;
        private System.Windows.Forms.Button btnPrint;
    }
}