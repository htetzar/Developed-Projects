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
using System.IO;

public partial class UploadForSale : System.Web.UI.Page
{
    string con_string = @"Data Source=LAEMON-PC\GROUP3_SERVER;Initial Catalog=ITSocietyDB;Persist Security Info=True;User ID=sa;Password=group3";
    bool flag = false;
    protected void Page_Load(object sender, EventArgs e)
    {

        imgSale.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
        if (flag)
            if (!(Server.MapPath("~/") + imgSale.ResolveClientUrl(imgSale.ImageUrl)).Equals(Server.MapPath("~/") + "App_Themes/Theme1/noimg.jpg"))
            {
                File.Delete(Server.MapPath("~/") + imgSale.ResolveClientUrl(imgSale.ImageUrl));
                imgSale.ImageUrl = "~/App_Themes/Theme1/noimg.jpg";
                flag = false;
            }

        SqlConnection con = new SqlConnection(con_string);
        con.Open();
        
        //First page loaded, we fill sale category items and brand name according to selected sale category item
        if(!IsPostBack)
        {
            string sqlsale = @"Select saleCategoryID,saleCategoryName from SaleCategory";
            SqlCommand cmdsale = new SqlCommand(sqlsale,con);
            SqlDataReader reader1 = cmdsale.ExecuteReader();
            while(reader1.Read())
            {
                //fill items into Sale Category dropdown list
                ddlSaleCategory.Items.Add(reader1[1].ToString());
            }
            
            reader1.Close();
            string sqlbrand = @"Select brandName from Brand where saleCategoryID=@salecatid";

            SqlCommand cmdbrand = new SqlCommand(sqlbrand, con);

            //Re execute cmdsale to get saleid corresponding to selected sale category name
            SqlDataReader reader2 = cmdsale.ExecuteReader();
            while(reader2.Read())
            {
                //if user's selected sale category name = sale category name in table
                if (ddlSaleCategory.SelectedItem.Value == reader2[1].ToString())
                {
                    //we get sale id
                    cmdbrand.Parameters.AddWithValue("@salecatid", (int)reader2[0]);
                    break;
                }
            }

            reader2.Close();

            SqlDataReader reader3 = cmdbrand.ExecuteReader();
            while (reader3.Read())
            {
                //fill items into brand dropdown list according to selected sale category name
                ddlBrand.Items.Add(reader3[0].ToString());
            }

            con.Close();
        }
    }
    protected void btnUploadSale_Click(object sender, EventArgs e)
    {

        
            SqlConnection con = new SqlConnection(con_string);

            //auto generate saleID
            int i;
            SqlCommand cmdmax = new SqlCommand(@"Select max(itemID) from Item", con);
            con.Open();
            Object objmax = cmdmax.ExecuteScalar();
            if (objmax == DBNull.Value) //if there is no record in table, we insert autogenerate no. 1
            {
                i = 1;
            }
            else   //if other, we get max id and add 1
            {
                i = int.Parse(objmax.ToString());
                i++;
            }

            Session["itemid"] = i.ToString();

            string sqlinsert = @"Insert into Item([itemID],[memberID],[brandID],[model],[title],[price],[phone],[email],[photo],[address],[region],[description],[postedDate],[status]) Values(@itemid,@memberid1,@brandid,@model,@title,@price,@phone,@email,@logo,@address,@region,@description,@posteddate,@status)";
            string sqlupdate = @"Update Member Set bankaccount=@bankacc where memberID=@memberid2";
            string sqlselectbank = @"Select bankaccount from Member where memberID=@memberid3";

            SqlCommand cmdinsert = new SqlCommand(sqlinsert, con);
            cmdinsert.Parameters.AddWithValue("@itemid", int.Parse(Session["itemid"].ToString()));
            cmdinsert.Parameters.AddWithValue("@memberid1", int.Parse(Session["mid"].ToString()));

            //Getting brand id corresponding to selected brand name
            string sql0 = @"Select brandID,brandName from Brand";
            SqlCommand cmd0 = new SqlCommand(sql0, con);
            SqlDataReader reader0 = cmd0.ExecuteReader();
            while (reader0.Read())
            {
                //if user's selected brand name = brand name in table
                if (reader0[1].ToString() == ddlBrand.SelectedItem.Text)
                {
                    //we get brand id
                    cmdinsert.Parameters.AddWithValue("@brandid", (int)reader0[0]);
                    break;
                }
            }
            reader0.Close();

            if (ViewState["forsalebytes"] == null)
            {
                Byte[] defimg = File.ReadAllBytes(Server.MapPath("~/") + imgSale.ResolveClientUrl(imgSale.ImageUrl));
                ViewState["forsalebytes"] = defimg;
            }

            cmdinsert.Parameters.AddWithValue("@model", txtModel.Text);
            cmdinsert.Parameters.AddWithValue("@title", txtTitle.Text);
            cmdinsert.Parameters.AddWithValue("@price", int.Parse(txtPrice.Text));
            cmdinsert.Parameters.AddWithValue("@phone", txtPhoneNo.Text);
            cmdinsert.Parameters.AddWithValue("@email", txtEmail.Text);
            cmdinsert.Parameters.AddWithValue("@logo", (byte[])ViewState["forsalebytes"]);
            cmdinsert.Parameters.AddWithValue("@address", txtAddress.Text);
            cmdinsert.Parameters.AddWithValue("@region", ddlRegion.SelectedValue.ToString());
            cmdinsert.Parameters.AddWithValue("@description", txtDescription.Text);
            cmdinsert.Parameters.AddWithValue("@posteddate", DateTime.Now.ToShortDateString());
            cmdinsert.Parameters.AddWithValue("@status", 0);

            SqlCommand cmdupdate = new SqlCommand(sqlupdate, con);
            cmdupdate.Parameters.AddWithValue("@bankacc", txtBankAcc.Text);
            cmdupdate.Parameters.AddWithValue("@memberid2", int.Parse(Session["mid"].ToString()));

            SqlCommand cmdbank = new SqlCommand(sqlselectbank, con);
            cmdbank.Parameters.AddWithValue(@"memberid3", int.Parse(Session["mid"].ToString()));
            
        try
            {
            if (Page.IsValid)
            {
                SqlDataReader reader = cmdbank.ExecuteReader();

                if (reader.Read())
                {
                    if ((reader[0]) == DBNull.Value)
                    {
                        reader.Close();
                        //insert data into Item Table
                        cmdinsert.ExecuteNonQuery();
                        //update bank account no. to Member Table(i.e insert bank account value)
                        cmdupdate.ExecuteNonQuery();
                    }
                    else
                    {
                        reader.Close();
                        //insert data into Item Table
                        cmdinsert.ExecuteNonQuery();
                    }

                    ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('Upload Successful!');", true);


                    //we delete temporarily upload image
                    if (ViewState["path"] != null)
                    {
                        File.Delete(ViewState["path"].ToString());
                    }

                }

                //After inserting data to DB, clear data in controls
                ResetData();
                flag = true;
                con.Close();
            }
            Page_Load(sender, e);
        }
        catch(Exception ex)
        {
            lblStatus.Text = "Following error occurs : " + ex.Message;
        }

    }

