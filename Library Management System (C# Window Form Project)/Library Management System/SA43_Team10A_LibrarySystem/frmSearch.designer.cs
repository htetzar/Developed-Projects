namespace SA43_Team10A_LibrarySystem
{
    partial class frmSearch
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
            this.labelBookTitle = new System.Windows.Forms.Label();
            this.labelAuthor = new System.Windows.Forms.Label();
            this.labelBookType = new System.Windows.Forms.Label();
            this.txtBookTilte = new System.Windows.Forms.TextBox();
            this.txtAuthor = new System.Windows.Forms.TextBox();
            this.txtBookType = new System.Windows.Forms.TextBox();
            this.buttonSearch = new System.Windows.Forms.Button();
            this.buttonCancel = new System.Windows.Forms.Button();
            this.dgvSearchLst = new System.Windows.Forms.DataGridView();
            this.toolStripText = new System.Windows.Forms.ToolStrip();
            this.toolStripLabelSearch = new System.Windows.Forms.ToolStripLabel();
            this.label3 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvSearchLst)).BeginInit();
            this.toolStripText.SuspendLayout();
            this.SuspendLayout();
            // 
            // labelBookTitle
            // 
            this.labelBookTitle.BackColor = System.Drawing.Color.Aquamarine;
            this.labelBookTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelBookTitle.Location = new System.Drawing.Point(294, 126);
            this.labelBookTitle.Name = "labelBookTitle";
            this.labelBookTitle.Size = new System.Drawing.Size(100, 23);
            this.labelBookTitle.TabIndex = 1;
            this.labelBookTitle.Text = "Book Title";
            this.labelBookTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelAuthor
            // 
            this.labelAuthor.BackColor = System.Drawing.Color.Aquamarine;
            this.labelAuthor.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelAuthor.Location = new System.Drawing.Point(294, 179);
            this.labelAuthor.Name = "labelAuthor";
            this.labelAuthor.Size = new System.Drawing.Size(100, 23);
            this.labelAuthor.TabIndex = 2;
            this.labelAuthor.Text = "Author";
            this.labelAuthor.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelBookType
            // 
            this.labelBookType.BackColor = System.Drawing.Color.Aquamarine;
            this.labelBookType.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelBookType.Location = new System.Drawing.Point(294, 233);
            this.labelBookType.Name = "labelBookType";
            this.labelBookType.Size = new System.Drawing.Size(100, 23);
            this.labelBookType.TabIndex = 3;
            this.labelBookType.Text = "Book Type";
            this.labelBookType.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtBookTilte
            // 
            this.txtBookTilte.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBookTilte.Location = new System.Drawing.Point(454, 126);
            this.txtBookTilte.Name = "txtBookTilte";
            this.txtBookTilte.Size = new System.Drawing.Size(150, 22);
            this.txtBookTilte.TabIndex = 4;
            // 
            // txtAuthor
            // 
            this.txtAuthor.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAuthor.Location = new System.Drawing.Point(454, 179);
            this.txtAuthor.Name = "txtAuthor";
            this.txtAuthor.Size = new System.Drawing.Size(150, 22);
            this.txtAuthor.TabIndex = 5;
            // 
            // txtBookType
            // 
            this.txtBookType.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtBookType.Location = new System.Drawing.Point(454, 235);
            this.txtBookType.Name = "txtBookType";
            this.txtBookType.Size = new System.Drawing.Size(150, 22);
            this.txtBookType.TabIndex = 6;
            // 
            // buttonSearch
            // 
            this.buttonSearch.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonSearch.Location = new System.Drawing.Point(319, 294);
            this.buttonSearch.Name = "buttonSearch";
            this.buttonSearch.Size = new System.Drawing.Size(75, 30);
            this.buttonSearch.TabIndex = 7;
            this.buttonSearch.Text = "Search";
            this.buttonSearch.UseVisualStyleBackColor = false;
            this.buttonSearch.Click += new System.EventHandler(this.buttonSearch_Click);
            // 
            // buttonCancel
            // 
            this.buttonCancel.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonCancel.Location = new System.Drawing.Point(454, 294);
            this.buttonCancel.Name = "buttonCancel";
            this.buttonCancel.Size = new System.Drawing.Size(75, 30);
            this.buttonCancel.TabIndex = 8;
            this.buttonCancel.Text = "Cancel";
            this.buttonCancel.UseVisualStyleBackColor = false;
            this.buttonCancel.Click += new System.EventHandler(this.buttonCancel_Click);
            // 
            // dgvSearchLst
            // 
            this.dgvSearchLst.AllowUserToAddRows = false;
            this.dgvSearchLst.AllowUserToDeleteRows = false;
            this.dgvSearchLst.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvSearchLst.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvSearchLst.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvSearchLst.Location = new System.Drawing.Point(121, 394);
            this.dgvSearchLst.Name = "dgvSearchLst";
            this.dgvSearchLst.ReadOnly = true;
            this.dgvSearchLst.Size = new System.Drawing.Size(601, 203);
            this.dgvSearchLst.TabIndex = 9;
            // 
            // toolStripText
            // 
            this.toolStripText.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.toolStripText.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabelSearch});
            this.toolStripText.Location = new System.Drawing.Point(0, 768);
            this.toolStripText.Name = "toolStripText";
            this.toolStripText.Size = new System.Drawing.Size(842, 25);
            this.toolStripText.TabIndex = 10;
            this.toolStripText.Text = "toolStrip1";
            // 
            // toolStripLabelSearch
            // 
            this.toolStripLabelSearch.Name = "toolStripLabelSearch";
            this.toolStripLabelSearch.Size = new System.Drawing.Size(0, 22);
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.BackColor = System.Drawing.Color.Aquamarine;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(371, 27);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 20);
            this.label3.TabIndex = 45;
            this.label3.Text = "Book Search";
            // 
            // frmSearch
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::SA43_Team10A_LibrarySystem.Properties.Resources.Picture1;
            this.ClientSize = new System.Drawing.Size(842, 793);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.toolStripText);
            this.Controls.Add(this.dgvSearchLst);
            this.Controls.Add(this.buttonCancel);
            this.Controls.Add(this.buttonSearch);
            this.Controls.Add(this.txtBookType);
            this.Controls.Add(this.txtAuthor);
            this.Controls.Add(this.txtBookTilte);
            this.Controls.Add(this.labelBookType);
            this.Controls.Add(this.labelAuthor);
            this.Controls.Add(this.labelBookTitle);
            this.Name = "frmSearch";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Book Search";
            ((System.ComponentModel.ISupportInitialize)(this.dgvSearchLst)).EndInit();
            this.toolStripText.ResumeLayout(false);
            this.toolStripText.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelBookTitle;
        private System.Windows.Forms.Label labelAuthor;
        private System.Windows.Forms.Label labelBookType;
        private System.Windows.Forms.TextBox txtBookTilte;
        private System.Windows.Forms.TextBox txtAuthor;
        private System.Windows.Forms.TextBox txtBookType;
        private System.Windows.Forms.Button buttonSearch;
        private System.Windows.Forms.Button buttonCancel;
        private System.Windows.Forms.DataGridView dgvSearchLst;
        private System.Windows.Forms.ToolStrip toolStripText;
        private System.Windows.Forms.ToolStripLabel toolStripLabelSearch;
        private System.Windows.Forms.Label label3;
    }
}