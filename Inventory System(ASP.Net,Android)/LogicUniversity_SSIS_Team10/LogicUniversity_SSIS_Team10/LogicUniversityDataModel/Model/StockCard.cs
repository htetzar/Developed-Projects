namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StockCard")]
    public partial class StockCard
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(100)]
        public string ItemId { get; set; }

        [Key]
        [Column(Order = 1)]
        public DateTime Update_Date { get; set; }

        [StringLength(150)]
        public string Description { get; set; }

        public int? Quantity { get; set; }

        public double? Balance { get; set; }

        public virtual Item Item { get; set; }
    }
}
