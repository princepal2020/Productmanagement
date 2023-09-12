using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.AdminModule
{
    public partial class UserList : System.Web.UI.Page
    {
        ClsUser clsUser = new ClsUser();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetUser();
            }

        }
        public void GetUser()
        {
            try
            {
                DataTable dt = clsUser.Getuser();
                if (dt != null && dt.Rows.Count > 0)
                {
                    grid_userlist.DataSource = dt;
                    grid_userlist.DataBind();
                }
                else
                {

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void grid_userlist_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label Userid = (Label)grid_userlist.Rows[e.RowIndex].FindControl("lbluserid") as Label;

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);

            DataTable dt = clsUser.GetSingleUser(Userid.Text);
            if (dt != null && dt.Rows.Count > 0)
            {

                DataTable dts = clsUser.Getstatewithid(dt.Rows[0]["State"].ToString());
                DataTable dtd = clsUser.Getdistrictwithid(dt.Rows[0]["distric"].ToString());
                if ((dts != null && dts.Rows.Count > 0) && (dtd != null && dtd.Rows.Count > 0))
                {
                    lblstate.Text = dts.Rows[0]["State_name"].ToString();
                    lbldistrict.Text = dtd.Rows[0]["District_Name"].ToString();

                }
                lbluserid.Text = dt.Rows[0]["Userid"].ToString();
                lblName.Text = dt.Rows[0]["UserName"].ToString();
                lblmobileno.Text = dt.Rows[0]["Mobile_No"].ToString();
                lblemailid.Text = dt.Rows[0]["Email_id"].ToString();
                lblaadharno.Text = dt.Rows[0]["Aadhar_No"].ToString();
                lblpanno.Text = dt.Rows[0]["Pancard_No"].ToString();
                lblGstin_no.Text = dt.Rows[0]["Gstin_no"].ToString();
                lbldob.Text = dt.Rows[0]["Dob"].ToString();
                lblcompanyname.Text = dt.Rows[0]["Company_Name"].ToString();
                lblpassword.Text = dt.Rows[0]["Password"].ToString();
                lbladdres.Text = dt.Rows[0]["Address"].ToString();
                lblcity.Text = dt.Rows[0]["city"].ToString();
                lblstore.Text = dt.Rows[0]["Store_Name"].ToString();
                lblbranch.Text = dt.Rows[0]["Branch_details"].ToString();
                userimg.Src = dt.Rows[0]["User_Image"].ToString();
                adharfornt.Src = dt.Rows[0]["Aadhar_image"].ToString();
                adharback.Src = dt.Rows[0]["Adhar_back_image"].ToString();
                panimg.Src = dt.Rows[0]["Pancard_image"].ToString();



            }
        }

        protected void grid_userlist_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridViewRow row = grid_userlist.Rows[e.NewEditIndex];
            Label Userid = (Label)row.FindControl("lbluserid");
            Response.Redirect("AddUser.aspx?userid=" + Userid.Text);
        }

        protected void grid_userlist_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            Label Userid = (Label)grid_userlist.Rows[e.RowIndex].FindControl("lbluserid") as Label;
            lblmassege.Text = Userid.Text;
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive2').modal();", true);

        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            int result = clsUser.Deleteuser(lblmassege.Text);
            if (result > 0)
            {
                GetUser();
            }
        }
    }
}