using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace LogicUniversityDataModel.CustomModel
{
    //Author Ei Ei Maw.
    //Team 10.
    public class DelegateEmployee
    {
        private int delegateId;

        public int DelegateId
        {
            get { return delegateId; }
            set { delegateId = value; }
        }
        private string departmentheadId;

        public string DepartmentheadId
        {
            get { return departmentheadId; }
            set { departmentheadId = value; }
        }
        private string staffId;

        public string StaffId
        {
            get { return staffId; }
            set { staffId = value; }
        }

        private string staffName;

        public string StaffName
        {
            get { return staffName; }
            set { staffName = value; }
        }
        private DateTime? startDate;

        public DateTime? StartDate
        {
            get { return startDate; }
            set { startDate = value; }
        }
        private DateTime? endDate;

        public DateTime? EndDate
        {
            get { return endDate; }
            set { endDate = value; }
        }
        private bool? status;

        public bool? Status
        {
            get { return status; }
            set { status = value; }
        }

    }
}
