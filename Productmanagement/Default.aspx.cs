using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement
{
    public partial class Default : System.Web.UI.Page
    {
        ClsLogin clsLogin = new ClsLogin();
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["mobile"] = null;
            Session["id"] = null;
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            DataTable dt = clsLogin.UserLogin(txtmobile.Text,txtpassword.Text);
            if(dt!=null && dt.Rows.Count > 0)
            {
                Session["mobile"] = txtmobile.Text;
                Session["id"] = dt.Rows[0]["id"].ToString();
                Response.Redirect("AdminModule/Deshboard.aspx");
            }
            else
            {
                 Response.Write("<script>alert('Userid Or Password Wrong');</script>");
            }

        }
    }
}