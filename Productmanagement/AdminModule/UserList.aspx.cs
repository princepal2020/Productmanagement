using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
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
                DataTable dt1 = clsUser.Searching(txtsearch.Text);
                if (dt1.Rows.Count > 0)
                {
                    grid_userlist.DataSource = dt1;
                    grid_userlist.DataBind();
                }
              else  if (dt != null && dt.Rows.Count > 0)
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

        protected void grid_userlist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grid_userlist.PageIndex = e.NewPageIndex;
            GetUser();
        }
        protected void btn_excel_Click(object sender, EventArgs e)
        {


            DataTable dt = clsUser.Getuser();
            StringBuilder csvData = new StringBuilder();

            // Add column headers
            csvData.AppendLine("User Name ,Mobile No ,Email Id,Aadhar No,Pan Card No,GSTIN No,Dob,Company Name, Address, State, District, City"); // Replace with your column names
           

            // Iterate through Repeater items and append data
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dts = clsUser.Getstatewithid(dt.Rows[0]["State"].ToString());
                DataTable dtd = clsUser.Getdistrictwithid(dt.Rows[0]["distric"].ToString());
                string UserName = dt.Rows[i]["UserName"].ToString(); // Replace with the actual control IDs
                string Mobile_No = dt.Rows[i]["Mobile_No"].ToString();
                string Email_id = dt.Rows[i]["Email_id"].ToString();
                string Aadhar_No = dt.Rows[i]["Aadhar_No"].ToString();
                string Pancard_No = dt.Rows[i]["Pancard_No"].ToString();
                string Gstin_no = dt.Rows[i]["Gstin_no"].ToString();
                string Dob = dt.Rows[i]["Dob"].ToString();
                string Company_Name = dt.Rows[i]["Company_Name"].ToString();
                string Address = dt.Rows[i]["Address"].ToString();
                string State_name = dts.Rows[i]["State_name"].ToString();
                string District_Name = dtd.Rows[i]["District_Name"].ToString();
                string city = dt.Rows[i]["city"].ToString();
           

                // Append data to the CSV string
                csvData.AppendLine($"{UserName},{Mobile_No},{Email_id},{Aadhar_No},{Pancard_No},{Gstin_no},{Dob},{Company_Name},{Address},{State_name},{District_Name},{city}");
            }

            // Send the data as a CSV file to the client
            Response.Clear();
            Response.Buffer = true;
            Response.ContentType = "text/csv";
            Response.AddHeader("content-disposition", "attachment;filename=data.csv");
            Response.Charset = "";
            Response.Output.Write(csvData.ToString());
            Response.End();
        }
        protected void btn_search_Click(object sender, EventArgs e)
        {
            GetUser();
        }
    }
}