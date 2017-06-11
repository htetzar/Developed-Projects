namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("StaffRequisition")]
    public partial class StaffRequisition
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public StaffRequisition()
        {
            RequisitionDetails = new HashSet<RequisitionDetail>();
        }

        [StringLength(50)]
        public string DepartmentRequisitionId { get; set; }

        [StringLength(50)]
        public string StaffRequisitionId { get; set; }

        [StringLength(150)]
        public string StaffId { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        public DateTime? ApproveDate { get; set; }

        public DateTime? CreateDate { get; set; }

        [StringLength(50)]
        public string ApproveBy { get; set; }

        [StringLength(50)]
        public string DepartmentId { get; set; }

        [StringLength(50)]
        public string Remark { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<RequisitionDetail> RequisitionDetails { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
