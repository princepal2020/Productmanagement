using Productmanagement.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.AdminModule
{
    public partial class ProductsList : System.Web.UI.Page
    {
        ClsAddproducts addproducts = new ClsAddproducts();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getallusers(0);

            }
        }

       



        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "Edit")
                {
                    string product_code = e.CommandArgument.ToString();
                    Response.Redirect("AddProducts.aspx?product_code=" + product_code);
                }
                else if (e.CommandName == "Update")
                {
                    string product_code = e.CommandArgument.ToString();
                   
                    DataTable dt = addproducts.GetProductcode(product_code);
                    if (dt != null && dt.Rows.Count > 0)
                    {
                        lblproductcode.Text = dt.Rows[0]["product_code"].ToString();
                        lblproductname.Text = dt.Rows[0]["product_Name"].ToString();
                        lblbrandame.Text = dt.Rows[0]["Brand_Name"].ToString();
                        lblhsncode.Text = dt.Rows[0]["product_hsn_ode"].ToString();
                        lblserialno.Text = dt.Rows[0]["product_serial_no"].ToString();
                        lbldetails.Text = dt.Rows[0]["product_details"].ToString();
                        lblbarcode.Text = dt.Rows[0]["product_varcode"].ToString();
                        product_image1.Src = dt.Rows[0]["Product_Image1"].ToString();
                        product_image2.Src = dt.Rows[0]["Product_Image2"].ToString();
                        product_image3.Src = dt.Rows[0]["Product_Image3"].ToString();
                        product_image4.Src = dt.Rows[0]["Product_Image4"].ToString();
                        product_image5.Src = dt.Rows[0]["Product_Image5"].ToString();
                        product_image6.Src = dt.Rows[0]["Product_Image6"].ToString();
                     
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);
                    

                    }
                }
                else if (e.CommandName == "Delete")
                {

                    lblmassege.Text = e.CommandArgument.ToString();
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive2').modal();", true);

                }
            }
            catch (Exception ex)
            {

            }

        }

        protected void btn_delete_Click(object sender, EventArgs e)
        {
            int result = addproducts.Deleteproducts(lblmassege.Text);
            if (result > 0)
            {
                getallusers(0);
            }
            else
            {

            }
        }

        //protected void rptpaging_itemcommand(object source, RepeaterCommandEventArgs e)
        //{
        //    int pagenumber = Convert.ToInt32(e.CommandArgument) - 1;
        //    getallusers(pagenumber);
        //}
        public void getallusers(int pagenumber)
        {
           
            try
            {
               // DataSet ds = addproducts.Searching(txtsearch.Text);
                DataTable dt = addproducts.Getaddpimagejoin();
               
                if (dt.Rows.Count > 0)
                {
                  
                    
                    PagedDataSource pgitems = new PagedDataSource();
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;

                    //control page size from here 
                    pgitems.PageSize = 5;
                    pgitems.CurrentPageIndex = pagenumber;
                    if (pgitems.PageCount > 1)
                    {
                        rptPaging.Visible = true;
                        ArrayList pages = new ArrayList();
                        for (int i = 0; i <= pgitems.PageCount - 1; i++)
                        {
                            pages.Add((i + 1).ToString());
                        }
                        rptPaging.DataSource = pages;
                        rptPaging.DataBind();
                    }
                    else
                    {
                        rptPaging.Visible = false;
                    }
                  
                 
                        Repeater1.DataSource = pgitems;
                        Repeater1.DataBind();
                    
                  
                }
                else
                {
                    Repeater1.DataSource = null;
                    Repeater1.DataBind();
                }
            }
            catch(Exception ex)
            {

            }
            finally
            {

            }
        }

        protected void rptPaging_ItemCommand1(object source, RepeaterCommandEventArgs e)
        {
            int pagenumber = Convert.ToInt32(e.CommandArgument) - 1;
            getallusers(pagenumber);
        }

      
    }
}