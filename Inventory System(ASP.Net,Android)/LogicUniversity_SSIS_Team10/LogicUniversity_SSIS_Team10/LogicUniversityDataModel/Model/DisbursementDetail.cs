namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DisbursementDetail")]
    public partial class DisbursementDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string DisbursementId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string ItemId { get; set; }

        public int? Quantity { get; set; }

        public virtual Disbursement Disbursement { get; set; }

        public virtual Item Item { get; set; }
    }
}
