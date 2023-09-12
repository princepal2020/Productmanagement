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
                DataTable dt = Stocksmanage.GetSize();
                DataTable dt1 = Stocksmanage.GetTaxType();
                if(dtstock!=null && dtstock.Rows.Count > 0)
                {
                    grid_Stoklist.DataSource = dtstock;
                    grid_Stoklist.DataBind();
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
                    lblsgst.Text= dt.Rows[0]["sgst"].ToString();
                    lbligst.Text= dt.Rows[0]["igst"].ToString();

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
                //decimal sellprice = 0;
                //decimal discout = Convert.ToDecimal(txtdiscount.Text);
                //if (dd_discounttype.SelectedItem.Text == "PER")
                //{
                //    if (discout > 0)
                //    {
                //        decimal price = Convert.ToDecimal(txtsallprice.Text);
                //        string gsit = dd_taxtype.SelectedItem.Text;
                //        decimal totaldiscount = (price * discout) / 100;
                //        decimal sell = price - totaldiscount;

                //    }
                //}
                //else if(dd_discounttype.SelectedItem.Text == "RS")
                //{

                //}
          
                int result = Stocksmanage.AddStocks(lblproductcode.Text, lblproductsname.Text, lblbradename.Text, txtQuantity.Text, dd_psize.SelectedValue, dd_discounttype.SelectedValue, txtdiscount.Text, txtmrp.Text, txtpurchase.Text, txtsallprice.Text, txtmfg.Text, txtexpire.Text, id, dd_taxtype.SelectedValue);


            }
            catch (Exception ex)
            {

            }
           
        }
    }
}