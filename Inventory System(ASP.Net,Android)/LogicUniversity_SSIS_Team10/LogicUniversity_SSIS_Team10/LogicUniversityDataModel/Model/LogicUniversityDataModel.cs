namespace LogicUniversityDataModel
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;

    public partial class LogicUniversityDataModel : DbContext
    {
        public LogicUniversityDataModel()
            : base("name=LogicUniversityDataModel")
        {
        }

        public virtual DbSet<Adjustment> Adjustments { get; set; }
        public virtual DbSet<AdjustmentDetail> AdjustmentDetails { get; set; }
        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<CollectionPoint> CollectionPoints { get; set; }
        public virtual DbSet<Delegate> Delegates { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<DepartmentRequisition> DepartmentRequisitions { get; set; }
        public virtual DbSet<Disbursement> Disbursements { get; set; }
        public virtual DbSet<DisbursementDetail> DisbursementDetails { get; set; }
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<Order> Orders { get; set; }
        public virtual DbSet<OrderDetail> OrderDetails { get; set; }
        public virtual DbSet<RequisitionDetail> RequisitionDetails { get; set; }
        public virtual DbSet<Role> Roles { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<StaffRequisition> StaffRequisitions { get; set; }
        public virtual DbSet<StockCard> StockCards { get; set; }
        public virtual DbSet<Supplier> Suppliers { get; set; }
        public virtual DbSet<Supplier_Stock> Supplier_Stock { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Adjustment>()
                .Property(e => e.VoucherId)
                .IsUnicode(false);

            modelBuilder.Entity<Adjustment>()
                .Property(e => e.ApprovedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Adjustment>()
                .Property(e => e.Remark)
                .IsUnicode(false);

            modelBuilder.Entity<Adjustment>()
                .Property(e => e.Status)
                .IsUnicode(false);

            modelBuilder.Entity<Adjustment>()
                .HasMany(e => e.AdjustmentDetails)
                .WithRequired(e => e.Adjustment)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AdjustmentDetail>()
                .Property(e => e.VoucherId)
                .IsUnicode(false);

            modelBuilder.Entity<AdjustmentDetail>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            //modelBuilder.Entity<AdjustmentDetail>()
            //    .Property(e => e.Quantity_Adjusted)
            //    .IsUnicode(false);

            modelBuilder.Entity<AdjustmentDetail>()
                .Property(e => e.Reason)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .Property(e => e.CategoryName)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Items)
                .WithRequired(e => e.Category)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<CollectionPoint>()
                .Property(e => e.CollectionPoint_Name)
                .IsUnicode(false);

            modelBuilder.Entity<CollectionPoint>()
                .Property(e => e.CollectionTime)
                .IsUnicode(false);

            modelBuilder.Entity<Delegate>()
                .Property(e => e.StaffId)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DepartmentId)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DepartmentName)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.ContactName)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.TelephoneNo)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.FaxNo)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DepartmentHead_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.Representative_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Department>()
                .HasMany(e => e.Staffs)
                .WithRequired(e => e.Department)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DepartmentRequisition>()
                .Property(e => e.DepartmentId)
                .IsUnicode(false);

            modelBuilder.Entity<DepartmentRequisition>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<Disbursement>()
                .Property(e => e.DepartmentId)
                .IsUnicode(false);

            modelBuilder.Entity<Disbursement>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Disbursement)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<DisbursementDetail>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.ItemName)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.BinId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.UOM)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.First_SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.Second_SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.Third_SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.AdjustmentDetails)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.DepartmentRequisitions)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.DisbursementDetails)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.RequisitionDetails)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.StockCards)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .HasMany(e => e.Supplier_Stock)
                .WithRequired(e => e.Item)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.OrderedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .Property(e => e.ApprovedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Order>()
                .HasMany(e => e.OrderDetails)
                .WithRequired(e => e.Order)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<OrderDetail>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<RequisitionDetail>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .Property(e => e.RoleName)
                .IsUnicode(false);

            modelBuilder.Entity<Role>()
                .HasMany(e => e.Staffs)
                .WithRequired(e => e.Role)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.StaffId)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.StaffName)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.DepartmentId)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.Delegates)
                .WithRequired(e => e.Staff)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StaffRequisition>()
                .Property(e => e.StaffId)
                .IsUnicode(false);

            modelBuilder.Entity<StaffRequisition>()
                .HasMany(e => e.RequisitionDetails)
                .WithRequired(e => e.StaffRequisition)
                .HasForeignKey(e => e.StaffReqisitionId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<StockCard>()
                .Property(e => e.ItemId)
                .IsUnicode(false);

            modelBuilder.Entity<StockCard>()
                .Property(e => e.Description)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.SupplierName)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.ContactName)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.PhoneNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.FaxNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.GST_Regstration_No)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .Property(e => e.Address)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier>()
                .HasMany(e => e.Supplier_Stock)
                .WithRequired(e => e.Supplier)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Supplier_Stock>()
                .Property(e => e.SupplierId)
                .IsUnicode(false);

            modelBuilder.Entity<Supplier_Stock>()
                .Property(e => e.ItemId)
                .IsUnicode(false);
        }
    }
}
