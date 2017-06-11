namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Item")]
    public partial class Item
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Item()
        {
            AdjustmentDetails = new HashSet<AdjustmentDetail>();
            DepartmentRequisitions = new HashSet<DepartmentRequisition>();
            DisbursementDetails = new HashSet<DisbursementDetail>();
            OrderDetails = new HashSet<OrderDetail>();
            RequisitionDetails = new HashSet<RequisitionDetail>();
            StockCards = new HashSet<StockCard>();
            Supplier_Stock = new HashSet<Supplier_Stock>();
        }

        [StringLength(100)]
        public string ItemId { get; set; }

        [StringLength(150)]
        public string ItemName { get; set; }

        public int CategoryId { get; set; }

        [StringLength(50)]
        public string BinId { get; set; }

        public int? ReorderLevel { get; set; }

        public int? ReorderQty { get; set; }

        [StringLength(50)]
        public string UOM { get; set; }

        [StringLength(100)]
        public string First_SupplierId { get; set; }

        [StringLength(100)]
        public string Second_SupplierId { get; set; }

        [StringLength(100)]
        public string Third_SupplierId { get; set; }

        public bool? Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdjustmentDetail> AdjustmentDetails { get; set; }

        public virtual Category Category { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DepartmentRequisition> DepartmentRequisitions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisbursementDetail> DisbursementDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequisitionDetail> RequisitionDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StockCard> StockCards { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Supplier_Stock> Supplier_Stock { get; set; }
    }
}
