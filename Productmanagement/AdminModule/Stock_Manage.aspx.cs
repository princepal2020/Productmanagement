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
    public partial class Stock_Manage : System.Web.UI.Page
    {
        ClsStocksmanage Stocksmanage = new ClsStocksmanage();
        //string id = Session["id"].ToString();
        string id = "0";
        protected void Page_Load(object sender, EventArgs e)
        {
            string productcode = Request.QueryString["productscode"];
            string brand_name = Request.QueryString["brand_name"];
            string product_name = Request.QueryString["product_name"];
            lblproductcode.Text = productcode;
            lblproductsname.Text = product_name;
            lblbradename.Text = brand_name;
            if (!IsPostBack)
            {
                GetSizeTaxType();
            }
        }

        public void GetSizeTaxType()
        {
            try
            {
                DataTable dtstock = Stocksmanage.GetStocks();
                DataTable dtsea = Stocksmanage.Searching(txtsearch.Text);
                //DataTable dataTable;
                //for (int i = 0; i < dtstock.Rows.Count; i++)
                //{
                //    DateTime Epiredate = Convert.ToDateTime(dtstock.Rows[i]["ExpriyDate"]);
                //    DateTime Todaydate = DateTime.Now.Date;
                //    if (Todaydate < Epiredate) //if given date is equal to exactly 6 months past from today (change == to > if date has to be less 6 months)
                //    {

                //    }

                //}
                DataTable dt = Stocksmanage.GetSize();
                DataTable dt1 = Stocksmanage.GetTaxType();
              
                    
                   
                
                 if (dtstock != null && dtstock.Rows.Count > 0)
                {
                    if(txtsearch.Text!=null && txtsearch.Text!="")
                    {
                        grid_Stoklist.DataSource = dtsea;
                        grid_Stoklist.DataBind();
                    }
                    else
                    {
                        grid_Stoklist.DataSource = null;
                        grid_Stoklist.DataSource = dtstock;
                        grid_Stoklist.DataBind();
                    }
      
                }

                if ((dt != null && dt.Rows.Count > 0) && (dt1 != null && dt.Rows.Count > 0))
                {

                    dd_taxtype.DataSource = dt1;
                    dd_taxtype.DataTextField = "igst";
                    dd_taxtype.DataValueField = "taxid";
                    dd_taxtype.DataBind();
                    dd_taxtype.Items.Insert(0, new ListItem { Text = "--Select Text Type --", Value = "0" });

                    dd_psize.DataSource = dt;
                    dd_psize.DataTextField = "Sizename";
                    dd_psize.DataValueField = "sizeid";
                    dd_psize.DataBind();
                    dd_psize.Items.Insert(0, new ListItem { Text = "--Select Product Size --", Value = "0" });

                }
                else
                {
                    dd_taxtype.DataSource = dt1;
                    dd_taxtype.DataTextField = "igst";
                    dd_taxtype.DataValueField = "taxid";
                    dd_taxtype.DataBind();
                    dd_taxtype.Items.Insert(0, new ListItem { Text = "--Select Text Type --", Value = "0" });

                    dd_psize.DataSource = dt;
                    dd_psize.DataTextField = "igst";
                    dd_psize.DataValueField = "taxid";
                    dd_psize.DataBind();
                    dd_psize.Items.Insert(0, new ListItem { Text = "--Select Product Size --", Value = "0" });
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_sizeSave_Click(object sender, EventArgs e)
        {
            int result = Stocksmanage.AddSize(txtproductsize.Text, txtdecription.Text, id);
            if (result > 0)
            {
                txtmassage.InnerText = "Size Add Success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }

        protected void btn_gsttype_Click(object sender, EventArgs e)
        {
            int result = Stocksmanage.AddTax(txtcgst.Text, txtsgst.Text, lbligst.Text, id);
            if (result > 0)
            {
                txtmassage.InnerText = "Tax Type Add Success";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }

        protected void dd_taxtype_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                DataTable dt = Stocksmanage.GetTaxType(dd_taxtype.SelectedValue);
                if (dt != null && dt.Rows.Count > 0)
                {
                    lblcgst.Text = dt.Rows[0]["cgst"].ToString();
                    lblsgst.Text = dt.Rows[0]["sgst"].ToString();
                    lbligst.Text = dt.Rows[0]["igst"].ToString();

                }
                else
                {
                    lblcgst.Text = dt.Rows[0]["cgst"].ToString();
                    lblsgst.Text = dt.Rows[0]["sgst"].ToString();
                    lbligst.Text = dt.Rows[0]["igst"].ToString();
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {


                int result = Stocksmanage.AddStocks(lblproductcode.Text, lblproductsname.Text, lblbradename.Text, txtQuantity.Text, dd_psize.SelectedValue, dd_discounttype.SelectedValue, txtdiscount.Text, txtmrp.Text, txtpurchase.Text, txtsallprice.Text, txtmfg.Text, txtexpire.Text, id, dd_taxtype.SelectedValue);
                if (result > 0)
                {
                    txtmassage.InnerText = "Stock Add has been success ";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                    GetSizeTaxType();
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

        protected void grid_Stoklist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "quntityupdate")
            {
                txtproductcode.Text = e.CommandArgument.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#modalquntity').modal();", true);

            }
        }

        protected void btn_quntity_Click(object sender, EventArgs e)
        {
            int result = Stocksmanage.AddQuntity(txtproductcode.Text, txtquntityadd.Text);
            if (result > 0)
            {
                txtmassage.InnerText = "Quntity Add has been success ";
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                GetSizeTaxType();
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);

            }
        }
        protected void btn_excel_Click(object sender, EventArgs e)
        {


            DataTable dt = Stocksmanage.GetStocks();
            StringBuilder csvData = new StringBuilder();

            // Add column headers
            csvData.AppendLine("Product Code,Product Name ,Brand Name,Quantity,Size ID,Discount Type,Discount,Product MRP, Product Price, Sell Price, MFG Date, Expriy Date"); // Replace with your column names


            // Iterate through Repeater items and append data
            for (int i = 0; i < dt.Rows.Count; i++)
            {

                string ProductCode = dt.Rows[i]["ProductCode"].ToString(); // Replace with the actual control IDs
                string ProductName = dt.Rows[i]["ProductName"].ToString();
                string BrandName = dt.Rows[i]["BrandName"].ToString();
                string Quantity = dt.Rows[i]["Quantity"].ToString();
                string SizeID = dt.Rows[i]["SizeID"].ToString();
                string DistCountType = dt.Rows[i]["DistCountType"].ToString();
                string Discount = dt.Rows[i]["Discount"].ToString();
                string ProductMRP = dt.Rows[i]["ProductMRP"].ToString();
                string ProductPrice = dt.Rows[i]["ProductPrice"].ToString();
                string SellPrice = dt.Rows[i]["SellPrice"].ToString();
                string MFGDate = dt.Rows[i]["MFGDate"].ToString();
                string ExpriyDate = dt.Rows[i]["ExpriyDate"].ToString();


                // Append data to the CSV string
                csvData.AppendLine($"{ProductCode},{ProductName},{BrandName},{Quantity},{SizeID},{DistCountType},{Discount},{ProductMRP},{ProductPrice},{SellPrice},{MFGDate},{ExpriyDate}");
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
             GetSizeTaxType();
        }
    }
}