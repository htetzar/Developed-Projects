namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Order")]
    public partial class Order
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Order()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        public long OrderId { get; set; }

        [StringLength(50)]
        public string SupplierId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? OrderDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? Expected_DeliveryDate { get; set; }

        [StringLength(50)]
        public string OrderedBy { get; set; }

        [StringLength(50)]
        public string ApprovedBy { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ApprovedDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? ReceivedDate { get; set; }

        [StringLength(50)]
        public string OrderStatus { get; set; }

        [StringLength(300)]
        public string Reason { get; set; }

        public virtual Supplier Supplier { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
