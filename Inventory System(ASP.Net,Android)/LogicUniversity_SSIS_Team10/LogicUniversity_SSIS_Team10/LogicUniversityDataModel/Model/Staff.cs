namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Staff")]
    public partial class Staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Staff()
        {
            Delegates = new HashSet<Delegate>();
            StaffRequisitions = new HashSet<StaffRequisition>();
        }

        [StringLength(150)]
        public string StaffId { get; set; }

        [StringLength(100)]
        public string Password { get; set; }

        [StringLength(150)]
        public string StaffName { get; set; }

        public int RoleId { get; set; }

        [Required]
        [StringLength(50)]
        public string DepartmentId { get; set; }

        [StringLength(150)]
        public string Email { get; set; }

        [StringLength(100)]
        public string PhoneNumber { get; set; }

        [StringLength(150)]
        public string Address { get; set; }

        [StringLength(50)]
        public string EmailPassword { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Delegate> Delegates { get; set; }

        public virtual Department Department { get; set; }

        public virtual Role Role { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<StaffRequisition> StaffRequisitions { get; set; }
    }
}
