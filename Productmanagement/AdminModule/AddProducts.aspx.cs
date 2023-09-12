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
    public partial class AddProducts : System.Web.UI.Page
    {
        ClsAddproducts addproducts = new ClsAddproducts();
        Clsdefferentmethode clsdefferent = new Clsdefferentmethode();
        ClsAddCategory_SubCategory clsAddCategory_ = new ClsAddCategory_SubCategory();
        //string id = Session["id"].ToString();
        string id = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindCategory();
                btn_Update.Visible = false;
            }
            if (Request.QueryString["product_code"] != null)
            {
                string product_code = Request.QueryString["product_code"].ToString();
                btn_submit.Visible = false;
                btn_Update.Visible = true;
                Productupdate(product_code);
            }

        }
        protected void Productupdate( string product_code)
        {
            DataTable dt = addproducts.GetProductcode(product_code);
            if(dt!=null && dt.Rows.Count > 0)
            {
                txtbrandname.Text = dt.Rows[0]["Brand_Name"].ToString();
                txtserialno.Text = dt.Rows[0]["Product_serial_No"].ToString();
                txtshncode.Text = dt.Rows[0]["Product_HSN_ode"].ToString(); ;
                txtproductDiscriptions.Text = dt.Rows[0]["Product_details"].ToString(); ;
                txtproductname.Text = dt.Rows[0]["Product_Name"].ToString();
                ViewState["Product_Image1"] = dt.Rows[0]["Product_Image1"].ToString();
                ViewState["Product_Image2"] = dt.Rows[0]["Product_Image2"].ToString();
                ViewState["Product_Image3"] = dt.Rows[0]["Product_Image3"].ToString();
                ViewState["Product_Image4"] = dt.Rows[0]["Product_Image4"].ToString();
                ViewState["Product_Image5"] = dt.Rows[0]["Product_Image5"].ToString();
                ViewState["Product_Image6"] = dt.Rows[0]["Product_Image6"].ToString();
                btn_submit.Visible=false;
            }
        }

        public void BindCategory()
        {
            try
            {
                DataTable dt = clsAddCategory_.GetCategoty();
                if (dt != null && dt.Rows.Count > 0)
                {


                    category.DataSource = dt;
                    category.DataTextField = "CatogeryName";
                    category.DataValueField = "Id";

                    category.DataBind();
                    dd_seletcategory.DataSource = dt;
                    dd_seletcategory.DataTextField = "CatogeryName";
                    dd_seletcategory.DataValueField = "Id";

                    dd_seletcategory.DataBind();
                }
                category.Items.Insert(0, new ListItem { Text = "--Select Category --", Value = "" });
                dd_seletcategory.Items.Insert(0, new ListItem { Text = "--Select Category --", Value = "" });


            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {


            try
            {

                Random random = new Random();
                string product_code = "wts" + DateTime.Now.ToString("ddMMyyyy") + random.Next(10000, 99999).ToString();
                int minsize = 45 * 1024; int maxsize = 300 * 1024;
                bool status = true; int count = 0; int statuscount = 0;
                string filename1 = "", filename2 = "", filename3 = "", filename4 = "", filename5 = "", filename6 = "";
                int fileSize1 = 0, fileSize2 = 0, fileSize3 = 0, fileSize4 = 0, fileSize5 = 0, fileSize6 = 0;
                if (productimage1.HasFile)
                {
                    fileSize1 = productimage1.PostedFile.ContentLength;
                    if (fileSize1 > minsize & fileSize1 < maxsize)
                    {
                        filename1 = Path.GetFileName(productimage1.PostedFile.FileName);
                        productimage1.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename1));
                        filename1 = "~/AdminModule/Productsimage/" + filename1;
                        status = clsdefferent.checkexetion(productimage1);
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
                if (productimage2.HasFile)
                {
                    fileSize2 = productimage2.PostedFile.ContentLength;
                    if (fileSize2 > minsize & fileSize2 < maxsize)
                    {
                        filename2 = Path.GetFileName(productimage2.PostedFile.FileName);
                        productimage2.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename2));
                        filename2 = "~/AdminModule/Productsimage/" + filename2;
                        status = clsdefferent.checkexetion(productimage2);
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
                if (productimage3.HasFile)
                {
                    fileSize3 = productimage3.PostedFile.ContentLength;
                    if (fileSize3 > minsize & fileSize3 < maxsize)
                    {
                        filename3 = Path.GetFileName(productimage3.PostedFile.FileName);
                        productimage3.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename3));
                        filename3 = "~/AdminModule/Productsimage/" + filename3;
                        status = clsdefferent.checkexetion(productimage3);
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
                if (productimage4.HasFile)
                {
                    fileSize4 = productimage4.PostedFile.ContentLength;
                    if (fileSize4 > minsize & fileSize4 < maxsize)
                    {
                        filename4 = Path.GetFileName(productimage4.PostedFile.FileName);
                        productimage4.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename4));
                        filename4 = "~/AdminModule/Productsimage/" + filename4;
                        status = clsdefferent.checkexetion(productimage4);
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
                if (productimage5.HasFile)
                {
                    fileSize5 = productimage5.PostedFile.ContentLength;
                    if (fileSize5 > minsize & fileSize5 < maxsize)
                    {
                        filename5 = Path.GetFileName(productimage5.PostedFile.FileName);
                        productimage5.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename5));
                        filename5 = "~/AdminModule/Productsimage/" + filename5;
                        status = clsdefferent.checkexetion(productimage5);
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
                if (productimage6.HasFile)
                {
                    fileSize6 = productimage6.PostedFile.ContentLength;
                    if (fileSize6 > minsize & fileSize6 < maxsize)
                    {
                        filename6 = Path.GetFileName(productimage6.PostedFile.FileName);
                        productimage6.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename6));
                        filename6 = "~/AdminModule/Productsimage/" + filename6;
                        status = clsdefferent.checkexetion(productimage6);
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


                    int result = addproducts.AddProduct(txtbrandname.Text, txtproductname.Text, product_code, category.SelectedValue, categorysub.SelectedValue, txtshncode.Text, txtserialno.Text, txtproductDiscriptions.Text, txtbarcode.Text, id);
                    DataTable dt = addproducts.GetProductcode(product_code);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        int product_id = Convert.ToInt32(dt.Rows[0]["Product_id"]);
                        int result1 = addproducts.Addproductimage(product_id, filename1, filename2, filename3, filename4, filename5, filename6, id);
                        if (result > 0 && result1 > 0)
                        {
                            txtmassage.InnerText = "Product add success" + "\n" + "Product Code " + product_code;
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                            btn_addstocks.Visible = true;
                            ViewState["product_code"] = product_code;
                            ViewState["brand_name"] = txtbrandname.Text;
                            ViewState["product_name"] = txtproductname.Text;
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                        }
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

                }
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }

        protected void btn_CSave_Click(object sender, EventArgs e)
        {
            int result = clsAddCategory_.AddCategory(txtcategoryname.Text, txtDescription.Text, id);
            if (result > 0)
            {
                txtmassage.InnerText = "Category Add Success";
                BindCategory();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }

        protected void btn_sbSave_Click(object sender, EventArgs e)
        {
            int result = clsAddCategory_.AddSubCategory(dd_seletcategory.SelectedValue, txtsubcategoryname.Text, txtsubDescription.Text, id);
            if (result > 0)
            {
                txtmassage.InnerText = "Sub Category Add Success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }

        protected void category_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = clsAddCategory_.GetSubCategoty(category.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    categorysub.DataSource = dt;
                    categorysub.DataTextField = "SubCatogeryName";
                    categorysub.DataValueField = "id";
                    categorysub.DataBind();
                    categorysub.Items.Insert(0, new ListItem { Text = "--Select Sub Category --", Value = "0" });

                }
                else
                {
                    categorysub.DataSource = dt;
                    categorysub.DataTextField = "SubCatogeryName";
                    categorysub.DataValueField = "id";
                    categorysub.DataBind();
                    categorysub.Items.Insert(0, new ListItem { Text = "--Select Sub Category --", Value = "0" });
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void btn_addstocks_Click(object sender, EventArgs e)
        {
            string product_code = ViewState["product_code"].ToString();
            string brand_name = ViewState["brand_name"].ToString();
            string product_name = ViewState["product_name"].ToString();
            Response.Redirect("Stock_Manage.aspx?productscode=" + product_code + "&product_name=" + product_name + "&brand_name=" + brand_name);

        }

        protected void btn_Update_Click(object sender, EventArgs e)
        {
            string product_code = Request.QueryString["product_code"].ToString();
            int minsize = 45 * 1024; int maxsize = 300 * 1024;
            bool status = true; int count = 0; int statuscount = 0;
            string filename1 = "", filename2 = "", filename3 = "", filename4 = "", filename5 = "", filename6 = "";
            int fileSize1 = 0, fileSize2 = 0, fileSize3 = 0, fileSize4 = 0, fileSize5 = 0, fileSize6 = 0;

            if (productimage1.HasFile)
            {
                fileSize1 = productimage1.PostedFile.ContentLength;
                if (fileSize1 > minsize & fileSize1 < maxsize)
                {
                    filename1 = Path.GetFileName(productimage1.PostedFile.FileName);
                    productimage1.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename1));
                    filename1 = "~/AdminModule/Productsimage/" + filename1;
                    status = clsdefferent.checkexetion(productimage1);
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
               if(ViewState["Product_Image1"] != null)
                {
                    filename1 = ViewState["Product_Image1"].ToString();
                }

            }
            if (productimage2.HasFile)
            {
                fileSize2 = productimage2.PostedFile.ContentLength;
                if (fileSize2 > minsize & fileSize2 < maxsize)
                {
                    filename2 = Path.GetFileName(productimage2.PostedFile.FileName);
                    productimage2.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename2));
                    filename2 = "~/AdminModule/Productsimage/" + filename2;
                    status = clsdefferent.checkexetion(productimage2);
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
                if (ViewState["Product_Image2"] != null)
                {
                    filename2 = ViewState["Product_Image2"].ToString();
                }

            }
            if (productimage3.HasFile)
            {
                fileSize3 = productimage3.PostedFile.ContentLength;
                if (fileSize3 > minsize & fileSize3 < maxsize)
                {
                    filename3 = Path.GetFileName(productimage3.PostedFile.FileName);
                    productimage3.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename3));
                    filename3 = "~/AdminModule/Productsimage/" + filename3;
                    status = clsdefferent.checkexetion(productimage3);
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
                if (ViewState["Product_Image3"] != null)
                {
                    filename3 = ViewState["Product_Image3"].ToString();
                }
            }
            if (productimage4.HasFile)
            {
                fileSize4 = productimage4.PostedFile.ContentLength;
                if (fileSize4 > minsize & fileSize4 < maxsize)
                {
                    filename4 = Path.GetFileName(productimage4.PostedFile.FileName);
                    productimage4.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename4));
                    filename4 = "~/AdminModule/Productsimage/" + filename4;
                    status = clsdefferent.checkexetion(productimage4);
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
                if (ViewState["Product_Image4"] != null)
                {
                    filename4= ViewState["Product_Image4"].ToString();
                }
            }
            if (productimage5.HasFile)
            {
                fileSize5 = productimage5.PostedFile.ContentLength;
                if (fileSize5 > minsize & fileSize5 < maxsize)
                {
                    filename5 = Path.GetFileName(productimage5.PostedFile.FileName);
                    productimage5.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename5));
                    filename5 = "~/AdminModule/Productsimage/" + filename5;
                    status = clsdefferent.checkexetion(productimage5);
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
                if (ViewState["Product_Image5"] != null)
                {
                    filename5 = ViewState["Product_Image5"].ToString();
                }
            }
            if (productimage6.HasFile)
            {
                fileSize6 = productimage6.PostedFile.ContentLength;
                if (fileSize6 > minsize & fileSize6 < maxsize)
                {
                    filename6 = Path.GetFileName(productimage6.PostedFile.FileName);
                    productimage6.SaveAs(Server.MapPath("~/AdminModule/Productsimage/" + filename6));
                    filename6 = "~/AdminModule/Productsimage/" + filename6;
                    status = clsdefferent.checkexetion(productimage6);
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
                if (ViewState["Product_Image6"] != null)
                {
                    filename6 = ViewState["Product_Image6"].ToString();
                }
            }

            int result = addproducts.productsUpdate(txtbrandname.Text,txtproductname.Text,txtserialno.Text,txtshncode.Text,txtproductDiscriptions.Text,filename1,filename2,filename3,filename4,filename5,filename6, product_code);
            if (result > 0)
            {
                txtmassage.InnerText = "Product has been update success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                //Response.Redirect("../ProductsList.aspx");

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }
    }
}