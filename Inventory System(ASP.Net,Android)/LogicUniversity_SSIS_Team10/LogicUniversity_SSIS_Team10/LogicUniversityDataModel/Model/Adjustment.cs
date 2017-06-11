namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Adjustment")]
    public partial class Adjustment
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Adjustment()
        {
            AdjustmentDetails = new HashSet<AdjustmentDetail>();
        }

        [Key]
        [StringLength(200)]
        public string VoucherId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? IssueDate { get; set; }

        [StringLength(150)]
        public string ApprovedBy { get; set; }

        [StringLength(200)]
        public string Remark { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AdjustmentDetail> AdjustmentDetails { get; set; }
    }
}
