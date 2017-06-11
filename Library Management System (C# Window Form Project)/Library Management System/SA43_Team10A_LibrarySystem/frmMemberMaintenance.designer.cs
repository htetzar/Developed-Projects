namespace SA43_Team10A_LibrarySystem
{
    partial class frmMemberMaintenance
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
            this.labelTitle = new System.Windows.Forms.Label();
            this.labelMemID = new System.Windows.Forms.Label();
            this.labelMemName = new System.Windows.Forms.Label();
            this.labelBirthDate = new System.Windows.Forms.Label();
            this.labelAddress = new System.Windows.Forms.Label();
            this.labelPostalCode = new System.Windows.Forms.Label();
            this.labelPhoneNumber = new System.Windows.Forms.Label();
            this.txtMemberID = new System.Windows.Forms.TextBox();
            this.txtMemberName = new System.Windows.Forms.TextBox();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.txtPostalCode = new System.Windows.Forms.TextBox();
            this.txtPhoneNumber = new System.Windows.Forms.TextBox();
            this.buttonAdd = new System.Windows.Forms.Button();
            this.buttonUpdate = new System.Windows.Forms.Button();
            this.buttonDelete = new System.Windows.Forms.Button();
            this.buttonLoad = new System.Windows.Forms.Button();
            this.buttonPrevious = new System.Windows.Forms.Button();
            this.buttonNext = new System.Windows.Forms.Button();
            this.buttonLastRecord = new System.Windows.Forms.Button();
            this.buttonFirstRecord = new System.Windows.Forms.Button();
            this.buttonFind = new System.Windows.Forms.Button();
            this.txtFind = new System.Windows.Forms.TextBox();
            this.dtpBirthDate = new System.Windows.Forms.DateTimePicker();
            this.toolStripStatus = new System.Windows.Forms.ToolStrip();
            this.toolStripLabel = new System.Windows.Forms.ToolStripLabel();
            this.chkBirthDate = new System.Windows.Forms.CheckBox();
            this.label1 = new System.Windows.Forms.Label();
            this.txtEmailAddress = new System.Windows.Forms.TextBox();
            this.toolStripStatus.SuspendLayout();
            this.SuspendLayout();
            // 
            // labelTitle
            // 
            this.labelTitle.BackColor = System.Drawing.Color.Aquamarine;
            this.labelTitle.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelTitle.Location = new System.Drawing.Point(257, 26);
            this.labelTitle.Name = "labelTitle";
            this.labelTitle.Size = new System.Drawing.Size(252, 23);
            this.labelTitle.TabIndex = 1;
            this.labelTitle.Text = "Member Maintenance";
            this.labelTitle.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelMemID
            // 
            this.labelMemID.BackColor = System.Drawing.Color.Aquamarine;
            this.labelMemID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelMemID.ForeColor = System.Drawing.Color.Black;
            this.labelMemID.Location = new System.Drawing.Point(190, 157);
            this.labelMemID.Name = "labelMemID";
            this.labelMemID.Size = new System.Drawing.Size(100, 23);
            this.labelMemID.TabIndex = 2;
            this.labelMemID.Text = "Member ID";
            this.labelMemID.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelMemName
            // 
            this.labelMemName.BackColor = System.Drawing.Color.Aquamarine;
            this.labelMemName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelMemName.ForeColor = System.Drawing.Color.Black;
            this.labelMemName.Location = new System.Drawing.Point(190, 210);
            this.labelMemName.Name = "labelMemName";
            this.labelMemName.Size = new System.Drawing.Size(100, 23);
            this.labelMemName.TabIndex = 3;
            this.labelMemName.Text = "Member Name";
            this.labelMemName.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelBirthDate
            // 
            this.labelBirthDate.BackColor = System.Drawing.Color.Aquamarine;
            this.labelBirthDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelBirthDate.ForeColor = System.Drawing.Color.Black;
            this.labelBirthDate.Location = new System.Drawing.Point(190, 258);
            this.labelBirthDate.Name = "labelBirthDate";
            this.labelBirthDate.Size = new System.Drawing.Size(100, 23);
            this.labelBirthDate.TabIndex = 4;
            this.labelBirthDate.Text = "Birth Date";
            this.labelBirthDate.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelAddress
            // 
            this.labelAddress.BackColor = System.Drawing.Color.Aquamarine;
            this.labelAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelAddress.ForeColor = System.Drawing.Color.Black;
            this.labelAddress.Location = new System.Drawing.Point(190, 364);
            this.labelAddress.Name = "labelAddress";
            this.labelAddress.Size = new System.Drawing.Size(100, 23);
            this.labelAddress.TabIndex = 5;
            this.labelAddress.Text = "Address";
            this.labelAddress.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // labelPostalCode
            // 
            this.labelPostalCode.BackColor = System.Drawing.Color.Aquamarine;
            this.labelPostalCode.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelPostalCode.ForeColor = System.Drawing.Color.Black;
            this.labelPostalCode.Location = new System.Drawing.Point(190, 416);
            this.labelPostalCode.Name = "labelPostalCode";
            this.labelPostalCode.Size = new System.Drawing.Size(100, 23);
            this.labelPostalCode.TabIndex = 6;
            this.labelPostalCode.Text = "Postal Code";
            this.labelPostalCode.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            this.labelPostalCode.Click += new System.EventHandler(this.label1_Click);
            // 
            // labelPhoneNumber
            // 
            this.labelPhoneNumber.BackColor = System.Drawing.Color.Aquamarine;
            this.labelPhoneNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.labelPhoneNumber.ForeColor = System.Drawing.Color.Black;
            this.labelPhoneNumber.Location = new System.Drawing.Point(190, 465);
            this.labelPhoneNumber.Name = "labelPhoneNumber";
            this.labelPhoneNumber.Size = new System.Drawing.Size(100, 23);
            this.labelPhoneNumber.TabIndex = 7;
            this.labelPhoneNumber.Text = "Phone Number";
            this.labelPhoneNumber.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtMemberID
            // 
            this.txtMemberID.Enabled = false;
            this.txtMemberID.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMemberID.Location = new System.Drawing.Point(374, 157);
            this.txtMemberID.Name = "txtMemberID";
            this.txtMemberID.ReadOnly = true;
            this.txtMemberID.Size = new System.Drawing.Size(200, 22);
            this.txtMemberID.TabIndex = 8;
            // 
            // txtMemberName
            // 
            this.txtMemberName.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMemberName.Location = new System.Drawing.Point(374, 210);
            this.txtMemberName.Name = "txtMemberName";
            this.txtMemberName.Size = new System.Drawing.Size(200, 22);
            this.txtMemberName.TabIndex = 9;
            // 
            // txtAddress
            // 
            this.txtAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAddress.Location = new System.Drawing.Point(374, 364);
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(200, 22);
            this.txtAddress.TabIndex = 12;
            // 
            // txtPostalCode
            // 
            this.txtPostalCode.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPostalCode.Location = new System.Drawing.Point(374, 416);
            this.txtPostalCode.Name = "txtPostalCode";
            this.txtPostalCode.Size = new System.Drawing.Size(200, 22);
            this.txtPostalCode.TabIndex = 13;
            // 
            // txtPhoneNumber
            // 
            this.txtPhoneNumber.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhoneNumber.Location = new System.Drawing.Point(374, 465);
            this.txtPhoneNumber.Name = "txtPhoneNumber";
            this.txtPhoneNumber.Size = new System.Drawing.Size(200, 22);
            this.txtPhoneNumber.TabIndex = 14;
            // 
            // buttonAdd
            // 
            this.buttonAdd.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonAdd.ForeColor = System.Drawing.Color.Black;
            this.buttonAdd.Location = new System.Drawing.Point(318, 534);
            this.buttonAdd.Name = "buttonAdd";
            this.buttonAdd.Size = new System.Drawing.Size(75, 30);
            this.buttonAdd.TabIndex = 15;
            this.buttonAdd.Text = "Add";
            this.buttonAdd.UseVisualStyleBackColor = false;
            this.buttonAdd.Click += new System.EventHandler(this.buttonAdd_Click);
            // 
            // buttonUpdate
            // 
            this.buttonUpdate.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonUpdate.ForeColor = System.Drawing.Color.Black;
            this.buttonUpdate.Location = new System.Drawing.Point(423, 534);
            this.buttonUpdate.Name = "buttonUpdate";
            this.buttonUpdate.Size = new System.Drawing.Size(75, 30);
            this.buttonUpdate.TabIndex = 16;
            this.buttonUpdate.Text = "Update";
            this.buttonUpdate.UseVisualStyleBackColor = false;
            this.buttonUpdate.Click += new System.EventHandler(this.buttonUpdate_Click);
            // 
            // buttonDelete
            // 
            this.buttonDelete.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonDelete.ForeColor = System.Drawing.Color.Black;
            this.buttonDelete.Location = new System.Drawing.Point(535, 534);
            this.buttonDelete.Name = "buttonDelete";
            this.buttonDelete.Size = new System.Drawing.Size(75, 30);
            this.buttonDelete.TabIndex = 17;
            this.buttonDelete.Text = "Delete";
            this.buttonDelete.UseVisualStyleBackColor = false;
            this.buttonDelete.Click += new System.EventHandler(this.buttonDelete_Click);
            // 
            // buttonLoad
            // 
            this.buttonLoad.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonLoad.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonLoad.ForeColor = System.Drawing.Color.Black;
            this.buttonLoad.Location = new System.Drawing.Point(215, 534);
            this.buttonLoad.Name = "buttonLoad";
            this.buttonLoad.Size = new System.Drawing.Size(75, 30);
            this.buttonLoad.TabIndex = 18;
            this.buttonLoad.Text = "Load";
            this.buttonLoad.UseVisualStyleBackColor = false;
            this.buttonLoad.Click += new System.EventHandler(this.buttonLoad_Click);
            // 
            // buttonPrevious
            // 
            this.buttonPrevious.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonPrevious.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonPrevious.ForeColor = System.Drawing.Color.Black;
            this.buttonPrevious.Location = new System.Drawing.Point(159, 534);
            this.buttonPrevious.Name = "buttonPrevious";
            this.buttonPrevious.Size = new System.Drawing.Size(31, 30);
            this.buttonPrevious.TabIndex = 19;
            this.buttonPrevious.Text = "<";
            this.buttonPrevious.UseVisualStyleBackColor = false;
            this.buttonPrevious.Click += new System.EventHandler(this.buttonPrevious_Click);
            // 
            // buttonNext
            // 
            this.buttonNext.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonNext.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonNext.ForeColor = System.Drawing.Color.Black;
            this.buttonNext.Location = new System.Drawing.Point(639, 534);
            this.buttonNext.Name = "buttonNext";
            this.buttonNext.Size = new System.Drawing.Size(31, 30);
            this.buttonNext.TabIndex = 20;
            this.buttonNext.Text = ">";
            this.buttonNext.UseVisualStyleBackColor = false;
            this.buttonNext.Click += new System.EventHandler(this.buttonNext_Click);
            // 
            // buttonLastRecord
            // 
            this.buttonLastRecord.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonLastRecord.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonLastRecord.ForeColor = System.Drawing.Color.Black;
            this.buttonLastRecord.Location = new System.Drawing.Point(639, 577);
            this.buttonLastRecord.Name = "buttonLastRecord";
            this.buttonLastRecord.Size = new System.Drawing.Size(31, 30);
            this.buttonLastRecord.TabIndex = 21;
            this.buttonLastRecord.Text = ">>";
            this.buttonLastRecord.UseVisualStyleBackColor = false;
            this.buttonLastRecord.Click += new System.EventHandler(this.buttonLastRecord_Click);
            // 
            // buttonFirstRecord
            // 
            this.buttonFirstRecord.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonFirstRecord.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonFirstRecord.ForeColor = System.Drawing.Color.Black;
            this.buttonFirstRecord.Location = new System.Drawing.Point(159, 577);
            this.buttonFirstRecord.Name = "buttonFirstRecord";
            this.buttonFirstRecord.Size = new System.Drawing.Size(31, 30);
            this.buttonFirstRecord.TabIndex = 22;
            this.buttonFirstRecord.Text = "<<";
            this.buttonFirstRecord.UseVisualStyleBackColor = false;
            this.buttonFirstRecord.Click += new System.EventHandler(this.buttonFirstRecord_Click);
            // 
            // buttonFind
            // 
            this.buttonFind.BackColor = System.Drawing.Color.Aquamarine;
            this.buttonFind.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.buttonFind.ForeColor = System.Drawing.Color.Black;
            this.buttonFind.Location = new System.Drawing.Point(318, 574);
            this.buttonFind.Name = "buttonFind";
            this.buttonFind.Size = new System.Drawing.Size(75, 30);
            this.buttonFind.TabIndex = 23;
            this.buttonFind.Text = "Find";
            this.buttonFind.UseVisualStyleBackColor = false;
            this.buttonFind.Click += new System.EventHandler(this.buttonFind_Click);
            // 
            // txtFind
            // 
            this.txtFind.Location = new System.Drawing.Point(423, 580);
            this.txtFind.Name = "txtFind";
            this.txtFind.Size = new System.Drawing.Size(75, 20);
            this.txtFind.TabIndex = 24;
            // 
            // dtpBirthDate
            // 
            this.dtpBirthDate.Location = new System.Drawing.Point(374, 257);
            this.dtpBirthDate.Name = "dtpBirthDate";
            this.dtpBirthDate.Size = new System.Drawing.Size(200, 20);
            this.dtpBirthDate.TabIndex = 25;
            // 
            // toolStripStatus
            // 
            this.toolStripStatus.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.toolStripStatus.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripLabel});
            this.toolStripStatus.Location = new System.Drawing.Point(0, 768);
            this.toolStripStatus.Name = "toolStripStatus";
            this.toolStripStatus.Size = new System.Drawing.Size(842, 25);
            this.toolStripStatus.TabIndex = 26;
            this.toolStripStatus.Text = "toolStripStatusLabel";
            // 
            // toolStripLabel
            // 
            this.toolStripLabel.Name = "toolStripLabel";
            this.toolStripLabel.Size = new System.Drawing.Size(86, 22);
            this.toolStripLabel.Text = "toolStripLabel1";
            // 
            // chkBirthDate
            // 
            this.chkBirthDate.AutoSize = true;
            this.chkBirthDate.BackColor = System.Drawing.Color.Aquamarine;
            this.chkBirthDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.chkBirthDate.Location = new System.Drawing.Point(580, 257);
            this.chkBirthDate.Name = "chkBirthDate";
            this.chkBirthDate.Size = new System.Drawing.Size(150, 20);
            this.chkBirthDate.TabIndex = 27;
            this.chkBirthDate.Text = "Birth Date Provided?";
            this.chkBirthDate.UseVisualStyleBackColor = false;
            this.chkBirthDate.CheckedChanged += new System.EventHandler(this.chkBirthDate_CheckedChanged);
            // 
            // label1
            // 
            this.label1.BackColor = System.Drawing.Color.Aquamarine;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.Color.Black;
            this.label1.Location = new System.Drawing.Point(190, 308);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 23);
            this.label1.TabIndex = 28;
            this.label1.Text = "Email Address";
            this.label1.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // txtEmailAddress
            // 
            this.txtEmailAddress.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEmailAddress.Location = new System.Drawing.Point(374, 308);
            this.txtEmailAddress.Name = "txtEmailAddress";
            this.txtEmailAddress.Size = new System.Drawing.Size(200, 22);
            this.txtEmailAddress.TabIndex = 29;
            // 
            // frmMemberMaintenance
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::SA43_Team10A_LibrarySystem.Properties.Resources.Picture1;
            this.ClientSize = new System.Drawing.Size(842, 793);
            this.Controls.Add(this.txtEmailAddress);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.chkBirthDate);
            this.Controls.Add(this.toolStripStatus);
            this.Controls.Add(this.dtpBirthDate);
            this.Controls.Add(this.txtFind);
            this.Controls.Add(this.buttonFind);
            this.Controls.Add(this.buttonFirstRecord);
            this.Controls.Add(this.buttonLastRecord);
            this.Controls.Add(this.buttonNext);
            this.Controls.Add(this.buttonPrevious);
            this.Controls.Add(this.buttonLoad);
            this.Controls.Add(this.buttonDelete);
            this.Controls.Add(this.buttonUpdate);
            this.Controls.Add(this.buttonAdd);
            this.Controls.Add(this.txtPhoneNumber);
            this.Controls.Add(this.txtPostalCode);
            this.Controls.Add(this.txtAddress);
            this.Controls.Add(this.txtMemberName);
            this.Controls.Add(this.txtMemberID);
            this.Controls.Add(this.labelPhoneNumber);
            this.Controls.Add(this.labelPostalCode);
            this.Controls.Add(this.labelAddress);
            this.Controls.Add(this.labelBirthDate);
            this.Controls.Add(this.labelMemName);
            this.Controls.Add(this.labelMemID);
            this.Controls.Add(this.labelTitle);
            this.Name = "frmMemberMaintenance";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Member Maintenance";
            this.toolStripStatus.ResumeLayout(false);
            this.toolStripStatus.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label labelTitle;
        private System.Windows.Forms.Label labelMemID;
        private System.Windows.Forms.Label labelMemName;
        private System.Windows.Forms.Label labelBirthDate;
        private System.Windows.Forms.Label labelAddress;
        private System.Windows.Forms.Label labelPostalCode;
        private System.Windows.Forms.Label labelPhoneNumber;
        private System.Windows.Forms.TextBox txtMemberID;
        private System.Windows.Forms.TextBox txtMemberName;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.TextBox txtPostalCode;
        private System.Windows.Forms.TextBox txtPhoneNumber;
        private System.Windows.Forms.Button buttonAdd;
        private System.Windows.Forms.Button buttonUpdate;
        private System.Windows.Forms.Button buttonDelete;
        private System.Windows.Forms.Button buttonLoad;
        private System.Windows.Forms.Button buttonPrevious;
        private System.Windows.Forms.Button buttonNext;
        private System.Windows.Forms.Button buttonLastRecord;
        private System.Windows.Forms.Button buttonFirstRecord;
        private System.Windows.Forms.Button buttonFind;
        private System.Windows.Forms.TextBox txtFind;
        private System.Windows.Forms.DateTimePicker dtpBirthDate;
        private System.Windows.Forms.ToolStrip toolStripStatus;
        private System.Windows.Forms.ToolStripLabel toolStripLabel;
        private System.Windows.Forms.CheckBox chkBirthDate;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtEmailAddress;
    }
}

