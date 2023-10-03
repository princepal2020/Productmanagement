using Productmanagement.App_Code;

using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SallerPanel.SallerPanel
{
    public partial class ProductList : System.Web.UI.Page
    {
        ClsAddproducts addproducts = new ClsAddproducts();
        ClsStocksmanage ClsStocksmanage = new ClsStocksmanage();
        ClsOrder ClsOrder = new ClsOrder();
        Clsdefferentmethode Clsdefferentmethode = new Clsdefferentmethode();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                getallusers(0);
                QueryStrigGet();

            }
        }
        public void QueryStrigGet()
        {
            try
            {
                if (Request.QueryString.Count > 0)
                {
                    string stockid = Request.QueryString["stockid"].ToString();
                    DataTable dt = ClsOrder.Getqunatity(stockid);
                    if (dt.Rows.Count > 0)
                    {

                        DataTable dt1 = ClsStocksmanage.GetTaxType(dt.Rows[0]["TaxTypeId"].ToString());
                        if (dt1.Rows.Count > 0)
                        {
                            lblprice.Text = dt.Rows[0]["SellPrice"].ToString();
                            lbltax.Text = dt1.Rows[0]["IGST"].ToString()+"%";
                            lbldiscount.Text = dt.Rows[0]["Discount"].ToString();
                            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);

                        }

                    }
                }
            }
            catch (Exception ex)
            {

            }

        }
        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            try
            {
                if (e.CommandName == "AddStock")
                {
                    Label price = (Label)e.Item.FindControl("lblsellprice");
                    Label tax = (Label)e.Item.FindControl("lblbrand");
                    Label discount = (Label)e.Item.FindControl("lbldiscount");
                    Label taxtype = (Label)e.Item.FindControl("lbltaxttype");
                    Label stid = (Label)e.Item.FindControl("lblstockid");
                    ViewState["StockId"] = stid.Text;
                    lblprice.Text = price.Text;
                    
                    lbldiscount.Text = discount.Text;
                    lbltax.Text = taxtype.Text + "%";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);
                    // Response.Redirect("Stock_Manage.aspx?productscode=" + product_code + "&product_name=" + Product_Name.Text + "&brand_name=" + Brand_Name.Text);
                }
            }
            catch (Exception ex)
            {

            }

        }
        public void getallusers(int pagenumber)
        {

            try
            {
                DataTable ds = addproducts.SallerSearching(txtsearch.Text);
                DataTable dt = addproducts.SallerProductList();

                if (dt.Rows.Count > 0)
                {

                    PagedDataSource pgitems = new PagedDataSource();
                    if (txtsearch.Text != null && txtsearch.Text != "")
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
        protected void btn_search_Click(object sender, EventArgs e)
        {
            getallusers(0);
        }


        protected void btn_order_Click(object sender, EventArgs e)
        {
            try
            {
                int minsize = 45 * 1024; int maxsize = 300 * 1024;
                bool status = true; int count = 0; int statuscount = 0;
                string paymentimage = "";
                int fileSize1 = 0;
                if (file.HasFile)
                {
                    fileSize1 = file.PostedFile.ContentLength;
                    if (fileSize1 > minsize & fileSize1 < maxsize)
                    {
                        paymentimage = Path.GetFileName(file.PostedFile.FileName);
                        file.SaveAs(Server.MapPath("~/AdminModule/ImagePayment/" + paymentimage));
                        paymentimage = "~/AdminModule/ImagePayment/" + paymentimage;
                        status = Clsdefferentmethode.checkexetion(file);
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
                string userid = Session["userid"].ToString();
                string StockId = ViewState["StockId"].ToString();
                Random random = new Random();
                string Order_Id = DateTime.Now.ToString("ddMMyyy") + random.Next(10000, 99999).ToString();
                if (count == 0 && statuscount == 0)
                {
                    int result = ClsOrder.ProductOrder(Order_Id, StockId, txtquntity.Text, userid, lblprice.Text, lblTotalamount.Text, paymentimage, dd_paymentmode.SelectedItem.Text.Trim());
                    if (result > 0)
                    {
                        txtmassage.InnerText = "Order Id " + Order_Id;
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

        protected void dd_paymentmode_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (dd_paymentmode.SelectedValue == "1")
            {
                Payment.Visible = true;
                file.Visible = true;
                profile_image.Visible = true;
            }
            else
            {
                Payment.Visible = false;
                file.Visible = false;
                profile_image.Visible = false;
            }

            ScriptManager.RegisterStartupScript(this, this.GetType(), "myModal", "$('#exampleModalLive1').modal();", true);

        }
    }
}