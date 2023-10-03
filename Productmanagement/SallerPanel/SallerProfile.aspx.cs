using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.SallerPanel
{
    public partial class SallerProfile : System.Web.UI.Page
    {
        ClsUser clsUser = new ClsUser();
        Clsdefferentmethode clsdefferent = new Clsdefferentmethode();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                GetActiveUserData();
            }

        }

        public void GetActiveUserData()

        {
            try
            {
                string userids = Session["userid"].ToString();
                DataTable dt = clsUser.GetSingleUser(userids, "id");
                if (dt.Rows.Count > 0)
                {
                    image.Src = dt.Rows[0]["User_image"].ToString();
                    husername.InnerText = dt.Rows[0]["Username"].ToString();
                    usertype.InnerText = dt.Rows[0]["UserType_Name"].ToString();
                    userid.InnerText = dt.Rows[0]["userid"].ToString();
                    amobile.InnerText = dt.Rows[0]["Mobile_no"].ToString();
                    aemail.InnerText = dt.Rows[0]["Email_id"].ToString();
                    string dob1 = dt.Rows[0]["Dob"].ToString();
                    string[] birthday = dob1.Split(' ');
                    dob.InnerText = birthday[0];
                    address.InnerText = dt.Rows[0]["address"].ToString();
                    gender.InnerText = dt.Rows[0]["Gender"].ToString();
                    spanno.InnerText = dt.Rows[0]["Pancard_No"].ToString();
                    sadharrno.InnerText = dt.Rows[0]["Aadhar_No"].ToString();
                    sgstiono.InnerText = dt.Rows[0]["Gstin_no"].ToString();
                    State.InnerText = dt.Rows[0]["State_name"].ToString();
                    District.InnerText = dt.Rows[0]["District_Name"].ToString();
                    pincode.InnerText = dt.Rows[0]["Pin_Code"].ToString();
                    Scity.InnerText = dt.Rows[0]["city"].ToString();
                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            DataTable dt = clsUser.GetState();
            if (dt.Rows.Count > 0)
            {
                profile_image.Src = image.Src;
                ViewState["image"] = image.Src;
                txtname.Text = husername.InnerText;
                txtemail.Text = aemail.InnerText;
                txtmobile.Text = amobile.InnerText;
                txtaddress.Text = address.InnerText;
                txtpincode.Text = pincode.InnerText;
                lbluserid.Text = userid.InnerText;
                txtcity.Text = Scity.InnerText;
                dd_state.DataSource = dt;
                dd_state.DataValueField = "Stateid";
                dd_state.DataTextField = "State_name";
                dd_state.DataBind();
            }
            dd_state.Items.Insert(0, new ListItem { Text = "-- Select State --", Value = "0" });
            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);
        }



        protected void btn_save_Click(object sender, EventArgs e)
        {
            try
            {
                string id = Session["userid"].ToString();
                bool status = true; int count = 0; int statuscount = 0;
                string filename1 = "";
                int fileSize1 = 0;
                int minsize = 45 * 1024; int maxsize = 300 * 1024;
                if (file.HasFile)
                {
                    fileSize1 = file.PostedFile.ContentLength;
                    if (fileSize1 > minsize & fileSize1 < maxsize)
                    {
                        filename1 = Path.GetFileName(file.PostedFile.FileName);
                        file.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename1));
                        filename1 = "~/AdminModule/Productsimage/" + filename1;
                        status = clsdefferent.checkexetion(file);
                        if (status == false)
                        {
                            statuscount++;
                        }
                    }
                    else
                    {

                        count++;
                    }
                }
                else
                {
                    filename1 = ViewState["image"].ToString();
                }

                if (count == 0 && statuscount == 0)
                {
                    int result = clsUser.ActiveUserUpdate(lbluserid.Text, txtname.Text, txtmobile.Text, txtemail.Text, txtaddress.Text, dd_state.SelectedValue, dd_district.SelectedValue, txtcity.Text, txtpincode.Text, filename1, id);

                    if (result > 0)
                    {
                        txtmassage.InnerText = "User has been update success";
                        GetActiveUserData();
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                    }

                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                    }
                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
            }
        }

        protected void dd_state_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = clsUser.GetDistrict(dd_state.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    dd_district.DataSource = dt;
                    dd_district.DataTextField = "District_Name";
                    dd_district.DataValueField = "District_Id";
                    dd_district.DataBind();

                }
                else
                {
                    dd_district.DataSource = dt;
                    dd_district.DataTextField = "District_Name";
                    dd_district.DataValueField = "District_Id";
                    dd_district.DataBind();


                }
                dd_district.Items.Insert(0, new ListItem { Text = "--Select District --", Value = "0" });
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);

            }
            catch (Exception ex)
            {

            }
        }
    }
}