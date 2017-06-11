namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public long OrderId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string ItemId { get; set; }

        public int Order_Quantity { get; set; }

        public int? Received_Quantity { get; set; }

        public double? Price { get; set; }

        public virtual Item Item { get; set; }

        public virtual Order Order { get; set; }
    }
}
