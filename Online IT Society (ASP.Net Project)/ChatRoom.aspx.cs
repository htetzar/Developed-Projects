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

public partial class ChatRoom : System.Web.UI.Page
{
    string msg;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        if (txtMsg.Text != "")
        {
            txtChat.Text = string.Empty;
            string username = Session["UserName"].ToString();
            string usermsg = txtMsg.Text;

            if (Application["msg"] != null)
            {
                msg = Application["msg"].ToString();
                msg += username + " : " + usermsg + "\n";
                Application["msg"] = msg;
                txtChat.Text = msg;
            }
            else
            {
                msg += username + " : " + usermsg + "\n";
                Application["msg"] = msg;
                txtChat.Text = msg;
            }
            txtMsg.Text = "";
            txtMsg.Focus();
        }
    }
    protected void Timer1_Tick(object sender, EventArgs e)
    {
        if (Application["msg"] != null)
        {
            msg = Application["msg"].ToString();
            txtChat.Text = msg;
        }
        if (Application["OnlineUser"] != null)
        {
            BulletOnlineUser.Items.Clear();
            string str = Application["OnlineUser"].ToString();
            string[] strarr = str.Split("\n".ToCharArray());
            
            foreach(string s in strarr)
            {
                if(s!="")
                BulletOnlineUser.Items.Add(s);
            }
        }
    }
    protected void txtChat_TextChanged(object sender, EventArgs e)
    {
        
       
    }
}
