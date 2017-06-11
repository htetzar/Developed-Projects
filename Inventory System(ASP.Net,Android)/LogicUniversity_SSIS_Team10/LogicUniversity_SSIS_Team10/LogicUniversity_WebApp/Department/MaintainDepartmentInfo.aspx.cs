using LogicUniversityController.Controller;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LogicUniversityDataModel;

namespace LogicUniversity_WebApp.Department
{
    //Author Mai Chi Cuong.
    //Team 10.
    public partial class MaintainDepartmentInfo : System.Web.UI.Page
    {
        MaintatinDepartmentInfoController maintainDeptInfoController = new MaintatinDepartmentInfoController();
        List<CollectionPoint> getCollectionPointList;
        Staff user;
        public void BindCollectionPoint()
        {
            getCollectionPointList = maintainDeptInfoController.getCollectionPointList();
            List<CollectionPoint> collectionPointList = new List<CollectionPoint>();

            foreach (CollectionPoint c in getCollectionPointList)

            {
                CollectionPoint coll = new CollectionPoint();
                coll.CollectionPoint_Name = c.CollectionPoint_Name + "-" + c.CollectionTime;
                coll.CollectionPointId = c.CollectionPointId;
                collectionPointList.Add(coll);
            }
            rdBtnLst.DataSource = collectionPointList;
            rdBtnLst.DataValueField = "CollectionPointId";
            rdBtnLst.SelectedIndex = 0;
            rdBtnLst.DataTextField = "CollectionPoint_Name";
            rdBtnLst.DataBind();
        }
        public void BindCollectionPointByDeptRep()
        {
            getCollectionPointList = maintainDeptInfoController.getCollectionPointList();
            List<CollectionPoint> collectionPointList = new List<CollectionPoint>();
             
            foreach (CollectionPoint c in getCollectionPointList)

            {
                CollectionPoint coll = new CollectionPoint();
                coll.CollectionPoint_Name = c.CollectionPoint_Name + "-" + c.CollectionTime;
                coll.CollectionPointId = c.CollectionPointId;
                collectionPointList.Add(coll);
            }
            rdBtnLst.DataSource = collectionPointList;
            rdBtnLst.DataValueField = "CollectionPointId";
            rdBtnLst.DataTextField = "CollectionPoint_Name";
            rdBtnLst.SelectedIndex = Convert.ToInt32(user.Department.CollectionPointId) - 1;
            rdBtnLst.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            user = (Staff)Session["User"];
            if (user != null) { 
                Session["roleid"] = user.RoleId;
                if (!IsPostBack)
                {
                    if (user.Role.RoleName == "DepartmentHead")
                    {
                        BindCollectionPoint();
                        //--Bind Staff List by DeptID
                        lblDepartmentName.Text = "Department Of " + user.Department.DepartmentName;
                        string deptid = user.DepartmentId;
                        ddlDeptRep.DataValueField = "StaffId";
                        ddlDeptRep.DataTextField = "StaffName";
                        ddlDeptRep.DataSource = maintainDeptInfoController.getStaffList().Where(s => s.DepartmentId == deptid && s.StaffId != user.StaffId).ToList();
                        ddlDeptRep.DataBind();
                    }
                    if(user.Role.RoleName == "DepartmentRep")
                    {
                        BindCollectionPointByDeptRep();
                        lblDepartmentName.Text = "Department Of " + user.Department.DepartmentName;
                    }
                }
            }
        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            try
            {
                lblCollectPoint.Text = rdBtnLst.SelectedItem.Text;
                lblSname.Text = ddlDeptRep.SelectedItem.Text;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#confirmModal').modal('show');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Please choose a collection point!');", true);
            }
        }

        protected void btnOk_Click(object sender, EventArgs e)
        {
            maintainDeptInfoController.maintainDepartmentInfo(user.DepartmentId, rdBtnLst.SelectedItem.Value, ddlDeptRep.SelectedItem.Value);
            SendMailToDepartmentRep();
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Submit successfully!');", true);
        }

        protected void btnChange_Click(object sender, EventArgs e)
        {
            try
            {
                lblnewCP.Text = rdBtnLst.SelectedItem.Text;
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "$('#changeModal').modal('show');", true);
            }
            catch
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Please choose a collection point!');", true);
            }
        }

        protected void btnCfmChange_Click(object sender, EventArgs e)
        {
            maintainDeptInfoController.maintainDepartmentInfo(user.DepartmentId, rdBtnLst.SelectedItem.Value, user.StaffId);
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "alertMessage", "alert('Change successfully!');", true);
            btnChange.CssClass = "btn btn-danger disabled";
            btnChange.Text = "Changed";
            SendMailToDepartmentRep();            
        }
        private void SendMailToDepartmentRep()
        {
            var user = (Staff)Session["User"];
            var userName = user.StaffName;
            var userRole = user.Role.RoleName;
            String toEmail = "zawmyohtet2016.mandalay@gmail.com";
            String subj = "A collection point has been assigned from "+ userName + "(" + userRole + ")";
            String message = "Please note that you has been assign to collect at "+ rdBtnLst.SelectedItem.Text +"."+"<br/><br/>" + "Best Regard" + "<br/>" + userName;
            EmailController.SendEmailByDeptHead(toEmail, subj, message);
        }
    }
}