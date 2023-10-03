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
            DataTable dt = clsLogin.UserLogin(txtmobile.Text, txtpassword.Text);
            if (dt != null && dt.Rows.Count > 0)
            {
                int usertype = Convert.ToInt32(dt.Rows[0]["User_Type"]);
                if (usertype == 1)
                {
                    Session["mobile"] = txtmobile.Text;
                    Session["userid"] = dt.Rows[0]["userid"].ToString();
                    Session["password"] = dt.Rows[0]["password"].ToString();
                    Session["Usertype"] = dt.Rows[0]["User_Type"].ToString();
                    Response.Redirect("AdminModule/Deshboard.aspx");
                }
                else if (usertype == 2)
                {
                    Session["mobile"] = txtmobile.Text;
                    Session["userid"] = dt.Rows[0]["userid"].ToString();
                    Session["password"] = dt.Rows[0]["password"].ToString();
                    Response.Redirect("SallerPanel/Dashboard.aspx");
                }



                else
                {
                    Response.Write("<script>alert('Userid Or Password Wrong');</script>");
                }

                    }
            else
                    {
                        Response.Write("<script>alert('Userid Or Password Wrong');</script>");
                    }

                }
            }
        }