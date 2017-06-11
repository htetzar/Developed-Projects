namespace LogicUniversityDataModel
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Department")]
    public partial class Department
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Department()
        {
            DepartmentRequisitions = new HashSet<DepartmentRequisition>();
            Disbursements = new HashSet<Disbursement>();
            Staffs = new HashSet<Staff>();
        }

        [StringLength(50)]
        public string DepartmentId { get; set; }

        [StringLength(50)]
        public string DepartmentName { get; set; }

        [StringLength(50)]
        public string ContactName { get; set; }

        [StringLength(50)]
        public string TelephoneNo { get; set; }

        [StringLength(50)]
        public string FaxNo { get; set; }

        [StringLength(50)]
        public string DepartmentHead_ID { get; set; }

        [StringLength(50)]
        public string Representative_ID { get; set; }

        public int? CollectionPointId { get; set; }

        public virtual CollectionPoint CollectionPoint { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<DepartmentRequisition> DepartmentRequisitions { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Disbursement> Disbursements { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Staff> Staffs { get; set; }
    }
}
