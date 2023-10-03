 using Productmanagement.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;

using System.Web;
using System.Web.UI.WebControls;

using System.Web.UI;
using System.Text;

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
                else if (e.CommandName == "AddStock")
                {
                    Label Product_Name = (Label)e.Item.FindControl("lblproduct_name");
                    Label Brand_Name = (Label)e.Item.FindControl("lblbrand");
                    string product_code = e.CommandArgument.ToString();
                    Response.Redirect("Stock_Manage.aspx?productscode=" + product_code + "&product_name=" + Product_Name.Text + "&brand_name=" + Brand_Name.Text);
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
                DataTable ds = addproducts.Searching(txtsearch.Text);
                DataTable dt = addproducts.Getaddpimagejoin();
               
                if (dt.Rows.Count > 0)
                {
                    
                        PagedDataSource pgitems = new PagedDataSource();
                    if(txtsearch.Text!=null && txtsearch.Text != "")
                    {
                        pgitems.DataSource = ds.DefaultView;
                        pgitems.AllowPaging = true;
                    }
                    else
                    {
                        pgitems.DataSource = dt.DefaultView;
                        pgitems.AllowPaging = true;
                    }
                        
                   

                   

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

        protected void btn_excel_Click(object sender, EventArgs e)
        {

           
            DataTable dt = addproducts.Getaddpimagejoin();
            StringBuilder csvData = new StringBuilder();

            // Add column headers
            csvData.AppendLine("Product Code,Product Name,Brand Name,Brand Name,HSN Code,Serial No,Product Barcode,Product details"); // Replace with your column names

            // Iterate through Repeater items and append data
            for(int i = 0; i<dt.Rows.Count;i++)
            {
                string product_code = dt.Rows[i]["product_code"].ToString(); // Replace with the actual control IDs
                string product_name = dt.Rows[i]["product_name"].ToString();
                string Brand_name = dt.Rows[i]["Brand_name"].ToString();
                string Product_HSN_ode = dt.Rows[i]["Product_HSN_ode"].ToString();
                string Product_serial_No = dt.Rows[i]["Product_serial_No"].ToString();
                string Product_varcode = dt.Rows[i]["Product_varcode"].ToString();
                string Product_details = dt.Rows[i]["Product_details"].ToString();

                // Append data to the CSV string
                csvData.AppendLine($"{product_code},{product_name},{Brand_name},{Product_HSN_ode},{Product_serial_No},{Product_varcode},{Product_details}");
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
            getallusers(0);
        }
    }
}