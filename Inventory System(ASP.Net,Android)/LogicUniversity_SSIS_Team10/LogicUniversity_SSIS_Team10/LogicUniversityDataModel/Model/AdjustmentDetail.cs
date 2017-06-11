namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AdjustmentDetail")]
    public partial class AdjustmentDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(200)]
        public string VoucherId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string ItemId { get; set; }

       
        public double Quantity_Adjusted { get; set; }

        [StringLength(200)]
        public string Reason { get; set; }

        public virtual Adjustment Adjustment { get; set; }

        public virtual Item Item { get; set; }
    }
}
