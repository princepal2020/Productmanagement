
using Productmanagement.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.AdminModule
{
    public partial class AddUser : System.Web.UI.Page
    {
        ClsUser clsUser = new ClsUser();
        Clsdefferentmethode clsdefferent = new Clsdefferentmethode();
        
       
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!IsPostBack)
            {
                GetSteteUsertype();
            }
            if (Request.QueryString["userid"] != null)
            {
                btn_submit.Visible = false;
                btn_Update.Visible = true;
                string userid = Request.QueryString["userid"].ToString();
                DataTable dt = clsUser.GetSingleUser(userid, "Userid");
                if (dt != null && dt.Rows.Count > 0)
                {
                    txtname.Text = dt.Rows[0]["UserName"].ToString(); ;
                    txtcompanyname.Text = dt.Rows[0]["Company_Name"].ToString();
                    txtemail.Text = dt.Rows[0]["Email_id"].ToString();
                    txtmobileno.Text = dt.Rows[0]["Mobile_No"].ToString();
                    txtaddharno.Text = dt.Rows[0]["Aadhar_No"].ToString();
                    txtpanno.Text = dt.Rows[0]["Pancard_No"].ToString();
                    txtgstinno.Text = dt.Rows[0]["Gstin_no"].ToString();
                    txtpassword.Text = dt.Rows[0]["Password"].ToString();
                    txtstorename.Text = dt.Rows[0]["Branch_details"].ToString();
                    txtbrachdetails.Text = dt.Rows[0]["Store_Name"].ToString();
                    txtcity.Text = dt.Rows[0]["city"].ToString(); ;
                    txtaddress.Text = dt.Rows[0]["Address"].ToString();
                    ViewState["UserImage"]= dt.Rows[0]["User_image"].ToString();
                }
            }
        }

        public void GetSteteUsertype()
        {
            
            try
            {
                string usertyp = Session["Usertype"].ToString();
                DataTable dt = clsUser.GetState();
                DataTable dt1 = clsUser.GetUsertype(usertyp);
                if ((dt != null && dt.Rows.Count > 0) && (dt1 != null && dt1.Rows.Count > 0))
                {
                    dd_state.DataSource = dt;
                    dd_state.DataValueField = "Stateid";
                    dd_state.DataTextField = "State_name";
                    dd_state.DataBind();
                    dd_usertype.DataSource = dt1;
                    dd_usertype.DataValueField = "id";
                    dd_usertype.DataTextField = "UserType_Name";
                    dd_usertype.DataBind();
                    dd_usertype.Items.Insert(0, new ListItem { Text = "-- Select UserType --", Value = "0" });
                    dd_state.Items.Insert(0, new ListItem { Text = "-- Select State --", Value = "0" });

                }
                else
                {
                    dd_state.DataSource = dt;
                    dd_state.DataValueField = "Stateid";
                    dd_state.DataTextField = "State_name";
                    dd_state.DataBind();
                    dd_usertype.DataSource = dt1;
                    dd_usertype.DataValueField = "id";
                    dd_usertype.DataTextField = "UserType_Name";
                    dd_usertype.DataBind();
                    dd_usertype.Items.Insert(0, new ListItem { Text = "-- Select UserType --", Value = "0" });
                    dd_state.Items.Insert(0, new ListItem { Text = "-- Select State --", Value = "0" });
                }

            }
            catch (Exception ex)
            {

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

            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                string id = Session["userid"].ToString();
                Random random = new Random();
                string userid = DateTime.Now.ToString("ddMMyyyy") + random.Next(10000, 99999).ToString();
                int minsize = 45 * 1024; int maxsize = 300 * 1024;
                bool status = true; int count = 0; int statuscount = 0;
                string useriame = "", adharfont = "", adharback = "", pancardimage = "";
                int fileSize1 = 0, fileSize2 = 0, fileSize3 = 0, fileSize4 = 0;
                if (fileuserimage.HasFile)
                {
                    fileSize1 = fileuserimage.PostedFile.ContentLength;
                    if (fileSize1 > minsize & fileSize1 < maxsize)
                    {
                        useriame = Path.GetFileName(fileuserimage.PostedFile.FileName);
                        fileuserimage.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + useriame));
                        useriame = "~/AdminModule/Userimage/" + useriame;
                        status = clsdefferent.checkexetion(fileuserimage);
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

                }
                if (fileadharfont.HasFile)
                {
                    fileSize2 = fileadharfont.PostedFile.ContentLength;
                    if (fileSize2 > minsize & fileSize2 < maxsize)
                    {
                        adharfont = Path.GetFileName(fileadharfont.PostedFile.FileName);
                        fileadharfont.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + adharfont));
                        adharfont = "~/AdminModule/Userimage/" + adharfont;
                        status = clsdefferent.checkexetion(fileadharfont);
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

                }
                if (fileadharback.HasFile)
                {
                    fileSize3 = fileadharback.PostedFile.ContentLength;
                    if (fileSize3 > minsize & fileSize3 < maxsize)
                    {
                        adharback = Path.GetFileName(fileadharback.PostedFile.FileName);
                        fileadharback.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + adharback));
                        adharback = "~/AdminModule/Userimage/" + adharback;
                        status = clsdefferent.checkexetion(fileadharback);
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

                }
                if (filepancard.HasFile)
                {
                    fileSize4 = filepancard.PostedFile.ContentLength;
                    if (fileSize4 > minsize & fileSize4 < maxsize)
                    {
                        pancardimage = Path.GetFileName(filepancard.PostedFile.FileName);
                        filepancard.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + pancardimage));
                        pancardimage = "~/AdminModule/Userimage/" + pancardimage;
                        status = clsdefferent.checkexetion(filepancard);
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

                }

                if (count == 0 && statuscount == 0)
                {
                    int result = clsUser.AddUSer(userid, txtname.Text, txtmobileno.Text, txtemail.Text, txtcompanyname.Text, txtpassword.Text, dd_usertype.SelectedValue, txtaddress.Text, txtaddharno.Text, txtpanno.Text, txtgstinno.Text, useriame, adharfont, pancardimage, txtstorename.Text, txtbrachdetails.Text, txtdob.Text, id, dd_state.SelectedValue, dd_district.SelectedValue, txtcity.Text, adharback,dd_gender.SelectedItem.Text);
                    if (result > 0)
                    {
                        txtmassage.InnerText = "User has been  add success";
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);

                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

                }
            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string id = Session["id"].ToString();
            int minsize = 45 * 1024; int maxsize = 300 * 1024;
            bool status = true; int count = 0; int statuscount = 0;
            string useriame = "", adharfont = "", adharback = "", pancardimage = "";
            int fileSize1 = 0, fileSize2 = 0, fileSize3 = 0, fileSize4 = 0;
            if (fileuserimage.HasFile)
            {
                fileSize1 = fileuserimage.PostedFile.ContentLength;
                if (fileSize1 > minsize & fileSize1 < maxsize)
                {
                    useriame = Path.GetFileName(fileuserimage.PostedFile.FileName);
                    fileuserimage.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + useriame));
                    useriame = "~/AdminModule/Userimage/" + useriame;
                    status = clsdefferent.checkexetion(fileuserimage);
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
                useriame = ViewState["UserImage"].ToString();
            }
            if (fileadharfont.HasFile)
            {
                fileSize2 = fileadharfont.PostedFile.ContentLength;
                if (fileSize2 > minsize & fileSize2 < maxsize)
                {
                    adharfont = Path.GetFileName(fileadharfont.PostedFile.FileName);
                    fileadharfont.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + adharfont));
                    adharfont = "~/AdminModule/Userimage/" + adharfont;
                    status = clsdefferent.checkexetion(fileadharfont);
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

            }
            if (fileadharback.HasFile)
            {
                fileSize3 = fileadharback.PostedFile.ContentLength;
                if (fileSize3 > minsize & fileSize3 < maxsize)
                {
                    adharback = Path.GetFileName(fileadharback.PostedFile.FileName);
                    fileadharback.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + adharback));
                    adharback = "~/AdminModule/Userimage/" + adharback;
                    status = clsdefferent.checkexetion(fileadharback);
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

            }
            if (filepancard.HasFile)
            {
                fileSize4 = filepancard.PostedFile.ContentLength;
                if (fileSize4 > minsize & fileSize4 < maxsize)
                {
                    pancardimage = Path.GetFileName(filepancard.PostedFile.FileName);
                    filepancard.SaveAs(Server.MapPath("~/AdminModule/Userimage/" + pancardimage));
                    pancardimage = "~/AdminModule/Userimage/" + pancardimage;
                    status = clsdefferent.checkexetion(filepancard);
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

            }
            string userid = Request.QueryString["userid"].ToString();
            int result = clsUser.AddUpdate(userid,txtname.Text,txtmobileno.Text,txtemail.Text,txtemail.Text,txtpassword.Text,dd_usertype.SelectedValue,txtaddress.Text,txtaddharno.Text,txtpanno.Text,txtgstinno.Text,useriame,adharfont,pancardimage,txtstorename.Text,txtbrachdetails.Text,txtdob.Text,id,dd_state.SelectedValue,dd_district.SelectedValue,txtcity.Text,adharback,dd_gender.SelectedItem.Text);
            if (result > 0)
            {

                txtmassage.InnerText = "User has been  update success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                Response.Redirect("UserList.aspx");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }
    }
}