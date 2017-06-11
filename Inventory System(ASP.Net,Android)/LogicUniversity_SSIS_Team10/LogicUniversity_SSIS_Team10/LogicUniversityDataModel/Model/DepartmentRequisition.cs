namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("DepartmentRequisition")]
    public partial class DepartmentRequisition
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(50)]
        public string DepartmentRequisitionId { get; set; }

        [StringLength(50)]
        public string DepartmentId { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string ItemId { get; set; }

        public int? Needed { get; set; }

        public int? Actual { get; set; }

        [StringLength(20)]
        public string Status { get; set; }

        [StringLength(50)]
        public string Remark { get; set; }
        public DateTime? CreateDate { get; set; }

        public virtual Department Department { get; set; }

        public virtual Item Item { get; set; }
    }
}
