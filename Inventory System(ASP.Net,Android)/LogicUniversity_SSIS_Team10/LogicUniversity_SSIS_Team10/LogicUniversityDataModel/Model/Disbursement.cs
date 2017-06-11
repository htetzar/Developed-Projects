namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Disbursement")]
    public partial class Disbursement
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Disbursement()
        {
            DisbursementDetails = new HashSet<DisbursementDetail>();
        }

        [StringLength(50)]
        public string DisbursementId { get; set; }

        [StringLength(20)]
        public string DepReqId { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        [StringLength(50)]
        public string DepartmentId { get; set; }

        public DateTime? CreateDate { get; set; }

        public virtual Department Department { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DisbursementDetail> DisbursementDetails { get; set; }
    }
}
