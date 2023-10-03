using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SallerPanel
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        ClsUser clsUser = new ClsUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                if (Session["userid"] != null)
                {
                    GetUserSession();
                }
                else
                {
                    Response.Redirect("../Default.aspx");
                }
            }

        }
        public void GetUserSession()
        {
            try
            {
                string id = Session["userid"].ToString();
                DataTable dt = clsUser.GetSingleUser(id, "id");
                if (dt.Rows.Count > 0)
                {

                    useriamge.Src = dt.Rows[0]["User_image"].ToString();
                    userimage1.Src = dt.Rows[0]["User_image"].ToString();
                    usertype.InnerText = dt.Rows[0]["UserType_Name"].ToString();
                    username.InnerText = dt.Rows[0]["Username"].ToString();
                    name.InnerText = dt.Rows[0]["Username"].ToString();

                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_logout1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("../Default.aspx");
        }

        protected void btn_profile_Click(object sender, EventArgs e)
        {
            Response.Redirect("../SallerPanel/SallerProfile.aspx");
        }
    }
}

