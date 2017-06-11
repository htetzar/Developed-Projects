using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;

public partial class ItemDetail : System.Web.UI.Page
{
    bool FLAG = true;
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (Session["mid"].ToString() != "")
        {
            Page.MasterPageFile = "~/MemberMasterPage.master";
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            Page.MasterPageFile = "~/AdminMasterPage.master";
        }

        else
        {
            Page.MasterPageFile = "~/GuestMasterPage.master";
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbtnPurchase_Click(object sender, EventArgs e)
    {
        pnlPurchase.Visible = true;
    }
    protected void btnBuy_Click(object sender, EventArgs e)
    {
        decimal CustomerBalance;
        decimal Price = 0;
        decimal CashInHand;
        decimal AdminBalance = 0;
        decimal SellerBalance = 0;
        decimal AgencyFee;


        //Retrieve Customer Balance which meet account number and security code from Account
        DataView dv = (DataView)AccountDS.Select(DataSourceSelectArguments.Empty);
         foreach (DataRowView dr in dv)
            {
                if (txtAccountNumber.Text == dr[0].ToString() && txtSecurityCode.Text == dr[1].ToString())
                {


                    CustomerBalance = decimal.Parse(dr[2].ToString());
                    //Retrieve Price from Item 
                    DataView dv1 = (DataView)ItemDS.Select(DataSourceSelectArguments.Empty);
                    foreach (DataRowView dr1 in dv1)
                        Price = decimal.Parse(dr1[5].ToString()); //Retrieve Price From Item

                    if (CustomerBalance > Price)
                    {
                        CashInHand = CustomerBalance - Price;

                        if (CashInHand >= 1000)
                        {

                            Session["Balance"] = CashInHand.ToString();
                            AccountDS.Update();

                            txtAccountNumber.Text = "";
                            txtSecurityCode.Text = "";

                            //Retrieve Admin Balance from Account and plus agency fee and update it
                            DataView dv2 = (DataView)AccountForAdminDS.Select(DataSourceSelectArguments.Empty);
                            foreach (DataRowView dr2 in dv2)
                            {
                                AdminBalance = decimal.Parse(dr2[0].ToString());
                                break;

                            }
                            AdminBalance = AdminBalance + (Price * (decimal)0.05);
                            Session["Balance"] = AdminBalance.ToString();
                            AccountForAdminDS.Update();

                            //Retrieve Seller Balance and plus item's amount
                            DataView dv3 = (DataView)AccountForSellerDS.Select(DataSourceSelectArguments.Empty);
                            foreach (DataRowView dr3 in dv3)
                                SellerBalance = decimal.Parse(dr3[0].ToString());

                            SellerBalance = SellerBalance + (Price - (Price * (decimal)0.05));
                            Session["Balance"] = SellerBalance.ToString();
                            AccountForSellerDS.Update();



                            
                            Session["PurchaseDate"] = DateTime.Now.ToShortDateString();

                            SqlDataSourceUpdate.Update();

                            int pid;
                            try
                            {
                                SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");
                                SqlCommand cmd = new SqlCommand("select max(purchaseID) from PurchaseInfo", conn);
                                conn.Open();
                                SqlDataReader rader1 = cmd.ExecuteReader();
                                rader1.Read();
                                pid = int.Parse(rader1[0].ToString());
                                pid++;
                                conn.Close();
                            }
                            catch (Exception)
                            {
                                pid = 1;
                            }
                            
                            Session["pid"] = pid;
                            PurchaseDS.Insert();

                            lblMsg.Text = "Successfully Purchased! Thank You For Purchasing";

                            lbtnPurchase.Visible = false;
                            pnlPurchase.Visible = false;
                            break;


                        }
                        else
                            lblMsg.Text = "Your Balance is lower than 1000 Kyats!";
                    }
                    else
                        lblMsg.Text = "Your Balance is not enough for purchase!";
                    break;

                }
                else
                {
                    lblMsg.Text = "Your Informatin is not Valid!";
                }


            }
        
    }

    protected bool IsMember(object iid)
    {
        bool flag = false;
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");
        SqlCommand cmd = new SqlCommand("Select memberID,photo from Item Where itemID=@itemID", conn);
        cmd.Parameters.AddWithValue("@itemID", int.Parse(iid.ToString()));
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();

        rd.Read();
        if (Session["mid"].ToString() == rd[0].ToString())
        {
            Session["photo"] = (byte[])rd[1];
            flag = true;
            FLAG = false;
            lbtnPurchase.Visible = false;
        }
        else
        {
            flag = false;
            FLAG = true;
        }

        conn.Close();
        return flag;
    }
    protected bool PurchaseVisible()
    {
        return FLAG;
        
    }
    protected bool IsMemberAdmin(object iid)
    {
        bool flag = false;
        SqlConnection conn = new SqlConnection(@"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;User ID=sa;Password=group3");
        SqlCommand cmd = new SqlCommand("Select memberID from Item Where itemID=@itemID", conn);
        cmd.Parameters.AddWithValue("@itemID", int.Parse(iid.ToString()));
        conn.Open();
        SqlDataReader rd = cmd.ExecuteReader();
        rd.Read();
        if (Session["mid"].ToString() == rd[0].ToString())
        {
            flag = true;
            FLAG = false;
            lbtnPurchase.Visible = false;
        }
        else if (Session["AdminLogin"].ToString() != "")
        {
            flag = true;
            FLAG = false;
            lbtnPurchase.Visible = false;
        }
        else
        {
            flag = false;
            FLAG = true;
        }

        conn.Close();
        return flag;

    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (((FileUpload)(FormView1.FindControl("FileUpload1"))).HasFile)
        {
            string fname = ((FileUpload)(FormView1.FindControl("FileUpload1"))).FileName;
            ((FileUpload)(FormView1.FindControl("FileUpload1"))).SaveAs(Server.MapPath("~/App_Themes/Theme1/") + fname);
            ((Image)FormView1.FindControl("Image2")).ImageUrl = "~/App_Themes/Theme1/" + fname;
            Session["photo"] = (byte[])(((FileUpload)(FormView1.FindControl("FileUpload1"))).FileBytes);


        }
    }
    protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
    {
        Session["Brand"] = ((DropDownList)FormView1.FindControl("ddlBrand")).SelectedValue;

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        txtAccountNumber.Text = "";
        txtSecurityCode.Text = "";
        txtName.Text = "";
        txtPhone.Text = "";
        txtAddress.Text = "";
        pnlPurchase.Visible = false;
    }
}
