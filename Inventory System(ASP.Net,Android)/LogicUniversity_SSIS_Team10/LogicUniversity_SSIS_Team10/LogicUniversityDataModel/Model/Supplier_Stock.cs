namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Supplier_Stock
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string SupplierId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string ItemId { get; set; }

        public double Price { get; set; }

        public virtual Item Item { get; set; }

        public virtual Supplier Supplier { get; set; }
    }
}