    private void ResetData()
    {
        //clear data in controls
        ddlBrand.ClearSelection();
        ddlSaleCategory.ClearSelection();
        txtTitle.Text = "";
        txtModel.Text = "";
        txtPrice.Text = "";
        txtPhoneNo.Text = "";
        txtEmail.Text = "";
        imgSale.ImageUrl = null;
        txtAddress.Text = "";
        ddlRegion.ClearSelection();
        txtDescription.Text = "";
        txtBankAcc.Text = "";
    }

    protected void btnUploadPhoto_Click(object sender, EventArgs e)
    {
        try
        {
            if (fulSalePhoto.HasFile)
            {
                /*upload image temporarily and store image in a binary format in ViewState "forsalebytes"*/
                string path = Server.MapPath(@"~\" + fulSalePhoto.FileName);
                ViewState["path"] = path;
                fulSalePhoto.SaveAs(path);
                imgSale.ImageUrl = @"~\" + fulSalePhoto.FileName;

                byte[] photo = fulSalePhoto.FileBytes;
                ViewState["forsalebytes"] = photo;
            }
        }
        catch (Exception ex)
        {
            lblStatus.Text = "Following error occurs : " + ex.Message;
        }

    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        //for Cancel button
        ResetData();
    }
    protected void ddlSaleCategory_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBrand.Items.Clear();
        string sqlsale = @"Select saleCategoryID,saleCategoryName from SaleCategory";
        SqlConnection con = new SqlConnection(con_string);
        SqlCommand cmdsale = new SqlCommand(sqlsale, con);
        con.Open();

        string sqlbrand = @"Select brandName from Brand where saleCategoryID=@salecatid";
        SqlCommand cmdbrand = new SqlCommand(sqlbrand, con);


        SqlDataReader reader2 = cmdsale.ExecuteReader();
        while (reader2.Read())
        {
            //if user's selected sale category name = sale category name in table
            if (ddlSaleCategory.SelectedItem.Value == reader2[1].ToString())
            {
                //we get sale id
                cmdbrand.Parameters.AddWithValue("@salecatid", int.Parse(reader2[0].ToString()));
                break;
            }
        }

        reader2.Close();

        SqlDataReader reader = cmdbrand.ExecuteReader();
        while (reader.Read())
        {
            //fill items into brand dropdown list according to user's selected sale category name
            ddlBrand.Items.Add(reader[0].ToString());
        }
        con.Close();

    }
    protected void CustValBankAcc_ServerValidate(object source, ServerValidateEventArgs args)
    {
        args.IsValid = false;
        SqlConnection con = new SqlConnection(con_string);
        con.Open();
        string sqlselectacc = @"Select accountID from Account";
        SqlCommand cmdmatchacc = new SqlCommand(sqlselectacc, con);
        SqlDataReader readermatch = cmdmatchacc.ExecuteReader();

        while (readermatch.Read())
        {
            if (txtBankAcc.Text == readermatch[0].ToString())
            {
                args.IsValid = true;
                break;
            }
        }

        con.Close();
    }
}
