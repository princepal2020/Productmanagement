using Productmanagement.App_Code;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Productmanagement.SallerPanel
{
    public partial class ProductSellList : System.Web.UI.Page
    {
        ClsStocksmanage stocksmanage = new ClsStocksmanage();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getallusers(0);
            }
        }

        public void getallusers(int pagenumber)


        {

            try
            {
                string userid = Session["userid"].ToString();
                //DataTable ds = addproducts.SallerSearching(txtsearch.Text);
                DataTable dt = stocksmanage.GetSellerStock(userid);

                if (dt.Rows.Count > 0)
                {

                    PagedDataSource pgitems = new PagedDataSource();
                    //if (txtsearch.Text != null && txtsearch.Text != "")
                    //{
                    //    pgitems.DataSource = ds.DefaultView;
                    //    pgitems.AllowPaging = true;
                    //}
                    //else
                    //{
                    pgitems.DataSource = dt.DefaultView;
                    pgitems.AllowPaging = true;
                    // }





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
            catch (Exception ex)
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
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "Sell")
            {
                Label product_Code = (Label)e.Item.FindControl("lblproduct_code");
                Label stockid = (Label)e.Item.FindControl("lblstockId");
                Label quantity = (Label)e.Item.FindControl("lblquantity");
                txtproductcode.Text = product_Code.Text;

                lblstockid.Text = stockid.Text;
                ViewState["Quantity"] = quantity.Text;


                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive').modal();", true);

            }


        }

        protected void btn_submit_Click(object sender, EventArgs e)
        {
            try
            {
                int Quantity = Convert.ToInt32(ViewState["Quantity"]);
                string sellarIs = Session["userid"].ToString();
                string mobile = "";
                DataTable dt = stocksmanage.CheckDuclicateCustomer(txtmobile.Text);
                if (dt.Rows.Count > 0)
                {
                    mobile = dt.Rows[0]["Customerid"].ToString();
                    if (mobile != null)
                    {
                        if (Quantity > Convert.ToInt32(txtquantity.Text))
                        {
                            int result1 = stocksmanage.AddSellProduct(txtquantity.Text, mobile, txtproductcode.Text, lblstockid.Text, sellarIs);
                            if (result1 > 0)
                            {
                                txtmassage.InnerText = "Product Sell has been success";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                                getallusers(0);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                            }
                        }
                        else
                        {
                            hmassage.InnerText = "Quantity is Low";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                        }
                    }
                }
                else
                {
                    int result = stocksmanage.AddCustomer(txtmobile.Text, txtname.Text, txtmobile.Text, sellarIs);
                    dt = stocksmanage.CheckDuclicateCustomer(txtmobile.Text);
                    mobile = dt.Rows[0]["Customerid"].ToString();
                    if (mobile != null)
                    {
                        if (Quantity > Convert.ToInt32(txtquantity.Text))
                        {
                            int result1 = stocksmanage.AddSellProduct(txtquantity.Text, mobile, txtproductcode.Text, lblstockid.Text, sellarIs);
                            if (result1 > 0)
                            {
                                txtmassage.InnerText = "Product Sell has been success";
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal').modal();", true);
                                getallusers(0);
                            }
                            else
                            {
                                ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                            }
                        }
                        {
                            hmassage.InnerText = "Quantity is Low";
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#myModal1').modal();", true);
                        }
                    }
                }


            }
            catch (Exception ex)
            {

            }
        }
    }
}