namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Delegate")]
    public partial class Delegate
    {
        public int DelegateId { get; set; }

        public string DepartmentHeadId { get; set; }

        [Required]
        [StringLength(150)]
        public string StaffId { get; set; }

        [Column(TypeName = "date")]
        public DateTime? StartDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime? EndDate { get; set; }

        public bool? Status { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
